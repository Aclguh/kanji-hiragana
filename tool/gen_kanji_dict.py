#!/usr/bin/env python3
"""从 KANJIDIC2 提取常用汉字的音读/训读, 生成 Dart 数据文件。

数据来源: KANJIDIC2 (Electronic Dictionary Research and Development Group)
          https://www.edrdg.org/wiki/index.php/KANJIDIC_Project
许可:     Creative Commons BY-SA 4.0

选取范围: grade 1-6 (教育汉字) + grade 8 (常用汉字) + grade 9/10 (人名用汉字)
"""
import gzip
import sys
import unicodedata
import xml.etree.ElementTree as ET
from pathlib import Path

# 锚定到脚本所在仓库, 任意工作目录均可运行。
REPO_ROOT = Path(__file__).resolve().parent.parent
SRC_GZ = REPO_ROOT / 'tool' / 'data' / 'kanjidic2.xml.gz'
SRC_XML = REPO_ROOT / 'tool' / 'data' / 'kanjidic2.xml'
OUT = REPO_ROOT / 'lib' / 'core' / 'kanji_reading_dict.dart'

# 训读中 '-び' 这样的前后缀标记改用括号形式更易读, 如 び(-)
def clean_kun(reading: str) -> str:
    """把 KANJIDIC 的训读记法 'ま.す' / '-び' 转成可读形式。

    'ま.す' -> 'ま(す)'   点号表示送假名分界
    '-び'   -> '(び)'     前导连字符表示仅作后缀
    'び-'   -> '(び)'     后导连字符表示仅作前缀
    """
    r = reading
    trailing_dash = r.endswith('-')
    leading_dash = r.startswith('-')
    r = r.strip('-')

    if '.' in r:
        head, tail = r.split('.', 1)
        r = f'{head}({tail})'

    if leading_dash or trailing_dash:
        # 只作词缀的读音, 用括号包裹整个读音
        if '.' not in reading:
            r = f'({r})'
    return r


def load_source():
    """打开 KANJIDIC2 原始数据 (二进制流, 供 ElementTree 解析)。

    优先用压缩包(.gz, 约 1.5MB, 随仓库提交), 没有则回退到解压后的
    XML(约 16MB, 不进版本库)。两者内容一致。
    """
    if SRC_GZ.exists():
        return gzip.open(SRC_GZ, 'rb')
    if SRC_XML.exists():
        return open(SRC_XML, 'rb')
    raise SystemExit(
        f'未找到词典源文件。请先下载:\n'
        f'  curl -L -o {SRC_GZ} '
        f'https://www.edrdg.org/kanjidic/kanjidic2.xml.gz'
    )


def parse():
    """ElementTree 解析 KANJIDIC2, 自动处理 XML 实体 (如 &amp;)。

    按使用频率排序返回, 便于控制生成体积时优先保留高频字。
    """
    with load_source() as f:
        tree = ET.parse(f)
    root = tree.getroot()
    result = {}

    for character in root.iter('character'):
        lit = character.find('literal')
        if lit is None or not (lit.text or '').strip():
            continue
        kanji = lit.text.strip()

        misc = character.find('misc')
        grade = None
        freq = 99999
        strokes = 0
        if misc is not None:
            grade_el = misc.find('grade')
            grade = int(grade_el.text) if grade_el is not None else None
            freq_el = misc.find('freq')
            freq = int(freq_el.text) if freq_el is not None else 99999
            strokes_el = misc.find('stroke_count')
            strokes = (
                int(strokes_el.text) if strokes_el is not None else 0)

        # 只保留常用汉字与教育汉字
        if grade not in (1, 2, 3, 4, 5, 6, 8, 9, 10):
            continue

        on = []
        kun = []
        meanings = []
        rm = character.find('reading_meaning')
        if rm is not None:
            for group in rm.findall('rmgroup'):
                for r in group.findall('reading'):
                    r_type = r.get('r_type')
                    text = (r.text or '').strip()
                    if r_type == 'ja_on':
                        on.append(text)
                    elif r_type == 'ja_kun':
                        kun.append(text)
                for m in group.findall('meaning'):
                    # 无 m_lang 属性的才是英文释义,
                    # 其余为 KANJIDIC2 内嵌的法语/西语/葡语翻译。
                    if not m.get('m_lang'):
                        meanings.append((m.text or '').strip())

        # 音读: 片假名 -> 平假名, 去重保序
        on_hira = []
        for o in on:
            h = ''.join(
                chr(ord(c) - 0x60) if 0x30A1 <= ord(c) <= 0x30F6 else c
                for c in o
            )
            if h not in on_hira:
                on_hira.append(h)

        # 训读: 清理记法, 去重保序
        kun_list = []
        for k in kun:
            c = clean_kun(k)
            if c not in kun_list:
                kun_list.append(c)

        rad = character.find('radical')
        radical = 0
        if rad is not None:
            for rv in rad.findall('rad_value'):
                if rv.get('rad_type') == 'classical':
                    radical = int(rv.text)
                    break

        result[kanji] = {
            'on': on_hira,
            'kun': kun_list,
            'meanings': meanings[:3],
            'grade': grade,
            'freq': freq,
            'strokes': strokes,
            'radical': radical,
        }

    return sorted(result.items(), key=lambda kv: kv[1]['freq'])


