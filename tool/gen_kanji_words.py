#!/usr/bin/env python3
"""从 kuromoji 内嵌的 IPADIC 词典提取「汉字 → 常见词」数据。

扫描 IPADIC 全部词条, 按 POS 白名单与字面条件筛出词典形词汇,
以「词内汉字的 KANJIDIC2 报纸频率均值」近似常用度排序,
每个汉字保留前 N 个词, 输出到 lib/core/kanji_words_dict.dart。

数据来源:
- 词条与读音: IPADIC (Atilika), 随 kuromoji pub 包内嵌分发, Apache License 2.0。
  直接解码包内 base64+gzip 的二进制词典 (tid / tid_map / tid_pos), 无需另行下载;
  提取到的词汇与应用运行时分词所用的词典完全一致。
- 常用度参考: KANJIDIC2 (EDRDG) 的 <freq> 字段, CC BY-SA 4.0。

用法: python tool/gen_kanji_words.py
(需要先 flutter pub get, 且 tool/data/kanjidic2.xml.gz 存在)
"""

import base64
import gzip
import json
import re
import struct
import sys
from pathlib import Path
from urllib.parse import unquote, urlparse

REPO_ROOT = Path(__file__).resolve().parent.parent
OUTPUT = REPO_ROOT / 'lib' / 'core' / 'kanji_words_dict.dart'
KANJIDIC2_GZ = REPO_ROOT / 'tool' / 'data' / 'kanjidic2.xml.gz'

# 与 single_kanji_view.dart 的 maxPerGroup 对齐: 每字最多展示的词数。
MAX_WORDS_PER_KANJI = 8
WORD_MIN_LEN = 2
WORD_MAX_LEN = 6

# 与 lib/core/kanji_filter.dart 的 kNoFrequencyRank 一致。
FREQ_MISSING = 99999

# 固有名名词条的常用度惩罚: 词典形普通词汇优先, 专有名词兜底。
# IPADIC 无词频数据, 地名/组织名若与普通词同权会淹没结果 (如「東三国」)。
PROPER_NOUN_PENALTY = 800

# 含假名的名词降权 (動詞/形容詞不降权 —— 它们天然含送假名, 如食べる/高い/学ぶ):
# 若不降权, 「ある日」「日にち」这类 词缀词 会以目标字自身的高频分刷满列表,
# 挤掉「日本」「東京」这类核心词汇。
KANA_MIXED_NOUN_PENALTY = 1200

# 单汉字动词 / 形容词的提权系数: 词典形动词 (食べる/学ぶ/飲む) 是该字最核心的
# 词汇, 但均值指标会让它们输给共享该字的高频复合词 (如「大学」之于「学ぶ」)。
# 仅对评分 ≥ SINGLE_KANJI_VERB_MIN 的字生效 —— 超高频字 (人/日/出) 的
# 「单字+假名」词质量参差 (人なれる/ある日), 交给其他规则处理。
SINGLE_KANJI_VERB_BONUS = 0.5
SINGLE_KANJI_VERB_MIN = 60

# 均值指标的结构性盲区人工提权: 下列词或因词性标注不一致 (「日本」是固有名词而
# 「日本人」是一般名词), 或因组字频率巧合 (「食事」以 0.5 分之差输给「中食」),
# 排不进前列, 参照 gen_kanji_dict.py 的 MEANING_ZH 先例人工指定。
WORD_BOOST = {
    '日本': 2000, '東京': 2000, '大阪': 2000, '京都': 2000,
    '会社': 2000, '学校': 2000, '大学': 2000, '先生': 2000,
    '電話': 2000, '食事': 2000, '時間': 2000, '電車': 2000,
    '行く': 2000, '行う': 2000, '見る': 2000, '出る': 2000,
    '入る': 2000,
}

# 继承字符号 々 (0x3005): 「人々」「各々」等高频词的组成部分。
KANJI_ITERATION_MARK = 0x3005

# IPADIC 特征串的词性白名单 (取特征串第 1~4 段做前缀匹配)。
# 注意: IPADIC 的地名分类叫「地域」(UniDic 才叫「地名」)。
# 刻意排除: 非自立词、代词、接尾词、副词、连体词、人名、数词等。
POS_WHITELIST = (
    '名詞,一般',
    '名詞,サ変接続',
    '名詞,形容動詞語幹',
    '名詞,副詞可能',
    '名詞,固有名詞,一般',
    '名詞,固有名詞,地域',
    '動詞,自立',
    '形容詞,自立',
)

