/// 平假名 / 片假名 与罗马音之间的相互转换。
///
/// 说明:
/// - 罗马音采用改良式 Hepburn(平文式)拼写, 例如 し => shi, つ => tsu, ふ => fu。
/// - 长音符号「ー」按前一个元音延展处理(如 コーヒー => koohii), 便于学习者阅读。
/// - 拨音「ん」默认写作 n, 后接元音或 y 时写作 n'(如 しんいち => shin'ichi)。
/// - 促音「っ」表现为下一个音节辅音的双写(如 がっこう => gakkou)。
library;

/// 拗音(二字符)映射表, key 为平假名。
const Map<String, String> _youonMap = {
  'きゃ': 'kya', 'きゅ': 'kyu', 'きょ': 'kyo',
  'しゃ': 'sha', 'しゅ': 'shu', 'しょ': 'sho',
  'ちゃ': 'cha', 'ちゅ': 'chu', 'ちょ': 'cho',
  'にゃ': 'nya', 'にゅ': 'nyu', 'にょ': 'nyo',
  'ひゃ': 'hya', 'ひゅ': 'hyu', 'ひょ': 'hyo',
  'みゃ': 'mya', 'みゅ': 'myu', 'みょ': 'myo',
  'りゃ': 'rya', 'りゅ': 'ryu', 'りょ': 'ryo',
  'ぎゃ': 'gya', 'ぎゅ': 'gyu', 'ぎょ': 'gyo',
  'じゃ': 'ja', 'じゅ': 'ju', 'じょ': 'jo',
  'びゃ': 'bya', 'びゅ': 'byu', 'びょ': 'byo',
  'ぴゃ': 'pya', 'ぴゅ': 'pyu', 'ぴょ': 'pyo',
};

/// 外来语专用的拗音组合(多为片假名, 转平假名后同样适用)。
const Map<String, String> _extendedYouonMap = {
  'ふぁ': 'fa', 'ふぃ': 'fi', 'ふぇ': 'fe', 'ふぉ': 'fo', 'ふゅ': 'fyu',
  'てぃ': 'ti', 'てゅ': 'tyu', 'でぃ': 'di', 'でゅ': 'dyu',
  'うぃ': 'wi', 'うぇ': 'we', 'うぉ': 'wo',
  'しぇ': 'she', 'じぇ': 'je', 'ちぇ': 'che',
  'つぁ': 'tsa', 'つぃ': 'tsi', 'つぇ': 'tse', 'つぉ': 'tso',
  'とぅ': 'tu', 'どぅ': 'du',
  'ゔぁ': 'va', 'ゔぃ': 'vi', 'ゔぇ': 've', 'ゔぉ': 'vo',
  'くぁ': 'kwa', 'ぐぁ': 'gwa',
};

/// 单字符平假名映射表。
const Map<String, String> _singleMap = {
  'あ': 'a', 'い': 'i', 'う': 'u', 'え': 'e', 'お': 'o',
  'か': 'ka', 'き': 'ki', 'く': 'ku', 'け': 'ke', 'こ': 'ko',
  'が': 'ga', 'ぎ': 'gi', 'ぐ': 'gu', 'げ': 'ge', 'ご': 'go',
  'さ': 'sa', 'し': 'shi', 'す': 'su', 'せ': 'se', 'そ': 'so',
  'ざ': 'za', 'じ': 'ji', 'ず': 'zu', 'ぜ': 'ze', 'ぞ': 'zo',
  'た': 'ta', 'ち': 'chi', 'つ': 'tsu', 'て': 'te', 'と': 'to',
  'だ': 'da', 'ぢ': 'ji', 'づ': 'zu', 'で': 'de', 'ど': 'do',
  'な': 'na', 'に': 'ni', 'ぬ': 'nu', 'ね': 'ne', 'の': 'no',
  'は': 'ha', 'ひ': 'hi', 'ふ': 'fu', 'へ': 'he', 'ほ': 'ho',
  'ば': 'ba', 'び': 'bi', 'ぶ': 'bu', 'べ': 'be', 'ぼ': 'bo',
  'ぱ': 'pa', 'ぴ': 'pi', 'ぷ': 'pu', 'ぺ': 'pe', 'ぽ': 'po',
  'ま': 'ma', 'み': 'mi', 'む': 'mu', 'め': 'me', 'も': 'mo',
  'や': 'ya', 'ゆ': 'yu', 'よ': 'yo',
  'ら': 'ra', 'り': 'ri', 'る': 'ru', 'れ': 're', 'ろ': 'ro',
  'わ': 'wa', 'ゐ': 'wi', 'ゑ': 'we', 'を': 'wo',
  'ん': 'n',
  'ぁ': 'a', 'ぃ': 'i', 'ぅ': 'u', 'ぇ': 'e', 'ぉ': 'o',
  'ゃ': 'ya', 'ゅ': 'yu', 'ょ': 'yo',
  'ゎ': 'wa',
  'ゔ': 'vu',
  'ー': '',
};