# 英文释义的中文对照 (常见高频词汇, 未命中则保留英文)
MEANING_ZH = {
    'day': '日', 'sun': '太阳', 'one': '一', 'two': '二', 'three': '三',
    'four': '四', 'five': '五', 'six': '六', 'seven': '七', 'eight': '八',
    'nine': '九', 'ten': '十', 'person': '人', 'man': '男人', 'woman': '女人',
    'water': '水', 'fire': '火', 'tree': '树', 'wood': '木', 'gold': '金',
    'earth': '土', 'mountain': '山', 'river': '河', 'stone': '石',
    'rice field': '稻田', 'field': '田地', 'country': '国家', 'king': '国王',
    'school': '学校', 'student': '学生', 'teacher': '老师', 'learn': '学习',
    'study': '学习', 'book': '书', 'language': '语言', 'word': '词',
    'speech': '言语', 'say': '说', 'speak': '说', 'listen': '听',
    'hear': '听', 'see': '看', 'look': '看', 'eye': '眼', 'ear': '耳',
    'hand': '手', 'foot': '足', 'mouth': '口', 'heart': '心',
    'body': '身体', 'head': '头', 'hair': '头发', 'face': '脸',
    'up': '上', 'down': '下', 'left': '左', 'right': '右',
    'before': '前', 'after': '后', 'inside': '内', 'outside': '外',
    'big': '大', 'small': '小', 'long': '长', 'short': '短',
    'tall': '高', 'high': '高', 'low': '低', 'new': '新', 'old': '旧',
    'good': '好', 'bad': '坏', 'white': '白', 'black': '黑',
    'red': '红', 'blue': '蓝', 'green': '绿', 'yellow': '黄',
    'morning': '早晨', 'evening': '傍晚', 'night': '夜晚', 'today': '今天',
    'tomorrow': '明天', 'yesterday': '昨天', 'year': '年', 'month': '月',
    'week': '周', 'time': '时间', 'hour': '小时', 'minute': '分钟',
    'spring': '春', 'summer': '夏', 'autumn': '秋', 'winter': '冬',
    'heaven': '天', 'sky': '天', 'rain': '雨', 'wind': '风', 'snow': '雪',
    'cloud': '云', 'flower': '花', 'grass': '草', 'leaf': '叶',
    'root': '根', 'seed': '种子', 'fruit': '果', 'bird': '鸟',
    'fish': '鱼', 'dog': '狗', 'cat': '猫', 'horse': '马', 'cow': '牛',
    'insect': '昆虫', 'egg': '蛋', 'meat': '肉', 'food': '食物',
    'eat': '吃', 'drink': '喝', 'walk': '走', 'run': '跑',
    'go': '去', 'come': '来', 'enter': '进入', 'exit': '出去',
    'leave': '离开', 'return': '返回', 'give': '给', 'receive': '接受',
    'make': '制作', 'do': '做', 'use': '使用', 'know': '知道',
    'think': '思考', 'mind': '心', 'feeling': '感觉', 'love': '爱',
    'friend': '朋友', 'family': '家庭', 'father': '父亲', 'mother': '母亲',
    'elder brother': '哥哥', 'younger brother': '弟弟',
    'elder sister': '姐姐', 'younger sister': '妹妹',
    'child': '孩子', 'baby': '婴儿', 'name': '名字', 'number': '数字',
    'money': '钱', 'shop': '商店', 'market': '市场', 'road': '道路',
    'way': '道路', 'street': '街道', 'town': '城镇', 'village': '村庄',
    'city': '城市', 'capital': '首都', 'house': '房子', 'home': '家',
    'room': '房间', 'door': '门', 'window': '窗户', 'wall': '墙',
    'table': '桌子', 'chair': '椅子', 'car': '车', 'ship': '船',
    'vehicle': '车辆', 'train': '火车', 'airplane': '飞机',
    'letter': '信', 'paper': '纸', 'pen': '笔', 'brush': '毛笔',
    'picture': '画', 'music': '音乐', 'song': '歌', 'dance': '舞蹈',
    'color': '颜色', 'light': '光', 'shadow': '影', 'sound': '声音',
    'voice': '声音', 'power': '力量', 'strength': '力量', 'weak': '弱',
    'strong': '强', 'true': '真实', 'lie': '谎言', 'truth': '真理',
    'peace': '和平', 'war': '战争', 'army': '军队', 'soldier': '士兵',
    'law': '法律', 'rule': '规则', 'government': '政府', 'people': '人民',
    'world': '世界', 'society': '社会', 'culture': '文化',
    'history': '历史', 'science': '科学', 'art': '艺术',
    'medicine': '药', 'illness': '疾病', 'health': '健康', 'life': '生命',
    'death': '死亡', 'die': '死', 'live': '活', 'birth': '出生',
    'begin': '开始', 'end': '结束', 'start': '开始', 'finish': '完成',
    'open': '开', 'close': '关', 'push': '推', 'pull': '拉',
    'cut': '切', 'break': '打破', 'build': '建造', 'destroy': '破坏',
    'send': '发送', 'carry': '搬运', 'hold': '持有', 'put': '放置',
    'stand': '站立', 'sit': '坐', 'sleep': '睡', 'wake': '醒',
    'work': '工作', 'rest': '休息', 'play': '玩', 'sing': '唱',
    'read': '读', 'write': '写', 'draw': '画', 'paint': '绘画',
    'count': '计数', 'measure': '测量', 'compare': '比较',
    'choose': '选择', 'decide': '决定', 'change': '改变',
    'move': '移动', 'stop': '停止', 'wait': '等待', 'meet': '见面',
    'help': '帮助', 'save': '拯救', 'protect': '保护', 'attack': '攻击',
    'win': '赢', 'lose': '输', 'fight': '战斗', 'competition': '竞争',
    'correct': '正确', 'wrong': '错误', 'same': '相同',
    'different': '不同', 'similar': '相似', 'special': '特别',
    'common': '普通', 'important': '重要', 'necessary': '必要',
    'possible': '可能', 'difficult': '困难', 'easy': '容易',
    'beautiful': '美丽', 'ugly': '丑', 'clean': '干净', 'dirty': '脏',
    'rich': '富有', 'poor': '贫穷', 'warm': '温暖', 'cold': '冷',
    'hot': '热', 'cool': '凉', 'heavy': '重', 'light (weight)': '轻',
    'fast': '快', 'slow': '慢', 'early': '早', 'late': '晚',
    'near': '近', 'far': '远', 'deep': '深', 'shallow': '浅',
    'wide': '宽', 'narrow': '窄', 'thick': '厚', 'thin': '薄',
    'many': '多', 'few': '少', 'all': '全部', 'some': '一些',
    'none': '无', 'nothing': '没有', 'everything': '一切',
    'north': '北', 'south': '南', 'east': '东', 'west': '西',
    'center': '中心', 'middle': '中间', 'side': '侧面',
    'front': '前面', 'back': '后面', 'top': '顶部', 'bottom': '底部',
    'number one': '第一', 'second': '第二', 'first': '第一',
    'sentence': '句子', 'character': '文字', 'kanji': '汉字',
    'kana': '假名', 'meaning': '意义', 'sound': '声音',
}