# 字符区间 (与 lib/core/kana_romaji.dart 保持一致)。
KANJI_RANGES = ((0x4E00, 0x9FFF), (0x3400, 0x4DBF),
                (0xF900, 0xFAFF), (0x20000, 0x2FA1F))
HIRAGANA_RANGE = (0x3041, 0x3096)
KATAKANA_RANGE = (0x30A1, 0x30F6)
LONG_VOWEL = 0x30FC
KATAKANA_OFFSET = 0x30A1 - 0x3041

# 生成文件头部的说明 (Dart 源码注释)。
HEADER = '''// GENERATED FILE - DO NOT EDIT BY HAND.
//
// 常见词数据: 每个汉字的常见搭配词, 供单字详解页展示。
//
// 数据来源: IPADIC (Atilika), 随 kuromoji (https://pub.dev/packages/kuromoji)
//           内嵌分发, 词汇集合与运行时分词词典完全一致。
// 许可:     Apache License 2.0
// 常用度:   IPADIC 不含词频, 以词内汉字的 KANJIDIC2 报纸频率均值近似排序
//           (KANJIDIC2 版权归 EDRDG, CC BY-SA 4.0)。
//
// 重新生成: python tool/gen_kanji_words.py
'''


def is_kanji(cp: int) -> bool:
    return any(lo <= cp <= hi for lo, hi in KANJI_RANGES)


def is_kana(cp: int) -> bool:
    hlo, hhi = HIRAGANA_RANGE
    klo, khi = KATAKANA_RANGE
    return hlo <= cp <= hhi or klo <= cp <= khi or cp == LONG_VOWEL


def word_chars_allowed(cp: int) -> bool:
    """词面允许的字符: 汉字、假名、长音符与 々。"""
    return is_kanji(cp) or is_kana(cp) or cp == KANJI_ITERATION_MARK


def katakana_to_hiragana(text: str) -> str:
    klo, khi = KATAKANA_RANGE
    return ''.join(
        chr(ord(c) - KATAKANA_OFFSET) if klo <= ord(c) <= khi else c
        for c in text)


def pos_allowed(pos_key: str) -> bool:
    return any(pos_key == w or pos_key.startswith(w + ',')
               for w in POS_WHITELIST)


def locate_kuromoji_data_dir() -> Path:
    """经 .dart_tool/package_config.json 定位 kuromoji 包的内嵌词典目录。"""
    config_path = REPO_ROOT / '.dart_tool' / 'package_config.json'
    if not config_path.exists():
        sys.exit('未找到 .dart_tool/package_config.json, 请先执行 flutter pub get')
    config = json.loads(config_path.read_text(encoding='utf-8'))
    for pkg in config.get('packages', []):
        if pkg.get('name') == 'kuromoji':
            # Windows 的 file:///C:/... 解析出 /C:/... 前缀, 需剥掉。
            raw = unquote(urlparse(pkg['rootUri']).path)
            if re.match(r'^/[A-Za-z]:', raw):
                raw = raw[1:]
            root = Path(raw)
            data_dir = root / 'lib' / 'src' / 'dict' / 'data'
            if data_dir.is_dir():
                return data_dir
            sys.exit(f'kuromoji 包内嵌词典目录不存在: {data_dir}')
    sys.exit('未找到 kuromoji 包, 请确认 pubspec.yaml 的依赖配置')


def load_embedded_gzip(path: Path) -> bytes:
    """解码 .dat.dart: base64 字符串 (可能拆成多个相邻字面量) -> gzip 明文。"""
    text = path.read_text(encoding='utf-8')
    chunks = re.findall(r"'([A-Za-z0-9+/=]{256,})'", text)
    if not chunks:
        sys.exit(f'未能从 {path.name} 中提取内嵌数据')
    return gzip.decompress(base64.b64decode(''.join(chunks)))