/// 片假名 -> 平假名 的 Unicode 码位偏移量。
const int _katakanaToHiraganaOffset = 0x30A1 - 0x3041;

/// 判断字符是否为平假名。
bool isHiragana(String char) {
  if (char.isEmpty) return false;
  final code = char.runes.first;
  // ぁ(0x3041) ~ ゖ(0x3096)
  return code >= 0x3041 && code <= 0x3096;
}

/// 判断字符是否为片假名(含长音符号「ー」)。
bool isKatakana(String char) {
  if (char.isEmpty) return false;
  final code = char.runes.first;
  // ァ(0x30A1) ~ ヶ(0x30F6), 以及长音符号 ー(0x30FC)
  return (code >= 0x30A1 && code <= 0x30F6) || code == 0x30FC;
}

/// 判断字符是否为汉字(含中文扩展区)。
bool isKanji(String char) {
  if (char.isEmpty) return false;
  final code = char.runes.first;
  return (code >= 0x4E00 && code <= 0x9FFF) || // CJK 统一表意文字
      (code >= 0x3400 && code <= 0x4DBF) || // 扩展 A
      (code >= 0xF900 && code <= 0xFAFF) || // 兼容表意文字
      (code >= 0x20000 && code <= 0x2FA1F); // 扩展 B~F
}

/// 将片假名转换为平假名, 非片假名字符原样保留。
String katakanaToHiragana(String input) {
  final buffer = StringBuffer();
  for (final rune in input.runes) {
    if (rune >= 0x30A1 && rune <= 0x30F6) {
      buffer.writeCharCode(rune - _katakanaToHiraganaOffset);
    } else {
      buffer.writeCharCode(rune);
    }
  }
  return buffer.toString();
}

/// 将平假名转换为片假名, 非平假名字符原样保留。
String hiraganaToKatakana(String input) {
  final buffer = StringBuffer();
  for (final rune in input.runes) {
    if (rune >= 0x3041 && rune <= 0x3096) {
      buffer.writeCharCode(rune + _katakanaToHiraganaOffset);
    } else {
      buffer.writeCharCode(rune);
    }
  }
  return buffer.toString();
}

/// 将平假名(或已转平的假名)串转换为罗马音。
///
/// [input] 应为平假名串; 若包含片假名会先自动折叠为平假名。
String hiraganaToRomaji(String input) {
  final hira = katakanaToHiragana(input);
  final buffer = StringBuffer();
  var index = 0;

  while (index < hira.length) {
    final char = hira[index];

    // 促音: 双写下一个音节的起始辅音。
    if (char == 'っ') {
      index++;
      final next = _peekRomaji(hira, index);
      if (next != null && next.isNotEmpty) {
        buffer.write(next[0] == 'c' ? 't' : next[0]);
      }
      continue;
    }

    // 拨音: 后接元音或 y 时需要加撇号避免歧义。
    if (char == 'ん') {
      index++;
      final next = _peekRomaji(hira, index);
      if (next != null && next.isNotEmpty) {
        final first = next[0];
        final isVowel = 'aeiou'.contains(first);
        if (isVowel || first == 'y') {
          buffer.write("n'");
          continue;
        }
      }
      buffer.write('n');
      continue;
    }

    // 长音符号: 延展前一个元音。
    if (char == 'ー') {
      index++;
      final soFar = buffer.toString();
      if (soFar.isNotEmpty) {
        final last = soFar[soFar.length - 1];
        if ('aeiou'.contains(last)) buffer.write(last);
      }
      continue;
    }

    // 优先匹配外来语拗音, 再匹配普通拗音。
    if (index + 1 < hira.length) {
      final two = hira.substring(index, index + 2);
      final extended = _extendedYouonMap[two];
      if (extended != null) {
        buffer.write(extended);
        index += 2;
        continue;
      }
      final youon = _youonMap[two];
      if (youon != null) {
        buffer.write(youon);
        index += 2;
        continue;
      }
    }

    final single = _singleMap[char];
    if (single != null) {
      buffer.write(single);
    } else if (char.trim().isNotEmpty) {
      // 非假名字符(汉字、标点等)保持原样。
      buffer.write(char);
    }
    index++;
  }

  return buffer.toString();
}

/// 预读从 [index] 开始的一个音节对应的罗马音, 用于促音与拨音判断。
String? _peekRomaji(String hira, int index) {
  if (index >= hira.length) return null;
  if (index + 1 < hira.length) {
    final two = hira.substring(index, index + 2);
    final extended = _extendedYouonMap[two];
    if (extended != null) return extended;
    final youon = _youonMap[two];
    if (youon != null) return youon;
  }
  return _singleMap[hira[index]];
}

/// 便捷方法: 片假名(kuromoji 的 reading 字段)直接转罗马音。
String katakanaToRomaji(String input) => hiraganaToRomaji(katakanaToHiragana(input));