def zh_meanings(meanings):
    """把英文释义映射为中文, 未命中映射表时保留英文原文。"""
    out = []
    for m in meanings:
        key = m.lower().strip()
        if key in MEANING_ZH:
            v = MEANING_ZH[key]
            if v not in out:
                out.append(v)
        elif m not in out:
            out.append(m)
    return out[:3]


def en_meanings(meanings):
    """KANJIDIC2 原生的英文释义, 去重后最多 3 条。

    界面切到英文时显示这一份 —— KANJIDIC2 的释义本就是英文,
    比从中文回译更准确。
    """
    out = []
    for m in meanings:
        m = m.strip()
        if m and m not in out:
            out.append(m)
    return out[:3]


def dart_escape(text: str) -> str:
    """Dart 单引号字符串转义。

    必须先转义反斜杠再转义单引号 —— 顺序颠倒会把 `\\'` 里的
    反斜杠再次转义, 生成非法 Dart。
    """
    return text.replace('\\', r'\\').replace("'", r"\'")


def dart_str_list(items):
    return ', '.join("'" + dart_escape(s) + "'" for s in items)


def main():
    entries = parse()
    print(f'提取到 {len(entries)} 个常用汉字', file=sys.stderr)

    lines = []
    lines.append('// GENERATED FILE - DO NOT EDIT BY HAND.')
    lines.append('//')
    lines.append('// 常用汉字的音读 / 训读数据。')
    lines.append('//')
    lines.append('// 数据来源: KANJIDIC2 (Electronic Dictionary Research and Development Group)')
    lines.append('//           https://www.edrdg.org/wiki/index.php/KANJIDIC_Project')
    lines.append('// 许可:     Creative Commons BY-SA 4.0')
    lines.append('//')
    lines.append('// 重新生成: python tool/gen_kanji_dict.py')
    lines.append('//')
    lines.append("// 覆盖范围: 教育汉字(grade 1-6) + 常用汉字(grade 8) + 人名用汉字(grade 9-10)")
    lines.append('/// 康熙部首 214 字表 (标准 CJK 统一汉字形态)。')
    rads = [unicodedata.normalize('NFKD', chr(0x2F00 + i)) for i in range(214)]
    rad_items = ', '.join("'" + r + "'" for r in rads)
    lines.append(f'const List<String> kKangxiRadicals = [{rad_items}];')
    lines.append('')
    lines.append('/// 一个汉字的读音信息。')
    lines.append('class KanjiReading {')
    lines.append('  /// 汉字本身。')
    lines.append('  final String kanji;')
    lines.append('')
    lines.append('  /// 音读(音読み), 平假名。')
    lines.append('  final List<String> onyomi;')
    lines.append('')
    lines.append('  /// 训读(訓読み), 平假名; 词缀读音以括号标注。')
    lines.append('  final List<String> kunyomi;')
    lines.append('')
    lines.append('  /// 中文释义(最多 3 条)。')
    lines.append('  final List<String> meanings;')
    lines.append('')
    lines.append('  /// 英文释义(最多 3 条), 取自 KANJIDIC2 原文。')
    lines.append('  final List<String> meaningsEn;')
    lines.append('')
    lines.append('  /// 学年: 1-6 为教育汉字, 8 为常用汉字, 9/10 为人名用汉字。')
    lines.append('  final int grade;')
    lines.append('')
    lines.append('  /// 笔画数。')
    lines.append('  final int strokes;')
    lines.append('')
    lines.append('  /// 报纸使用频率排名(越小越常用)。')
    lines.append('  final int frequencyRank;')
    lines.append('')
    lines.append('  /// 康熙部首序号 (1-214)。')
    lines.append('  final int radical;')
    lines.append('')
    lines.append('  const KanjiReading({')
    lines.append('    required this.kanji,')
    lines.append('    required this.onyomi,')
    lines.append('    required this.kunyomi,')
    lines.append('    required this.meanings,')
    lines.append('    required this.meaningsEn,')
    lines.append('    required this.grade,')
    lines.append('    required this.strokes,')
    lines.append('    required this.frequencyRank,')
    lines.append('    this.radical = 0,')
    lines.append('  });')
    lines.append('')
    lines.append('  /// 是否有音读。')
    lines.append('  bool get hasOnyomi => onyomi.isNotEmpty;')
    lines.append('')
    lines.append('  /// 是否有训读。')
    lines.append('  bool get hasKunyomi => kunyomi.isNotEmpty;')
    lines.append('')
    lines.append('  /// 康熙部首字形。')
    lines.append('  String get radicalChar =>')
    lines.append('      radical >= 1 && radical <= kKangxiRadicals.length')
    lines.append('          ? kKangxiRadicals[radical - 1]')
    lines.append('          : \'\';')
    lines.append('}')
    lines.append('')
    lines.append('/// 汉字读音字典。key 为单个汉字。')
    lines.append('const Map<String, KanjiReading> kanjiReadingDict = {')

    for kanji, info in entries:
        zh = zh_meanings(info['meanings'])
        en = en_meanings(info['meanings'])
        lines.append(
            "  '%s': KanjiReading(kanji: '%s', onyomi: [%s], kunyomi: [%s], "
            "meanings: [%s], meaningsEn: [%s], grade: %d, strokes: %d, "
            "frequencyRank: %d, radical: %d)," % (
                kanji,
                kanji,
                dart_str_list(info['on']),
                dart_str_list(info['kun']),
                dart_str_list(zh),
                dart_str_list(en),
                info['grade'],
                info['strokes'],
                info['freq'],
                info['radical'],
            )
        )

    lines.append('};')
    lines.append('')

    with open(OUT, 'w', encoding='utf-8', newline='\n') as f:
        f.write('\n'.join(lines))

    print(f'已生成 {OUT}', file=sys.stderr)


if __name__ == '__main__':
    main()