def load_kanjidic2() -> dict:
    """KANJIDIC2 -> {汉字: (grade, freq)}, 筛选与 gen_kanji_dict.py 一致。"""
    if not KANJIDIC2_GZ.exists():
        sys.exit(f'缺少 {KANJIDIC2_GZ}, 请参照 README 下载')
    with gzip.open(KANJIDIC2_GZ, 'rt', encoding='utf-8') as f:
        data = f.read()

    allowed_grades = (1, 2, 3, 4, 5, 6, 8, 9, 10)
    info = {}
    for block in re.findall(r'<character>(.*?)</character>', data, re.S):
        literal = re.search(r'<literal>(.*?)</literal>', block)
        if not literal:
            continue
        grade = re.search(r'<grade>(\d+)</grade>', block)
        if not grade or int(grade.group(1)) not in allowed_grades:
            continue
        freq = re.search(r'<freq>(\d+)</freq>', block)
        info[literal.group(1)] = (
            int(grade.group(1)),
            int(freq.group(1)) if freq else FREQ_MISSING,
        )
    return info


def collect_words(data_dir: Path) -> dict:
    """解码 IPADIC 二进制词典, 返回 {词面: (平假名读音, 是否专有名词, 词性)}。"""
    tid_buf = load_embedded_gzip(data_dir / 'tid.dat.dart')
    pos_buf = load_embedded_gzip(data_dir / 'tid_pos.dat.dart')
    map_buf = load_embedded_gzip(data_dir / 'tid_map.dat.dart')

    # tid_map.dat: [count][key][valuesSize][values...] (小端 int32),
    # 枚举全部 token id, 无需遍历 double-array trie。
    count = struct.unpack_from('<i', map_buf, 0)[0]
    p = 4
    token_ids = set()
    for _ in range(count):
        _key, vsize = struct.unpack_from('<ii', map_buf, p)
        p += 8
        if vsize > 0:
            token_ids.update(struct.unpack_from(f'<{vsize}i', map_buf, p))
            p += 4 * vsize
    # tid_map 之外是 ByteBuffer 按 2 的幂扩容留下的未用容量, 只需确认已全部消费在内。
    assert p <= len(map_buf), 'tid_map.dat 解析越界'
    assert len(token_ids) > 300_000, f'token id 数量异常: {len(token_ids)}'

    # tid.dat: token id t 的特征串偏移位于字节 t + 6 (见包内 TokenInfoDictionary.getFeatures)。
    # tid_pos.dat: 自偏移起 NUL 结尾的 UTF-8 CSV:
    #   surface,pos,细分1,细分2,细分3,活用类型,活用形,基本形,读音,发音
    words = {}
    for token_id in token_ids:
        pos_id = struct.unpack_from('<i', tid_buf, token_id + 6)[0]
        if not (0 <= pos_id < len(pos_buf)):
            continue
        end = pos_buf.index(b'\x00', pos_id)
        features = pos_buf[pos_id:end].decode('utf-8').split(',')
        if len(features) < 9:
            continue

        surface = features[0]
        basic = features[7]
        reading = features[8]
        pos_head = features[1]

        # 仅词典形 (排除 やぼったく 之类的活用形)。
        if basic != surface:
            continue
        pos_key = ','.join(features[1:5])
        proper = pos_key.startswith('名詞,固有名詞')
        if not pos_allowed(pos_key):
            continue
        if not (WORD_MIN_LEN <= len(surface) <= WORD_MAX_LEN):
            continue
        chars = [ord(c) for c in surface]
        if not any(is_kanji(cp) for cp in chars):
            continue
        if not all(word_chars_allowed(cp) for cp in chars):
            continue
        # 读音须为纯片假名 (长音符 ー 允许)。
        if not reading or reading == '*':
            continue
        rchars = [ord(c) for c in reading]
        if not all(KATAKANA_RANGE[0] <= cp <= KATAKANA_RANGE[1]
                   or cp == LONG_VOWEL for cp in rchars):
            continue

        hiragana = katakana_to_hiragana(reading)
        existing = words.get(surface)
        # 同一词面多读音 (如 日本食: にほんしょく/にっぽんしょく) 取先出现的,
        # IPADIC 内部顺序稳定; 专有名词标记取「否」优先。
        if existing is None or (existing[1] and not proper):
            words[surface] = (hiragana, proper, pos_head)

    assert words, '未提取到任何词条'
    return words


def word_score(surface: str, kanji_info: dict, is_proper: bool,
               pos_head: str) -> float:
    """常用度近似: 词内汉字的报纸频率均值 (越小越常用)。

    词内含 KANJIDIC2 未收录的汉字 (如「巓») 时按缺失频率计,
    避免生僻字词与常用词同权。专有名词整体加罚;
    含假名的名词加罚 (動詞/形容詞天然含送假名, 不罚);
    单汉字动词/形容词 (食べる/学ぶ/高い) 评分减半提权;
    人工提权名单 (WORD_BOOST) 最后套用。
    """
    ranks = [kanji_info[c][1] if c in kanji_info else FREQ_MISSING
             for c in surface if is_kanji(ord(c))]
    score = (sum(ranks) / len(ranks)) if ranks else float(FREQ_MISSING)
    if is_proper:
        score += PROPER_NOUN_PENALTY
    has_kana = any(is_kana(ord(c)) for c in surface)
    if has_kana and pos_head == '名詞':
        score += KANA_MIXED_NOUN_PENALTY
    kanji_count = sum(1 for c in surface if is_kanji(ord(c)))
    if (pos_head in ('動詞', '形容詞') and kanji_count == 1
            and score >= SINGLE_KANJI_VERB_MIN):
        score *= SINGLE_KANJI_VERB_BONUS
    score -= WORD_BOOST.get(surface, 0)
    return score


def build_index(words: dict, kanji_info: dict) -> dict:
    """按汉字归组、评分排序、截取前 N 个。"""
    by_kanji = {}
    for surface, (hiragana, is_proper, pos_head) in words.items():
        score = word_score(surface, kanji_info, is_proper, pos_head)
        kanjis = {c for c in surface if is_kanji(ord(c))}
        for ch in kanjis:
            if ch in kanji_info:
                by_kanji.setdefault(ch, []).append(
                    (score, len(surface), surface, hiragana))

    index = {}
    for ch, entries in by_kanji.items():
        entries.sort()
        index[ch] = entries[:MAX_WORDS_PER_KANJI]
    return index


def dart_escape(text: str) -> str:
    return text.replace('\\', r'\\').replace("'", r"\'")


def render(index: dict, kanji_info: dict) -> str:
    lines = [
        HEADER,
        '/// 一个常见词: 词面与规范平假名读音。',
        'class KanjiWord {',
        '  /// 词面 (词典形), 如「日本」。',
        '  final String word;',
        '',
        '  /// 规范平假名读音, 如「にっぽん」。',
        '  final String hiragana;',
        '',
        '  const KanjiWord(this.word, this.hiragana);',
        '}',
        '',
        f'/// 汉字 -> 常见词列表 (已按常用度排序, 每字至多 {MAX_WORDS_PER_KANJI} 个)。',
        '/// 查不到的汉字不在表中, 调用方按空列表处理。',
        'const Map<String, List<KanjiWord>> kanjiWordsDict = {',
    ]

    # 与 kanji_reading_dict.dart 一致: 高频汉字在前, 频次相同时按字符编码确定稳定顺序。
    for ch in sorted(index, key=lambda c: (kanji_info[c][1], kanji_info[c][0], c)):
        words_dart = ', '.join(
            "KanjiWord('%s', '%s')" % (dart_escape(surface), dart_escape(hiragana))
            for _score, _len, surface, hiragana in index[ch]
        )
        lines.append(f"  '{dart_escape(ch)}': [{words_dart}],")
    lines.append('};')
    return '\n'.join(lines) + '\n'


def main() -> None:
    data_dir = locate_kuromoji_data_dir()
    print(f'kuromoji 内嵌词典: {data_dir}')

    kanji_info = load_kanjidic2()
    print(f'KANJIDIC2 收录汉字: {len(kanji_info)}')

    words = collect_words(data_dir)
    print(f'候选词典形词汇: {len(words)}')

    index = build_index(words, kanji_info)
    total = sum(len(v) for v in index.values())
    print(f'覆盖汉字: {len(index)}, 词条总计: {total}')

    # 抽查高频字与低频字的词条质量, 便于人工确认。
    for probe in ('日', '学', '食', '東', '人', '行', '見', '時',
                  '会', '先', '電', '飲', '読', '優', '凛'):
        entries = index.get(probe, [])
        joined = ', '.join(f'{s}({h})' for _s, _l, s, h in entries)
        print(f'  抽查 {probe}: {joined or "(无)"}')

    OUTPUT.write_text(render(index, kanji_info), encoding='utf-8')
    print(f'已写入 {OUTPUT}')


if __name__ == '__main__':
    main()
