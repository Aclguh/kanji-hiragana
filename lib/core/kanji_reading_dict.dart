// GENERATED FILE - DO NOT EDIT BY HAND.
//
// 常用汉字的音读 / 训读数据。
//
// 数据来源: KANJIDIC2 (Electronic Dictionary Research and Development Group)
//           https://www.edrdg.org/wiki/index.php/KANJIDIC_Project
// 许可:     Creative Commons BY-SA 4.0
//
// 重新生成: python tool/gen_kanji_dict.py
//
// 覆盖范围: 教育汉字(grade 1-6) + 常用汉字(grade 8) + 人名用汉字(grade 9-10)

/// 一个汉字的读音信息。
class KanjiReading {
  /// 汉字本身。
  final String kanji;

  /// 音读(音読み), 平假名。
  final List<String> onyomi;

  /// 训读(訓読み), 平假名; 词缀读音以括号标注。
  final List<String> kunyomi;

  /// 中文释义(最多 3 条)。
  final List<String> meanings;

  /// 学年: 1-6 为教育汉字, 8 为常用汉字, 9/10 为人名用汉字。
  final int grade;

  /// 笔画数。
  final int strokes;

  /// 报纸使用频率排名(越小越常用)。
  final int frequencyRank;

  const KanjiReading({
    required this.kanji,
    required this.onyomi,
    required this.kunyomi,
    required this.meanings,
    required this.grade,
    required this.strokes,
    required this.frequencyRank,
  });

  /// 是否有音读。
  bool get hasOnyomi => onyomi.isNotEmpty;

  /// 是否有训读。
  bool get hasKunyomi => kunyomi.isNotEmpty;
}

/// 汉字读音字典。key 为单个汉字。
const Map<String, KanjiReading> kanjiReadingDict = {
  // 日 / 太阳 / Japan
  '日': KanjiReading(
    kanji: '日',
    onyomi: ['にち', 'じつ'],
    kunyomi: ['ひ', '(び)', '(か)'],
    meanings: ['日', '太阳', 'Japan'],
    grade: 1,
    strokes: 4,
    frequencyRank: 1,
  ),
  // 一 / one radical (no.1)
  '一': KanjiReading(
    kanji: '一',
    onyomi: ['いち', 'いつ'],
    kunyomi: ['(ひと)', 'ひと(つ)'],
    meanings: ['一', 'one radical (no.1)'],
    grade: 1,
    strokes: 1,
    frequencyRank: 2,
  ),
  // 国家
  '国': KanjiReading(
    kanji: '国',
    onyomi: ['こく'],
    kunyomi: ['くに'],
    meanings: ['国家'],
    grade: 2,
    strokes: 8,
    frequencyRank: 3,
  ),
  // meeting / 见面 / party
  '会': KanjiReading(
    kanji: '会',
    onyomi: ['かい', 'え'],
    kunyomi: ['あ(う)', 'あ(わせる)', 'あつ(まる)'],
    meanings: ['meeting', '见面', 'party'],
    grade: 2,
    strokes: 6,
    frequencyRank: 4,
  ),
  // 人
  '人': KanjiReading(
    kanji: '人',
    onyomi: ['じん', 'にん'],
    kunyomi: ['ひと', '(り)', '(と)'],
    meanings: ['人'],
    grade: 1,
    strokes: 2,
    frequencyRank: 5,
  ),
  // 年 / counter for years
  '年': KanjiReading(
    kanji: '年',
    onyomi: ['ねん'],
    kunyomi: ['とし'],
    meanings: ['年', 'counter for years'],
    grade: 1,
    strokes: 6,
    frequencyRank: 6,
  ),
  // large / 大
  '大': KanjiReading(
    kanji: '大',
    onyomi: ['だい', 'たい'],
    kunyomi: ['(おお)', 'おお(きい)', 'おお(いに)'],
    meanings: ['large', '大'],
    grade: 1,
    strokes: 3,
    frequencyRank: 7,
  ),
  // 十
  '十': KanjiReading(
    kanji: '十',
    onyomi: ['じゅう', 'じっ', 'じゅっ'],
    kunyomi: ['とお', 'と', 'そ'],
    meanings: ['十'],
    grade: 1,
    strokes: 2,
    frequencyRank: 8,
  ),
  // 二 / two radical (no. 7)
  '二': KanjiReading(
    kanji: '二',
    onyomi: ['に', 'じ'],
    kunyomi: ['ふた', 'ふた(つ)', 'ふたたび'],
    meanings: ['二', 'two radical (no. 7)'],
    grade: 1,
    strokes: 2,
    frequencyRank: 9,
  ),
  // 书 / present / main
  '本': KanjiReading(
    kanji: '本',
    onyomi: ['ほん'],
    kunyomi: ['もと'],
    meanings: ['书', 'present', 'main'],
    grade: 1,
    strokes: 5,
    frequencyRank: 10,
  ),
  // in / 内 / 中间
  '中': KanjiReading(
    kanji: '中',
    onyomi: ['ちゅう'],
    kunyomi: ['なか', 'うち', 'あた(る)'],
    meanings: ['in', '内', '中间'],
    grade: 1,
    strokes: 4,
    frequencyRank: 11,
  ),
  // 长 / leader / superior
  '長': KanjiReading(
    kanji: '長',
    onyomi: ['ちょう'],
    kunyomi: ['なが(い)', 'おさ'],
    meanings: ['长', 'leader', 'superior'],
    grade: 2,
    strokes: 8,
    frequencyRank: 12,
  ),
  // 出去 / 离开 / go out
  '出': KanjiReading(
    kanji: '出',
    onyomi: ['しゅつ', 'すい'],
    kunyomi: ['で(る)', '(で)', 'だ(す)', 'い(でる)', 'い(だす)'],
    meanings: ['出去', '离开', 'go out'],
    grade: 1,
    strokes: 5,
    frequencyRank: 13,
  ),
  // 三
  '三': KanjiReading(
    kanji: '三',
    onyomi: ['さん', 'ぞう'],
    kunyomi: ['み', 'み(つ)', 'みっ(つ)'],
    meanings: ['三'],
    grade: 1,
    strokes: 3,
    frequencyRank: 14,
  ),
  // 相同 / agree / equal
  '同': KanjiReading(
    kanji: '同',
    onyomi: ['どう'],
    kunyomi: ['おな(じ)'],
    meanings: ['相同', 'agree', 'equal'],
    grade: 2,
    strokes: 6,
    frequencyRank: 15,
  ),
  // 时间 / 小时
  '時': KanjiReading(
    kanji: '時',
    onyomi: ['じ'],
    kunyomi: ['とき', '(どき)'],
    meanings: ['时间', '小时'],
    grade: 2,
    strokes: 10,
    frequencyRank: 16,
  ),
  // politics / 政府
  '政': KanjiReading(
    kanji: '政',
    onyomi: ['せい', 'しょう'],
    kunyomi: ['まつりごと', 'まん'],
    meanings: ['politics', '政府'],
    grade: 5,
    strokes: 9,
    frequencyRank: 17,
  ),
  // matter / thing / fact
  '事': KanjiReading(
    kanji: '事',
    onyomi: ['じ', 'ず'],
    kunyomi: ['こと', 'つか(う)', 'つか(える)'],
    meanings: ['matter', 'thing', 'fact'],
    grade: 3,
    strokes: 8,
    frequencyRank: 18,
  ),
  // oneself
  '自': KanjiReading(
    kanji: '自',
    onyomi: ['じ', 'し'],
    kunyomi: ['みずか(ら)', 'おの(ずから)', 'おの(ずと)'],
    meanings: ['oneself'],
    grade: 2,
    strokes: 6,
    frequencyRank: 19,
  ),
  // going / journey / carry out
  '行': KanjiReading(
    kanji: '行',
    onyomi: ['こう', 'ぎょう', 'あん'],
    kunyomi: ['い(く)', 'ゆ(く)', 'ゆ(き)', '(ゆき)', 'い(き)', '(いき)', 'おこな(う)', 'おこ(なう)'],
    meanings: ['going', 'journey', 'carry out'],
    grade: 2,
    strokes: 6,
    frequencyRank: 20,
  ),
  // company / firm / office
  '社': KanjiReading(
    kanji: '社',
    onyomi: ['しゃ'],
    kunyomi: ['やしろ'],
    meanings: ['company', 'firm', 'office'],
    grade: 2,
    strokes: 7,
    frequencyRank: 21,
  ),
  // 看 / hopes / chances
  '見': KanjiReading(
    kanji: '見',
    onyomi: ['けん'],
    kunyomi: ['み(る)', 'み(える)', 'み(せる)'],
    meanings: ['看', 'hopes', 'chances'],
    grade: 1,
    strokes: 7,
    frequencyRank: 22,
  ),
  // 月 / moon
  '月': KanjiReading(
    kanji: '月',
    onyomi: ['げつ', 'がつ'],
    kunyomi: ['つき'],
    meanings: ['月', 'moon'],
    grade: 1,
    strokes: 4,
    frequencyRank: 23,
  ),
  // part / minute of time / segment
  '分': KanjiReading(
    kanji: '分',
    onyomi: ['ぶん', 'ふん', 'ぶ'],
    kunyomi: ['わ(ける)', 'わ(け)', 'わ(かれる)', 'わ(かる)', 'わ(かつ)'],
    meanings: ['part', 'minute of time', 'segment'],
    grade: 2,
    strokes: 4,
    frequencyRank: 24,
  ),
  // deliberation / consultation / debate
  '議': KanjiReading(
    kanji: '議',
    onyomi: ['ぎ'],
    kunyomi: [],
    meanings: ['deliberation', 'consultation', 'debate'],
    grade: 4,
    strokes: 20,
    frequencyRank: 25,
  ),
  // behind / 后面 / later
  '後': KanjiReading(
    kanji: '後',
    onyomi: ['ご', 'こう'],
    kunyomi: ['のち', 'うし(ろ)', 'うしろ', 'あと', 'おく(れる)'],
    meanings: ['behind', '后面', 'later'],
    grade: 2,
    strokes: 9,
    frequencyRank: 26,
  ),
  // in front / 前
  '前': KanjiReading(
    kanji: '前',
    onyomi: ['ぜん'],
    kunyomi: ['まえ', '(まえ)'],
    meanings: ['in front', '前'],
    grade: 2,
    strokes: 9,
    frequencyRank: 27,
  ),
  // 人民 / nation / subjects
  '民': KanjiReading(
    kanji: '民',
    onyomi: ['みん'],
    kunyomi: ['たみ'],
    meanings: ['人民', 'nation', 'subjects'],
    grade: 4,
    strokes: 5,
    frequencyRank: 28,
  ),
  // 生命 / genuine / 出生
  '生': KanjiReading(
    kanji: '生',
    onyomi: ['せい', 'しょう'],
    kunyomi: ['い(きる)', 'い(かす)', 'い(ける)', 'う(まれる)', 'うま(れる)', 'う(まれ)', 'うまれ', 'う(む)', 'お(う)', 'は(える)', 'は(やす)', 'き', 'なま', '(なま)', 'な(る)', 'な(す)', 'む(す)', '(う)'],
    meanings: ['生命', 'genuine', '出生'],
    grade: 1,
    strokes: 5,
    frequencyRank: 29,
  ),
  // take along / lead / join
  '連': KanjiReading(
    kanji: '連',
    onyomi: ['れん'],
    kunyomi: ['つら(なる)', 'つら(ねる)', 'つ(れる)', 'づ(れ)'],
    meanings: ['take along', 'lead', 'join'],
    grade: 4,
    strokes: 10,
    frequencyRank: 30,
  ),
  // 五
  '五': KanjiReading(
    kanji: '五',
    onyomi: ['ご'],
    kunyomi: ['いつ', 'いつ(つ)'],
    meanings: ['五'],
    grade: 1,
    strokes: 4,
    frequencyRank: 31,
  ),
  // departure / discharge / publish
  '発': KanjiReading(
    kanji: '発',
    onyomi: ['はつ', 'ほつ'],
    kunyomi: ['た(つ)', 'あば(く)', 'おこ(る)', 'つか(わす)', 'はな(つ)'],
    meanings: ['departure', 'discharge', 'publish'],
    grade: 3,
    strokes: 9,
    frequencyRank: 32,
  ),
  // interval / space
  '間': KanjiReading(
    kanji: '間',
    onyomi: ['かん', 'けん'],
    kunyomi: ['あいだ', 'ま', 'あい'],
    meanings: ['interval', 'space'],
    grade: 2,
    strokes: 12,
    frequencyRank: 33,
  ),
  // vis-a-vis / opposite / even
  '対': KanjiReading(
    kanji: '対',
    onyomi: ['たい', 'つい'],
    kunyomi: ['あいて', 'こた(える)', 'そろ(い)', 'つれあ(い)', 'なら(ぶ)', 'むか(う)'],
    meanings: ['vis-a-vis', 'opposite', 'even'],
    grade: 3,
    strokes: 7,
    frequencyRank: 34,
  ),
  // above / 上
  '上': KanjiReading(
    kanji: '上',
    onyomi: ['じょう', 'しょう', 'しゃん'],
    kunyomi: ['うえ', '(うえ)', '(うわ)', 'かみ', 'あ(げる)', 'あ(がる)', 'あ(がり)', 'のぼ(る)', 'のぼ(り)', 'のぼ(せる)', 'のぼ(す)', 'たてまつ(る)'],
    meanings: ['above', '上'],
    grade: 1,
    strokes: 3,
    frequencyRank: 35,
  ),
  // section / bureau / dept
  '部': KanjiReading(
    kanji: '部',
    onyomi: ['ぶ'],
    kunyomi: ['(べ)'],
    meanings: ['section', 'bureau', 'dept'],
    grade: 3,
    strokes: 11,
    frequencyRank: 36,
  ),
  // 东
  '東': KanjiReading(
    kanji: '東',
    onyomi: ['とう'],
    kunyomi: ['ひがし'],
    meanings: ['东'],
    grade: 2,
    strokes: 8,
    frequencyRank: 37,
  ),
  // someone / 人
  '者': KanjiReading(
    kanji: '者',
    onyomi: ['しゃ'],
    kunyomi: ['もの'],
    meanings: ['someone', '人'],
    grade: 3,
    strokes: 8,
    frequencyRank: 38,
  ),
  // party / faction / clique
  '党': KanjiReading(
    kanji: '党',
    onyomi: ['とう'],
    kunyomi: ['なかま', 'むら'],
    meanings: ['party', 'faction', 'clique'],
    grade: 6,
    strokes: 10,
    frequencyRank: 39,
  ),
  // ground / 土
  '地': KanjiReading(
    kanji: '地',
    onyomi: ['ち', 'じ'],
    kunyomi: [],
    meanings: ['ground', '土'],
    grade: 2,
    strokes: 6,
    frequencyRank: 40,
  ),
  // fit / suit / join
  '合': KanjiReading(
    kanji: '合',
    onyomi: ['ごう', 'がっ', 'かっ'],
    kunyomi: ['あ(う)', 'あ(い)', '(あい)', 'あ(わす)', 'あ(わせる)'],
    meanings: ['fit', 'suit', 'join'],
    grade: 2,
    strokes: 6,
    frequencyRank: 41,
  ),
  // 市场 / 城市 / 城镇
  '市': KanjiReading(
    kanji: '市',
    onyomi: ['し'],
    kunyomi: ['いち'],
    meanings: ['市场', '城市', '城镇'],
    grade: 2,
    strokes: 5,
    frequencyRank: 42,
  ),
  // business / vocation / arts
  '業': KanjiReading(
    kanji: '業',
    onyomi: ['ぎょう', 'ごう'],
    kunyomi: ['わざ'],
    meanings: ['business', 'vocation', 'arts'],
    grade: 3,
    strokes: 13,
    frequencyRank: 43,
  ),
  // 内 / within / between
  '内': KanjiReading(
    kanji: '内',
    onyomi: ['ない', 'だい'],
    kunyomi: ['うち'],
    meanings: ['内', 'within', 'between'],
    grade: 2,
    strokes: 4,
    frequencyRank: 44,
  ),
  // inter- / mutual / together
  '相': KanjiReading(
    kanji: '相',
    onyomi: ['そう', 'しょう'],
    kunyomi: ['(あい)'],
    meanings: ['inter-', 'mutual', 'together'],
    grade: 3,
    strokes: 9,
    frequencyRank: 45,
  ),
  // direction / 人 / alternative
  '方': KanjiReading(
    kanji: '方',
    onyomi: ['ほう'],
    kunyomi: ['かた', '(かた)', '(がた)'],
    meanings: ['direction', '人', 'alternative'],
    grade: 2,
    strokes: 4,
    frequencyRank: 46,
  ),
  // 四
  '四': KanjiReading(
    kanji: '四',
    onyomi: ['し'],
    kunyomi: ['よ', 'よ(つ)', 'よっ(つ)', 'よん'],
    meanings: ['四'],
    grade: 1,
    strokes: 5,
    frequencyRank: 47,
  ),
  // determine / fix / establish
  '定': KanjiReading(
    kanji: '定',
    onyomi: ['てい', 'じょう'],
    kunyomi: ['さだ(める)', 'さだ(まる)', 'さだ(か)'],
    meanings: ['determine', 'fix', 'establish'],
    grade: 3,
    strokes: 8,
    frequencyRank: 48,
  ),
  // now
  '今': KanjiReading(
    kanji: '今',
    onyomi: ['こん', 'きん'],
    kunyomi: ['いま'],
    meanings: ['now'],
    grade: 2,
    strokes: 4,
    frequencyRank: 49,
  ),
  // -times / round / game
  '回': KanjiReading(
    kanji: '回',
    onyomi: ['かい', 'え'],
    kunyomi: ['まわ(る)', 'まわ(り)', 'まわ(す)', 'まわ(し)', 'もとお(る)', 'か(える)'],
    meanings: ['-times', 'round', 'game'],
    grade: 2,
    strokes: 6,
    frequencyRank: 50,
  ),
  // 新
  '新': KanjiReading(
    kanji: '新',
    onyomi: ['しん'],
    kunyomi: ['あたら(しい)', 'あら(た)', '(あら)', '(にい)'],
    meanings: ['新'],
    grade: 2,
    strokes: 13,
    frequencyRank: 51,
  ),
  // location / place
  '場': KanjiReading(
    kanji: '場',
    onyomi: ['じょう', 'ちょう'],
    kunyomi: ['ば'],
    meanings: ['location', 'place'],
    grade: 2,
    strokes: 12,
    frequencyRank: 52,
  ),
  // 金
  '金': KanjiReading(
    kanji: '金',
    onyomi: ['きん', 'こん', 'ごん'],
    kunyomi: ['かね', '(かな)', '(がね)'],
    meanings: ['金'],
    grade: 1,
    strokes: 8,
    frequencyRank: 53,
  ),
  // employee / member / 数字
  '員': KanjiReading(
    kanji: '員',
    onyomi: ['いん'],
    kunyomi: [],
    meanings: ['employee', 'member', '数字'],
    grade: 3,
    strokes: 10,
    frequencyRank: 54,
  ),
  // 九
  '九': KanjiReading(
    kanji: '九',
    onyomi: ['きゅう', 'く'],
    kunyomi: ['ここの', 'ここの(つ)'],
    meanings: ['九'],
    grade: 1,
    strokes: 2,
    frequencyRank: 55,
  ),
  // 进入 / insert
  '入': KanjiReading(
    kanji: '入',
    onyomi: ['にゅう', 'じゅ'],
    kunyomi: ['い(る)', 'い(り)', 'い(れる)', 'い(れ)', 'はい(る)'],
    meanings: ['进入', 'insert'],
    grade: 1,
    strokes: 2,
    frequencyRank: 56,
  ),
  // elect / select / 选择
  '選': KanjiReading(
    kanji: '選',
    onyomi: ['せん'],
    kunyomi: ['えら(ぶ)', 'え(る)', 'よ(る)'],
    meanings: ['elect', 'select', '选择'],
    grade: 4,
    strokes: 15,
    frequencyRank: 57,
  ),
  // stand up / rise / set up
  '立': KanjiReading(
    kanji: '立',
    onyomi: ['りつ', 'りゅう', 'りっとる'],
    kunyomi: ['た(つ)', 'た(ち)', 'た(てる)', 'た(て)', '(たて)', 'だ(て)', 'だ(てる)'],
    meanings: ['stand up', 'rise', 'set up'],
    grade: 1,
    strokes: 5,
    frequencyRank: 58,
  ),
  // 开 / unfold / unseal
  '開': KanjiReading(
    kanji: '開',
    onyomi: ['かい'],
    kunyomi: ['ひら(く)', 'ひら(き)', 'びら(き)', 'ひら(ける)', 'あ(く)', 'あ(ける)'],
    meanings: ['开', 'unfold', 'unseal'],
    grade: 3,
    strokes: 12,
    frequencyRank: 59,
  ),
  // 手
  '手': KanjiReading(
    kanji: '手',
    onyomi: ['しゅ', 'ず'],
    kunyomi: ['て', '(て)', '(た)'],
    meanings: ['手'],
    grade: 1,
    strokes: 4,
    frequencyRank: 60,
  ),
  // rice / USA / metre
  '米': KanjiReading(
    kanji: '米',
    onyomi: ['べい', 'まい', 'めえとる'],
    kunyomi: ['こめ', 'よね'],
    meanings: ['rice', 'USA', 'metre'],
    grade: 2,
    strokes: 6,
    frequencyRank: 61,
  ),
  // 力量 / 强
  '力': KanjiReading(
    kanji: '力',
    onyomi: ['りょく', 'りき', 'りい'],
    kunyomi: ['ちから'],
    meanings: ['力量', '强'],
    grade: 1,
    strokes: 2,
    frequencyRank: 62,
  ),
  // 学习 / learning / 科学
  '学': KanjiReading(
    kanji: '学',
    onyomi: ['がく'],
    kunyomi: ['まな(ぶ)'],
    meanings: ['学习', 'learning', '科学'],
    grade: 1,
    strokes: 8,
    frequencyRank: 63,
  ),
  // question / ask / problem
  '問': KanjiReading(
    kanji: '問',
    onyomi: ['もん'],
    kunyomi: ['と(う)', 'と(い)', 'とん'],
    meanings: ['question', 'ask', 'problem'],
    grade: 3,
    strokes: 11,
    frequencyRank: 64,
  ),
  // 高 / expensive
  '高': KanjiReading(
    kanji: '高',
    onyomi: ['こう'],
    kunyomi: ['たか(い)', 'たか', '(だか)', 'たか(まる)', 'たか(める)'],
    meanings: ['高', 'expensive'],
    grade: 2,
    strokes: 10,
    frequencyRank: 65,
  ),
  // substitute / 改变 / convert
  '代': KanjiReading(
    kanji: '代',
    onyomi: ['だい', 'たい'],
    kunyomi: ['か(わる)', 'かわ(る)', 'かわ(り)', 'か(わり)', 'がわ(り)', 'が(わり)', 'か(える)', 'よ', 'しろ'],
    meanings: ['substitute', '改变', 'convert'],
    grade: 3,
    strokes: 5,
    frequencyRank: 66,
  ),
  // bright / 光
  '明': KanjiReading(
    kanji: '明',
    onyomi: ['めい', 'みょう', 'みん'],
    kunyomi: ['あ(かり)', 'あか(るい)', 'あか(るむ)', 'あか(らむ)', 'あき(らか)', 'あ(ける)', 'あ(け)', 'あ(く)', 'あ(くる)', 'あ(かす)'],
    meanings: ['bright', '光'],
    grade: 2,
    strokes: 8,
    frequencyRank: 67,
  ),
  // reality / 真理 / 种子
  '実': KanjiReading(
    kanji: '実',
    onyomi: ['じつ', 'しつ'],
    kunyomi: ['み', 'みの(る)', 'まこと', 'みの', 'みち(る)'],
    meanings: ['reality', '真理', '种子'],
    grade: 3,
    strokes: 8,
    frequencyRank: 68,
  ),
  // circle / yen / round
  '円': KanjiReading(
    kanji: '円',
    onyomi: ['えん'],
    kunyomi: ['まる(い)', 'まる', 'まど', 'まど(か)', 'まろ(やか)'],
    meanings: ['circle', 'yen', 'round'],
    grade: 1,
    strokes: 4,
    frequencyRank: 69,
  ),
  // connection / barrier / gateway
  '関': KanjiReading(
    kanji: '関',
    onyomi: ['かん'],
    kunyomi: ['せき', '(ぜき)', 'かか(わる)', 'からくり', 'かんぬき'],
    meanings: ['connection', 'barrier', 'gateway'],
    grade: 4,
    strokes: 14,
    frequencyRank: 70,
  ),
  // 决定 / fix / agree upon
  '決': KanjiReading(
    kanji: '決',
    onyomi: ['けつ'],
    kunyomi: ['き(める)', 'ぎ(め)', 'き(まる)', 'さ(く)'],
    meanings: ['决定', 'fix', 'agree upon'],
    grade: 3,
    strokes: 7,
    frequencyRank: 71,
  ),
  // 孩子 / sign of the rat / 11PM-1AM
  '子': KanjiReading(
    kanji: '子',
    onyomi: ['し', 'す', 'つ'],
    kunyomi: ['こ', '(こ)', 'ね'],
    meanings: ['孩子', 'sign of the rat', '11PM-1AM'],
    grade: 1,
    strokes: 3,
    frequencyRank: 72,
  ),
  // 移动 / motion / 改变
  '動': KanjiReading(
    kanji: '動',
    onyomi: ['どう'],
    kunyomi: ['うご(く)', 'うご(かす)'],
    meanings: ['移动', 'motion', '改变'],
    grade: 3,
    strokes: 11,
    frequencyRank: 73,
  ),
  // 首都 / 10**16
  '京': KanjiReading(
    kanji: '京',
    onyomi: ['きょう', 'けい', 'きん'],
    kunyomi: ['みやこ'],
    meanings: ['首都', '10**16'],
    grade: 2,
    strokes: 8,
    frequencyRank: 74,
  ),
  // whole / entire / 全部
  '全': KanjiReading(
    kanji: '全',
    onyomi: ['ぜん'],
    kunyomi: ['まった(く)', 'すべ(て)'],
    meanings: ['whole', 'entire', '全部'],
    grade: 3,
    strokes: 6,
    frequencyRank: 75,
  ),
  // 眼 / class / 看
  '目': KanjiReading(
    kanji: '目',
    onyomi: ['もく', 'ぼく'],
    kunyomi: ['め', '(め)', '(ま)'],
    meanings: ['眼', 'class', '看'],
    grade: 1,
    strokes: 5,
    frequencyRank: 76,
  ),
  // surface / 桌子 / chart
  '表': KanjiReading(
    kanji: '表',
    onyomi: ['ひょう'],
    kunyomi: ['おもて', '(おもて)', 'あらわ(す)', 'あらわ(れる)', 'あら(わす)'],
    meanings: ['surface', '桌子', 'chart'],
    grade: 3,
    strokes: 8,
    frequencyRank: 77,
  ),
  // 战争 / battle / match
  '戦': KanjiReading(
    kanji: '戦',
    onyomi: ['せん'],
    kunyomi: ['いくさ', 'たたか(う)', 'おのの(く)', 'そよ(ぐ)', 'わなな(く)'],
    meanings: ['战争', 'battle', 'match'],
    grade: 4,
    strokes: 13,
    frequencyRank: 78,
  ),
  // sutra / longitude / pass thru
  '経': KanjiReading(
    kanji: '経',
    onyomi: ['けい', 'きょう', 'きん'],
    kunyomi: ['へ(る)', 'た(つ)', 'たていと', 'はか(る)', 'のり'],
    meanings: ['sutra', 'longitude', 'pass thru'],
    grade: 5,
    strokes: 11,
    frequencyRank: 79,
  ),
  // traffic / pass through / avenue
  '通': KanjiReading(
    kanji: '通',
    onyomi: ['つう', 'つ'],
    kunyomi: ['とお(る)', 'とお(り)', 'どお(り)', 'とお(す)', 'とお(し)', 'どお(し)', 'かよ(う)'],
    meanings: ['traffic', 'pass through', 'avenue'],
    grade: 2,
    strokes: 10,
    frequencyRank: 80,
  ),
  // 外
  '外': KanjiReading(
    kanji: '外',
    onyomi: ['がい', 'げ'],
    kunyomi: ['そと', 'ほか', 'はず(す)', 'はず(れる)', '(と)'],
    meanings: ['外'],
    grade: 2,
    strokes: 5,
    frequencyRank: 81,
  ),
  // utmost / most / extreme
  '最': KanjiReading(
    kanji: '最',
    onyomi: ['さい', 'しゅ'],
    kunyomi: ['もっと(も)', 'つま'],
    meanings: ['utmost', 'most', 'extreme'],
    grade: 4,
    strokes: 12,
    frequencyRank: 82,
  ),
  // 说 / 词
  '言': KanjiReading(
    kanji: '言',
    onyomi: ['げん', 'ごん'],
    kunyomi: ['い(う)', 'こと'],
    meanings: ['说', '词'],
    grade: 2,
    strokes: 7,
    frequencyRank: 83,
  ),
  // family name / surname / clan
  '氏': KanjiReading(
    kanji: '氏',
    onyomi: ['し'],
    kunyomi: ['うじ', '(うじ)'],
    meanings: ['family name', 'surname', 'clan'],
    grade: 4,
    strokes: 4,
    frequencyRank: 84,
  ),
  // present / existing / actual
  '現': KanjiReading(
    kanji: '現',
    onyomi: ['げん'],
    kunyomi: ['あらわ(れる)', 'あらわ(す)', 'うつつ', 'うつ(つ)'],
    meanings: ['present', 'existing', 'actual'],
    grade: 5,
    strokes: 11,
    frequencyRank: 85,
  ),
  // logic / arrangement / reason
  '理': KanjiReading(
    kanji: '理',
    onyomi: ['り'],
    kunyomi: ['ことわり'],
    meanings: ['logic', 'arrangement', 'reason'],
    grade: 2,
    strokes: 11,
    frequencyRank: 86,
  ),
  // tune / tone / meter
  '調': KanjiReading(
    kanji: '調',
    onyomi: ['ちょう'],
    kunyomi: ['しら(べる)', 'しら(べ)', 'ととの(う)', 'ととの(える)'],
    meanings: ['tune', 'tone', 'meter'],
    grade: 3,
    strokes: 15,
    frequencyRank: 87,
  ),
  // 身体 / substance / object
  '体': KanjiReading(
    kanji: '体',
    onyomi: ['たい', 'てい'],
    kunyomi: ['からだ', 'かたち'],
    meanings: ['身体', 'substance', 'object'],
    grade: 2,
    strokes: 7,
    frequencyRank: 88,
  ),
  // 改变 / take the form of / influence
  '化': KanjiReading(
    kanji: '化',
    onyomi: ['か', 'け'],
    kunyomi: ['ば(ける)', 'ば(かす)', 'ふ(ける)', 'け(する)'],
    meanings: ['改变', 'take the form of', 'influence'],
    grade: 3,
    strokes: 4,
    frequencyRank: 89,
  ),
  // 稻田 / rice paddy
  '田': KanjiReading(
    kanji: '田',
    onyomi: ['でん'],
    kunyomi: ['た'],
    meanings: ['稻田', 'rice paddy'],
    grade: 1,
    strokes: 5,
    frequencyRank: 90,
  ),
  // hit / 右 / appropriate
  '当': KanjiReading(
    kanji: '当',
    onyomi: ['とう'],
    kunyomi: ['あ(たる)', 'あ(たり)', 'あ(てる)', 'あ(て)', 'まさ(に)', 'まさ(にべし)'],
    meanings: ['hit', '右', 'appropriate'],
    grade: 2,
    strokes: 6,
    frequencyRank: 91,
  ),
  // 八 / eight radical (no. 12)
  '八': KanjiReading(
    kanji: '八',
    onyomi: ['はち', 'はつ'],
    kunyomi: ['や', 'や(つ)', 'やっ(つ)', 'よう'],
    meanings: ['八', 'eight radical (no. 12)'],
    grade: 1,
    strokes: 2,
    frequencyRank: 92,
  ),
  // 六
  '六': KanjiReading(
    kanji: '六',
    onyomi: ['ろく', 'りく'],
    kunyomi: ['む', 'む(つ)', 'むっ(つ)', 'むい'],
    meanings: ['六'],
    grade: 1,
    strokes: 4,
    frequencyRank: 93,
  ),
  // promise / approximately / shrink
  '約': KanjiReading(
    kanji: '約',
    onyomi: ['やく'],
    kunyomi: ['つづ(まる)', 'つづ(める)', 'つづま(やか)'],
    meanings: ['promise', 'approximately', 'shrink'],
    grade: 4,
    strokes: 9,
    frequencyRank: 94,
  ),
  // lord / chief / master
  '主': KanjiReading(
    kanji: '主',
    onyomi: ['しゅ', 'す', 'しゅう'],
    kunyomi: ['ぬし', 'おも', 'あるじ'],
    meanings: ['lord', 'chief', 'master'],
    grade: 3,
    strokes: 5,
    frequencyRank: 95,
  ),
  // topic / subject
  '題': KanjiReading(
    kanji: '題',
    onyomi: ['だい'],
    kunyomi: [],
    meanings: ['topic', 'subject'],
    grade: 3,
    strokes: 18,
    frequencyRank: 96,
  ),
  // below / 下 / descend
  '下': KanjiReading(
    kanji: '下',
    onyomi: ['か', 'げ'],
    kunyomi: ['した', 'しも', 'もと', 'さ(げる)', 'さ(がる)', 'くだ(る)', 'くだ(り)', 'くだ(す)', 'くだ(さる)', 'お(ろす)', 'お(りる)'],
    meanings: ['below', '下', 'descend'],
    grade: 1,
    strokes: 3,
    frequencyRank: 97,
  ),
  // neck / counter for songs and poems
  '首': KanjiReading(
    kanji: '首',
    onyomi: ['しゅ'],
    kunyomi: ['くび'],
    meanings: ['neck', 'counter for songs and poems'],
    grade: 2,
    strokes: 9,
    frequencyRank: 98,
  ),
  // idea / 心
  '意': KanjiReading(
    kanji: '意',
    onyomi: ['い'],
    kunyomi: [],
    meanings: ['idea', '心'],
    grade: 3,
    strokes: 13,
    frequencyRank: 99,
  ),
  // method / 法律 / 规则
  '法': KanjiReading(
    kanji: '法',
    onyomi: ['ほう', 'はっ', 'ほっ', 'ふらん'],
    kunyomi: ['のり'],
    meanings: ['method', '法律', '规则'],
    grade: 4,
    strokes: 8,
    frequencyRank: 100,
  ),
  // negative / non- / 坏
  '不': KanjiReading(
    kanji: '不',
    onyomi: ['ふ', 'ぶ'],
    kunyomi: [],
    meanings: ['negative', 'non-', '坏'],
    grade: 4,
    strokes: 4,
    frequencyRank: 101,
  ),
  // 来 / due / next
  '来': KanjiReading(
    kanji: '来',
    onyomi: ['らい', 'たい'],
    kunyomi: ['く(る)', 'きた(る)', 'きた(す)', 'き(たす)', 'き(たる)', 'き', 'こ'],
    meanings: ['来', 'due', 'next'],
    grade: 2,
    strokes: 7,
    frequencyRank: 102,
  ),
  // 制作 / production / prepare
  '作': KanjiReading(
    kanji: '作',
    onyomi: ['さく', 'さ'],
    kunyomi: ['つく(る)', 'つく(り)', 'づく(り)'],
    meanings: ['制作', 'production', 'prepare'],
    grade: 2,
    strokes: 7,
    frequencyRank: 103,
  ),
  // sex / gender / nature
  '性': KanjiReading(
    kanji: '性',
    onyomi: ['せい', 'しょう'],
    kunyomi: ['さが'],
    meanings: ['sex', 'gender', 'nature'],
    grade: 5,
    strokes: 8,
    frequencyRank: 104,
  ),
  // bull's eye / mark / target
  '的': KanjiReading(
    kanji: '的',
    onyomi: ['てき'],
    kunyomi: ['まと'],
    meanings: ['bull\'s eye', 'mark', 'target'],
    grade: 4,
    strokes: 8,
    frequencyRank: 105,
  ),
  // need / main point / essence
  '要': KanjiReading(
    kanji: '要',
    onyomi: ['よう'],
    kunyomi: ['い(る)', 'かなめ'],
    meanings: ['need', 'main point', 'essence'],
    grade: 4,
    strokes: 9,
    frequencyRank: 106,
  ),
  // utilize / business / service
  '用': KanjiReading(
    kanji: '用',
    onyomi: ['よう'],
    kunyomi: ['もち(いる)'],
    meanings: ['utilize', 'business', 'service'],
    grade: 2,
    strokes: 5,
    frequencyRank: 107,
  ),
  // system / 法律 / 规则
  '制': KanjiReading(
    kanji: '制',
    onyomi: ['せい'],
    kunyomi: [],
    meanings: ['system', '法律', '规则'],
    grade: 5,
    strokes: 8,
    frequencyRank: 108,
  ),
  // reign / be at peace / calm down
  '治': KanjiReading(
    kanji: '治',
    onyomi: ['じ', 'ち'],
    kunyomi: ['おさ(める)', 'おさ(まる)', 'なお(る)', 'なお(す)'],
    meanings: ['reign', 'be at peace', 'calm down'],
    grade: 4,
    strokes: 8,
    frequencyRank: 109,
  ),
  // degrees / occurrence / 时间
  '度': KanjiReading(
    kanji: '度',
    onyomi: ['ど', 'と', 'たく'],
    kunyomi: ['たび', 'た(い)'],
    meanings: ['degrees', 'occurrence', '时间'],
    grade: 3,
    strokes: 9,
    frequencyRank: 110,
  ),
  // task / duties
  '務': KanjiReading(
    kanji: '務',
    onyomi: ['む'],
    kunyomi: ['つと(める)'],
    meanings: ['task', 'duties'],
    grade: 5,
    strokes: 11,
    frequencyRank: 111,
  ),
  // 强
  '強': KanjiReading(
    kanji: '強',
    onyomi: ['きょう', 'ごう'],
    kunyomi: ['つよ(い)', 'つよ(まる)', 'つよ(める)', 'し(いる)', 'こわ(い)'],
    meanings: ['强'],
    grade: 2,
    strokes: 11,
    frequencyRank: 112,
  ),
  // spirit / 心 / air
  '気': KanjiReading(
    kanji: '気',
    onyomi: ['き', 'け'],
    kunyomi: ['いき', 'き'],
    meanings: ['spirit', '心', 'air'],
    grade: 1,
    strokes: 6,
    frequencyRank: 113,
  ),
  // little / 小
  '小': KanjiReading(
    kanji: '小',
    onyomi: ['しょう'],
    kunyomi: ['ちい(さい)', '(こ)', '(お)', '(さ)'],
    meanings: ['little', '小'],
    grade: 1,
    strokes: 3,
    frequencyRank: 114,
  ),
  // 七
  '七': KanjiReading(
    kanji: '七',
    onyomi: ['しち'],
    kunyomi: ['なな', 'なな(つ)', 'なの'],
    meanings: ['七'],
    grade: 1,
    strokes: 2,
    frequencyRank: 115,
  ),
  // turn into / become / get
  '成': KanjiReading(
    kanji: '成',
    onyomi: ['せい', 'じょう'],
    kunyomi: ['な(る)', 'な(す)'],
    meanings: ['turn into', 'become', 'get'],
    grade: 4,
    strokes: 6,
    frequencyRank: 116,
  ),
  // period / 时间 / date
  '期': KanjiReading(
    kanji: '期',
    onyomi: ['き', 'ご'],
    kunyomi: [],
    meanings: ['period', '时间', 'date'],
    grade: 3,
    strokes: 12,
    frequencyRank: 117,
  ),
  // public / prince / official
  '公': KanjiReading(
    kanji: '公',
    onyomi: ['こう', 'く'],
    kunyomi: ['おおやけ'],
    meanings: ['public', 'prince', 'official'],
    grade: 2,
    strokes: 4,
    frequencyRank: 118,
  ),
  // 持有 / have
  '持': KanjiReading(
    kanji: '持',
    onyomi: ['じ'],
    kunyomi: ['も(つ)', 'も(ち)', 'も(てる)'],
    meanings: ['持有', 'have'],
    grade: 3,
    strokes: 9,
    frequencyRank: 119,
  ),
  // plains / 田地 / rustic
  '野': KanjiReading(
    kanji: '野',
    onyomi: ['や', 'しょ'],
    kunyomi: ['の', '(の)'],
    meanings: ['plains', '田地', 'rustic'],
    grade: 2,
    strokes: 11,
    frequencyRank: 120,
  ),
  // co- / cooperation
  '協': KanjiReading(
    kanji: '協',
    onyomi: ['きょう'],
    kunyomi: [],
    meanings: ['co-', 'cooperation'],
    grade: 4,
    strokes: 8,
    frequencyRank: 121,
  ),
  // take / fetch / take up
  '取': KanjiReading(
    kanji: '取',
    onyomi: ['しゅ'],
    kunyomi: ['と(る)', 'と(り)', 'とり', 'ど(り)'],
    meanings: ['take', 'fetch', 'take up'],
    grade: 3,
    strokes: 8,
    frequencyRank: 122,
  ),
  // metropolis / 首都 / 全部
  '都': KanjiReading(
    kanji: '都',
    onyomi: ['と', 'つ'],
    kunyomi: ['みやこ'],
    meanings: ['metropolis', '首都', '全部'],
    grade: 3,
    strokes: 11,
    frequencyRank: 123,
  ),
  // harmony / Japanese style / 和平
  '和': KanjiReading(
    kanji: '和',
    onyomi: ['わ', 'お', 'か'],
    kunyomi: ['やわ(らぐ)', 'やわ(らげる)', 'なご(む)', 'なご(やか)', 'あ(える)'],
    meanings: ['harmony', 'Japanese style', '和平'],
    grade: 3,
    strokes: 8,
    frequencyRank: 124,
  ),
  // overall / relationship / ruling
  '統': KanjiReading(
    kanji: '統',
    onyomi: ['とう'],
    kunyomi: ['す(べる)'],
    meanings: ['overall', 'relationship', 'ruling'],
    grade: 5,
    strokes: 12,
    frequencyRank: 125,
  ),
  // by means of / because / in view of
  '以': KanjiReading(
    kanji: '以',
    onyomi: ['い'],
    kunyomi: ['もっ(て)'],
    meanings: ['by means of', 'because', 'in view of'],
    grade: 4,
    strokes: 5,
    frequencyRank: 126,
  ),
  // loom / mechanism / machine
  '機': KanjiReading(
    kanji: '機',
    onyomi: ['き'],
    kunyomi: ['はた'],
    meanings: ['loom', 'mechanism', 'machine'],
    grade: 4,
    strokes: 16,
    frequencyRank: 127,
  ),
  // even / flat / 和平
  '平': KanjiReading(
    kanji: '平',
    onyomi: ['へい', 'びょう', 'ひょう'],
    kunyomi: ['たい(ら)', 'たい(らげる)', 'ひら'],
    meanings: ['even', 'flat', '和平'],
    grade: 3,
    strokes: 5,
    frequencyRank: 128,
  ),
  // general / whole / 全部
  '総': KanjiReading(
    kanji: '総',
    onyomi: ['そう'],
    kunyomi: ['す(べて)', 'すべ(て)', 'ふさ'],
    meanings: ['general', 'whole', '全部'],
    grade: 5,
    strokes: 14,
    frequencyRank: 129,
  ),
  // add / addition / increase
  '加': KanjiReading(
    kanji: '加',
    onyomi: ['か'],
    kunyomi: ['くわ(える)', 'くわ(わる)'],
    meanings: ['add', 'addition', 'increase'],
    grade: 4,
    strokes: 5,
    frequencyRank: 130,
  ),
  // 山
  '山': KanjiReading(
    kanji: '山',
    onyomi: ['さん', 'せん'],
    kunyomi: ['やま'],
    meanings: ['山'],
    grade: 1,
    strokes: 3,
    frequencyRank: 131,
  ),
  // 思考
  '思': KanjiReading(
    kanji: '思',
    onyomi: ['し'],
    kunyomi: ['おも(う)', 'おもえら(く)', 'おぼ(す)'],
    meanings: ['思考'],
    grade: 2,
    strokes: 9,
    frequencyRank: 132,
  ),
  // 房子 / 家 / 家庭
  '家': KanjiReading(
    kanji: '家',
    onyomi: ['か', 'け'],
    kunyomi: ['いえ', 'や', 'うち'],
    meanings: ['房子', '家', '家庭'],
    grade: 2,
    strokes: 10,
    frequencyRank: 133,
  ),
  // tale / talk
  '話': KanjiReading(
    kanji: '話',
    onyomi: ['わ'],
    kunyomi: ['はな(す)', 'はなし'],
    meanings: ['tale', 'talk'],
    grade: 2,
    strokes: 13,
    frequencyRank: 134,
  ),
  // generation / 世界 / 社会
  '世': KanjiReading(
    kanji: '世',
    onyomi: ['せい', 'せ', 'そう'],
    kunyomi: ['よ'],
    meanings: ['generation', '世界', '社会'],
    grade: 3,
    strokes: 5,
    frequencyRank: 135,
  ),
  // accept / undergo / answer (phone)
  '受': KanjiReading(
    kanji: '受',
    onyomi: ['じゅ'],
    kunyomi: ['う(ける)', 'う(け)', 'う(かる)'],
    meanings: ['accept', 'undergo', 'answer (phone)'],
    grade: 3,
    strokes: 8,
    frequencyRank: 136,
  ),
  // ward / district
  '区': KanjiReading(
    kanji: '区',
    onyomi: ['く', 'おう', 'こう'],
    kunyomi: [],
    meanings: ['ward', 'district'],
    grade: 3,
    strokes: 4,
    frequencyRank: 137,
  ),
  // jurisdiction / dominion / territory
  '領': KanjiReading(
    kanji: '領',
    onyomi: ['りょう'],
    kunyomi: ['えり'],
    meanings: ['jurisdiction', 'dominion', 'territory'],
    grade: 5,
    strokes: 14,
    frequencyRank: 138,
  ),
  // 多 / frequent / much
  '多': KanjiReading(
    kanji: '多',
    onyomi: ['た'],
    kunyomi: ['おお(い)', 'まさ(に)', 'まさ(る)'],
    meanings: ['多', 'frequent', 'much'],
    grade: 2,
    strokes: 6,
    frequencyRank: 139,
  ),
  // prefecture
  '県': KanjiReading(
    kanji: '県',
    onyomi: ['けん'],
    kunyomi: ['か(ける)'],
    meanings: ['prefecture'],
    grade: 3,
    strokes: 9,
    frequencyRank: 140,
  ),
  // continue / series / sequel
  '続': KanjiReading(
    kanji: '続',
    onyomi: ['ぞく', 'しょく', 'こう', 'きょう'],
    kunyomi: ['つづ(く)', 'つづ(ける)', 'つぐ(ない)'],
    meanings: ['continue', 'series', 'sequel'],
    grade: 4,
    strokes: 13,
    frequencyRank: 141,
  ),
  // advance / proceed / progress
  '進': KanjiReading(
    kanji: '進',
    onyomi: ['しん'],
    kunyomi: ['すす(む)', 'すす(める)'],
    meanings: ['advance', 'proceed', 'progress'],
    grade: 3,
    strokes: 11,
    frequencyRank: 142,
  ),
  // 正确 / justice / righteous
  '正': KanjiReading(
    kanji: '正',
    onyomi: ['せい', 'しょう'],
    kunyomi: ['ただ(しい)', 'ただ(す)', 'まさ', 'まさ(に)'],
    meanings: ['正确', 'justice', 'righteous'],
    grade: 1,
    strokes: 5,
    frequencyRank: 143,
  ),
  // relax / cheap / 低
  '安': KanjiReading(
    kanji: '安',
    onyomi: ['あん'],
    kunyomi: ['やす(い)', 'やす(まる)', 'やす', 'やす(らか)'],
    meanings: ['relax', 'cheap', '低'],
    grade: 3,
    strokes: 6,
    frequencyRank: 144,
  ),
  // establishment / provision / prepare
  '設': KanjiReading(
    kanji: '設',
    onyomi: ['せつ'],
    kunyomi: ['もう(ける)'],
    meanings: ['establishment', 'provision', 'prepare'],
    grade: 5,
    strokes: 11,
    frequencyRank: 145,
  ),
  // 保护 / guarantee / keep
  '保': KanjiReading(
    kanji: '保',
    onyomi: ['ほ', 'ほう'],
    kunyomi: ['たも(つ)'],
    meanings: ['保护', 'guarantee', 'keep'],
    grade: 5,
    strokes: 9,
    frequencyRank: 146,
  ),
  // reformation / 改变 / modify
  '改': KanjiReading(
    kanji: '改',
    onyomi: ['かい'],
    kunyomi: ['あらた(める)', 'あらた(まる)'],
    meanings: ['reformation', '改变', 'modify'],
    grade: 4,
    strokes: 7,
    frequencyRank: 147,
  ),
  // 数字 / 力量 / fate
  '数': KanjiReading(
    kanji: '数',
    onyomi: ['すう', 'す', 'さく', 'そく', 'しゅ'],
    kunyomi: ['かず', 'かぞ(える)', 'しばしば', 'せ(める)', 'わずらわ(しい)'],
    meanings: ['数字', '力量', 'fate'],
    grade: 2,
    strokes: 13,
    frequencyRank: 148,
  ),
  // scribe / account / narrative
  '記': KanjiReading(
    kanji: '記',
    onyomi: ['き'],
    kunyomi: ['しる(す)'],
    meanings: ['scribe', 'account', 'narrative'],
    grade: 2,
    strokes: 10,
    frequencyRank: 149,
  ),
  // Inst. / institution / temple
  '院': KanjiReading(
    kanji: '院',
    onyomi: ['いん'],
    kunyomi: [],
    meanings: ['Inst.', 'institution', 'temple'],
    grade: 3,
    strokes: 10,
    frequencyRank: 150,
  ),
  // 女人 / female
  '女': KanjiReading(
    kanji: '女',
    onyomi: ['じょ', 'にょ', 'にょう'],
    kunyomi: ['おんな', 'め'],
    meanings: ['女人', 'female'],
    grade: 1,
    strokes: 3,
    frequencyRank: 151,
  ),
  // first time / beginning
  '初': KanjiReading(
    kanji: '初',
    onyomi: ['しょ'],
    kunyomi: ['はじ(め)', 'はじ(めて)', 'はつ', '(はつ)', '(うい)', 'そ(める)', 'ぞ(め)'],
    meanings: ['first time', 'beginning'],
    grade: 4,
    strokes: 7,
    frequencyRank: 152,
  ),
  // 北
  '北': KanjiReading(
    kanji: '北',
    onyomi: ['ほく'],
    kunyomi: ['きた'],
    meanings: ['北'],
    grade: 2,
    strokes: 5,
    frequencyRank: 153,
  ),
  // noon / sign of the horse / 11AM-1PM
  '午': KanjiReading(
    kanji: '午',
    onyomi: ['ご'],
    kunyomi: ['うま'],
    meanings: ['noon', 'sign of the horse', '11AM-1PM'],
    grade: 2,
    strokes: 4,
    frequencyRank: 154,
  ),
  // finger / point to / indicate
  '指': KanjiReading(
    kanji: '指',
    onyomi: ['し'],
    kunyomi: ['ゆび', 'さ(す)', 'さ(し)'],
    meanings: ['finger', 'point to', 'indicate'],
    grade: 3,
    strokes: 9,
    frequencyRank: 155,
  ),
  // authority / 力量 / rights
  '権': KanjiReading(
    kanji: '権',
    onyomi: ['けん', 'ごん'],
    kunyomi: ['おもり', 'かり', 'はか(る)'],
    meanings: ['authority', '力量', 'rights'],
    grade: 6,
    strokes: 15,
    frequencyRank: 156,
  ),
  // 心 / spirit
  '心': KanjiReading(
    kanji: '心',
    onyomi: ['しん'],
    kunyomi: ['こころ', '(ごころ)'],
    meanings: ['心', 'spirit'],
    grade: 2,
    strokes: 4,
    frequencyRank: 157,
  ),
  // 世界 / boundary
  '界': KanjiReading(
    kanji: '界',
    onyomi: ['かい'],
    kunyomi: [],
    meanings: ['世界', 'boundary'],
    grade: 3,
    strokes: 9,
    frequencyRank: 158,
  ),
  // branch / support / sustain
  '支': KanjiReading(
    kanji: '支',
    onyomi: ['し'],
    kunyomi: ['ささ(える)', 'つか(える)', 'か(う)'],
    meanings: ['branch', 'support', 'sustain'],
    grade: 5,
    strokes: 4,
    frequencyRank: 159,
  ),
  // No. / residence
  '第': KanjiReading(
    kanji: '第',
    onyomi: ['だい', 'てい'],
    kunyomi: [],
    meanings: ['No.', 'residence'],
    grade: 3,
    strokes: 11,
    frequencyRank: 160,
  ),
  // products / bear / give birth
  '産': KanjiReading(
    kanji: '産',
    onyomi: ['さん'],
    kunyomi: ['う(む)', 'う(まれる)', '(うぶ)', 'む(す)'],
    meanings: ['products', 'bear', 'give birth'],
    grade: 4,
    strokes: 11,
    frequencyRank: 161,
  ),
  // tie / bind / contract
  '結': KanjiReading(
    kanji: '結',
    onyomi: ['けつ', 'けち'],
    kunyomi: ['むす(ぶ)', 'ゆ(う)', 'ゆ(わえる)'],
    meanings: ['tie', 'bind', 'contract'],
    grade: 4,
    strokes: 12,
    frequencyRank: 162,
  ),
  // hundred
  '百': KanjiReading(
    kanji: '百',
    onyomi: ['ひゃく', 'びゃく'],
    kunyomi: ['もも'],
    meanings: ['hundred'],
    grade: 1,
    strokes: 6,
    frequencyRank: 163,
  ),
  // faction / group / party
  '派': KanjiReading(
    kanji: '派',
    onyomi: ['は'],
    kunyomi: [],
    meanings: ['faction', 'group', 'party'],
    grade: 6,
    strokes: 9,
    frequencyRank: 164,
  ),
  // spot / point / mark
  '点': KanjiReading(
    kanji: '点',
    onyomi: ['てん'],
    kunyomi: ['つ(ける)', 'つ(く)', 'た(てる)', 'さ(す)', 'とぼ(す)', 'とも(す)', 'ぼち'],
    meanings: ['spot', 'point', 'mark'],
    grade: 2,
    strokes: 9,
    frequencyRank: 165,
  ),
  // teach / faith / doctrine
  '教': KanjiReading(
    kanji: '教',
    onyomi: ['きょう'],
    kunyomi: ['おし(える)', 'おそ(わる)'],
    meanings: ['teach', 'faith', 'doctrine'],
    grade: 2,
    strokes: 11,
    frequencyRank: 166,
  ),
  // report / news / reward
  '報': KanjiReading(
    kanji: '報',
    onyomi: ['ほう'],
    kunyomi: ['むく(いる)'],
    meanings: ['report', 'news', 'reward'],
    grade: 5,
    strokes: 12,
    frequencyRank: 167,
  ),
  // settle (debt, etc.) / relieve (burden) / 完成
  '済': KanjiReading(
    kanji: '済',
    onyomi: ['さい', 'せい'],
    kunyomi: ['す(む)', 'ず(み)', '(ずみ)', 'す(まない)', 'す(ます)', 'すく(う)', 'な(す)', 'わたし', 'わた(る)'],
    meanings: ['settle (debt, etc.)', 'relieve (burden)', '完成'],
    grade: 6,
    strokes: 11,
    frequencyRank: 168,
  ),
  // 写
  '書': KanjiReading(
    kanji: '書',
    onyomi: ['しょ'],
    kunyomi: ['か(く)', 'が(き)', '(がき)'],
    meanings: ['写'],
    grade: 2,
    strokes: 10,
    frequencyRank: 169,
  ),
  // borough / urban prefecture / govt office
  '府': KanjiReading(
    kanji: '府',
    onyomi: ['ふ'],
    kunyomi: [],
    meanings: ['borough', 'urban prefecture', 'govt office'],
    grade: 4,
    strokes: 8,
    frequencyRank: 170,
  ),
  // lively / resuscitation / being helped
  '活': KanjiReading(
    kanji: '活',
    onyomi: ['かつ'],
    kunyomi: ['い(きる)', 'い(かす)', 'い(ける)'],
    meanings: ['lively', 'resuscitation', 'being helped'],
    grade: 2,
    strokes: 9,
    frequencyRank: 171,
  ),
  // meadow / original / primitive
  '原': KanjiReading(
    kanji: '原',
    onyomi: ['げん'],
    kunyomi: ['はら'],
    meanings: ['meadow', 'original', 'primitive'],
    grade: 2,
    strokes: 10,
    frequencyRank: 172,
  ),
  // 前 / ahead / previous
  '先': KanjiReading(
    kanji: '先',
    onyomi: ['せん'],
    kunyomi: ['さき', 'ま(ず)'],
    meanings: ['前', 'ahead', 'previous'],
    grade: 1,
    strokes: 6,
    frequencyRank: 173,
  ),
  // together / both / neither
  '共': KanjiReading(
    kanji: '共',
    onyomi: ['きょう'],
    kunyomi: ['とも', 'とも(に)', '(ども)'],
    meanings: ['together', 'both', 'neither'],
    grade: 4,
    strokes: 6,
    frequencyRank: 174,
  ),
  // gain / get / find
  '得': KanjiReading(
    kanji: '得',
    onyomi: ['とく'],
    kunyomi: ['え(る)', 'う(る)'],
    meanings: ['gain', 'get', 'find'],
    grade: 5,
    strokes: 11,
    frequencyRank: 175,
  ),
  // unravel / notes / key
  '解': KanjiReading(
    kanji: '解',
    onyomi: ['かい', 'げ'],
    kunyomi: ['と(く)', 'と(かす)', 'と(ける)', 'ほど(く)', 'ほぐ(す)', 'わか(る)', 'さと(る)'],
    meanings: ['unravel', 'notes', 'key'],
    grade: 5,
    strokes: 13,
    frequencyRank: 176,
  ),
  // 名字 / noted / distinguished
  '名': KanjiReading(
    kanji: '名',
    onyomi: ['めい', 'みょう'],
    kunyomi: ['な', '(な)'],
    meanings: ['名字', 'noted', 'distinguished'],
    grade: 1,
    strokes: 6,
    frequencyRank: 177,
  ),
  // mingle / mixing / association
  '交': KanjiReading(
    kanji: '交',
    onyomi: ['こう'],
    kunyomi: ['まじ(わる)', 'まじ(える)', 'ま(じる)', 'まじ(る)', 'ま(ざる)', 'ま(ぜる)', 'か(う)', 'か(わす)', 'かわ(す)', 'こもごも'],
    meanings: ['mingle', 'mixing', 'association'],
    grade: 2,
    strokes: 6,
    frequencyRank: 178,
  ),
  // assets / resources / 首都
  '資': KanjiReading(
    kanji: '資',
    onyomi: ['し'],
    kunyomi: [],
    meanings: ['assets', 'resources', '首都'],
    grade: 5,
    strokes: 13,
    frequencyRank: 179,
  ),
  // beforehand / previous / myself
  '予': KanjiReading(
    kanji: '予',
    onyomi: ['よ', 'しゃ'],
    kunyomi: ['あらかじ(め)'],
    meanings: ['beforehand', 'previous', 'myself'],
    grade: 3,
    strokes: 4,
    frequencyRank: 180,
  ),
  // stream / 河 / river or three-stroke river radical (no. 47)
  '川': KanjiReading(
    kanji: '川',
    onyomi: ['せん'],
    kunyomi: ['かわ'],
    meanings: ['stream', '河', 'river or three-stroke river radical (no. 47)'],
    grade: 1,
    strokes: 3,
    frequencyRank: 181,
  ),
  // yonder / facing / beyond
  '向': KanjiReading(
    kanji: '向',
    onyomi: ['こう'],
    kunyomi: ['む(く)', 'む(い)', 'む(き)', 'む(ける)', 'む(け)', 'む(かう)', 'む(かい)', 'む(こう)', 'むこ', 'むか(い)'],
    meanings: ['yonder', 'facing', 'beyond'],
    grade: 3,
    strokes: 6,
    frequencyRank: 182,
  ),
  // occasion / 侧面 / edge
  '際': KanjiReading(
    kanji: '際',
    onyomi: ['さい'],
    kunyomi: ['きわ', '(ぎわ)'],
    meanings: ['occasion', '侧面', 'edge'],
    grade: 5,
    strokes: 14,
    frequencyRank: 183,
  ),
  // investigate
  '査': KanjiReading(
    kanji: '査',
    onyomi: ['さ'],
    kunyomi: [],
    meanings: ['investigate'],
    grade: 5,
    strokes: 9,
    frequencyRank: 184,
  ),
  // victory / 赢 / prevail
  '勝': KanjiReading(
    kanji: '勝',
    onyomi: ['しょう'],
    kunyomi: ['か(つ)', 'が(ち)', 'まさ(る)', 'すぐ(れる)', 'かつ'],
    meanings: ['victory', '赢', 'prevail'],
    grade: 3,
    strokes: 12,
    frequencyRank: 185,
  ),
  // mask / 脸 / features
  '面': KanjiReading(
    kanji: '面',
    onyomi: ['めん', 'べん'],
    kunyomi: ['おも', 'おもて', 'つら'],
    meanings: ['mask', '脸', 'features'],
    grade: 3,
    strokes: 9,
    frequencyRank: 186,
  ),
  // committee / entrust to / leave to
  '委': KanjiReading(
    kanji: '委',
    onyomi: ['い'],
    kunyomi: ['ゆだ(ねる)'],
    meanings: ['committee', 'entrust to', 'leave to'],
    grade: 3,
    strokes: 8,
    frequencyRank: 187,
  ),
  // revelation / tell / inform
  '告': KanjiReading(
    kanji: '告',
    onyomi: ['こく'],
    kunyomi: ['つ(げる)'],
    meanings: ['revelation', 'tell', 'inform'],
    grade: 5,
    strokes: 7,
    frequencyRank: 188,
  ),
  // 军队 / force / troops
  '軍': KanjiReading(
    kanji: '軍',
    onyomi: ['ぐん'],
    kunyomi: ['いくさ'],
    meanings: ['军队', 'force', 'troops'],
    grade: 4,
    strokes: 9,
    frequencyRank: 189,
  ),
  // 句子 / literature / style
  '文': KanjiReading(
    kanji: '文',
    onyomi: ['ぶん', 'もん'],
    kunyomi: ['ふみ', 'あや'],
    meanings: ['句子', 'literature', 'style'],
    grade: 1,
    strokes: 4,
    frequencyRank: 190,
  ),
  // anti-
  '反': KanjiReading(
    kanji: '反',
    onyomi: ['はん', 'ほん', 'たん', 'ほ'],
    kunyomi: ['そ(る)', 'そ(らす)', 'かえ(す)', 'かえ(る)'],
    meanings: ['anti-'],
    grade: 3,
    strokes: 4,
    frequencyRank: 191,
  ),
  // beginning / former time / origin
  '元': KanjiReading(
    kanji: '元',
    onyomi: ['げん', 'がん'],
    kunyomi: ['もと'],
    meanings: ['beginning', 'former time', 'origin'],
    grade: 2,
    strokes: 4,
    frequencyRank: 192,
  ),
  // 重 / 重要 / esteem
  '重': KanjiReading(
    kanji: '重',
    onyomi: ['じゅう', 'ちょう'],
    kunyomi: ['え', 'おも(い)', 'おも(り)', 'おも(なう)', 'かさ(ねる)', 'かさ(なる)', 'おも'],
    meanings: ['重', '重要', 'esteem'],
    grade: 3,
    strokes: 9,
    frequencyRank: 193,
  ),
  // 近 / 早 / akin
  '近': KanjiReading(
    kanji: '近',
    onyomi: ['きん', 'こん'],
    kunyomi: ['ちか(い)'],
    meanings: ['近', '早', 'akin'],
    grade: 2,
    strokes: 7,
    frequencyRank: 194,
  ),
  // thousand
  '千': KanjiReading(
    kanji: '千',
    onyomi: ['せん'],
    kunyomi: ['ち'],
    meanings: ['thousand'],
    grade: 1,
    strokes: 3,
    frequencyRank: 195,
  ),
  // consider / think over
  '考': KanjiReading(
    kanji: '考',
    onyomi: ['こう'],
    kunyomi: ['かんが(える)', 'かんが(え)'],
    meanings: ['consider', 'think over'],
    grade: 2,
    strokes: 6,
    frequencyRank: 196,
  ),
  // judgement / judgment / signature
  '判': KanjiReading(
    kanji: '判',
    onyomi: ['はん', 'ばん'],
    kunyomi: ['わか(る)'],
    meanings: ['judgement', 'judgment', 'signature'],
    grade: 5,
    strokes: 7,
    frequencyRank: 197,
  ),
  // acknowledge / witness / discern
  '認': KanjiReading(
    kanji: '認',
    onyomi: ['にん'],
    kunyomi: ['みと(める)', 'したた(める)'],
    meanings: ['acknowledge', 'witness', 'discern'],
    grade: 6,
    strokes: 14,
    frequencyRank: 198,
  ),
  // brush-stroke / 画
  '画': KanjiReading(
    kanji: '画',
    onyomi: ['が', 'かく', 'え', 'かい'],
    kunyomi: ['えが(く)', 'かく(する)', 'かぎ(る)', 'はかりごと', 'はか(る)'],
    meanings: ['brush-stroke', '画'],
    grade: 2,
    strokes: 8,
    frequencyRank: 199,
  ),
  // sea / ocean
  '海': KanjiReading(
    kanji: '海',
    onyomi: ['かい'],
    kunyomi: ['うみ'],
    meanings: ['sea', 'ocean'],
    grade: 2,
    strokes: 9,
    frequencyRank: 200,
  ),
  // nonplussed / three (in documents) / going
  '参': KanjiReading(
    kanji: '参',
    onyomi: ['さん', 'しん'],
    kunyomi: ['まい(る)', '(まい)', 'まじわる', 'みつ'],
    meanings: ['nonplussed', 'three (in documents)', 'going'],
    grade: 4,
    strokes: 8,
    frequencyRank: 201,
  ),
  // sell
  '売': KanjiReading(
    kanji: '売',
    onyomi: ['ばい'],
    kunyomi: ['う(る)', 'う(れる)'],
    meanings: ['sell'],
    grade: 2,
    strokes: 7,
    frequencyRank: 202,
  ),
  // profit / advantage / benefit
  '利': KanjiReading(
    kanji: '利',
    onyomi: ['り'],
    kunyomi: ['き(く)'],
    meanings: ['profit', 'advantage', 'benefit'],
    grade: 4,
    strokes: 7,
    frequencyRank: 203,
  ),
  // association / braid / plait
  '組': KanjiReading(
    kanji: '組',
    onyomi: ['そ'],
    kunyomi: ['く(む)', 'くみ', '(ぐみ)'],
    meanings: ['association', 'braid', 'plait'],
    grade: 2,
    strokes: 11,
    frequencyRank: 204,
  ),
  // 知道 / wisdom
  '知': KanjiReading(
    kanji: '知',
    onyomi: ['ち'],
    kunyomi: ['し(る)', 'し(らせる)'],
    meanings: ['知道', 'wisdom'],
    grade: 2,
    strokes: 8,
    frequencyRank: 205,
  ),
  // plan / suggestion / draft
  '案': KanjiReading(
    kanji: '案',
    onyomi: ['あん'],
    kunyomi: ['つくえ'],
    meanings: ['plan', 'suggestion', 'draft'],
    grade: 4,
    strokes: 10,
    frequencyRank: 206,
  ),
  // road-way / 街道 / district
  '道': KanjiReading(
    kanji: '道',
    onyomi: ['どう', 'とう'],
    kunyomi: ['みち', 'いう'],
    meanings: ['road-way', '街道', 'district'],
    grade: 2,
    strokes: 12,
    frequencyRank: 207,
  ),
  // faith / 真理 / fidelity
  '信': KanjiReading(
    kanji: '信',
    onyomi: ['しん'],
    kunyomi: [],
    meanings: ['faith', '真理', 'fidelity'],
    grade: 4,
    strokes: 9,
    frequencyRank: 208,
  ),
  // scheme / plan / policy
  '策': KanjiReading(
    kanji: '策',
    onyomi: ['さく'],
    kunyomi: [],
    meanings: ['scheme', 'plan', 'policy'],
    grade: 6,
    strokes: 12,
    frequencyRank: 209,
  ),
  // gather / 见面 / congregate
  '集': KanjiReading(
    kanji: '集',
    onyomi: ['しゅう'],
    kunyomi: ['あつ(まる)', 'あつ(める)', 'つど(う)'],
    meanings: ['gather', '见面', 'congregate'],
    grade: 3,
    strokes: 12,
    frequencyRank: 210,
  ),
  // exist / outskirts / suburbs
  '在': KanjiReading(
    kanji: '在',
    onyomi: ['ざい'],
    kunyomi: ['あ(る)'],
    meanings: ['exist', 'outskirts', 'suburbs'],
    grade: 5,
    strokes: 6,
    frequencyRank: 211,
  ),
  // affair / case / matter
  '件': KanjiReading(
    kanji: '件',
    onyomi: ['けん'],
    kunyomi: ['くだん'],
    meanings: ['affair', 'case', 'matter'],
    grade: 5,
    strokes: 6,
    frequencyRank: 212,
  ),
  // group / association
  '団': KanjiReading(
    kanji: '団',
    onyomi: ['だん', 'とん'],
    kunyomi: ['かたまり', 'まる(い)'],
    meanings: ['group', 'association'],
    grade: 5,
    strokes: 6,
    frequencyRank: 213,
  ),
  // separate / branch off / diverge
  '別': KanjiReading(
    kanji: '別',
    onyomi: ['べつ'],
    kunyomi: ['わか(れる)', 'わ(ける)'],
    meanings: ['separate', 'branch off', 'diverge'],
    grade: 4,
    strokes: 7,
    frequencyRank: 214,
  ),
  // thing / object / matter
  '物': KanjiReading(
    kanji: '物',
    onyomi: ['ぶつ', 'もつ'],
    kunyomi: ['もの', '(もの)'],
    meanings: ['thing', 'object', 'matter'],
    grade: 3,
    strokes: 8,
    frequencyRank: 215,
  ),
  // 侧面 / lean / oppose
  '側': KanjiReading(
    kanji: '側',
    onyomi: ['そく'],
    kunyomi: ['かわ', 'がわ', 'そば'],
    meanings: ['侧面', 'lean', 'oppose'],
    grade: 4,
    strokes: 11,
    frequencyRank: 216,
  ),
  // responsibility / duty / term
  '任': KanjiReading(
    kanji: '任',
    onyomi: ['にん'],
    kunyomi: ['まか(せる)', 'まか(す)'],
    meanings: ['responsibility', 'duty', 'term'],
    grade: 5,
    strokes: 6,
    frequencyRank: 217,
  ),
  // 拉 / tug / jerk
  '引': KanjiReading(
    kanji: '引',
    onyomi: ['いん'],
    kunyomi: ['ひ(く)', 'ひ(ける)'],
    meanings: ['拉', 'tug', 'jerk'],
    grade: 2,
    strokes: 4,
    frequencyRank: 218,
  ),
  // 使用 / send on a mission / order
  '使': KanjiReading(
    kanji: '使',
    onyomi: ['し'],
    kunyomi: ['つか(う)', 'つか(い)', 'づか(い)'],
    meanings: ['使用', 'send on a mission', 'order'],
    grade: 3,
    strokes: 8,
    frequencyRank: 219,
  ),
  // request / want / wish for
  '求': KanjiReading(
    kanji: '求',
    onyomi: ['きゅう', 'ぐ'],
    kunyomi: ['もと(める)'],
    meanings: ['request', 'want', 'wish for'],
    grade: 4,
    strokes: 7,
    frequencyRank: 220,
  ),
  // place / extent
  '所': KanjiReading(
    kanji: '所',
    onyomi: ['しょ'],
    kunyomi: ['ところ', '(ところ)', 'どころ', 'とこ'],
    meanings: ['place', 'extent'],
    grade: 3,
    strokes: 8,
    frequencyRank: 221,
  ),
  // next / order / sequence
  '次': KanjiReading(
    kanji: '次',
    onyomi: ['じ', 'し'],
    kunyomi: ['つ(ぐ)', 'つぎ'],
    meanings: ['next', 'order', 'sequence'],
    grade: 3,
    strokes: 6,
    frequencyRank: 222,
  ),
  // 水
  '水': KanjiReading(
    kanji: '水',
    onyomi: ['すい'],
    kunyomi: ['みず', '(みず)'],
    meanings: ['水'],
    grade: 1,
    strokes: 4,
    frequencyRank: 223,
  ),
  // half / 中间 / odd number
  '半': KanjiReading(
    kanji: '半',
    onyomi: ['はん'],
    kunyomi: ['なか(ば)'],
    meanings: ['half', '中间', 'odd number'],
    grade: 2,
    strokes: 5,
    frequencyRank: 224,
  ),
  // goods / refinement / dignity
  '品': KanjiReading(
    kanji: '品',
    onyomi: ['ひん', 'ほん'],
    kunyomi: ['しな'],
    meanings: ['goods', 'refinement', 'dignity'],
    grade: 3,
    strokes: 9,
    frequencyRank: 225,
  ),
  // 昨天 / previous
  '昨': KanjiReading(
    kanji: '昨',
    onyomi: ['さく'],
    kunyomi: [],
    meanings: ['昨天', 'previous'],
    grade: 4,
    strokes: 9,
    frequencyRank: 226,
  ),
  // argument / discourse
  '論': KanjiReading(
    kanji: '論',
    onyomi: ['ろん'],
    kunyomi: ['あげつら(う)'],
    meanings: ['argument', 'discourse'],
    grade: 6,
    strokes: 15,
    frequencyRank: 227,
  ),
  // plot / plan / scheme
  '計': KanjiReading(
    kanji: '計',
    onyomi: ['けい'],
    kunyomi: ['はか(る)', 'はか(らう)'],
    meanings: ['plot', 'plan', 'scheme'],
    grade: 2,
    strokes: 9,
    frequencyRank: 228,
  ),
  // 死亡 / 死
  '死': KanjiReading(
    kanji: '死',
    onyomi: ['し'],
    kunyomi: ['し(ぬ)', 'し(に)'],
    meanings: ['死亡', '死'],
    grade: 3,
    strokes: 6,
    frequencyRank: 229,
  ),
  // bureaucrat / the government / organ
  '官': KanjiReading(
    kanji: '官',
    onyomi: ['かん'],
    kunyomi: [],
    meanings: ['bureaucrat', 'the government', 'organ'],
    grade: 4,
    strokes: 8,
    frequencyRank: 230,
  ),
  // increase / add / augment
  '増': KanjiReading(
    kanji: '増',
    onyomi: ['ぞう'],
    kunyomi: ['ま(す)', 'ま(し)', 'ふ(える)', 'ふ(やす)'],
    meanings: ['increase', 'add', 'augment'],
    grade: 5,
    strokes: 14,
    frequencyRank: 231,
  ),
  // person in charge / connection / duty
  '係': KanjiReading(
    kanji: '係',
    onyomi: ['けい'],
    kunyomi: ['かか(る)', 'かかり', '(がかり)', 'かか(わる)'],
    meanings: ['person in charge', 'connection', 'duty'],
    grade: 3,
    strokes: 9,
    frequencyRank: 232,
  ),
  // emotion / 感觉 / sensation
  '感': KanjiReading(
    kanji: '感',
    onyomi: ['かん'],
    kunyomi: [],
    meanings: ['emotion', '感觉', 'sensation'],
    grade: 3,
    strokes: 13,
    frequencyRank: 233,
  ),
  // 特别
  '特': KanjiReading(
    kanji: '特',
    onyomi: ['とく'],
    kunyomi: [],
    meanings: ['特别'],
    grade: 4,
    strokes: 10,
    frequencyRank: 234,
  ),
  // feelings / emotion / passion
  '情': KanjiReading(
    kanji: '情',
    onyomi: ['じょう', 'せい'],
    kunyomi: ['なさ(け)'],
    meanings: ['feelings', 'emotion', 'passion'],
    grade: 5,
    strokes: 11,
    frequencyRank: 235,
  ),
  // throw / discard / abandon
  '投': KanjiReading(
    kanji: '投',
    onyomi: ['とう'],
    kunyomi: ['な(げる)', 'な(げ)'],
    meanings: ['throw', 'discard', 'abandon'],
    grade: 3,
    strokes: 7,
    frequencyRank: 236,
  ),
  // show / indicate / point out
  '示': KanjiReading(
    kanji: '示',
    onyomi: ['じ', 'し'],
    kunyomi: ['しめ(す)'],
    meanings: ['show', 'indicate', 'point out'],
    grade: 5,
    strokes: 5,
    frequencyRank: 237,
  ),
  // unusual / 改变 / strange
  '変': KanjiReading(
    kanji: '変',
    onyomi: ['へん'],
    kunyomi: ['か(わる)', 'か(わり)', 'か(える)'],
    meanings: ['unusual', '改变', 'strange'],
    grade: 4,
    strokes: 9,
    frequencyRank: 238,
  ),
  // strike / hit / knock
  '打': KanjiReading(
    kanji: '打',
    onyomi: ['だ', 'だーす'],
    kunyomi: ['う(つ)', 'う(ち)', 'ぶ(つ)'],
    meanings: ['strike', 'hit', 'knock'],
    grade: 3,
    strokes: 5,
    frequencyRank: 239,
  ),
  // male
  '男': KanjiReading(
    kanji: '男',
    onyomi: ['だん', 'なん'],
    kunyomi: ['おとこ', 'お'],
    meanings: ['male'],
    grade: 1,
    strokes: 7,
    frequencyRank: 240,
  ),
  // fundamentals / radical (chem) / counter for machines
  '基': KanjiReading(
    kanji: '基',
    onyomi: ['き'],
    kunyomi: ['もと', 'もとい'],
    meanings: ['fundamentals', 'radical (chem)', 'counter for machines'],
    grade: 5,
    strokes: 11,
    frequencyRank: 241,
  ),
  // private / I / me
  '私': KanjiReading(
    kanji: '私',
    onyomi: ['し'],
    kunyomi: ['わたくし', 'わたし'],
    meanings: ['private', 'I', 'me'],
    grade: 6,
    strokes: 7,
    frequencyRank: 242,
  ),
  // each / every / either
  '各': KanjiReading(
    kanji: '各',
    onyomi: ['かく'],
    kunyomi: ['おのおの'],
    meanings: ['each', 'every', 'either'],
    grade: 4,
    strokes: 6,
    frequencyRank: 243,
  ),
  // commence / 开始
  '始': KanjiReading(
    kanji: '始',
    onyomi: ['し'],
    kunyomi: ['はじ(める)', 'はじ(まる)'],
    meanings: ['commence', '开始'],
    grade: 3,
    strokes: 8,
    frequencyRank: 244,
  ),
  // island
  '島': KanjiReading(
    kanji: '島',
    onyomi: ['とう'],
    kunyomi: ['しま'],
    meanings: ['island'],
    grade: 3,
    strokes: 10,
    frequencyRank: 245,
  ),
  // straightaway / honesty / frankness
  '直': KanjiReading(
    kanji: '直',
    onyomi: ['ちょく', 'じき', 'じか'],
    kunyomi: ['ただ(ちに)', 'なお(す)', 'なお(る)', 'なお(き)', 'す(ぐ)'],
    meanings: ['straightaway', 'honesty', 'frankness'],
    grade: 2,
    strokes: 8,
    frequencyRank: 246,
  ),
  // both / old Japanese coin / counter for carriages (e.g., in a train)
  '両': KanjiReading(
    kanji: '両',
    onyomi: ['りょう'],
    kunyomi: ['てる', 'ふたつ'],
    meanings: ['both', 'old Japanese coin', 'counter for carriages (e.g., in a train)'],
    grade: 3,
    strokes: 6,
    frequencyRank: 247,
  ),
  // 早晨 / dynasty / regime
  '朝': KanjiReading(
    kanji: '朝',
    onyomi: ['ちょう'],
    kunyomi: ['あさ'],
    meanings: ['早晨', 'dynasty', 'regime'],
    grade: 2,
    strokes: 12,
    frequencyRank: 248,
  ),
  // leather / skin / reform
  '革': KanjiReading(
    kanji: '革',
    onyomi: ['かく'],
    kunyomi: ['かわ'],
    meanings: ['leather', 'skin', 'reform'],
    grade: 6,
    strokes: 9,
    frequencyRank: 249,
  ),
  // value / price
  '価': KanjiReading(
    kanji: '価',
    onyomi: ['か', 'け'],
    kunyomi: ['あたい'],
    meanings: ['value', 'price'],
    grade: 5,
    strokes: 8,
    frequencyRank: 250,
  ),
  // style / ceremony / rite
  '式': KanjiReading(
    kanji: '式',
    onyomi: ['しき'],
    kunyomi: [],
    meanings: ['style', 'ceremony', 'rite'],
    grade: 3,
    strokes: 6,
    frequencyRank: 251,
  ),
  // assurance / firm / tight
  '確': KanjiReading(
    kanji: '確',
    onyomi: ['かく', 'こう'],
    kunyomi: ['たし(か)', 'たし(かめる)'],
    meanings: ['assurance', 'firm', 'tight'],
    grade: 5,
    strokes: 15,
    frequencyRank: 252,
  ),
  // 村庄 / 城镇
  '村': KanjiReading(
    kanji: '村',
    onyomi: ['そん'],
    kunyomi: ['むら'],
    meanings: ['村庄', '城镇'],
    grade: 1,
    strokes: 7,
    frequencyRank: 253,
  ),
  // propose / take along / carry in hand
  '提': KanjiReading(
    kanji: '提',
    onyomi: ['てい', 'ちょう', 'だい'],
    kunyomi: ['さ(げる)'],
    meanings: ['propose', 'take along', 'carry in hand'],
    grade: 5,
    strokes: 12,
    frequencyRank: 254,
  ),
  // 搬运 / luck / destiny
  '運': KanjiReading(
    kanji: '運',
    onyomi: ['うん'],
    kunyomi: ['はこ(ぶ)'],
    meanings: ['搬运', 'luck', 'destiny'],
    grade: 3,
    strokes: 12,
    frequencyRank: 255,
  ),
  // 结束 / 完成
  '終': KanjiReading(
    kanji: '終',
    onyomi: ['しゅう'],
    kunyomi: ['お(わる)', 'おわ(る)', 'お(える)', 'つい', 'つい(に)'],
    meanings: ['结束', '完成'],
    grade: 3,
    strokes: 11,
    frequencyRank: 256,
  ),
  // raise / plan / project
  '挙': KanjiReading(
    kanji: '挙',
    onyomi: ['きょ'],
    kunyomi: ['あ(げる)', 'あ(がる)', 'こぞ(る)'],
    meanings: ['raise', 'plan', 'project'],
    grade: 4,
    strokes: 10,
    frequencyRank: 257,
  ),
  // 果 / reward / carry out
  '果': KanjiReading(
    kanji: '果',
    onyomi: ['か'],
    kunyomi: ['は(たす)', 'はた(す)', 'は(てる)', 'は(て)'],
    meanings: ['果', 'reward', 'carry out'],
    grade: 4,
    strokes: 8,
    frequencyRank: 258,
  ),
  // 西 / Spain
  '西': KanjiReading(
    kanji: '西',
    onyomi: ['せい', 'さい', 'す'],
    kunyomi: ['にし'],
    meanings: ['西', 'Spain'],
    grade: 2,
    strokes: 6,
    frequencyRank: 259,
  ),
  // forces / energy / military strength
  '勢': KanjiReading(
    kanji: '勢',
    onyomi: ['せい', 'ぜい'],
    kunyomi: ['いきお(い)', 'はずみ'],
    meanings: ['forces', 'energy', 'military strength'],
    grade: 5,
    strokes: 13,
    frequencyRank: 260,
  ),
  // dwindle / decrease / reduce
  '減': KanjiReading(
    kanji: '減',
    onyomi: ['げん'],
    kunyomi: ['へ(る)', 'へ(らす)'],
    meanings: ['dwindle', 'decrease', 'reduce'],
    grade: 5,
    strokes: 12,
    frequencyRank: 261,
  ),
  // pedestal / a stand / counter for machines and vehicles
  '台': KanjiReading(
    kanji: '台',
    onyomi: ['だい', 'たい'],
    kunyomi: ['うてな', 'われ', 'つかさ'],
    meanings: ['pedestal', 'a stand', 'counter for machines and vehicles'],
    grade: 2,
    strokes: 5,
    frequencyRank: 262,
  ),
  // 宽 / broad / spacious
  '広': KanjiReading(
    kanji: '広',
    onyomi: ['こう'],
    kunyomi: ['ひろ(い)', 'ひろ(まる)', 'ひろ(める)', 'ひろ(がる)', 'ひろ(げる)'],
    meanings: ['宽', 'broad', 'spacious'],
    grade: 2,
    strokes: 5,
    frequencyRank: 263,
  ),
  // contain / form / looks
  '容': KanjiReading(
    kanji: '容',
    onyomi: ['よう'],
    kunyomi: ['い(れる)'],
    meanings: ['contain', 'form', 'looks'],
    grade: 5,
    strokes: 10,
    frequencyRank: 264,
  ),
  // invariably / certain / inevitable
  '必': KanjiReading(
    kanji: '必',
    onyomi: ['ひつ'],
    kunyomi: ['かなら(ず)'],
    meanings: ['invariably', 'certain', 'inevitable'],
    grade: 4,
    strokes: 5,
    frequencyRank: 265,
  ),
  // apply / answer / yes
  '応': KanjiReading(
    kanji: '応',
    onyomi: ['おう', 'よう', '-のう'],
    kunyomi: ['あた(る)', 'まさに', 'こた(える)'],
    meanings: ['apply', 'answer', 'yes'],
    grade: 5,
    strokes: 7,
    frequencyRank: 266,
  ),
  // performance / act / 玩
  '演': KanjiReading(
    kanji: '演',
    onyomi: ['えん'],
    kunyomi: [],
    meanings: ['performance', 'act', '玩'],
    grade: 5,
    strokes: 14,
    frequencyRank: 267,
  ),
  // electricity
  '電': KanjiReading(
    kanji: '電',
    onyomi: ['でん'],
    kunyomi: [],
    meanings: ['electricity'],
    grade: 2,
    strokes: 13,
    frequencyRank: 268,
  ),
  // year-end / age / occasion
  '歳': KanjiReading(
    kanji: '歳',
    onyomi: ['さい', 'せい'],
    kunyomi: ['とし', 'とせ', 'よわい'],
    meanings: ['year-end', 'age', 'occasion'],
    grade: 8,
    strokes: 13,
    frequencyRank: 269,
  ),
  // dwell / reside / 活
  '住': KanjiReading(
    kanji: '住',
    onyomi: ['じゅう', 'ぢゅう', 'ちゅう'],
    kunyomi: ['す(む)', 'す(まう)', 'ず(まい)'],
    meanings: ['dwell', 'reside', '活'],
    grade: 3,
    strokes: 7,
    frequencyRank: 270,
  ),
  // contend / dispute / argue
  '争': KanjiReading(
    kanji: '争',
    onyomi: ['そう'],
    kunyomi: ['あらそ(う)', 'いか(でか)'],
    meanings: ['contend', 'dispute', 'argue'],
    grade: 4,
    strokes: 6,
    frequencyRank: 271,
  ),
  // discuss / talk
  '談': KanjiReading(
    kanji: '談',
    onyomi: ['だん'],
    kunyomi: [],
    meanings: ['discuss', 'talk'],
    grade: 3,
    strokes: 15,
    frequencyRank: 272,
  ),
  // ability / talent / skill
  '能': KanjiReading(
    kanji: '能',
    onyomi: ['のう'],
    kunyomi: ['よ(く)', 'あた(う)'],
    meanings: ['ability', 'talent', 'skill'],
    grade: 5,
    strokes: 10,
    frequencyRank: 273,
  ),
  // nothingness / 无 / ain't
  '無': KanjiReading(
    kanji: '無',
    onyomi: ['む', 'ぶ'],
    kunyomi: ['な(い)'],
    meanings: ['nothingness', '无', 'ain\'t'],
    grade: 4,
    strokes: 12,
    frequencyRank: 274,
  ),
  // again / twice / second time
  '再': KanjiReading(
    kanji: '再',
    onyomi: ['さい', 'さ'],
    kunyomi: ['ふたた(び)'],
    meanings: ['again', 'twice', 'second time'],
    grade: 5,
    strokes: 6,
    frequencyRank: 275,
  ),
  // rank / grade / throne
  '位': KanjiReading(
    kanji: '位',
    onyomi: ['い'],
    kunyomi: ['くらい', 'ぐらい'],
    meanings: ['rank', 'grade', 'throne'],
    grade: 4,
    strokes: 7,
    frequencyRank: 276,
  ),
  // placement / 放置 / set
  '置': KanjiReading(
    kanji: '置',
    onyomi: ['ち'],
    kunyomi: ['お(く)', 'お(き)'],
    meanings: ['placement', '放置', 'set'],
    grade: 4,
    strokes: 13,
    frequencyRank: 277,
  ),
  // undertake / scheme / design
  '企': KanjiReading(
    kanji: '企',
    onyomi: ['き'],
    kunyomi: ['くわだ(てる)', 'たくら(む)'],
    meanings: ['undertake', 'scheme', 'design'],
    grade: 8,
    strokes: 6,
    frequencyRank: 278,
  ),
  // 真实 / reality / Buddhist sect
  '真': KanjiReading(
    kanji: '真',
    onyomi: ['しん'],
    kunyomi: ['ま', '(ま)', 'まこと'],
    meanings: ['真实', 'reality', 'Buddhist sect'],
    grade: 3,
    strokes: 10,
    frequencyRank: 279,
  ),
  // current / a sink / flow
  '流': KanjiReading(
    kanji: '流',
    onyomi: ['りゅう', 'る'],
    kunyomi: ['なが(れる)', 'なが(れ)', 'なが(す)'],
    meanings: ['current', 'a sink', 'flow'],
    grade: 3,
    strokes: 10,
    frequencyRank: 280,
  ),
  // status / rank / capacity
  '格': KanjiReading(
    kanji: '格',
    onyomi: ['かく', 'こう', 'きゃく', 'ごう'],
    kunyomi: [],
    meanings: ['status', 'rank', 'capacity'],
    grade: 5,
    strokes: 10,
    frequencyRank: 281,
  ),
  // possess / have / exist
  '有': KanjiReading(
    kanji: '有',
    onyomi: ['ゆう', 'う'],
    kunyomi: ['あ(る)'],
    meanings: ['possess', 'have', 'exist'],
    grade: 3,
    strokes: 6,
    frequencyRank: 282,
  ),
  // doubt / distrust / be suspicious
  '疑': KanjiReading(
    kanji: '疑',
    onyomi: ['ぎ'],
    kunyomi: ['うたが(う)'],
    meanings: ['doubt', 'distrust', 'be suspicious'],
    grade: 6,
    strokes: 14,
    frequencyRank: 283,
  ),
  // 口
  '口': KanjiReading(
    kanji: '口',
    onyomi: ['こう', 'く'],
    kunyomi: ['くち'],
    meanings: ['口'],
    grade: 1,
    strokes: 3,
    frequencyRank: 284,
  ),
  // overdo / exceed / go beyond
  '過': KanjiReading(
    kanji: '過',
    onyomi: ['か'],
    kunyomi: ['す(ぎる)', 'す(ごす)', 'あやま(ち)', 'あやま(つ)', 'よぎ(る)', 'よ(ぎる)'],
    meanings: ['overdo', 'exceed', 'go beyond'],
    grade: 5,
    strokes: 12,
    frequencyRank: 285,
  ),
  // bureau / board / office
  '局': KanjiReading(
    kanji: '局',
    onyomi: ['きょく'],
    kunyomi: ['つぼね'],
    meanings: ['bureau', 'board', 'office'],
    grade: 3,
    strokes: 7,
    frequencyRank: 286,
  ),
  // 少 / little
  '少': KanjiReading(
    kanji: '少',
    onyomi: ['しょう'],
    kunyomi: ['すく(ない)', 'すこ(し)'],
    meanings: ['少', 'little'],
    grade: 2,
    strokes: 4,
    frequencyRank: 287,
  ),
  // set free / release / 火
  '放': KanjiReading(
    kanji: '放',
    onyomi: ['ほう'],
    kunyomi: ['はな(す)', 'っぱな(し)', 'はな(つ)', 'はな(れる)', 'こ(く)', 'ほう(る)'],
    meanings: ['set free', 'release', '火'],
    grade: 3,
    strokes: 8,
    frequencyRank: 288,
  ),
  // tax / duty
  '税': KanjiReading(
    kanji: '税',
    onyomi: ['ぜい'],
    kunyomi: [],
    meanings: ['tax', 'duty'],
    grade: 5,
    strokes: 12,
    frequencyRank: 289,
  ),
  // examination / investigate
  '検': KanjiReading(
    kanji: '検',
    onyomi: ['けん'],
    kunyomi: ['しら(べる)'],
    meanings: ['examination', 'investigate'],
    grade: 5,
    strokes: 12,
    frequencyRank: 290,
  ),
  // wisteria
  '藤': KanjiReading(
    kanji: '藤',
    onyomi: ['とう', 'どう'],
    kunyomi: ['ふじ'],
    meanings: ['wisteria'],
    grade: 8,
    strokes: 18,
    frequencyRank: 291,
  ),
  // 城镇 / 村庄 / block
  '町': KanjiReading(
    kanji: '町',
    onyomi: ['ちょう'],
    kunyomi: ['まち'],
    meanings: ['城镇', '村庄', 'block'],
    grade: 1,
    strokes: 7,
    frequencyRank: 292,
  ),
  // usual / ordinary / normal
  '常': KanjiReading(
    kanji: '常',
    onyomi: ['じょう'],
    kunyomi: ['つね', '(とこ)'],
    meanings: ['usual', 'ordinary', 'normal'],
    grade: 5,
    strokes: 11,
    frequencyRank: 293,
  ),
  // exam / 学校 / printing
  '校': KanjiReading(
    kanji: '校',
    onyomi: ['こう', 'きょう'],
    kunyomi: [],
    meanings: ['exam', '学校', 'printing'],
    grade: 1,
    strokes: 10,
    frequencyRank: 294,
  ),
  // fee / materials
  '料': KanjiReading(
    kanji: '料',
    onyomi: ['りょう'],
    kunyomi: [],
    meanings: ['fee', 'materials'],
    grade: 4,
    strokes: 10,
    frequencyRank: 295,
  ),
  // swamp / marsh / brilliance
  '沢': KanjiReading(
    kanji: '沢',
    onyomi: ['たく'],
    kunyomi: ['さわ', 'うるお(い)', 'うるお(す)', 'つや'],
    meanings: ['swamp', 'marsh', 'brilliance'],
    grade: 8,
    strokes: 7,
    frequencyRank: 296,
  ),
  // tailor / judge / decision
  '裁': KanjiReading(
    kanji: '裁',
    onyomi: ['さい'],
    kunyomi: ['た(つ)', 'さば(く)'],
    meanings: ['tailor', 'judge', 'decision'],
    grade: 6,
    strokes: 12,
    frequencyRank: 297,
  ),
  // status quo / conditions / circumstances
  '状': KanjiReading(
    kanji: '状',
    onyomi: ['じょう'],
    kunyomi: [],
    meanings: ['status quo', 'conditions', 'circumstances'],
    grade: 5,
    strokes: 7,
    frequencyRank: 298,
  ),
  // craft / construction / katakana e radical (no. 48)
  '工': KanjiReading(
    kanji: '工',
    onyomi: ['こう', 'く', 'ぐ'],
    kunyomi: [],
    meanings: ['craft', 'construction', 'katakana e radical (no. 48)'],
    grade: 2,
    strokes: 3,
    frequencyRank: 299,
  ),
  // 建造
  '建': KanjiReading(
    kanji: '建',
    onyomi: ['けん', 'こん'],
    kunyomi: ['た(てる)', 'た(て)', 'だ(て)', 'た(つ)'],
    meanings: ['建造'],
    grade: 4,
    strokes: 9,
    frequencyRank: 300,
  ),
  // 词 / 言语 / 语言
  '語': KanjiReading(
    kanji: '語',
    onyomi: ['ご'],
    kunyomi: ['かた(る)', 'かた(らう)'],
    meanings: ['词', '言语', '语言'],
    grade: 2,
    strokes: 14,
    frequencyRank: 301,
  ),
  // ball / sphere
  '球': KanjiReading(
    kanji: '球',
    onyomi: ['きゅう'],
    kunyomi: ['たま'],
    meanings: ['ball', 'sphere'],
    grade: 3,
    strokes: 11,
    frequencyRank: 302,
  ),
  // camp / perform / 建造
  '営': KanjiReading(
    kanji: '営',
    onyomi: ['えい'],
    kunyomi: ['いとな(む)', 'いとな(み)'],
    meanings: ['camp', 'perform', '建造'],
    grade: 5,
    strokes: 12,
    frequencyRank: 303,
  ),
  // empty / 天 / void
  '空': KanjiReading(
    kanji: '空',
    onyomi: ['くう'],
    kunyomi: ['そら', 'あ(く)', 'あ(き)', 'あ(ける)', 'から', 'す(く)', 'す(かす)', 'むな(しい)'],
    meanings: ['empty', '天', 'void'],
    grade: 1,
    strokes: 8,
    frequencyRank: 304,
  ),
  // post / employment / 工作
  '職': KanjiReading(
    kanji: '職',
    onyomi: ['しょく', 'そく'],
    kunyomi: [],
    meanings: ['post', 'employment', '工作'],
    grade: 5,
    strokes: 18,
    frequencyRank: 305,
  ),
  // evidence / proof / certificate
  '証': KanjiReading(
    kanji: '証',
    onyomi: ['しょう'],
    kunyomi: ['あかし'],
    meanings: ['evidence', 'proof', 'certificate'],
    grade: 5,
    strokes: 12,
    frequencyRank: 306,
  ),
  // soil / 土 / ground
  '土': KanjiReading(
    kanji: '土',
    onyomi: ['ど', 'と'],
    kunyomi: ['つち'],
    meanings: ['soil', '土', 'ground'],
    grade: 1,
    strokes: 3,
    frequencyRank: 307,
  ),
  // bestow / participate in / 给
  '与': KanjiReading(
    kanji: '与',
    onyomi: ['よ'],
    kunyomi: ['あた(える)', 'あずか(る)', 'くみ(する)', 'ともに'],
    meanings: ['bestow', 'participate in', '给'],
    grade: 8,
    strokes: 3,
    frequencyRank: 308,
  ),
  // hurry / emergency / sudden
  '急': KanjiReading(
    kanji: '急',
    onyomi: ['きゅう'],
    kunyomi: ['いそ(ぐ)', 'いそ(ぎ)', 'せ(く)'],
    meanings: ['hurry', 'emergency', 'sudden'],
    grade: 3,
    strokes: 9,
    frequencyRank: 309,
  ),
  // 停止 / halt
  '止': KanjiReading(
    kanji: '止',
    onyomi: ['し'],
    kunyomi: ['と(まる)', 'ど(まり)', 'と(める)', 'ど(め)', 'とど(める)', 'とど(め)', 'とど(まる)', 'や(める)', 'や(む)', 'よ(す)', 'さ(す)', 'さ(し)'],
    meanings: ['停止', 'halt'],
    grade: 2,
    strokes: 4,
    frequencyRank: 310,
  ),
  // escort / 发送
  '送': KanjiReading(
    kanji: '送',
    onyomi: ['そう'],
    kunyomi: ['おく(る)'],
    meanings: ['escort', '发送'],
    grade: 3,
    strokes: 9,
    frequencyRank: 311,
  ),
  // abet / 帮助 / 拯救
  '援': KanjiReading(
    kanji: '援',
    onyomi: ['えん'],
    kunyomi: [],
    meanings: ['abet', '帮助', '拯救'],
    grade: 8,
    strokes: 12,
    frequencyRank: 312,
  ),
  // submit / offer / present
  '供': KanjiReading(
    kanji: '供',
    onyomi: ['きょう', 'く', 'くう', 'ぐ'],
    kunyomi: ['そな(える)', 'とも', '(ども)'],
    meanings: ['submit', 'offer', 'present'],
    grade: 6,
    strokes: 8,
    frequencyRank: 313,
  ),
  // can / passable / approval
  '可': KanjiReading(
    kanji: '可',
    onyomi: ['か', 'こく'],
    kunyomi: ['べ(き)', 'べ(し)'],
    meanings: ['can', 'passable', 'approval'],
    grade: 5,
    strokes: 5,
    frequencyRank: 314,
  ),
  // duty / 战争 / campaign
  '役': KanjiReading(
    kanji: '役',
    onyomi: ['やく', 'えき'],
    kunyomi: [],
    meanings: ['duty', '战争', 'campaign'],
    grade: 3,
    strokes: 7,
    frequencyRank: 315,
  ),
  // posture / stance / appearance
  '構': KanjiReading(
    kanji: '構',
    onyomi: ['こう'],
    kunyomi: ['かま(える)', 'かま(う)'],
    meanings: ['posture', 'stance', 'appearance'],
    grade: 5,
    strokes: 14,
    frequencyRank: 316,
  ),
  // 树 / 木
  '木': KanjiReading(
    kanji: '木',
    onyomi: ['ぼく', 'もく'],
    kunyomi: ['き', '(こ)'],
    meanings: ['树', '木'],
    grade: 1,
    strokes: 4,
    frequencyRank: 317,
  ),
  // proportion / comparatively / divide
  '割': KanjiReading(
    kanji: '割',
    onyomi: ['かつ'],
    kunyomi: ['わ(る)', 'わり', 'わ(り)', 'わ(れる)', 'さ(く)'],
    meanings: ['proportion', 'comparatively', 'divide'],
    grade: 6,
    strokes: 12,
    frequencyRank: 318,
  ),
  // 听 / ask
  '聞': KanjiReading(
    kanji: '聞',
    onyomi: ['ぶん', 'もん'],
    kunyomi: ['き(く)', 'き(こえる)'],
    meanings: ['听', 'ask'],
    grade: 2,
    strokes: 14,
    frequencyRank: 319,
  ),
  // somebody / 人 / one's station in life
  '身': KanjiReading(
    kanji: '身',
    onyomi: ['しん'],
    kunyomi: ['み'],
    meanings: ['somebody', '人', 'one\'s station in life'],
    grade: 3,
    strokes: 7,
    frequencyRank: 320,
  ),
  // expense / cost / spend
  '費': KanjiReading(
    kanji: '費',
    onyomi: ['ひ'],
    kunyomi: ['つい(やす)', 'つい(える)'],
    meanings: ['expense', 'cost', 'spend'],
    grade: 5,
    strokes: 12,
    frequencyRank: 321,
  ),
  // adhere / attach / refer to
  '付': KanjiReading(
    kanji: '付',
    onyomi: ['ふ'],
    kunyomi: ['つ(ける)', 'づ(ける)', 'つ(け)', 'づ(け)', '(づけ)', 'つ(く)', 'づ(く)', 'つ(き)', '(つき)', 'づ(き)', '(づき)'],
    meanings: ['adhere', 'attach', 'refer to'],
    grade: 4,
    strokes: 5,
    frequencyRank: 322,
  ),
  // 给 / bestow / perform
  '施': KanjiReading(
    kanji: '施',
    onyomi: ['し', 'せ'],
    kunyomi: ['ほどこ(す)'],
    meanings: ['给', 'bestow', 'perform'],
    grade: 8,
    strokes: 9,
    frequencyRank: 323,
  ),
  // 切 / cutoff / be sharp
  '切': KanjiReading(
    kanji: '切',
    onyomi: ['せつ', 'さい'],
    kunyomi: ['き(る)', 'き(り)', 'ぎ(り)', 'き(れる)', 'き(れ)', 'ぎ(れ)'],
    meanings: ['切', 'cutoff', 'be sharp'],
    grade: 2,
    strokes: 4,
    frequencyRank: 324,
  ),
  // wherefore / a reason
  '由': KanjiReading(
    kanji: '由',
    onyomi: ['ゆ', 'ゆう', 'ゆい'],
    kunyomi: ['よし', 'よ(る)'],
    meanings: ['wherefore', 'a reason'],
    grade: 3,
    strokes: 5,
    frequencyRank: 325,
  ),
  // opinion / theory / explanation
  '説': KanjiReading(
    kanji: '説',
    onyomi: ['せつ', 'ぜい'],
    kunyomi: ['と(く)'],
    meanings: ['opinion', 'theory', 'explanation'],
    grade: 4,
    strokes: 14,
    frequencyRank: 326,
  ),
  // revolve / turn around / 改变
  '転': KanjiReading(
    kanji: '転',
    onyomi: ['てん'],
    kunyomi: ['ころ(がる)', 'ころ(げる)', 'ころ(がす)', 'ころ(ぶ)', 'まろ(ぶ)', 'うたた', 'うつ(る)', 'くる(めく)'],
    meanings: ['revolve', 'turn around', '改变'],
    grade: 3,
    strokes: 11,
    frequencyRank: 327,
  ),
  // 吃 / 食物
  '食': KanjiReading(
    kanji: '食',
    onyomi: ['しょく', 'じき'],
    kunyomi: ['く(う)', 'く(らう)', 'た(べる)', 'は(む)'],
    meanings: ['吃', '食物'],
    grade: 2,
    strokes: 9,
    frequencyRank: 328,
  ),
  // 比较 / race / ratio
  '比': KanjiReading(
    kanji: '比',
    onyomi: ['ひ'],
    kunyomi: ['くら(べる)'],
    meanings: ['比较', 'race', 'ratio'],
    grade: 5,
    strokes: 4,
    frequencyRank: 329,
  ),
  // 困难 / impossible / trouble
  '難': KanjiReading(
    kanji: '難',
    onyomi: ['なん'],
    kunyomi: ['かた(い)', 'がた(い)', 'むずか(しい)', 'むづか(しい)', 'むつか(しい)', 'にく(い)'],
    meanings: ['困难', 'impossible', 'trouble'],
    grade: 6,
    strokes: 18,
    frequencyRank: 330,
  ),
  // ward off / defend / 保护
  '防': KanjiReading(
    kanji: '防',
    onyomi: ['ぼう'],
    kunyomi: ['ふせ(ぐ)'],
    meanings: ['ward off', 'defend', '保护'],
    grade: 5,
    strokes: 7,
    frequencyRank: 331,
  ),
  // supplement / supply / make good
  '補': KanjiReading(
    kanji: '補',
    onyomi: ['ほ'],
    kunyomi: ['おぎな(う)'],
    meanings: ['supplement', 'supply', 'make good'],
    grade: 6,
    strokes: 12,
    frequencyRank: 332,
  ),
  // 车
  '車': KanjiReading(
    kanji: '車',
    onyomi: ['しゃ'],
    kunyomi: ['くるま'],
    meanings: ['车'],
    grade: 1,
    strokes: 7,
    frequencyRank: 333,
  ),
  // tenderness / excel / surpass
  '優': KanjiReading(
    kanji: '優',
    onyomi: ['ゆう', 'う'],
    kunyomi: ['やさ(しい)', 'すぐ(れる)', 'まさ(る)'],
    meanings: ['tenderness', 'excel', 'surpass'],
    grade: 6,
    strokes: 17,
    frequencyRank: 334,
  ),
  // husband / 男人
  '夫': KanjiReading(
    kanji: '夫',
    onyomi: ['ふ', 'ふう', 'ぶ'],
    kunyomi: ['おっと', 'それ'],
    meanings: ['husband', '男人'],
    grade: 4,
    strokes: 4,
    frequencyRank: 335,
  ),
  // polish / study of / sharpen
  '研': KanjiReading(
    kanji: '研',
    onyomi: ['けん'],
    kunyomi: ['と(ぐ)'],
    meanings: ['polish', 'study of', 'sharpen'],
    grade: 3,
    strokes: 9,
    frequencyRank: 336,
  ),
  // income / obtain / reap
  '収': KanjiReading(
    kanji: '収',
    onyomi: ['しゅう'],
    kunyomi: ['おさ(める)', 'おさ(まる)'],
    meanings: ['income', 'obtain', 'reap'],
    grade: 6,
    strokes: 4,
    frequencyRank: 337,
  ),
  // severance / decline / refuse
  '断': KanjiReading(
    kanji: '断',
    onyomi: ['だん'],
    kunyomi: ['た(つ)', 'ことわ(る)', 'さだ(める)'],
    meanings: ['severance', 'decline', 'refuse'],
    grade: 5,
    strokes: 11,
    frequencyRank: 338,
  ),
  // well / well crib / 城镇
  '井': KanjiReading(
    kanji: '井',
    onyomi: ['せい', 'しょう'],
    kunyomi: ['い'],
    meanings: ['well', 'well crib', '城镇'],
    grade: 4,
    strokes: 4,
    frequencyRank: 339,
  ),
  // what
  '何': KanjiReading(
    kanji: '何',
    onyomi: ['か'],
    kunyomi: ['なに', 'なん', '(なに)', '(なん)'],
    meanings: ['what'],
    grade: 2,
    strokes: 7,
    frequencyRank: 340,
  ),
  // 南
  '南': KanjiReading(
    kanji: '南',
    onyomi: ['なん', 'な'],
    kunyomi: ['みなみ'],
    meanings: ['南'],
    grade: 2,
    strokes: 9,
    frequencyRank: 341,
  ),
  // 石
  '石': KanjiReading(
    kanji: '石',
    onyomi: ['せき', 'しゃく', 'こく'],
    kunyomi: ['いし'],
    meanings: ['石'],
    grade: 1,
    strokes: 5,
    frequencyRank: 342,
  ),
  // leg / 足 / be sufficient
  '足': KanjiReading(
    kanji: '足',
    onyomi: ['そく'],
    kunyomi: ['あし', 'た(りる)', 'た(る)', 'た(す)'],
    meanings: ['leg', '足', 'be sufficient'],
    grade: 1,
    strokes: 7,
    frequencyRank: 343,
  ),
  // difference / differ
  '違': KanjiReading(
    kanji: '違',
    onyomi: ['い'],
    kunyomi: ['ちが(う)', 'ちが(い)', 'ちが(える)', 'たが(う)', 'たが(える)'],
    meanings: ['difference', 'differ'],
    grade: 8,
    strokes: 13,
    frequencyRank: 344,
  ),
  // extinguish / blow out / turn off
  '消': KanjiReading(
    kanji: '消',
    onyomi: ['しょう'],
    kunyomi: ['き(える)', 'け(す)'],
    meanings: ['extinguish', 'blow out', 'turn off'],
    grade: 3,
    strokes: 10,
    frequencyRank: 345,
  ),
  // boundary / border / region
  '境': KanjiReading(
    kanji: '境',
    onyomi: ['きょう', 'けい'],
    kunyomi: ['さかい'],
    meanings: ['boundary', 'border', 'region'],
    grade: 5,
    strokes: 14,
    frequencyRank: 346,
  ),
  // gods / 心 / soul
  '神': KanjiReading(
    kanji: '神',
    onyomi: ['しん', 'じん'],
    kunyomi: ['かみ', '(かん)', '(こう)'],
    meanings: ['gods', '心', 'soul'],
    grade: 3,
    strokes: 9,
    frequencyRank: 347,
  ),
  // turn / number in a series
  '番': KanjiReading(
    kanji: '番',
    onyomi: ['ばん'],
    kunyomi: ['つが(い)'],
    meanings: ['turn', 'number in a series'],
    grade: 2,
    strokes: 12,
    frequencyRank: 348,
  ),
  // standard / 测量
  '規': KanjiReading(
    kanji: '規',
    onyomi: ['き'],
    kunyomi: [],
    meanings: ['standard', '测量'],
    grade: 5,
    strokes: 11,
    frequencyRank: 349,
  ),
  // 艺术 / technique / skill
  '術': KanjiReading(
    kanji: '術',
    onyomi: ['じゅつ'],
    kunyomi: ['すべ'],
    meanings: ['艺术', 'technique', 'skill'],
    grade: 5,
    strokes: 11,
    frequencyRank: 350,
  ),
  // safeguard / 保护
  '護': KanjiReading(
    kanji: '護',
    onyomi: ['ご'],
    kunyomi: ['まも(る)'],
    meanings: ['safeguard', '保护'],
    grade: 5,
    strokes: 20,
    frequencyRank: 351,
  ),
  // unfold / expand
  '展': KanjiReading(
    kanji: '展',
    onyomi: ['てん'],
    kunyomi: [],
    meanings: ['unfold', 'expand'],
    grade: 6,
    strokes: 10,
    frequencyRank: 352,
  ),
  // attitude / condition / figure
  '態': KanjiReading(
    kanji: '態',
    onyomi: ['たい'],
    kunyomi: ['わざ(と)'],
    meanings: ['attitude', 'condition', 'figure'],
    grade: 5,
    strokes: 14,
    frequencyRank: 353,
  ),
  // guidance / leading / conduct
  '導': KanjiReading(
    kanji: '導',
    onyomi: ['どう'],
    kunyomi: ['みちび(く)'],
    meanings: ['guidance', 'leading', 'conduct'],
    grade: 5,
    strokes: 15,
    frequencyRank: 354,
  ),
  // fresh / vivid / clear
  '鮮': KanjiReading(
    kanji: '鮮',
    onyomi: ['せん'],
    kunyomi: ['あざ(やか)'],
    meanings: ['fresh', 'vivid', 'clear'],
    grade: 8,
    strokes: 17,
    frequencyRank: 355,
  ),
  // equip / provision / preparation
  '備': KanjiReading(
    kanji: '備',
    onyomi: ['び'],
    kunyomi: ['そな(える)', 'そな(わる)', 'つぶさ(に)'],
    meanings: ['equip', 'provision', 'preparation'],
    grade: 5,
    strokes: 12,
    frequencyRank: 356,
  ),
  // 家 / 房子 / residence
  '宅': KanjiReading(
    kanji: '宅',
    onyomi: ['たく'],
    kunyomi: [],
    meanings: ['家', '房子', 'residence'],
    grade: 6,
    strokes: 6,
    frequencyRank: 357,
  ),
  // harm / injury
  '害': KanjiReading(
    kanji: '害',
    onyomi: ['がい'],
    kunyomi: [],
    meanings: ['harm', 'injury'],
    grade: 4,
    strokes: 10,
    frequencyRank: 358,
  ),
  // distribute / spouse / exile
  '配': KanjiReading(
    kanji: '配',
    onyomi: ['はい'],
    kunyomi: ['くば(る)'],
    meanings: ['distribute', 'spouse', 'exile'],
    grade: 3,
    strokes: 10,
    frequencyRank: 359,
  ),
  // vice- / assistant / aide
  '副': KanjiReading(
    kanji: '副',
    onyomi: ['ふく'],
    kunyomi: [],
    meanings: ['vice-', 'assistant', 'aide'],
    grade: 4,
    strokes: 11,
    frequencyRank: 360,
  ),
  // calculate / divining / 数字
  '算': KanjiReading(
    kanji: '算',
    onyomi: ['さん'],
    kunyomi: ['そろ'],
    meanings: ['calculate', 'divining', '数字'],
    grade: 2,
    strokes: 14,
    frequencyRank: 361,
  ),
  // inspection / regard as / 看
  '視': KanjiReading(
    kanji: '視',
    onyomi: ['し'],
    kunyomi: ['み(る)'],
    meanings: ['inspection', 'regard as', '看'],
    grade: 6,
    strokes: 11,
    frequencyRank: 362,
  ),
  // article / clause / counter for articles, clauses, paragraphs, etc.
  '条': KanjiReading(
    kanji: '条',
    onyomi: ['じょう', 'ちょう', 'でき'],
    kunyomi: ['えだ', 'すじ'],
    meanings: ['article', 'clause', 'counter for articles, clauses, paragraphs, etc.'],
    grade: 5,
    strokes: 7,
    frequencyRank: 363,
  ),
  // tree trunk / main part / talent
  '幹': KanjiReading(
    kanji: '幹',
    onyomi: ['かん'],
    kunyomi: ['みき'],
    meanings: ['tree trunk', 'main part', 'talent'],
    grade: 5,
    strokes: 13,
    frequencyRank: 364,
  ),
  // single / alone / spontaneously
  '独': KanjiReading(
    kanji: '独',
    onyomi: ['どく', 'とく'],
    kunyomi: ['ひと(り)'],
    meanings: ['single', 'alone', 'spontaneously'],
    grade: 5,
    strokes: 9,
    frequencyRank: 365,
  ),
  // admonish / commandment
  '警': KanjiReading(
    kanji: '警',
    onyomi: ['けい'],
    kunyomi: ['いまし(める)'],
    meanings: ['admonish', 'commandment'],
    grade: 6,
    strokes: 19,
    frequencyRank: 366,
  ),
  // Shinto shrine / constellations / palace
  '宮': KanjiReading(
    kanji: '宮',
    onyomi: ['きゅう', 'ぐう', 'く', 'くう'],
    kunyomi: ['みや'],
    meanings: ['Shinto shrine', 'constellations', 'palace'],
    grade: 3,
    strokes: 10,
    frequencyRank: 367,
  ),
  // research / 学习
  '究': KanjiReading(
    kanji: '究',
    onyomi: ['きゅう', 'く'],
    kunyomi: ['きわ(める)'],
    meanings: ['research', '学习'],
    grade: 3,
    strokes: 7,
    frequencyRank: 368,
  ),
  // bring up / grow up / raise
  '育': KanjiReading(
    kanji: '育',
    onyomi: ['いく'],
    kunyomi: ['そだ(つ)', 'そだ(ち)', 'そだ(てる)', 'はぐく(む)'],
    meanings: ['bring up', 'grow up', 'raise'],
    grade: 3,
    strokes: 8,
    frequencyRank: 369,
  ),
  // seat / mat / occasion
  '席': KanjiReading(
    kanji: '席',
    onyomi: ['せき'],
    kunyomi: ['むしろ'],
    meanings: ['seat', 'mat', 'occasion'],
    grade: 4,
    strokes: 10,
    frequencyRank: 370,
  ),
  // transport / 发送 / be inferior
  '輸': KanjiReading(
    kanji: '輸',
    onyomi: ['ゆ', 'しゅ'],
    kunyomi: [],
    meanings: ['transport', '发送', 'be inferior'],
    grade: 5,
    strokes: 16,
    frequencyRank: 371,
  ),
  // call on / visit / look up
  '訪': KanjiReading(
    kanji: '訪',
    onyomi: ['ほう'],
    kunyomi: ['おとず(れる)', 'たず(ねる)', 'と(う)'],
    meanings: ['call on', 'visit', 'look up'],
    grade: 6,
    strokes: 11,
    frequencyRank: 372,
  ),
  // 音乐 / comfort / ease
  '楽': KanjiReading(
    kanji: '楽',
    onyomi: ['がく', 'らく', 'ごう'],
    kunyomi: ['たの(しい)', 'たの(しむ)', 'この(む)'],
    meanings: ['音乐', 'comfort', 'ease'],
    grade: 2,
    strokes: 13,
    frequencyRank: 373,
  ),
  // rouse / wake up / get up
  '起': KanjiReading(
    kanji: '起',
    onyomi: ['き'],
    kunyomi: ['お(きる)', 'お(こる)', 'お(こす)', 'おこ(す)', 'た(つ)'],
    meanings: ['rouse', 'wake up', 'get up'],
    grade: 3,
    strokes: 10,
    frequencyRank: 374,
  ),
  // ten thousand / 10,000
  '万': KanjiReading(
    kanji: '万',
    onyomi: ['まん', 'ばん'],
    kunyomi: ['よろず'],
    meanings: ['ten thousand', '10,000'],
    grade: 2,
    strokes: 3,
    frequencyRank: 375,
  ),
  // don / arrive / wear
  '着': KanjiReading(
    kanji: '着',
    onyomi: ['ちゃく', 'じゃく'],
    kunyomi: ['き(る)', 'き(せる)', 'つ(く)', 'つ(ける)'],
    meanings: ['don', 'arrive', 'wear'],
    grade: 3,
    strokes: 12,
    frequencyRank: 376,
  ),
  // ride / 力量 / multiplication
  '乗': KanjiReading(
    kanji: '乗',
    onyomi: ['じょう', 'しょう'],
    kunyomi: ['の(る)', 'の(り)', 'の(せる)'],
    meanings: ['ride', '力量', 'multiplication'],
    grade: 3,
    strokes: 9,
    frequencyRank: 377,
  ),
  // store / 商店
  '店': KanjiReading(
    kanji: '店',
    onyomi: ['てん'],
    kunyomi: ['みせ', 'たな'],
    meanings: ['store', '商店'],
    grade: 2,
    strokes: 8,
    frequencyRank: 378,
  ),
  // mention / state / 说
  '述': KanjiReading(
    kanji: '述',
    onyomi: ['じゅつ'],
    kunyomi: ['の(べる)'],
    meanings: ['mention', 'state', '说'],
    grade: 5,
    strokes: 8,
    frequencyRank: 379,
  ),
  // remainder / leftover / balance
  '残': KanjiReading(
    kanji: '残',
    onyomi: ['ざん', 'さん'],
    kunyomi: ['のこ(る)', 'のこ(す)', 'そこな(う)', 'のこ(り)'],
    meanings: ['remainder', 'leftover', 'balance'],
    grade: 4,
    strokes: 10,
    frequencyRank: 380,
  ),
  // idea / thought / conception
  '想': KanjiReading(
    kanji: '想',
    onyomi: ['そう', 'そ'],
    kunyomi: ['おも(う)'],
    meanings: ['idea', 'thought', 'conception'],
    grade: 3,
    strokes: 13,
    frequencyRank: 381,
  ),
  // line / track
  '線': KanjiReading(
    kanji: '線',
    onyomi: ['せん'],
    kunyomi: ['すじ'],
    meanings: ['line', 'track'],
    grade: 2,
    strokes: 15,
    frequencyRank: 382,
  ),
  // ratio / rate / proportion
  '率': KanjiReading(
    kanji: '率',
    onyomi: ['そつ', 'りつ', 'しゅつ'],
    kunyomi: ['ひき(いる)'],
    meanings: ['ratio', 'rate', 'proportion'],
    grade: 5,
    strokes: 11,
    frequencyRank: 383,
  ),
  // ill / sick
  '病': KanjiReading(
    kanji: '病',
    onyomi: ['びょう', 'へい'],
    kunyomi: ['や(む)', 'や(み)', 'やまい'],
    meanings: ['ill', 'sick'],
    grade: 3,
    strokes: 10,
    frequencyRank: 384,
  ),
  // agriculture / farmers
  '農': KanjiReading(
    kanji: '農',
    onyomi: ['のう'],
    kunyomi: [],
    meanings: ['agriculture', 'farmers'],
    grade: 3,
    strokes: 13,
    frequencyRank: 385,
  ),
  // state / province
  '州': KanjiReading(
    kanji: '州',
    onyomi: ['しゅう', 'す'],
    kunyomi: ['す'],
    meanings: ['state', 'province'],
    grade: 3,
    strokes: 6,
    frequencyRank: 386,
  ),
  // warrior / military / chivalry
  '武': KanjiReading(
    kanji: '武',
    onyomi: ['ぶ', 'む'],
    kunyomi: ['たけ', 'たけ(し)'],
    meanings: ['warrior', 'military', 'chivalry'],
    grade: 5,
    strokes: 8,
    frequencyRank: 387,
  ),
  // 声音
  '声': KanjiReading(
    kanji: '声',
    onyomi: ['せい', 'しょう'],
    kunyomi: ['こえ', '(こわ)'],
    meanings: ['声音'],
    grade: 2,
    strokes: 7,
    frequencyRank: 388,
  ),
  // substance / quality / matter
  '質': KanjiReading(
    kanji: '質',
    onyomi: ['しつ', 'しち', 'ち'],
    kunyomi: ['たち', 'ただ(す)', 'もと', 'わりふ'],
    meanings: ['substance', 'quality', 'matter'],
    grade: 5,
    strokes: 15,
    frequencyRank: 389,
  ),
  // wish / sense / idea
  '念': KanjiReading(
    kanji: '念',
    onyomi: ['ねん'],
    kunyomi: [],
    meanings: ['wish', 'sense', 'idea'],
    grade: 4,
    strokes: 8,
    frequencyRank: 390,
  ),
  // 等待 / depend on
  '待': KanjiReading(
    kanji: '待',
    onyomi: ['たい'],
    kunyomi: ['ま(つ)', 'ま(ち)'],
    meanings: ['等待', 'depend on'],
    grade: 3,
    strokes: 9,
    frequencyRank: 391,
  ),
  // test / try / attempt
  '試': KanjiReading(
    kanji: '試',
    onyomi: ['し'],
    kunyomi: ['こころ(みる)', 'ため(す)'],
    meanings: ['test', 'try', 'attempt'],
    grade: 4,
    strokes: 13,
    frequencyRank: 392,
  ),
  // tribe / 家庭
  '族': KanjiReading(
    kanji: '族',
    onyomi: ['ぞく'],
    kunyomi: [],
    meanings: ['tribe', '家庭'],
    grade: 3,
    strokes: 11,
    frequencyRank: 393,
  ),
  // elephant / pattern after / imitate
  '象': KanjiReading(
    kanji: '象',
    onyomi: ['しょう', 'ぞう'],
    kunyomi: ['かたど(る)'],
    meanings: ['elephant', 'pattern after', 'imitate'],
    grade: 5,
    strokes: 12,
    frequencyRank: 394,
  ),
  // silver
  '銀': KanjiReading(
    kanji: '銀',
    onyomi: ['ぎん'],
    kunyomi: ['しろがね'],
    meanings: ['silver'],
    grade: 3,
    strokes: 14,
    frequencyRank: 395,
  ),
  // range / region / limits
  '域': KanjiReading(
    kanji: '域',
    onyomi: ['いき'],
    kunyomi: [],
    meanings: ['range', 'region', 'limits'],
    grade: 6,
    strokes: 11,
    frequencyRank: 396,
  ),
  // 帮助 / rescue / assist
  '助': KanjiReading(
    kanji: '助',
    onyomi: ['じょ'],
    kunyomi: ['たす(ける)', 'たす(かる)', 'す(ける)', 'すけ'],
    meanings: ['帮助', 'rescue', 'assist'],
    grade: 3,
    strokes: 7,
    frequencyRank: 397,
  ),
  // labor / thank for / reward for
  '労': KanjiReading(
    kanji: '労',
    onyomi: ['ろう'],
    kunyomi: ['ろう(する)', 'いたわ(る)', 'いた(ずき)', 'ねぎら', 'つか(れる)', 'ねぎら(う)'],
    meanings: ['labor', 'thank for', 'reward for'],
    grade: 4,
    strokes: 7,
    frequencyRank: 398,
  ),
  // example / custom / usage
  '例': KanjiReading(
    kanji: '例',
    onyomi: ['れい'],
    kunyomi: ['たと(える)'],
    meanings: ['example', 'custom', 'usage'],
    grade: 4,
    strokes: 8,
    frequencyRank: 399,
  ),
  // defense / protection
  '衛': KanjiReading(
    kanji: '衛',
    onyomi: ['えい', 'え'],
    kunyomi: [],
    meanings: ['defense', 'protection'],
    grade: 5,
    strokes: 16,
    frequencyRank: 400,
  ),
  // sort of thing / so / if so
  '然': KanjiReading(
    kanji: '然',
    onyomi: ['ぜん', 'ねん'],
    kunyomi: ['しか', 'しか(り)', 'しか(し)', 'さ'],
    meanings: ['sort of thing', 'so', 'if so'],
    grade: 4,
    strokes: 12,
    frequencyRank: 401,
  ),
  // 早 / 快
  '早': KanjiReading(
    kanji: '早',
    onyomi: ['そう', 'さっ'],
    kunyomi: ['はや(い)', 'はや', '(はや)', 'はや(まる)', 'はや(める)', '(さ)'],
    meanings: ['早', '快'],
    grade: 1,
    strokes: 6,
    frequencyRank: 402,
  ),
  // counter for bows &amp; stringed instruments / stretch / spread
  '張': KanjiReading(
    kanji: '張',
    onyomi: ['ちょう'],
    kunyomi: ['は(る)', 'は(り)', 'ば(り)'],
    meanings: ['counter for bows &amp; stringed instruments', 'stretch', 'spread'],
    grade: 5,
    strokes: 11,
    frequencyRank: 403,
  ),
  // reflect / reflection / projection
  '映': KanjiReading(
    kanji: '映',
    onyomi: ['えい'],
    kunyomi: ['うつ(る)', 'うつ(す)', 'は(える)', 'ば(え)'],
    meanings: ['reflect', 'reflection', 'projection'],
    grade: 6,
    strokes: 9,
    frequencyRank: 404,
  ),
  // limit / restrict / to best of ability
  '限': KanjiReading(
    kanji: '限',
    onyomi: ['げん'],
    kunyomi: ['かぎ(る)', 'かぎ(り)'],
    meanings: ['limit', 'restrict', 'to best of ability'],
    grade: 5,
    strokes: 9,
    frequencyRank: 405,
  ),
  // parent / intimacy / relative
  '親': KanjiReading(
    kanji: '親',
    onyomi: ['しん'],
    kunyomi: ['おや', '(おや)', 'した(しい)', 'した(しむ)'],
    meanings: ['parent', 'intimacy', 'relative'],
    grade: 2,
    strokes: 16,
    frequencyRank: 406,
  ),
  // forehead / tablet / plaque
  '額': KanjiReading(
    kanji: '額',
    onyomi: ['がく'],
    kunyomi: ['ひたい'],
    meanings: ['forehead', 'tablet', 'plaque'],
    grade: 5,
    strokes: 18,
    frequencyRank: 407,
  ),
  // oversee / official / govt office
  '監': KanjiReading(
    kanji: '監',
    onyomi: ['かん'],
    kunyomi: [],
    meanings: ['oversee', 'official', 'govt office'],
    grade: 8,
    strokes: 15,
    frequencyRank: 408,
  ),
  // ring / circle / loop
  '環': KanjiReading(
    kanji: '環',
    onyomi: ['かん'],
    kunyomi: ['わ'],
    meanings: ['ring', 'circle', 'loop'],
    grade: 8,
    strokes: 17,
    frequencyRank: 409,
  ),
  // verification / effect / testing
  '験': KanjiReading(
    kanji: '験',
    onyomi: ['けん', 'げん'],
    kunyomi: ['あかし', 'しるし', 'ため(す)', 'ためし'],
    meanings: ['verification', 'effect', 'testing'],
    grade: 4,
    strokes: 18,
    frequencyRank: 410,
  ),
  // chase / drive away / follow
  '追': KanjiReading(
    kanji: '追',
    onyomi: ['つい'],
    kunyomi: ['お(う)'],
    meanings: ['chase', 'drive away', 'follow'],
    grade: 3,
    strokes: 9,
    frequencyRank: 411,
  ),
  // hearing / judge / trial
  '審': KanjiReading(
    kanji: '審',
    onyomi: ['しん'],
    kunyomi: ['つまび(らか)', 'つぶさ(に)'],
    meanings: ['hearing', 'judge', 'trial'],
    grade: 8,
    strokes: 15,
    frequencyRank: 412,
  ),
  // make a deal / selling / dealing in
  '商': KanjiReading(
    kanji: '商',
    onyomi: ['しょう'],
    kunyomi: ['あきな(う)'],
    meanings: ['make a deal', 'selling', 'dealing in'],
    grade: 3,
    strokes: 11,
    frequencyRank: 413,
  ),
  // 叶 / plane / lobe
  '葉': KanjiReading(
    kanji: '葉',
    onyomi: ['よう'],
    kunyomi: ['は'],
    meanings: ['叶', 'plane', 'lobe'],
    grade: 3,
    strokes: 12,
    frequencyRank: 414,
  ),
  // righteousness / justice / morality
  '義': KanjiReading(
    kanji: '義',
    onyomi: ['ぎ'],
    kunyomi: [],
    meanings: ['righteousness', 'justice', 'morality'],
    grade: 5,
    strokes: 13,
    frequencyRank: 415,
  ),
  // transmit / go along / walk along
  '伝': KanjiReading(
    kanji: '伝',
    onyomi: ['でん', 'てん'],
    kunyomi: ['つた(わる)', 'つた(える)', 'つた(う)', 'つだ(う)', 'づた(い)', 'つて'],
    meanings: ['transmit', 'go along', 'walk along'],
    grade: 4,
    strokes: 6,
    frequencyRank: 416,
  ),
  // 工作 / (kokuji)
  '働': KanjiReading(
    kanji: '働',
    onyomi: ['どう'],
    kunyomi: ['はたら(く)'],
    meanings: ['工作', '(kokuji)'],
    grade: 4,
    strokes: 13,
    frequencyRank: 417,
  ),
  // shape / form / style
  '形': KanjiReading(
    kanji: '形',
    onyomi: ['けい', 'ぎょう'],
    kunyomi: ['かた', '(がた)', 'かたち', 'なり'],
    meanings: ['shape', 'form', 'style'],
    grade: 2,
    strokes: 7,
    frequencyRank: 418,
  ),
  // scenery / view
  '景': KanjiReading(
    kanji: '景',
    onyomi: ['けい'],
    kunyomi: [],
    meanings: ['scenery', 'view'],
    grade: 4,
    strokes: 12,
    frequencyRank: 419,
  ),
  // fall / drop / come down
  '落': KanjiReading(
    kanji: '落',
    onyomi: ['らく'],
    kunyomi: ['お(ちる)', 'お(ち)', 'お(とす)'],
    meanings: ['fall', 'drop', 'come down'],
    grade: 3,
    strokes: 12,
    frequencyRank: 420,
  ),
  // Europe
  '欧': KanjiReading(
    kanji: '欧',
    onyomi: ['おう'],
    kunyomi: ['うた(う)', 'は(く)'],
    meanings: ['Europe'],
    grade: 8,
    strokes: 8,
    frequencyRank: 421,
  ),
  // shouldering / 搬运 / raise
  '担': KanjiReading(
    kanji: '担',
    onyomi: ['たん'],
    kunyomi: ['かつ(ぐ)', 'にな(う)'],
    meanings: ['shouldering', '搬运', 'raise'],
    grade: 6,
    strokes: 8,
    frequencyRank: 422,
  ),
  // fond / pleasing / like something
  '好': KanjiReading(
    kanji: '好',
    onyomi: ['こう'],
    kunyomi: ['この(む)', 'す(く)', 'よ(い)', 'い(い)'],
    meanings: ['fond', 'pleasing', 'like something'],
    grade: 4,
    strokes: 6,
    frequencyRank: 423,
  ),
  // retreat / withdraw / retire
  '退': KanjiReading(
    kanji: '退',
    onyomi: ['たい'],
    kunyomi: ['しりぞ(く)', 'しりぞ(ける)', 'ひ(く)', 'の(く)', 'の(ける)', 'ど(く)'],
    meanings: ['retreat', 'withdraw', 'retire'],
    grade: 6,
    strokes: 9,
    frequencyRank: 424,
  ),
  // semi- / correspond to / proportionate to
  '準': KanjiReading(
    kanji: '準',
    onyomi: ['じゅん'],
    kunyomi: ['じゅん(じる)', 'じゅん(ずる)', 'なぞら(える)', 'のり', 'ひと(しい)', 'みずもり'],
    meanings: ['semi-', 'correspond to', 'proportionate to'],
    grade: 5,
    strokes: 13,
    frequencyRank: 425,
  ),
  // prize / reward / praise
  '賞': KanjiReading(
    kanji: '賞',
    onyomi: ['しょう'],
    kunyomi: ['ほ(める)'],
    meanings: ['prize', 'reward', 'praise'],
    grade: 5,
    strokes: 15,
    frequencyRank: 426,
  ),
  // accusation / sue / complain of pain
  '訴': KanjiReading(
    kanji: '訴',
    onyomi: ['そ'],
    kunyomi: ['うった(える)'],
    meanings: ['accusation', 'sue', 'complain of pain'],
    grade: 8,
    strokes: 12,
    frequencyRank: 427,
  ),
  // environs / boundary / border
  '辺': KanjiReading(
    kanji: '辺',
    onyomi: ['へん'],
    kunyomi: ['あた(り)', 'ほと(り)', '(べ)'],
    meanings: ['environs', 'boundary', 'border'],
    grade: 4,
    strokes: 5,
    frequencyRank: 428,
  ),
  // create / 制作 / structure
  '造': KanjiReading(
    kanji: '造',
    onyomi: ['ぞう'],
    kunyomi: ['つく(る)', 'つく(り)', 'づく(り)'],
    meanings: ['create', '制作', 'structure'],
    grade: 5,
    strokes: 10,
    frequencyRank: 429,
  ),
  // England / English / hero
  '英': KanjiReading(
    kanji: '英',
    onyomi: ['えい'],
    kunyomi: ['はなぶさ'],
    meanings: ['England', 'English', 'hero'],
    grade: 4,
    strokes: 8,
    frequencyRank: 430,
  ),
  // incur / cover / veil
  '被': KanjiReading(
    kanji: '被',
    onyomi: ['ひ'],
    kunyomi: ['こうむ(る)', 'おお(う)', 'かぶ(る)', 'かぶ(せる)'],
    meanings: ['incur', 'cover', 'veil'],
    grade: 8,
    strokes: 10,
    frequencyRank: 431,
  ),
  // stocks / stump / shares
  '株': KanjiReading(
    kanji: '株',
    onyomi: ['しゅ'],
    kunyomi: ['かぶ'],
    meanings: ['stocks', 'stump', 'shares'],
    grade: 6,
    strokes: 10,
    frequencyRank: 432,
  ),
  // 头 / counter for large animals
  '頭': KanjiReading(
    kanji: '頭',
    onyomi: ['とう', 'ず', 'と'],
    kunyomi: ['あたま', 'かしら', '(がしら)', 'かぶり'],
    meanings: ['头', 'counter for large animals'],
    grade: 2,
    strokes: 16,
    frequencyRank: 433,
  ),
  // skill / 艺术 / craft
  '技': KanjiReading(
    kanji: '技',
    onyomi: ['ぎ'],
    kunyomi: ['わざ'],
    meanings: ['skill', '艺术', 'craft'],
    grade: 5,
    strokes: 7,
    frequencyRank: 434,
  ),
  // lower / 短 / humble
  '低': KanjiReading(
    kanji: '低',
    onyomi: ['てい'],
    kunyomi: ['ひく(い)', 'ひく(める)', 'ひく(まる)'],
    meanings: ['lower', '短', 'humble'],
    grade: 4,
    strokes: 7,
    frequencyRank: 435,
  ),
  // every
  '毎': KanjiReading(
    kanji: '毎',
    onyomi: ['まい'],
    kunyomi: ['ごと', 'ごと(に)'],
    meanings: ['every'],
    grade: 2,
    strokes: 6,
    frequencyRank: 436,
  ),
  // doctor / 药
  '医': KanjiReading(
    kanji: '医',
    onyomi: ['い'],
    kunyomi: ['い(やす)', 'い(する)', 'くすし'],
    meanings: ['doctor', '药'],
    grade: 3,
    strokes: 7,
    frequencyRank: 437,
  ),
  // restore / return to / revert
  '復': KanjiReading(
    kanji: '復',
    onyomi: ['ふく'],
    kunyomi: ['また'],
    meanings: ['restore', 'return to', 'revert'],
    grade: 5,
    strokes: 12,
    frequencyRank: 438,
  ),
  // attend / doing / official
  '仕': KanjiReading(
    kanji: '仕',
    onyomi: ['し', 'じ'],
    kunyomi: ['つか(える)'],
    meanings: ['attend', 'doing', 'official'],
    grade: 3,
    strokes: 5,
    frequencyRank: 439,
  ),
  // gone / past / quit
  '去': KanjiReading(
    kanji: '去',
    onyomi: ['きょ', 'こ'],
    kunyomi: ['さ(る)'],
    meanings: ['gone', 'past', 'quit'],
    grade: 3,
    strokes: 5,
    frequencyRank: 440,
  ),
  // figure / form / shape
  '姿': KanjiReading(
    kanji: '姿',
    onyomi: ['し'],
    kunyomi: ['すがた'],
    meanings: ['figure', 'form', 'shape'],
    grade: 6,
    strokes: 9,
    frequencyRank: 441,
  ),
  // flavor / taste
  '味': KanjiReading(
    kanji: '味',
    onyomi: ['み'],
    kunyomi: ['あじ', 'あじ(わう)'],
    meanings: ['flavor', 'taste'],
    grade: 3,
    strokes: 8,
    frequencyRank: 442,
  ),
  // defeat / negative / -
  '負': KanjiReading(
    kanji: '負',
    onyomi: ['ふ'],
    kunyomi: ['ま(ける)', 'ま(かす)', 'お(う)'],
    meanings: ['defeat', 'negative', '-'],
    grade: 3,
    strokes: 9,
    frequencyRank: 443,
  ),
  // tower / tall building / palace
  '閣': KanjiReading(
    kanji: '閣',
    onyomi: ['かく'],
    kunyomi: [],
    meanings: ['tower', 'tall building', 'palace'],
    grade: 6,
    strokes: 14,
    frequencyRank: 444,
  ),
  // Korea
  '韓': KanjiReading(
    kanji: '韓',
    onyomi: ['かん'],
    kunyomi: ['から', 'いげた'],
    meanings: ['Korea'],
    grade: 8,
    strokes: 18,
    frequencyRank: 445,
  ),
  // transit / ford / ferry
  '渡': KanjiReading(
    kanji: '渡',
    onyomi: ['と'],
    kunyomi: ['わた(る)', 'わた(す)'],
    meanings: ['transit', 'ford', 'ferry'],
    grade: 8,
    strokes: 12,
    frequencyRank: 446,
  ),
  // 输 / error / fault
  '失': KanjiReading(
    kanji: '失',
    onyomi: ['しつ'],
    kunyomi: ['うしな(う)', 'う(せる)'],
    meanings: ['输', 'error', 'fault'],
    grade: 4,
    strokes: 5,
    frequencyRank: 447,
  ),
  // shift / 移动 / 改变
  '移': KanjiReading(
    kanji: '移',
    onyomi: ['い'],
    kunyomi: ['うつ(る)', 'うつ(す)'],
    meanings: ['shift', '移动', '改变'],
    grade: 5,
    strokes: 11,
    frequencyRank: 448,
  ),
  // distinction / difference / variation
  '差': KanjiReading(
    kanji: '差',
    onyomi: ['さ'],
    kunyomi: ['さ(す)', 'さ(し)'],
    meanings: ['distinction', 'difference', 'variation'],
    grade: 4,
    strokes: 10,
    frequencyRank: 449,
  ),
  // masses / great numbers / multitude
  '衆': KanjiReading(
    kanji: '衆',
    onyomi: ['しゅう', 'しゅ'],
    kunyomi: ['おお(い)'],
    meanings: ['masses', 'great numbers', 'multitude'],
    grade: 6,
    strokes: 12,
    frequencyRank: 450,
  ),
  // individual / counter for articles
  '個': KanjiReading(
    kanji: '個',
    onyomi: ['こ', 'か'],
    kunyomi: [],
    meanings: ['individual', 'counter for articles'],
    grade: 5,
    strokes: 10,
    frequencyRank: 451,
  ),
  // gate / counter for cannons
  '門': KanjiReading(
    kanji: '門',
    onyomi: ['もん'],
    kunyomi: ['かど', 'と'],
    meanings: ['gate', 'counter for cannons'],
    grade: 2,
    strokes: 8,
    frequencyRank: 452,
  ),
  // copy / be photographed / describe
  '写': KanjiReading(
    kanji: '写',
    onyomi: ['しゃ', 'じゃ'],
    kunyomi: ['うつ(す)', 'うつ(る)', '(うつ)', 'うつ(し)'],
    meanings: ['copy', 'be photographed', 'describe'],
    grade: 3,
    strokes: 5,
    frequencyRank: 453,
  ),
  // evaluate / criticism / comment
  '評': KanjiReading(
    kanji: '評',
    onyomi: ['ひょう'],
    kunyomi: [],
    meanings: ['evaluate', 'criticism', 'comment'],
    grade: 5,
    strokes: 12,
    frequencyRank: 454,
  ),
  // chapter / lesson / section
  '課': KanjiReading(
    kanji: '課',
    onyomi: ['か'],
    kunyomi: [],
    meanings: ['chapter', 'lesson', 'section'],
    grade: 4,
    strokes: 15,
    frequencyRank: 455,
  ),
  // 结束 / 关 / tip
  '末': KanjiReading(
    kanji: '末',
    onyomi: ['まつ', 'ばつ'],
    kunyomi: ['すえ', 'うら', 'うれ'],
    meanings: ['结束', '关', 'tip'],
    grade: 4,
    strokes: 5,
    frequencyRank: 456,
  ),
  // guard / 保护 / defend
  '守': KanjiReading(
    kanji: '守',
    onyomi: ['しゅ', 'す'],
    kunyomi: ['まも(る)', 'まも(り)', 'もり', '(もり)', 'かみ'],
    meanings: ['guard', '保护', 'defend'],
    grade: 3,
    strokes: 6,
    frequencyRank: 457,
  ),
  // young / if / perhaps
  '若': KanjiReading(
    kanji: '若',
    onyomi: ['じゃく', 'にゃく', 'にゃ'],
    kunyomi: ['わか(い)', '(わか)', 'も(しくわ)', 'も(し)', 'も(しくは)', 'ごと(し)'],
    meanings: ['young', 'if', 'perhaps'],
    grade: 6,
    strokes: 8,
    frequencyRank: 458,
  ),
  // brain / memory
  '脳': KanjiReading(
    kanji: '脳',
    onyomi: ['のう', 'どう'],
    kunyomi: ['のうずる'],
    meanings: ['brain', 'memory'],
    grade: 6,
    strokes: 11,
    frequencyRank: 459,
  ),
  // extreme / pole / extremely
  '極': KanjiReading(
    kanji: '極',
    onyomi: ['きょく', 'ごく'],
    kunyomi: ['きわ(める)', 'きわ(まる)', 'きわ(まり)', 'きわ(み)', 'き(める)', 'ぎ(め)', 'き(まる)'],
    meanings: ['extreme', 'pole', 'extremely'],
    grade: 4,
    strokes: 12,
    frequencyRank: 460,
  ),
  // species / kind / class
  '種': KanjiReading(
    kanji: '種',
    onyomi: ['しゅ'],
    kunyomi: ['たね', '(ぐさ)'],
    meanings: ['species', 'kind', 'class'],
    grade: 4,
    strokes: 14,
    frequencyRank: 461,
  ),
  // beauty / 美丽
  '美': KanjiReading(
    kanji: '美',
    onyomi: ['び', 'み'],
    kunyomi: ['うつく(しい)'],
    meanings: ['beauty', '美丽'],
    grade: 3,
    strokes: 9,
    frequencyRank: 462,
  ),
  // mount / hill / knoll
  '岡': KanjiReading(
    kanji: '岡',
    onyomi: ['こう'],
    kunyomi: ['おか'],
    meanings: ['mount', 'hill', 'knoll'],
    grade: 4,
    strokes: 8,
    frequencyRank: 463,
  ),
  // 影 / silhouette / phantom
  '影': KanjiReading(
    kanji: '影',
    onyomi: ['えい'],
    kunyomi: ['かげ'],
    meanings: ['影', 'silhouette', 'phantom'],
    grade: 8,
    strokes: 15,
    frequencyRank: 464,
  ),
  // fate / command / decree
  '命': KanjiReading(
    kanji: '命',
    onyomi: ['めい', 'みょう'],
    kunyomi: ['いのち'],
    meanings: ['fate', 'command', 'decree'],
    grade: 3,
    strokes: 8,
    frequencyRank: 465,
  ),
  // contain / include / hold in the mouth
  '含': KanjiReading(
    kanji: '含',
    onyomi: ['がん'],
    kunyomi: ['ふく(む)', 'ふく(める)'],
    meanings: ['contain', 'include', 'hold in the mouth'],
    grade: 8,
    strokes: 7,
    frequencyRank: 466,
  ),
  // blessing / fortune / luck
  '福': KanjiReading(
    kanji: '福',
    onyomi: ['ふく'],
    kunyomi: [],
    meanings: ['blessing', 'fortune', 'luck'],
    grade: 3,
    strokes: 13,
    frequencyRank: 467,
  ),
  // storehouse / hide / own
  '蔵': KanjiReading(
    kanji: '蔵',
    onyomi: ['ぞう', 'そう'],
    kunyomi: ['くら', 'おさ(める)', 'かく(れる)'],
    meanings: ['storehouse', 'hide', 'own'],
    grade: 6,
    strokes: 15,
    frequencyRank: 468,
  ),
  // quantity / 测量 / weight
  '量': KanjiReading(
    kanji: '量',
    onyomi: ['りょう'],
    kunyomi: ['はか(る)'],
    meanings: ['quantity', '测量', 'weight'],
    grade: 4,
    strokes: 12,
    frequencyRank: 469,
  ),
  // ambition / full moon / hope
  '望': KanjiReading(
    kanji: '望',
    onyomi: ['ぼう', 'もう'],
    kunyomi: ['のぞ(む)', 'もち'],
    meanings: ['ambition', 'full moon', 'hope'],
    grade: 4,
    strokes: 11,
    frequencyRank: 470,
  ),
  // pine tree
  '松': KanjiReading(
    kanji: '松',
    onyomi: ['しょう'],
    kunyomi: ['まつ'],
    meanings: ['pine tree'],
    grade: 4,
    strokes: 8,
    frequencyRank: 471,
  ),
  // un- / mistake / negative
  '非': KanjiReading(
    kanji: '非',
    onyomi: ['ひ'],
    kunyomi: ['あら(ず)'],
    meanings: ['un-', 'mistake', 'negative'],
    grade: 5,
    strokes: 8,
    frequencyRank: 472,
  ),
  // beat / 攻击 / defeat
  '撃': KanjiReading(
    kanji: '撃',
    onyomi: ['げき'],
    kunyomi: ['う(つ)'],
    meanings: ['beat', '攻击', 'defeat'],
    grade: 8,
    strokes: 15,
    frequencyRank: 473,
  ),
  // assistant / 帮助
  '佐': KanjiReading(
    kanji: '佐',
    onyomi: ['さ'],
    kunyomi: [],
    meanings: ['assistant', '帮助'],
    grade: 4,
    strokes: 7,
    frequencyRank: 474,
  ),
  // nucleus / core / kernel
  '核': KanjiReading(
    kanji: '核',
    onyomi: ['かく'],
    kunyomi: [],
    meanings: ['nucleus', 'core', 'kernel'],
    grade: 8,
    strokes: 10,
    frequencyRank: 475,
  ),
  // outlook / 看 / appearance
  '観': KanjiReading(
    kanji: '観',
    onyomi: ['かん'],
    kunyomi: ['み(る)', 'しめ(す)'],
    meanings: ['outlook', '看', 'appearance'],
    grade: 4,
    strokes: 18,
    frequencyRank: 476,
  ),
  // guess / presume / surmise
  '察': KanjiReading(
    kanji: '察',
    onyomi: ['さつ'],
    kunyomi: [],
    meanings: ['guess', 'presume', 'surmise'],
    grade: 4,
    strokes: 14,
    frequencyRank: 477,
  ),
  // organize / arranging / tune
  '整': KanjiReading(
    kanji: '整',
    onyomi: ['せい'],
    kunyomi: ['ととの(える)', 'ととの(う)'],
    meanings: ['organize', 'arranging', 'tune'],
    grade: 3,
    strokes: 16,
    frequencyRank: 478,
  ),
  // grade / steps / stairs
  '段': KanjiReading(
    kanji: '段',
    onyomi: ['だん', 'たん'],
    kunyomi: [],
    meanings: ['grade', 'steps', 'stairs'],
    grade: 6,
    strokes: 9,
    frequencyRank: 479,
  ),
  // sideways / 侧面 / horizontal
  '横': KanjiReading(
    kanji: '横',
    onyomi: ['おう'],
    kunyomi: ['よこ'],
    meanings: ['sideways', '侧面', 'horizontal'],
    grade: 3,
    strokes: 15,
    frequencyRank: 480,
  ),
  // dissolve / melt
  '融': KanjiReading(
    kanji: '融',
    onyomi: ['ゆう'],
    kunyomi: ['と(ける)', 'と(かす)'],
    meanings: ['dissolve', 'melt'],
    grade: 8,
    strokes: 16,
    frequencyRank: 481,
  ),
  // mould / type / model
  '型': KanjiReading(
    kanji: '型',
    onyomi: ['けい'],
    kunyomi: ['かた', '(がた)'],
    meanings: ['mould', 'type', 'model'],
    grade: 5,
    strokes: 9,
    frequencyRank: 482,
  ),
  // 白
  '白': KanjiReading(
    kanji: '白',
    onyomi: ['はく', 'びゃく'],
    kunyomi: ['しろ', '(しら)', 'しろ(い)'],
    meanings: ['白'],
    grade: 1,
    strokes: 5,
    frequencyRank: 483,
  ),
  // 深 / heighten / intensify
  '深': KanjiReading(
    kanji: '深',
    onyomi: ['しん'],
    kunyomi: ['ふか(い)', 'ぶか(い)', 'ふか(まる)', 'ふか(める)', '(み)'],
    meanings: ['深', 'heighten', 'intensify'],
    grade: 3,
    strokes: 11,
    frequencyRank: 484,
  ),
  // 文字 / 信 / 词
  '字': KanjiReading(
    kanji: '字',
    onyomi: ['じ'],
    kunyomi: ['あざ', 'あざな', '(な)'],
    meanings: ['文字', '信', '词'],
    grade: 1,
    strokes: 6,
    frequencyRank: 485,
  ),
  // solution / answer
  '答': KanjiReading(
    kanji: '答',
    onyomi: ['とう'],
    kunyomi: ['こた(える)', 'こた(え)'],
    meanings: ['solution', 'answer'],
    grade: 2,
    strokes: 12,
    frequencyRank: 486,
  ),
  // 夜晚 / 傍晚
  '夜': KanjiReading(
    kanji: '夜',
    onyomi: ['や'],
    kunyomi: ['よ', 'よる'],
    meanings: ['夜晚', '傍晚'],
    grade: 2,
    strokes: 8,
    frequencyRank: 487,
  ),
  // made in... / manufacture
  '製': KanjiReading(
    kanji: '製',
    onyomi: ['せい'],
    kunyomi: [],
    meanings: ['made in...', 'manufacture'],
    grade: 5,
    strokes: 14,
    frequencyRank: 488,
  ),
  // ballot / label / ticket
  '票': KanjiReading(
    kanji: '票',
    onyomi: ['ひょう'],
    kunyomi: [],
    meanings: ['ballot', 'label', 'ticket'],
    grade: 4,
    strokes: 11,
    frequencyRank: 489,
  ),
  // condition / situation
  '況': KanjiReading(
    kanji: '況',
    onyomi: ['きょう'],
    kunyomi: ['まし(て)', 'いわ(んや)', 'おもむき'],
    meanings: ['condition', 'situation'],
    grade: 8,
    strokes: 8,
    frequencyRank: 490,
  ),
  // 声音 / noise
  '音': KanjiReading(
    kanji: '音',
    onyomi: ['おん', 'いん', '-のん'],
    kunyomi: ['おと', 'ね'],
    meanings: ['声音', 'noise'],
    grade: 1,
    strokes: 9,
    frequencyRank: 491,
  ),
  // have the honor to / sign of the monkey / 3-5PM
  '申': KanjiReading(
    kanji: '申',
    onyomi: ['しん'],
    kunyomi: ['もう(す)', 'もう(し)', 'さる'],
    meanings: ['have the honor to', 'sign of the monkey', '3-5PM'],
    grade: 3,
    strokes: 5,
    frequencyRank: 492,
  ),
  // Esq. / 道路 / manner
  '様': KanjiReading(
    kanji: '様',
    onyomi: ['よう', 'しょう'],
    kunyomi: ['さま', 'さん'],
    meanings: ['Esq.', '道路', 'manner'],
    grade: 3,
    strokes: 14,
    frequencyRank: 493,
  ),
  // property / 钱 / wealth
  '財': KanjiReading(
    kanji: '財',
    onyomi: ['ざい', 'さい', 'ぞく'],
    kunyomi: ['たから'],
    meanings: ['property', '钱', 'wealth'],
    grade: 5,
    strokes: 10,
    frequencyRank: 494,
  ),
  // harbor
  '港': KanjiReading(
    kanji: '港',
    onyomi: ['こう'],
    kunyomi: ['みなと'],
    meanings: ['harbor'],
    grade: 3,
    strokes: 12,
    frequencyRank: 495,
  ),
  // discriminating / 知道 / 写
  '識': KanjiReading(
    kanji: '識',
    onyomi: ['しき'],
    kunyomi: ['し(る)', 'しる(す)'],
    meanings: ['discriminating', '知道', '写'],
    grade: 5,
    strokes: 19,
    frequencyRank: 496,
  ),
  // pour / irrigate / shed (tears)
  '注': KanjiReading(
    kanji: '注',
    onyomi: ['ちゅう'],
    kunyomi: ['そそ(ぐ)', 'さ(す)', 'つ(ぐ)'],
    meanings: ['pour', 'irrigate', 'shed (tears)'],
    grade: 3,
    strokes: 8,
    frequencyRank: 497,
  ),
  // call / call out to / invite
  '呼': KanjiReading(
    kanji: '呼',
    onyomi: ['こ'],
    kunyomi: ['よ(ぶ)'],
    meanings: ['call', 'call out to', 'invite'],
    grade: 6,
    strokes: 8,
    frequencyRank: 498,
  ),
  // ford / go cross / transit
  '渉': KanjiReading(
    kanji: '渉',
    onyomi: ['しょう'],
    kunyomi: ['わた(る)'],
    meanings: ['ford', 'go cross', 'transit'],
    grade: 8,
    strokes: 11,
    frequencyRank: 499,
  ),
  // accomplished / reach / arrive
  '達': KanjiReading(
    kanji: '達',
    onyomi: ['たつ', 'だ'],
    kunyomi: ['(たち)'],
    meanings: ['accomplished', 'reach', 'arrive'],
    grade: 4,
    strokes: 12,
    frequencyRank: 500,
  ),
  // 好 / pleasing / skilled
  '良': KanjiReading(
    kanji: '良',
    onyomi: ['りょう'],
    kunyomi: ['よ(い)', 'い(い)'],
    meanings: ['好', 'pleasing', 'skilled'],
    grade: 4,
    strokes: 7,
    frequencyRank: 501,
  ),
  // echo / 声音 / resound
  '響': KanjiReading(
    kanji: '響',
    onyomi: ['きょう'],
    kunyomi: ['ひび(く)'],
    meanings: ['echo', '声音', 'resound'],
    grade: 8,
    strokes: 20,
    frequencyRank: 502,
  ),
  // heights / slope
  '阪': KanjiReading(
    kanji: '阪',
    onyomi: ['はん'],
    kunyomi: ['さか'],
    meanings: ['heights', 'slope'],
    grade: 4,
    strokes: 7,
    frequencyRank: 503,
  ),
  // homecoming / arrive at / lead to
  '帰': KanjiReading(
    kanji: '帰',
    onyomi: ['き'],
    kunyomi: ['かえ(る)', 'かえ(す)', 'おく(る)', 'とつ(ぐ)'],
    meanings: ['homecoming', 'arrive at', 'lead to'],
    grade: 2,
    strokes: 10,
    frequencyRank: 504,
  ),
  // needle / pin / staple
  '針': KanjiReading(
    kanji: '針',
    onyomi: ['しん'],
    kunyomi: ['はり'],
    meanings: ['needle', 'pin', 'staple'],
    grade: 6,
    strokes: 10,
    frequencyRank: 505,
  ),
  // specialty / exclusive / mainly
  '専': KanjiReading(
    kanji: '専',
    onyomi: ['せん'],
    kunyomi: ['もっぱ(ら)'],
    meanings: ['specialty', 'exclusive', 'mainly'],
    grade: 6,
    strokes: 9,
    frequencyRank: 506,
  ),
  // conjecture / infer / guess
  '推': KanjiReading(
    kanji: '推',
    onyomi: ['すい'],
    kunyomi: ['お(す)'],
    meanings: ['conjecture', 'infer', 'guess'],
    grade: 6,
    strokes: 11,
    frequencyRank: 507,
  ),
  // valley
  '谷': KanjiReading(
    kanji: '谷',
    onyomi: ['こく'],
    kunyomi: ['たに', 'きわ(まる)'],
    meanings: ['valley'],
    grade: 2,
    strokes: 7,
    frequencyRank: 508,
  ),
  // 旧
  '古': KanjiReading(
    kanji: '古',
    onyomi: ['こ'],
    kunyomi: ['ふる(い)', '(ふる)', 'ふる(す)'],
    meanings: ['旧'],
    grade: 2,
    strokes: 5,
    frequencyRank: 509,
  ),
  // climate / season / weather
  '候': KanjiReading(
    kanji: '候',
    onyomi: ['こう'],
    kunyomi: ['そうろう'],
    meanings: ['climate', 'season', 'weather'],
    grade: 4,
    strokes: 10,
    frequencyRank: 510,
  ),
  // 历史 / chronicle
  '史': KanjiReading(
    kanji: '史',
    onyomi: ['し'],
    kunyomi: [],
    meanings: ['历史', 'chronicle'],
    grade: 5,
    strokes: 5,
    frequencyRank: 511,
  ),
  // heavens / 天 / imperial
  '天': KanjiReading(
    kanji: '天',
    onyomi: ['てん'],
    kunyomi: ['あまつ', 'あめ', '(あま)'],
    meanings: ['heavens', '天', 'imperial'],
    grade: 1,
    strokes: 4,
    frequencyRank: 512,
  ),
  // storey / stair / counter for storeys of a building
  '階': KanjiReading(
    kanji: '階',
    onyomi: ['かい'],
    kunyomi: ['きざはし'],
    meanings: ['storey', 'stair', 'counter for storeys of a building'],
    grade: 3,
    strokes: 12,
    frequencyRank: 513,
  ),
  // extent / degree / 法律
  '程': KanjiReading(
    kanji: '程',
    onyomi: ['てい'],
    kunyomi: ['ほど', '(ほど)'],
    meanings: ['extent', 'degree', '法律'],
    grade: 5,
    strokes: 12,
    frequencyRank: 514,
  ),
  // full / fullness / enough
  '満': KanjiReading(
    kanji: '満',
    onyomi: ['まん', 'ばん'],
    kunyomi: ['み(ちる)', 'み(つ)', 'み(たす)'],
    meanings: ['full', 'fullness', 'enough'],
    grade: 4,
    strokes: 12,
    frequencyRank: 515,
  ),
  // failure / defeat / reversal
  '敗': KanjiReading(
    kanji: '敗',
    onyomi: ['はい'],
    kunyomi: ['やぶ(れる)'],
    meanings: ['failure', 'defeat', 'reversal'],
    grade: 4,
    strokes: 11,
    frequencyRank: 516,
  ),
  // pipe / tube / wind instrument
  '管': KanjiReading(
    kanji: '管',
    onyomi: ['かん'],
    kunyomi: ['くだ'],
    meanings: ['pipe', 'tube', 'wind instrument'],
    grade: 4,
    strokes: 14,
    frequencyRank: 517,
  ),
  // price / cost / value
  '値': KanjiReading(
    kanji: '値',
    onyomi: ['ち'],
    kunyomi: ['ね', 'あたい'],
    meanings: ['price', 'cost', 'value'],
    grade: 6,
    strokes: 10,
    frequencyRank: 518,
  ),
  // 歌 / 唱
  '歌': KanjiReading(
    kanji: '歌',
    onyomi: ['か'],
    kunyomi: ['うた', 'うた(う)'],
    meanings: ['歌', '唱'],
    grade: 2,
    strokes: 14,
    frequencyRank: 519,
  ),
  // buy
  '買': KanjiReading(
    kanji: '買',
    onyomi: ['ばい'],
    kunyomi: ['か(う)'],
    meanings: ['buy'],
    grade: 2,
    strokes: 12,
    frequencyRank: 520,
  ),
  // stab / protruding / thrust
  '突': KanjiReading(
    kanji: '突',
    onyomi: ['とつ', 'か'],
    kunyomi: ['つ(く)'],
    meanings: ['stab', 'protruding', 'thrust'],
    grade: 8,
    strokes: 8,
    frequencyRank: 521,
  ),
  // 士兵 / private / troops
  '兵': KanjiReading(
    kanji: '兵',
    onyomi: ['へい', 'ひょう'],
    kunyomi: ['つわもの'],
    meanings: ['士兵', 'private', 'troops'],
    grade: 4,
    strokes: 7,
    frequencyRank: 522,
  ),
  // touch / contact / adjoin
  '接': KanjiReading(
    kanji: '接',
    onyomi: ['せつ', 'しょう'],
    kunyomi: ['つ(ぐ)'],
    meanings: ['touch', 'contact', 'adjoin'],
    grade: 5,
    strokes: 11,
    frequencyRank: 523,
  ),
  // solicit / invite / ask
  '請': KanjiReading(
    kanji: '請',
    onyomi: ['せい', 'しん', 'しょう'],
    kunyomi: ['こ(う)', 'う(ける)'],
    meanings: ['solicit', 'invite', 'ask'],
    grade: 8,
    strokes: 15,
    frequencyRank: 524,
  ),
  // utensil / vessel / receptacle
  '器': KanjiReading(
    kanji: '器',
    onyomi: ['き'],
    kunyomi: ['うつわ'],
    meanings: ['utensil', 'vessel', 'receptacle'],
    grade: 4,
    strokes: 15,
    frequencyRank: 525,
  ),
  // gentleman / scholar / samurai
  '士': KanjiReading(
    kanji: '士',
    onyomi: ['し'],
    kunyomi: ['さむらい'],
    meanings: ['gentleman', 'scholar', 'samurai'],
    grade: 5,
    strokes: 3,
    frequencyRank: 526,
  ),
  // ray / 光
  '光': KanjiReading(
    kanji: '光',
    onyomi: ['こう'],
    kunyomi: ['ひか(る)', 'ひかり'],
    meanings: ['ray', '光'],
    grade: 2,
    strokes: 6,
    frequencyRank: 527,
  ),
  // chastise / 攻击 / defeat
  '討': KanjiReading(
    kanji: '討',
    onyomi: ['とう'],
    kunyomi: ['う(つ)'],
    meanings: ['chastise', '攻击', 'defeat'],
    grade: 6,
    strokes: 10,
    frequencyRank: 528,
  ),
  // path / route / 道路
  '路': KanjiReading(
    kanji: '路',
    onyomi: ['ろ', 'る'],
    kunyomi: ['(じ)', 'みち'],
    meanings: ['path', 'route', '道路'],
    grade: 3,
    strokes: 13,
    frequencyRank: 529,
  ),
  // 坏 / vice / rascal
  '悪': KanjiReading(
    kanji: '悪',
    onyomi: ['あく', 'お'],
    kunyomi: ['わる(い)', '(わる)', 'あ(し)', 'にく(い)', 'ああ', 'いずくに', 'いずくんぞ', 'にく(む)'],
    meanings: ['坏', 'vice', 'rascal'],
    grade: 3,
    strokes: 11,
    frequencyRank: 530,
  ),
  // department / course / section
  '科': KanjiReading(
    kanji: '科',
    onyomi: ['か'],
    kunyomi: [],
    meanings: ['department', 'course', 'section'],
    grade: 2,
    strokes: 9,
    frequencyRank: 531,
  ),
  // aggression / 攻击 / criticize
  '攻': KanjiReading(
    kanji: '攻',
    onyomi: ['こう'],
    kunyomi: ['せ(める)'],
    meanings: ['aggression', '攻击', 'criticize'],
    grade: 8,
    strokes: 7,
    frequencyRank: 532,
  ),
  // promontory / cape / spit
  '崎': KanjiReading(
    kanji: '崎',
    onyomi: ['き'],
    kunyomi: ['さき', 'さい', 'みさき'],
    meanings: ['promontory', 'cape', 'spit'],
    grade: 4,
    strokes: 11,
    frequencyRank: 533,
  ),
  // coach / command / urge
  '督': KanjiReading(
    kanji: '督',
    onyomi: ['とく'],
    kunyomi: [],
    meanings: ['coach', 'command', 'urge'],
    grade: 8,
    strokes: 13,
    frequencyRank: 534,
  ),
  // impart / instruct / grant
  '授': KanjiReading(
    kanji: '授',
    onyomi: ['じゅ'],
    kunyomi: ['さず(ける)', 'さず(かる)'],
    meanings: ['impart', 'instruct', 'grant'],
    grade: 5,
    strokes: 11,
    frequencyRank: 535,
  ),
  // sponsor / hold (a meeting) / give (a dinner)
  '催': KanjiReading(
    kanji: '催',
    onyomi: ['さい'],
    kunyomi: ['もよう(す)', 'もよお(す)'],
    meanings: ['sponsor', 'hold (a meeting)', 'give (a dinner)'],
    grade: 8,
    strokes: 13,
    frequencyRank: 536,
  ),
  // dainty / get thin / taper
  '細': KanjiReading(
    kanji: '細',
    onyomi: ['さい'],
    kunyomi: ['ほそ(い)', 'ほそ(る)', 'こま(か)', 'こま(かい)'],
    meanings: ['dainty', 'get thin', 'taper'],
    grade: 2,
    strokes: 11,
    frequencyRank: 537,
  ),
  // merit / efficacy / efficiency
  '効': KanjiReading(
    kanji: '効',
    onyomi: ['こう'],
    kunyomi: ['き(く)', 'ききめ', 'なら(う)'],
    meanings: ['merit', 'efficacy', 'efficiency'],
    grade: 5,
    strokes: 8,
    frequencyRank: 538,
  ),
  // map / drawing / plan
  '図': KanjiReading(
    kanji: '図',
    onyomi: ['ず', 'と'],
    kunyomi: ['え', 'はか(る)'],
    meanings: ['map', 'drawing', 'plan'],
    grade: 2,
    strokes: 7,
    frequencyRank: 539,
  ),
  // 周
  '週': KanjiReading(
    kanji: '週',
    onyomi: ['しゅう'],
    kunyomi: [],
    meanings: ['周'],
    grade: 2,
    strokes: 11,
    frequencyRank: 540,
  ),
  // volume / product (x*y) / acreage
  '積': KanjiReading(
    kanji: '積',
    onyomi: ['せき'],
    kunyomi: ['つ(む)', 'づ(み)', 'つ(もる)', 'つ(もり)'],
    meanings: ['volume', 'product (x*y)', 'acreage'],
    grade: 4,
    strokes: 16,
    frequencyRank: 541,
  ),
  // round / full (month) / perfection
  '丸': KanjiReading(
    kanji: '丸',
    onyomi: ['がん'],
    kunyomi: ['まる', 'まる(める)', 'まる(い)'],
    meanings: ['round', 'full (month)', 'perfection'],
    grade: 2,
    strokes: 3,
    frequencyRank: 542,
  ),
  // other / another / the others
  '他': KanjiReading(
    kanji: '他',
    onyomi: ['た'],
    kunyomi: ['ほか'],
    meanings: ['other', 'another', 'the others'],
    grade: 3,
    strokes: 5,
    frequencyRank: 543,
  ),
  // reach out / exert / exercise
  '及': KanjiReading(
    kanji: '及',
    onyomi: ['きゅう'],
    kunyomi: ['およ(ぶ)', 'およ(び)', 'および', 'およ(ぼす)'],
    meanings: ['reach out', 'exert', 'exercise'],
    grade: 8,
    strokes: 3,
    frequencyRank: 544,
  ),
  // gulf / bay / inlet
  '湾': KanjiReading(
    kanji: '湾',
    onyomi: ['わん'],
    kunyomi: ['いりえ'],
    meanings: ['gulf', 'bay', 'inlet'],
    grade: 8,
    strokes: 12,
    frequencyRank: 545,
  ),
  // record
  '録': KanjiReading(
    kanji: '録',
    onyomi: ['ろく'],
    kunyomi: ['しる(す)', 'と(る)'],
    meanings: ['record'],
    grade: 4,
    strokes: 16,
    frequencyRank: 546,
  ),
  // dispose / manage / deal with
  '処': KanjiReading(
    kanji: '処',
    onyomi: ['しょ'],
    kunyomi: ['ところ', '(こ)', 'お(る)'],
    meanings: ['dispose', 'manage', 'deal with'],
    grade: 6,
    strokes: 5,
    frequencyRank: 547,
  ),
  // government ministry / conserve / omit
  '省': KanjiReading(
    kanji: '省',
    onyomi: ['せい', 'しょう'],
    kunyomi: ['かえり(みる)', 'はぶ(く)'],
    meanings: ['government ministry', 'conserve', 'omit'],
    grade: 4,
    strokes: 9,
    frequencyRank: 548,
  ),
  // old times / old things / old friend
  '旧': KanjiReading(
    kanji: '旧',
    onyomi: ['きゅう'],
    kunyomi: ['ふる(い)', 'もと'],
    meanings: ['old times', 'old things', 'old friend'],
    grade: 5,
    strokes: 5,
    frequencyRank: 549,
  ),
  // 房间 / apartment / chamber
  '室': KanjiReading(
    kanji: '室',
    onyomi: ['しつ'],
    kunyomi: ['むろ'],
    meanings: ['房间', 'apartment', 'chamber'],
    grade: 2,
    strokes: 9,
    frequencyRank: 550,
  ),
  // constitution / 法律
  '憲': KanjiReading(
    kanji: '憲',
    onyomi: ['けん'],
    kunyomi: [],
    meanings: ['constitution', '法律'],
    grade: 6,
    strokes: 16,
    frequencyRank: 551,
  ),
  // plump / 厚 / big around
  '太': KanjiReading(
    kanji: '太',
    onyomi: ['たい', 'た'],
    kunyomi: ['ふと(い)', 'ふと(る)'],
    meanings: ['plump', '厚', 'big around'],
    grade: 2,
    strokes: 4,
    frequencyRank: 552,
  ),
  // bridge
  '橋': KanjiReading(
    kanji: '橋',
    onyomi: ['きょう'],
    kunyomi: ['はし'],
    meanings: ['bridge'],
    grade: 3,
    strokes: 16,
    frequencyRank: 553,
  ),
  // 走 / counter for steps
  '歩': KanjiReading(
    kanji: '歩',
    onyomi: ['ほ', 'ぶ', 'ふ'],
    kunyomi: ['ある(く)', 'あゆ(む)'],
    meanings: ['走', 'counter for steps'],
    grade: 2,
    strokes: 8,
    frequencyRank: 554,
  ),
  // detach / separation / disjoin
  '離': KanjiReading(
    kanji: '離',
    onyomi: ['り'],
    kunyomi: ['はな(れる)', 'はな(す)'],
    meanings: ['detach', 'separation', 'disjoin'],
    grade: 8,
    strokes: 19,
    frequencyRank: 555,
  ),
  // beach
  '岸': KanjiReading(
    kanji: '岸',
    onyomi: ['がん'],
    kunyomi: ['きし'],
    meanings: ['beach'],
    grade: 3,
    strokes: 8,
    frequencyRank: 556,
  ),
  // guest / visitor / customer
  '客': KanjiReading(
    kanji: '客',
    onyomi: ['きゃく', 'かく'],
    kunyomi: [],
    meanings: ['guest', 'visitor', 'customer'],
    grade: 3,
    strokes: 9,
    frequencyRank: 557,
  ),
  // 风 / air / style
  '風': KanjiReading(
    kanji: '風',
    onyomi: ['ふう', 'ふ'],
    kunyomi: ['かぜ', '(かざ)'],
    meanings: ['风', 'air', 'style'],
    grade: 2,
    strokes: 9,
    frequencyRank: 558,
  ),
  // 纸
  '紙': KanjiReading(
    kanji: '紙',
    onyomi: ['し'],
    kunyomi: ['かみ'],
    meanings: ['纸'],
    grade: 2,
    strokes: 10,
    frequencyRank: 559,
  ),
  // violent / get excited / enraged
  '激': KanjiReading(
    kanji: '激',
    onyomi: ['げき'],
    kunyomi: ['はげ(しい)'],
    meanings: ['violent', 'get excited', 'enraged'],
    grade: 6,
    strokes: 16,
    frequencyRank: 560,
  ),
  // negate / no / noes
  '否': KanjiReading(
    kanji: '否',
    onyomi: ['ひ'],
    kunyomi: ['いな', 'いや'],
    meanings: ['negate', 'no', 'noes'],
    grade: 6,
    strokes: 7,
    frequencyRank: 561,
  ),
  // circumference / circuit / lap
  '周': KanjiReading(
    kanji: '周',
    onyomi: ['しゅう'],
    kunyomi: ['まわ(り)'],
    meanings: ['circumference', 'circuit', 'lap'],
    grade: 4,
    strokes: 8,
    frequencyRank: 562,
  ),
  // expert / 老师 / master
  '師': KanjiReading(
    kanji: '師',
    onyomi: ['し'],
    kunyomi: ['いくさ'],
    meanings: ['expert', '老师', 'master'],
    grade: 5,
    strokes: 10,
    frequencyRank: 563,
  ),
  // pinch / pick / pluck
  '摘': KanjiReading(
    kanji: '摘',
    onyomi: ['てき'],
    kunyomi: ['つ(む)'],
    meanings: ['pinch', 'pick', 'pluck'],
    grade: 8,
    strokes: 14,
    frequencyRank: 564,
  ),
  // lumber / log / timber
  '材': KanjiReading(
    kanji: '材',
    onyomi: ['ざい'],
    kunyomi: [],
    meanings: ['lumber', 'log', 'timber'],
    grade: 4,
    strokes: 7,
    frequencyRank: 565,
  ),
  // ascend / climb up
  '登': KanjiReading(
    kanji: '登',
    onyomi: ['とう', 'と', 'どう', 'しょう', 'ちょう'],
    kunyomi: ['のぼ(る)', 'あ(がる)'],
    meanings: ['ascend', 'climb up'],
    grade: 3,
    strokes: 12,
    frequencyRank: 566,
  ),
  // lineage / system
  '系': KanjiReading(
    kanji: '系',
    onyomi: ['けい'],
    kunyomi: [],
    meanings: ['lineage', 'system'],
    grade: 6,
    strokes: 7,
    frequencyRank: 567,
  ),
  // criticism / strike
  '批': KanjiReading(
    kanji: '批',
    onyomi: ['ひ'],
    kunyomi: [],
    meanings: ['criticism', 'strike'],
    grade: 6,
    strokes: 7,
    frequencyRank: 568,
  ),
  // son / counter for sons
  '郎': KanjiReading(
    kanji: '郎',
    onyomi: ['ろう', 'りょう'],
    kunyomi: ['おとこ'],
    meanings: ['son', 'counter for sons'],
    grade: 8,
    strokes: 9,
    frequencyRank: 569,
  ),
  // 母亲
  '母': KanjiReading(
    kanji: '母',
    onyomi: ['ぼ'],
    kunyomi: ['はは', 'も'],
    meanings: ['母亲'],
    grade: 2,
    strokes: 5,
    frequencyRank: 570,
  ),
  // 容易 / ready to / simple
  '易': KanjiReading(
    kanji: '易',
    onyomi: ['えき', 'い'],
    kunyomi: ['やさ(しい)', 'やす(い)'],
    meanings: ['容易', 'ready to', 'simple'],
    grade: 5,
    strokes: 8,
    frequencyRank: 571,
  ),
  // healthy / 健康 / 力量
  '健': KanjiReading(
    kanji: '健',
    onyomi: ['けん'],
    kunyomi: ['すこ(やか)'],
    meanings: ['healthy', '健康', '力量'],
    grade: 4,
    strokes: 11,
    frequencyRank: 572,
  ),
  // 黑
  '黒': KanjiReading(
    kanji: '黒',
    onyomi: ['こく'],
    kunyomi: ['くろ', 'くろ(ずむ)', 'くろ(い)'],
    meanings: ['黑'],
    grade: 2,
    strokes: 11,
    frequencyRank: 573,
  ),
  // 火
  '火': KanjiReading(
    kanji: '火',
    onyomi: ['か'],
    kunyomi: ['ひ', '(び)', '(ほ)'],
    meanings: ['火'],
    grade: 1,
    strokes: 4,
    frequencyRank: 574,
  ),
  // 门 / counter for houses / door radical (no. 63)
  '戸': KanjiReading(
    kanji: '戸',
    onyomi: ['こ'],
    kunyomi: ['と'],
    meanings: ['门', 'counter for houses', 'door radical (no. 63)'],
    grade: 2,
    strokes: 4,
    frequencyRank: 575,
  ),
  // quick / 快
  '速': KanjiReading(
    kanji: '速',
    onyomi: ['そく'],
    kunyomi: ['はや(い)', '(はや)', 'はや(める)', 'すみ(やか)'],
    meanings: ['quick', '快'],
    grade: 3,
    strokes: 10,
    frequencyRank: 576,
  ),
  // exist / suppose / be aware of
  '存': KanjiReading(
    kanji: '存',
    onyomi: ['そん', 'ぞん'],
    kunyomi: ['ながら(える)', 'あ(る)', 'たも(つ)', 'と(う)'],
    meanings: ['exist', 'suppose', 'be aware of'],
    grade: 6,
    strokes: 6,
    frequencyRank: 577,
  ),
  // 花
  '花': KanjiReading(
    kanji: '花',
    onyomi: ['か', 'け'],
    kunyomi: ['はな'],
    meanings: ['花'],
    grade: 1,
    strokes: 7,
    frequencyRank: 578,
  ),
  // springtime / spring (season)
  '春': KanjiReading(
    kanji: '春',
    onyomi: ['しゅん'],
    kunyomi: ['はる'],
    meanings: ['springtime', 'spring (season)'],
    grade: 2,
    strokes: 9,
    frequencyRank: 579,
  ),
  // fly / skip (pages) / scatter
  '飛': KanjiReading(
    kanji: '飛',
    onyomi: ['ひ'],
    kunyomi: ['と(ぶ)', 'と(ばす)'],
    meanings: ['fly', 'skip (pages)', 'scatter'],
    grade: 4,
    strokes: 9,
    frequencyRank: 580,
  ),
  // kill / murder / butcher
  '殺': KanjiReading(
    kanji: '殺',
    onyomi: ['さつ', 'さい', 'せつ'],
    kunyomi: ['ころ(す)', 'ごろ(し)', 'そ(ぐ)', 'あや(める)'],
    meanings: ['kill', 'murder', 'butcher'],
    grade: 5,
    strokes: 10,
    frequencyRank: 581,
  ),
  // 中心 / 中间
  '央': KanjiReading(
    kanji: '央',
    onyomi: ['おう'],
    kunyomi: [],
    meanings: ['中心', '中间'],
    grade: 3,
    strokes: 5,
    frequencyRank: 582,
  ),
  // ticket
  '券': KanjiReading(
    kanji: '券',
    onyomi: ['けん'],
    kunyomi: [],
    meanings: ['ticket'],
    grade: 6,
    strokes: 8,
    frequencyRank: 583,
  ),
  // 红
  '赤': KanjiReading(
    kanji: '赤',
    onyomi: ['せき', 'しゃく'],
    kunyomi: ['あか', '(あか)', 'あか(い)', 'あか(らむ)', 'あか(らめる)'],
    meanings: ['红'],
    grade: 1,
    strokes: 7,
    frequencyRank: 584,
  ),
  // nickname / 数字 / item
  '号': KanjiReading(
    kanji: '号',
    onyomi: ['ごう'],
    kunyomi: ['さけ(ぶ)', 'よびな'],
    meanings: ['nickname', '数字', 'item'],
    grade: 3,
    strokes: 5,
    frequencyRank: 585,
  ),
  // simple / 一 / single
  '単': KanjiReading(
    kanji: '単',
    onyomi: ['たん'],
    kunyomi: ['ひとえ'],
    meanings: ['simple', '一', 'single'],
    grade: 4,
    strokes: 9,
    frequencyRank: 586,
  ),
  // alliance / oath
  '盟': KanjiReading(
    kanji: '盟',
    onyomi: ['めい'],
    kunyomi: [],
    meanings: ['alliance', 'oath'],
    grade: 6,
    strokes: 13,
    frequencyRank: 587,
  ),
  // squat / seat / cushion
  '座': KanjiReading(
    kanji: '座',
    onyomi: ['ざ'],
    kunyomi: ['すわ(る)'],
    meanings: ['squat', 'seat', 'cushion'],
    grade: 6,
    strokes: 10,
    frequencyRank: 588,
  ),
  // 蓝 / 绿
  '青': KanjiReading(
    kanji: '青',
    onyomi: ['せい', 'しょう'],
    kunyomi: ['あお', '(あお)', 'あお(い)'],
    meanings: ['蓝', '绿'],
    grade: 1,
    strokes: 8,
    frequencyRank: 589,
  ),
  // rend / rip / tear
  '破': KanjiReading(
    kanji: '破',
    onyomi: ['は'],
    kunyomi: ['やぶ(る)', 'やぶ(れる)', 'わ(れる)'],
    meanings: ['rend', 'rip', 'tear'],
    grade: 5,
    strokes: 10,
    frequencyRank: 590,
  ),
  // compilation / knit / plait
  '編': KanjiReading(
    kanji: '編',
    onyomi: ['へん'],
    kunyomi: ['あ(む)', 'あ(み)'],
    meanings: ['compilation', 'knit', 'plait'],
    grade: 5,
    strokes: 15,
    frequencyRank: 591,
  ),
  // search / look for / locate
  '捜': KanjiReading(
    kanji: '捜',
    onyomi: ['そう', 'しゅ', 'しゅう'],
    kunyomi: ['さが(す)'],
    meanings: ['search', 'look for', 'locate'],
    grade: 8,
    strokes: 10,
    frequencyRank: 592,
  ),
  // bamboo
  '竹': KanjiReading(
    kanji: '竹',
    onyomi: ['ちく'],
    kunyomi: ['たけ'],
    meanings: ['bamboo'],
    grade: 1,
    strokes: 6,
    frequencyRank: 593,
  ),
  // exclude / division (x/3) / remove
  '除': KanjiReading(
    kanji: '除',
    onyomi: ['じょ', 'じ'],
    kunyomi: ['のぞ(く)', 'よ(け)'],
    meanings: ['exclude', 'division (x/3)', 'remove'],
    grade: 6,
    strokes: 10,
    frequencyRank: 594,
  ),
  // perfect / completion / 结束
  '完': KanjiReading(
    kanji: '完',
    onyomi: ['かん'],
    kunyomi: [],
    meanings: ['perfect', 'completion', '结束'],
    grade: 4,
    strokes: 7,
    frequencyRank: 595,
  ),
  // descend / precipitate / fall
  '降': KanjiReading(
    kanji: '降',
    onyomi: ['こう', 'ご'],
    kunyomi: ['お(りる)', 'お(ろす)', 'ふ(る)', 'ふ(り)', 'くだ(る)', 'くだ(す)'],
    meanings: ['descend', 'precipitate', 'fall'],
    grade: 6,
    strokes: 10,
    frequencyRank: 596,
  ),
  // transcend / super- / ultra-
  '超': KanjiReading(
    kanji: '超',
    onyomi: ['ちょう'],
    kunyomi: ['こ(える)', 'こ(す)'],
    meanings: ['transcend', 'super-', 'ultra-'],
    grade: 8,
    strokes: 12,
    frequencyRank: 597,
  ),
  // blame / condemn / censure
  '責': KanjiReading(
    kanji: '責',
    onyomi: ['せき'],
    kunyomi: ['せ(める)'],
    meanings: ['blame', 'condemn', 'censure'],
    grade: 5,
    strokes: 11,
    frequencyRank: 598,
  ),
  // row / and / besides
  '並': KanjiReading(
    kanji: '並',
    onyomi: ['へい', 'ほう'],
    kunyomi: ['な(み)', 'なみ', 'なら(べる)', 'なら(ぶ)', 'なら(びに)'],
    meanings: ['row', 'and', 'besides'],
    grade: 6,
    strokes: 8,
    frequencyRank: 599,
  ),
  // heal / cure
  '療': KanjiReading(
    kanji: '療',
    onyomi: ['りょう'],
    kunyomi: [],
    meanings: ['heal', 'cure'],
    grade: 8,
    strokes: 17,
    frequencyRank: 600,
  ),
  // accompany / obey / submit to
  '従': KanjiReading(
    kanji: '従',
    onyomi: ['じゅう', 'しょう', 'じゅ'],
    kunyomi: ['したが(う)', 'したが(える)', 'より'],
    meanings: ['accompany', 'obey', 'submit to'],
    grade: 6,
    strokes: 10,
    frequencyRank: 601,
  ),
  // 右
  '右': KanjiReading(
    kanji: '右',
    onyomi: ['う', 'ゆう'],
    kunyomi: ['みぎ'],
    meanings: ['右'],
    grade: 1,
    strokes: 5,
    frequencyRank: 602,
  ),
  // discipline / conduct oneself well / 学习
  '修': KanjiReading(
    kanji: '修',
    onyomi: ['しゅう', 'しゅ'],
    kunyomi: ['おさ(める)', 'おさ(まる)'],
    meanings: ['discipline', 'conduct oneself well', '学习'],
    grade: 5,
    strokes: 10,
    frequencyRank: 603,
  ),
  // catch / capture
  '捕': KanjiReading(
    kanji: '捕',
    onyomi: ['ほ'],
    kunyomi: ['と(らえる)', 'と(らわれる)', 'と(る)', 'とら(える)', 'とら(われる)', 'つか(まえる)', 'つか(まる)'],
    meanings: ['catch', 'capture'],
    grade: 8,
    strokes: 10,
    frequencyRank: 604,
  ),
  // regiment / party / company
  '隊': KanjiReading(
    kanji: '隊',
    onyomi: ['たい'],
    kunyomi: [],
    meanings: ['regiment', 'party', 'company'],
    grade: 4,
    strokes: 12,
    frequencyRank: 605,
  ),
  // dangerous / fear / uneasy
  '危': KanjiReading(
    kanji: '危',
    onyomi: ['き'],
    kunyomi: ['あぶ(ない)', 'あや(うい)', 'あや(ぶむ)'],
    meanings: ['dangerous', 'fear', 'uneasy'],
    grade: 6,
    strokes: 6,
    frequencyRank: 606,
  ),
  // pick / take / fetch
  '採': KanjiReading(
    kanji: '採',
    onyomi: ['さい'],
    kunyomi: ['と(る)'],
    meanings: ['pick', 'take', 'fetch'],
    grade: 5,
    strokes: 11,
    frequencyRank: 607,
  ),
  // weave / fabric
  '織': KanjiReading(
    kanji: '織',
    onyomi: ['しょく', 'しき'],
    kunyomi: ['お(る)', 'お(り)', 'おり', '(おり)'],
    meanings: ['weave', 'fabric'],
    grade: 5,
    strokes: 18,
    frequencyRank: 608,
  ),
  // forest / woods
  '森': KanjiReading(
    kanji: '森',
    onyomi: ['しん'],
    kunyomi: ['もり'],
    meanings: ['forest', 'woods'],
    grade: 1,
    strokes: 12,
    frequencyRank: 609,
  ),
  // emulate / compete with / bid
  '競': KanjiReading(
    kanji: '競',
    onyomi: ['きょう', 'けい'],
    kunyomi: ['きそ(う)', 'せ(る)', 'くら(べる)'],
    meanings: ['emulate', 'compete with', 'bid'],
    grade: 4,
    strokes: 20,
    frequencyRank: 610,
  ),
  // broaden / extend / expand
  '拡': KanjiReading(
    kanji: '拡',
    onyomi: ['かく', 'こう'],
    kunyomi: ['ひろ(がる)', 'ひろ(げる)', 'ひろ(める)'],
    meanings: ['broaden', 'extend', 'expand'],
    grade: 6,
    strokes: 8,
    frequencyRank: 611,
  ),
  // happenstance / especially / intentionally
  '故': KanjiReading(
    kanji: '故',
    onyomi: ['こ'],
    kunyomi: ['ゆえ', 'ふる(い)', 'もと'],
    meanings: ['happenstance', 'especially', 'intentionally'],
    grade: 5,
    strokes: 9,
    frequencyRank: 612,
  ),
  // building / mansion / large building
  '館': KanjiReading(
    kanji: '館',
    onyomi: ['かん'],
    kunyomi: ['やかた', 'たて'],
    meanings: ['building', 'mansion', 'large building'],
    grade: 3,
    strokes: 16,
    frequencyRank: 613,
  ),
  // shake / wave / wag
  '振': KanjiReading(
    kanji: '振',
    onyomi: ['しん'],
    kunyomi: ['ふ(る)', 'ふ(れる)', 'ふ(るう)'],
    meanings: ['shake', 'wave', 'wag'],
    grade: 8,
    strokes: 10,
    frequencyRank: 614,
  ),
  // salary / wage / gift
  '給': KanjiReading(
    kanji: '給',
    onyomi: ['きゅう'],
    kunyomi: ['たま(う)', 'たも(う)', 'たま(え)'],
    meanings: ['salary', 'wage', 'gift'],
    grade: 4,
    strokes: 12,
    frequencyRank: 615,
  ),
  // roof / 房子 / 商店
  '屋': KanjiReading(
    kanji: '屋',
    onyomi: ['おく'],
    kunyomi: ['や'],
    meanings: ['roof', '房子', '商店'],
    grade: 3,
    strokes: 9,
    frequencyRank: 616,
  ),
  // jammed in / shellfish / mediate
  '介': KanjiReading(
    kanji: '介',
    onyomi: ['かい'],
    kunyomi: [],
    meanings: ['jammed in', 'shellfish', 'mediate'],
    grade: 8,
    strokes: 4,
    frequencyRank: 617,
  ),
  // 读
  '読': KanjiReading(
    kanji: '読',
    onyomi: ['どく', 'とく', 'とう'],
    kunyomi: ['よ(む)', 'よ(み)'],
    meanings: ['读'],
    grade: 2,
    strokes: 14,
    frequencyRank: 618,
  ),
  // valve / petal / braid
  '弁': KanjiReading(
    kanji: '弁',
    onyomi: ['べん', 'へん'],
    kunyomi: ['かんむり', 'わきま(える)', 'わ(ける)', 'はなびら', 'あらそ(う)'],
    meanings: ['valve', 'petal', 'braid'],
    grade: 5,
    strokes: 5,
    frequencyRank: 619,
  ),
  // 根 / radical / head (pimple)
  '根': KanjiReading(
    kanji: '根',
    onyomi: ['こん'],
    kunyomi: ['ね', '(ね)'],
    meanings: ['根', 'radical', 'head (pimple)'],
    grade: 3,
    strokes: 10,
    frequencyRank: 620,
  ),
  // 颜色
  '色': KanjiReading(
    kanji: '色',
    onyomi: ['しょく', 'しき'],
    kunyomi: ['いろ'],
    meanings: ['颜色'],
    grade: 2,
    strokes: 6,
    frequencyRank: 621,
  ),
  // 朋友
  '友': KanjiReading(
    kanji: '友',
    onyomi: ['ゆう'],
    kunyomi: ['とも'],
    meanings: ['朋友'],
    grade: 2,
    strokes: 4,
    frequencyRank: 622,
  ),
  // suffering / trial / worry
  '苦': KanjiReading(
    kanji: '苦',
    onyomi: ['く'],
    kunyomi: ['くる(しい)', 'ぐる(しい)', 'くる(しむ)', 'くる(しめる)', 'にが(い)', 'にが(る)'],
    meanings: ['suffering', 'trial', 'worry'],
    grade: 3,
    strokes: 8,
    frequencyRank: 623,
  ),
  // concerning / settle / take position
  '就': KanjiReading(
    kanji: '就',
    onyomi: ['しゅう', 'じゅ'],
    kunyomi: ['つ(く)', 'つ(ける)'],
    meanings: ['concerning', 'settle', 'take position'],
    grade: 6,
    strokes: 12,
    frequencyRank: 624,
  ),
  // welcome / 见面 / greet
  '迎': KanjiReading(
    kanji: '迎',
    onyomi: ['げい'],
    kunyomi: ['むか(える)'],
    meanings: ['welcome', '见面', 'greet'],
    grade: 8,
    strokes: 7,
    frequencyRank: 625,
  ),
  // 跑
  '走': KanjiReading(
    kanji: '走',
    onyomi: ['そう'],
    kunyomi: ['はし(る)'],
    meanings: ['跑'],
    grade: 2,
    strokes: 7,
    frequencyRank: 626,
  ),
  // marketing / sell / trade
  '販': KanjiReading(
    kanji: '販',
    onyomi: ['はん'],
    kunyomi: [],
    meanings: ['marketing', 'sell', 'trade'],
    grade: 8,
    strokes: 11,
    frequencyRank: 627,
  ),
  // park / garden / yard
  '園': KanjiReading(
    kanji: '園',
    onyomi: ['えん'],
    kunyomi: ['その'],
    meanings: ['park', 'garden', 'yard'],
    grade: 2,
    strokes: 13,
    frequencyRank: 628,
  ),
  // tool / utensil / means
  '具': KanjiReading(
    kanji: '具',
    onyomi: ['ぐ'],
    kunyomi: ['そな(える)', 'つぶさ(に)'],
    meanings: ['tool', 'utensil', 'means'],
    grade: 3,
    strokes: 8,
    frequencyRank: 629,
  ),
  // 左
  '左': KanjiReading(
    kanji: '左',
    onyomi: ['さ', 'しゃ'],
    kunyomi: ['ひだり'],
    meanings: ['左'],
    grade: 1,
    strokes: 5,
    frequencyRank: 630,
  ),
  // uncommon / 不同 / queerness
  '異': KanjiReading(
    kanji: '異',
    onyomi: ['い'],
    kunyomi: ['こと', 'こと(なる)', 'け'],
    meanings: ['uncommon', '不同', 'queerness'],
    grade: 6,
    strokes: 11,
    frequencyRank: 631,
  ),
  // curriculum / continuation / passage of time
  '歴': KanjiReading(
    kanji: '歴',
    onyomi: ['れき', 'れっき'],
    kunyomi: [],
    meanings: ['curriculum', 'continuation', 'passage of time'],
    grade: 5,
    strokes: 14,
    frequencyRank: 632,
  ),
  // resign / 词 / term
  '辞': KanjiReading(
    kanji: '辞',
    onyomi: ['じ'],
    kunyomi: ['や(める)', 'いな(む)'],
    meanings: ['resign', '词', 'term'],
    grade: 4,
    strokes: 13,
    frequencyRank: 633,
  ),
  // leader / commander / general
  '将': KanjiReading(
    kanji: '将',
    onyomi: ['しょう', 'そう'],
    kunyomi: ['まさ(に)', 'はた', 'まさ', 'ひきい(る)', 'もって'],
    meanings: ['leader', 'commander', 'general'],
    grade: 6,
    strokes: 10,
    frequencyRank: 634,
  ),
  // 秋
  '秋': KanjiReading(
    kanji: '秋',
    onyomi: ['しゅう'],
    kunyomi: ['あき', 'とき'],
    meanings: ['秋'],
    grade: 2,
    strokes: 9,
    frequencyRank: 635,
  ),
  // cause / factor / be associated with
  '因': KanjiReading(
    kanji: '因',
    onyomi: ['いん'],
    kunyomi: ['よ(る)', 'ちな(む)'],
    meanings: ['cause', 'factor', 'be associated with'],
    grade: 5,
    strokes: 6,
    frequencyRank: 636,
  ),
  // offering / counter for drinks / present
  '献': KanjiReading(
    kanji: '献',
    onyomi: ['けん', 'こん'],
    kunyomi: ['たてまつ(る)'],
    meanings: ['offering', 'counter for drinks', 'present'],
    grade: 8,
    strokes: 13,
    frequencyRank: 637,
  ),
  // stern / strictness / severity
  '厳': KanjiReading(
    kanji: '厳',
    onyomi: ['げん', 'ごん'],
    kunyomi: ['おごそ(か)', 'きび(しい)', 'いか(めしい)', 'いつくし'],
    meanings: ['stern', 'strictness', 'severity'],
    grade: 6,
    strokes: 17,
    frequencyRank: 638,
  ),
  // 马
  '馬': KanjiReading(
    kanji: '馬',
    onyomi: ['ば', 'め', 'ま', 'ぼ', 'も'],
    kunyomi: ['うま', 'ま'],
    meanings: ['马'],
    grade: 2,
    strokes: 10,
    frequencyRank: 639,
  ),
  // 爱 / affection / favourite
  '愛': KanjiReading(
    kanji: '愛',
    onyomi: ['あい'],
    kunyomi: ['いと(しい)', 'かな(しい)', 'め(でる)', 'お(しむ)', 'まな'],
    meanings: ['爱', 'affection', 'favourite'],
    grade: 4,
    strokes: 13,
    frequencyRank: 640,
  ),
  // hanging scroll / width
  '幅': KanjiReading(
    kanji: '幅',
    onyomi: ['ふく'],
    kunyomi: ['はば'],
    meanings: ['hanging scroll', 'width'],
    grade: 8,
    strokes: 12,
    frequencyRank: 641,
  ),
  // 休息 / day off / retire
  '休': KanjiReading(
    kanji: '休',
    onyomi: ['きゅう'],
    kunyomi: ['やす(む)', 'やす(まる)', 'やす(める)'],
    meanings: ['休息', 'day off', 'retire'],
    grade: 1,
    strokes: 6,
    frequencyRank: 642,
  ),
  // fiber / tie / rope
  '維': KanjiReading(
    kanji: '維',
    onyomi: ['い'],
    kunyomi: [],
    meanings: ['fiber', 'tie', 'rope'],
    grade: 8,
    strokes: 14,
    frequencyRank: 643,
  ),
  // wealth / enrich / abundant
  '富': KanjiReading(
    kanji: '富',
    onyomi: ['ふ', 'ふう'],
    kunyomi: ['と(む)', 'とみ'],
    meanings: ['wealth', 'enrich', 'abundant'],
    grade: 4,
    strokes: 12,
    frequencyRank: 644,
  ),
  // seacoast / beach / seashore
  '浜': KanjiReading(
    kanji: '浜',
    onyomi: ['ひん'],
    kunyomi: ['はま'],
    meanings: ['seacoast', 'beach', 'seashore'],
    grade: 8,
    strokes: 10,
    frequencyRank: 645,
  ),
  // 父亲
  '父': KanjiReading(
    kanji: '父',
    onyomi: ['ふ'],
    kunyomi: ['ちち'],
    meanings: ['父亲'],
    grade: 2,
    strokes: 4,
    frequencyRank: 646,
  ),
  // bequeath / leave behind / reserve
  '遺': KanjiReading(
    kanji: '遺',
    onyomi: ['い', 'ゆい'],
    kunyomi: ['のこ(す)'],
    meanings: ['bequeath', 'leave behind', 'reserve'],
    grade: 6,
    strokes: 15,
    frequencyRank: 647,
  ),
  // he / that / the
  '彼': KanjiReading(
    kanji: '彼',
    onyomi: ['ひ'],
    kunyomi: ['かれ', 'かの', 'か(の)'],
    meanings: ['he', 'that', 'the'],
    grade: 8,
    strokes: 8,
    frequencyRank: 648,
  ),
  // carrier / 搬运 / 全部
  '般': KanjiReading(
    kanji: '般',
    onyomi: ['はん'],
    kunyomi: [],
    meanings: ['carrier', '搬运', '全部'],
    grade: 8,
    strokes: 10,
    frequencyRank: 649,
  ),
  // un- / not yet / hitherto
  '未': KanjiReading(
    kanji: '未',
    onyomi: ['み', 'び'],
    kunyomi: ['いま(だ)', 'ま(だ)', 'ひつじ'],
    meanings: ['un-', 'not yet', 'hitherto'],
    grade: 4,
    strokes: 5,
    frequencyRank: 650,
  ),
  // bases / fort / rampart
  '塁': KanjiReading(
    kanji: '塁',
    onyomi: ['るい', 'らい', 'すい'],
    kunyomi: ['とりで'],
    meanings: ['bases', 'fort', 'rampart'],
    grade: 8,
    strokes: 12,
    frequencyRank: 651,
  ),
  // trade / exchange
  '貿': KanjiReading(
    kanji: '貿',
    onyomi: ['ぼう'],
    kunyomi: [],
    meanings: ['trade', 'exchange'],
    grade: 5,
    strokes: 12,
    frequencyRank: 652,
  ),
  // lecture / club / association
  '講': KanjiReading(
    kanji: '講',
    onyomi: ['こう'],
    kunyomi: [],
    meanings: ['lecture', 'club', 'association'],
    grade: 5,
    strokes: 17,
    frequencyRank: 653,
  ),
  // home country / 国家 / Japan
  '邦': KanjiReading(
    kanji: '邦',
    onyomi: ['ほう'],
    kunyomi: ['くに'],
    meanings: ['home country', '国家', 'Japan'],
    grade: 8,
    strokes: 7,
    frequencyRank: 654,
  ),
  // 舞蹈 / flit / circle
  '舞': KanjiReading(
    kanji: '舞',
    onyomi: ['ぶ'],
    kunyomi: ['ま(う)', 'まい'],
    meanings: ['舞蹈', 'flit', 'circle'],
    grade: 8,
    strokes: 15,
    frequencyRank: 655,
  ),
  // grove / forest
  '林': KanjiReading(
    kanji: '林',
    onyomi: ['りん'],
    kunyomi: ['はやし'],
    meanings: ['grove', 'forest'],
    grade: 1,
    strokes: 8,
    frequencyRank: 656,
  ),
  // attire / dress / pretend
  '装': KanjiReading(
    kanji: '装',
    onyomi: ['そう', 'しょう'],
    kunyomi: ['よそお(う)', 'よそお(い)'],
    meanings: ['attire', 'dress', 'pretend'],
    grade: 6,
    strokes: 12,
    frequencyRank: 657,
  ),
  // various / 多 / several
  '諸': KanjiReading(
    kanji: '諸',
    onyomi: ['しょ'],
    kunyomi: ['もろ'],
    meanings: ['various', '多', 'several'],
    grade: 6,
    strokes: 15,
    frequencyRank: 658,
  ),
  // 夏
  '夏': KanjiReading(
    kanji: '夏',
    onyomi: ['か', 'が', 'げ'],
    kunyomi: ['なつ'],
    meanings: ['夏'],
    grade: 2,
    strokes: 10,
    frequencyRank: 659,
  ),
  // elementary / principle / naked
  '素': KanjiReading(
    kanji: '素',
    onyomi: ['そ', 'す'],
    kunyomi: ['もと'],
    meanings: ['elementary', 'principle', 'naked'],
    grade: 5,
    strokes: 10,
    frequencyRank: 660,
  ),
  // deceased / the late / dying
  '亡': KanjiReading(
    kanji: '亡',
    onyomi: ['ぼう', 'もう'],
    kunyomi: ['な(い)', 'な(き)', 'ほろ(びる)', 'ほろ(ぶ)', 'ほろ(ぼす)'],
    meanings: ['deceased', 'the late', 'dying'],
    grade: 6,
    strokes: 3,
    frequencyRank: 661,
  ),
  // drama / 玩
  '劇': KanjiReading(
    kanji: '劇',
    onyomi: ['げき'],
    kunyomi: [],
    meanings: ['drama', '玩'],
    grade: 6,
    strokes: 15,
    frequencyRank: 662,
  ),
  // 河
  '河': KanjiReading(
    kanji: '河',
    onyomi: ['か'],
    kunyomi: ['かわ'],
    meanings: ['河'],
    grade: 5,
    strokes: 8,
    frequencyRank: 663,
  ),
  // dispatch / despatch / 发送
  '遣': KanjiReading(
    kanji: '遣',
    onyomi: ['けん'],
    kunyomi: ['つか(う)', 'つか(い)', 'づか(い)', 'つか(わす)', 'や(る)'],
    meanings: ['dispatch', 'despatch', '发送'],
    grade: 8,
    strokes: 13,
    frequencyRank: 664,
  ),
  // navigate / sail / cruise
  '航': KanjiReading(
    kanji: '航',
    onyomi: ['こう'],
    kunyomi: [],
    meanings: ['navigate', 'sail', 'cruise'],
    grade: 5,
    strokes: 10,
    frequencyRank: 665,
  ),
  // confront / resist / defy
  '抗': KanjiReading(
    kanji: '抗',
    onyomi: ['こう'],
    kunyomi: ['あらが(う)'],
    meanings: ['confront', 'resist', 'defy'],
    grade: 8,
    strokes: 7,
    frequencyRank: 666,
  ),
  // 凉 / cold (beer, person) / chill
  '冷': KanjiReading(
    kanji: '冷',
    onyomi: ['れい'],
    kunyomi: ['つめ(たい)', 'ひ(える)', 'ひ(や)', 'ひ(ややか)', 'ひ(やす)', 'ひ(やかす)', 'さ(める)', 'さ(ます)'],
    meanings: ['凉', 'cold (beer, person)', 'chill'],
    grade: 4,
    strokes: 7,
    frequencyRank: 667,
  ),
  // imitation / copy / mock
  '模': KanjiReading(
    kanji: '模',
    onyomi: ['も', 'ぼ'],
    kunyomi: [],
    meanings: ['imitation', 'copy', 'mock'],
    grade: 6,
    strokes: 14,
    frequencyRank: 668,
  ),
  // masculine / male / hero
  '雄': KanjiReading(
    kanji: '雄',
    onyomi: ['ゆう'],
    kunyomi: ['(お)', 'おす', 'おん'],
    meanings: ['masculine', 'male', 'hero'],
    grade: 8,
    strokes: 12,
    frequencyRank: 669,
  ),
  // suitable / occasional / rare
  '適': KanjiReading(
    kanji: '適',
    onyomi: ['てき'],
    kunyomi: ['かな(う)'],
    meanings: ['suitable', 'occasional', 'rare'],
    grade: 5,
    strokes: 14,
    frequencyRank: 670,
  ),
  // lady / 女人 / wife
  '婦': KanjiReading(
    kanji: '婦',
    onyomi: ['ふ'],
    kunyomi: ['よめ'],
    meanings: ['lady', '女人', 'wife'],
    grade: 5,
    strokes: 11,
    frequencyRank: 671,
  ),
  // iron
  '鉄': KanjiReading(
    kanji: '鉄',
    onyomi: ['てつ'],
    kunyomi: ['くろがね'],
    meanings: ['iron'],
    grade: 3,
    strokes: 13,
    frequencyRank: 672,
  ),
  // draw near / stop in / bring near
  '寄': KanjiReading(
    kanji: '寄',
    onyomi: ['き'],
    kunyomi: ['よ(る)', 'よ(り)', 'よ(せる)'],
    meanings: ['draw near', 'stop in', 'bring near'],
    grade: 5,
    strokes: 11,
    frequencyRank: 673,
  ),
  // benefit / gain / profit
  '益': KanjiReading(
    kanji: '益',
    onyomi: ['えき', 'やく'],
    kunyomi: ['ま(す)'],
    meanings: ['benefit', 'gain', 'profit'],
    grade: 5,
    strokes: 10,
    frequencyRank: 674,
  ),
  // crowded / mixture / in bulk
  '込': KanjiReading(
    kanji: '込',
    onyomi: [],
    kunyomi: ['こ(む)', 'こ(み)', 'こ(める)'],
    meanings: ['crowded', 'mixture', 'in bulk'],
    grade: 8,
    strokes: 5,
    frequencyRank: 675,
  ),
  // 脸 / expression
  '顔': KanjiReading(
    kanji: '顔',
    onyomi: ['がん'],
    kunyomi: ['かお'],
    meanings: ['脸', 'expression'],
    grade: 2,
    strokes: 18,
    frequencyRank: 676,
  ),
  // tense / solid / hard
  '緊': KanjiReading(
    kanji: '緊',
    onyomi: ['きん'],
    kunyomi: ['し(める)', 'し(まる)'],
    meanings: ['tense', 'solid', 'hard'],
    grade: 8,
    strokes: 15,
    frequencyRank: 677,
  ),
  // sort / kind / variety
  '類': KanjiReading(
    kanji: '類',
    onyomi: ['るい'],
    kunyomi: ['たぐ(い)'],
    meanings: ['sort', 'kind', 'variety'],
    grade: 4,
    strokes: 18,
    frequencyRank: 678,
  ),
  // newborn babe / 孩子 / young of animals
  '児': KanjiReading(
    kanji: '児',
    onyomi: ['じ', 'に', 'げい'],
    kunyomi: ['こ', '(こ)', '(っこ)'],
    meanings: ['newborn babe', '孩子', 'young of animals'],
    grade: 4,
    strokes: 7,
    frequencyRank: 679,
  ),
  // too much / myself / surplus
  '余': KanjiReading(
    kanji: '余',
    onyomi: ['よ'],
    kunyomi: ['あま(る)', 'あま(り)', 'あま(す)', 'あんま(り)'],
    meanings: ['too much', 'myself', 'surplus'],
    grade: 5,
    strokes: 7,
    frequencyRank: 680,
  ),
  // prohibition / ban / forbid
  '禁': KanjiReading(
    kanji: '禁',
    onyomi: ['きん'],
    kunyomi: [],
    meanings: ['prohibition', 'ban', 'forbid'],
    grade: 5,
    strokes: 13,
    frequencyRank: 681,
  ),
  // stamp / seal / mark
  '印': KanjiReading(
    kanji: '印',
    onyomi: ['いん'],
    kunyomi: ['しるし', '(じるし)', 'しる(す)'],
    meanings: ['stamp', 'seal', 'mark'],
    grade: 4,
    strokes: 6,
    frequencyRank: 682,
  ),
  // inverted / reverse / opposite
  '逆': KanjiReading(
    kanji: '逆',
    onyomi: ['ぎゃく', 'げき'],
    kunyomi: ['さか', 'さか(さ)', 'さか(らう)'],
    meanings: ['inverted', 'reverse', 'opposite'],
    grade: 5,
    strokes: 9,
    frequencyRank: 683,
  ),
  // 国王 / 规则 / magnate
  '王': KanjiReading(
    kanji: '王',
    onyomi: ['おう', '-のう'],
    kunyomi: [],
    meanings: ['国王', '规则', 'magnate'],
    grade: 1,
    strokes: 4,
    frequencyRank: 684,
  ),
  // 返回 / answer / fade
  '返': KanjiReading(
    kanji: '返',
    onyomi: ['へん'],
    kunyomi: ['かえ(す)', 'かえ(る)'],
    meanings: ['返回', 'answer', 'fade'],
    grade: 3,
    strokes: 7,
    frequencyRank: 685,
  ),
  // signpost / seal / mark
  '標': KanjiReading(
    kanji: '標',
    onyomi: ['ひょう'],
    kunyomi: ['しるべ', 'しるし'],
    meanings: ['signpost', 'seal', 'mark'],
    grade: 4,
    strokes: 15,
    frequencyRank: 686,
  ),
  // interchange / period / 改变
  '換': KanjiReading(
    kanji: '換',
    onyomi: ['かん'],
    kunyomi: ['か(える)', 'か(わる)'],
    meanings: ['interchange', 'period', '改变'],
    grade: 8,
    strokes: 12,
    frequencyRank: 687,
  ),
  // long time / old story
  '久': KanjiReading(
    kanji: '久',
    onyomi: ['きゅう', 'く'],
    kunyomi: ['ひさ(しい)'],
    meanings: ['long time', 'old story'],
    grade: 5,
    strokes: 3,
    frequencyRank: 688,
  ),
  // 短 / brevity / fault
  '短': KanjiReading(
    kanji: '短',
    onyomi: ['たん'],
    kunyomi: ['みじか(い)'],
    meanings: ['短', 'brevity', 'fault'],
    grade: 3,
    strokes: 12,
    frequencyRank: 689,
  ),
  // oil / fat
  '油': KanjiReading(
    kanji: '油',
    onyomi: ['ゆ', 'ゆう'],
    kunyomi: ['あぶら'],
    meanings: ['oil', 'fat'],
    grade: 3,
    strokes: 8,
    frequencyRank: 690,
  ),
  // wife / spouse
  '妻': KanjiReading(
    kanji: '妻',
    onyomi: ['さい'],
    kunyomi: ['つま'],
    meanings: ['wife', 'spouse'],
    grade: 5,
    strokes: 8,
    frequencyRank: 691,
  ),
  // outburst / rave / fret
  '暴': KanjiReading(
    kanji: '暴',
    onyomi: ['ぼう', 'ばく'],
    kunyomi: ['あば(く)', 'あば(れる)'],
    meanings: ['outburst', 'rave', 'fret'],
    grade: 5,
    strokes: 15,
    frequencyRank: 692,
  ),
  // wheel / ring / circle
  '輪': KanjiReading(
    kanji: '輪',
    onyomi: ['りん'],
    kunyomi: ['わ'],
    meanings: ['wheel', 'ring', 'circle'],
    grade: 4,
    strokes: 15,
    frequencyRank: 693,
  ),
  // fortune-telling / divining / forecasting
  '占': KanjiReading(
    kanji: '占',
    onyomi: ['せん'],
    kunyomi: ['し(める)', 'うらな(う)'],
    meanings: ['fortune-telling', 'divining', 'forecasting'],
    grade: 8,
    strokes: 5,
    frequencyRank: 694,
  ),
  // proclaim / 说 / announce
  '宣': KanjiReading(
    kanji: '宣',
    onyomi: ['せん'],
    kunyomi: ['のたま(う)'],
    meanings: ['proclaim', '说', 'announce'],
    grade: 6,
    strokes: 9,
    frequencyRank: 695,
  ),
  // stature / height / 后面
  '背': KanjiReading(
    kanji: '背',
    onyomi: ['はい'],
    kunyomi: ['せ', 'せい', 'そむ(く)', 'そむ(ける)'],
    meanings: ['stature', 'height', '后面'],
    grade: 6,
    strokes: 9,
    frequencyRank: 696,
  ),
  // shining / bright
  '昭': KanjiReading(
    kanji: '昭',
    onyomi: ['しょう'],
    kunyomi: [],
    meanings: ['shining', 'bright'],
    grade: 3,
    strokes: 9,
    frequencyRank: 697,
  ),
  // abolish / obsolete / cessation
  '廃': KanjiReading(
    kanji: '廃',
    onyomi: ['はい'],
    kunyomi: ['すた(れる)', 'すた(る)'],
    meanings: ['abolish', 'obsolete', 'cessation'],
    grade: 8,
    strokes: 12,
    frequencyRank: 698,
  ),
  // plant
  '植': KanjiReading(
    kanji: '植',
    onyomi: ['しょく'],
    kunyomi: ['う(える)', 'う(わる)'],
    meanings: ['plant'],
    grade: 3,
    strokes: 12,
    frequencyRank: 699,
  ),
  // heat / temperature / fever
  '熱': KanjiReading(
    kanji: '熱',
    onyomi: ['ねつ'],
    kunyomi: ['あつ(い)'],
    meanings: ['heat', 'temperature', 'fever'],
    grade: 4,
    strokes: 15,
    frequencyRank: 700,
  ),
  // inn / lodging / relay station
  '宿': KanjiReading(
    kanji: '宿',
    onyomi: ['しゅく'],
    kunyomi: ['やど', 'やど(る)', 'やど(す)'],
    meanings: ['inn', 'lodging', 'relay station'],
    grade: 3,
    strokes: 11,
    frequencyRank: 701,
  ),
  // 药 / chemical / enamel
  '薬': KanjiReading(
    kanji: '薬',
    onyomi: ['やく'],
    kunyomi: ['くすり'],
    meanings: ['药', 'chemical', 'enamel'],
    grade: 3,
    strokes: 16,
    frequencyRank: 702,
  ),
  // Italy / that one
  '伊': KanjiReading(
    kanji: '伊',
    onyomi: ['い'],
    kunyomi: ['かれ'],
    meanings: ['Italy', 'that one'],
    grade: 9,
    strokes: 6,
    frequencyRank: 703,
  ),
  // creek / inlet / bay
  '江': KanjiReading(
    kanji: '江',
    onyomi: ['こう'],
    kunyomi: ['え'],
    meanings: ['creek', 'inlet', 'bay'],
    grade: 8,
    strokes: 6,
    frequencyRank: 704,
  ),
  // pure / purify / cleanse
  '清': KanjiReading(
    kanji: '清',
    onyomi: ['せい', 'しょう', 'しん'],
    kunyomi: ['きよ(い)', 'きよ(まる)', 'きよ(める)'],
    meanings: ['pure', 'purify', 'cleanse'],
    grade: 4,
    strokes: 11,
    frequencyRank: 705,
  ),
  // 学习
  '習': KanjiReading(
    kanji: '習',
    onyomi: ['しゅう', 'じゅ'],
    kunyomi: ['なら(う)', 'なら(い)'],
    meanings: ['学习'],
    grade: 3,
    strokes: 11,
    frequencyRank: 706,
  ),
  // precipitous / inaccessible place / impregnable position
  '険': KanjiReading(
    kanji: '険',
    onyomi: ['けん'],
    kunyomi: ['けわ(しい)'],
    meanings: ['precipitous', 'inaccessible place', 'impregnable position'],
    grade: 5,
    strokes: 11,
    frequencyRank: 707,
  ),
  // trust / request
  '頼': KanjiReading(
    kanji: '頼',
    onyomi: ['らい'],
    kunyomi: ['たの(む)', 'たの(もしい)', 'たよ(る)'],
    meanings: ['trust', 'request'],
    grade: 8,
    strokes: 16,
    frequencyRank: 708,
  ),
  // colleague / official / companion
  '僚': KanjiReading(
    kanji: '僚',
    onyomi: ['りょう'],
    kunyomi: [],
    meanings: ['colleague', 'official', 'companion'],
    grade: 8,
    strokes: 14,
    frequencyRank: 709,
  ),
  // memorize / 学习 / remember
  '覚': KanjiReading(
    kanji: '覚',
    onyomi: ['かく'],
    kunyomi: ['おぼ(える)', 'さ(ます)', 'さ(める)', 'さと(る)'],
    meanings: ['memorize', '学习', 'remember'],
    grade: 4,
    strokes: 12,
    frequencyRank: 710,
  ),
  // good luck / joy / congratulations
  '吉': KanjiReading(
    kanji: '吉',
    onyomi: ['きち', 'きつ'],
    kunyomi: ['よし'],
    meanings: ['good luck', 'joy', 'congratulations'],
    grade: 8,
    strokes: 6,
    frequencyRank: 711,
  ),
  // boom / prosper / copulate
  '盛': KanjiReading(
    kanji: '盛',
    onyomi: ['せい', 'じょう'],
    kunyomi: ['も(る)', 'さか(る)', 'さか(ん)'],
    meanings: ['boom', 'prosper', 'copulate'],
    grade: 6,
    strokes: 11,
    frequencyRank: 712,
  ),
  // 船 / boat
  '船': KanjiReading(
    kanji: '船',
    onyomi: ['せん'],
    kunyomi: ['ふね', '(ふな)'],
    meanings: ['船', 'boat'],
    grade: 2,
    strokes: 11,
    frequencyRank: 713,
  ),
  // double / twice / times
  '倍': KanjiReading(
    kanji: '倍',
    onyomi: ['ばい'],
    kunyomi: [],
    meanings: ['double', 'twice', 'times'],
    grade: 3,
    strokes: 10,
    frequencyRank: 714,
  ),
  // level / average
  '均': KanjiReading(
    kanji: '均',
    onyomi: ['きん'],
    kunyomi: ['なら(す)'],
    meanings: ['level', 'average'],
    grade: 5,
    strokes: 7,
    frequencyRank: 715,
  ),
  // hundred million / 10**8
  '億': KanjiReading(
    kanji: '億',
    onyomi: ['おく'],
    kunyomi: [],
    meanings: ['hundred million', '10**8'],
    grade: 4,
    strokes: 15,
    frequencyRank: 716,
  ),
  // route / 道路
  '途': KanjiReading(
    kanji: '途',
    onyomi: ['と'],
    kunyomi: ['みち'],
    meanings: ['route', '道路'],
    grade: 8,
    strokes: 10,
    frequencyRank: 717,
  ),
  // pressure / 推 / overwhelm
  '圧': KanjiReading(
    kanji: '圧',
    onyomi: ['あつ', 'えん', 'おう'],
    kunyomi: ['お(す)', 'へ(す)', 'おさ(える)', 'お(さえる)'],
    meanings: ['pressure', '推', 'overwhelm'],
    grade: 5,
    strokes: 5,
    frequencyRank: 718,
  ),
  // technique / 艺术 / craft
  '芸': KanjiReading(
    kanji: '芸',
    onyomi: ['げい', 'うん'],
    kunyomi: ['う(える)', 'のり', 'わざ'],
    meanings: ['technique', '艺术', 'craft'],
    grade: 4,
    strokes: 7,
    frequencyRank: 719,
  ),
  // permit / approve
  '許': KanjiReading(
    kanji: '許',
    onyomi: ['きょ'],
    kunyomi: ['ゆる(す)', 'もと'],
    meanings: ['permit', 'approve'],
    grade: 5,
    strokes: 11,
    frequencyRank: 720,
  ),
  // emperor
  '皇': KanjiReading(
    kanji: '皇',
    onyomi: ['こう', 'おう'],
    kunyomi: [],
    meanings: ['emperor'],
    grade: 6,
    strokes: 9,
    frequencyRank: 721,
  ),
  // look to / 脸 / 见面
  '臨': KanjiReading(
    kanji: '臨',
    onyomi: ['りん'],
    kunyomi: ['のぞ(む)'],
    meanings: ['look to', '脸', '见面'],
    grade: 6,
    strokes: 18,
    frequencyRank: 722,
  ),
  // step / trample / carry through
  '踏': KanjiReading(
    kanji: '踏',
    onyomi: ['とう'],
    kunyomi: ['ふ(む)', 'ふ(まえる)'],
    meanings: ['step', 'trample', 'carry through'],
    grade: 8,
    strokes: 15,
    frequencyRank: 723,
  ),
  // station
  '駅': KanjiReading(
    kanji: '駅',
    onyomi: ['えき'],
    kunyomi: [],
    meanings: ['station'],
    grade: 3,
    strokes: 14,
    frequencyRank: 724,
  ),
  // signature / govt office / police station
  '署': KanjiReading(
    kanji: '署',
    onyomi: ['しょ'],
    kunyomi: [],
    meanings: ['signature', 'govt office', 'police station'],
    grade: 6,
    strokes: 13,
    frequencyRank: 725,
  ),
  // slip out / extract / pull out
  '抜': KanjiReading(
    kanji: '抜',
    onyomi: ['ばつ', 'はつ', 'はい'],
    kunyomi: ['ぬ(く)', 'ぬ(き)', 'ぬ(ける)', 'ぬ(かす)', 'ぬ(かる)'],
    meanings: ['slip out', 'extract', 'pull out'],
    grade: 8,
    strokes: 7,
    frequencyRank: 726,
  ),
  // demolition / 打破 / 破坏
  '壊': KanjiReading(
    kanji: '壊',
    onyomi: ['かい', 'え'],
    kunyomi: ['こわ(す)', 'こわ(れる)', 'やぶ(る)'],
    meanings: ['demolition', '打破', '破坏'],
    grade: 8,
    strokes: 16,
    frequencyRank: 727,
  ),
  // bond / loan / debt
  '債': KanjiReading(
    kanji: '債',
    onyomi: ['さい'],
    kunyomi: [],
    meanings: ['bond', 'loan', 'debt'],
    grade: 8,
    strokes: 13,
    frequencyRank: 728,
  ),
  // convenience / facility / excrement
  '便': KanjiReading(
    kanji: '便',
    onyomi: ['べん', 'びん'],
    kunyomi: ['たよ(り)'],
    meanings: ['convenience', 'facility', 'excrement'],
    grade: 4,
    strokes: 9,
    frequencyRank: 729,
  ),
  // expand / stretch / extend
  '伸': KanjiReading(
    kanji: '伸',
    onyomi: ['しん'],
    kunyomi: ['の(びる)', 'の(ばす)', 'の(べる)', 'の(す)'],
    meanings: ['expand', 'stretch', 'extend'],
    grade: 8,
    strokes: 7,
    frequencyRank: 730,
  ),
  // detain / fasten / halt
  '留': KanjiReading(
    kanji: '留',
    onyomi: ['りゅう', 'る'],
    kunyomi: ['と(める)', 'と(まる)', 'とど(める)', 'とど(まる)', 'るうぶる'],
    meanings: ['detain', 'fasten', 'halt'],
    grade: 5,
    strokes: 10,
    frequencyRank: 731,
  ),
  // guilt / sin / crime
  '罪': KanjiReading(
    kanji: '罪',
    onyomi: ['ざい'],
    kunyomi: ['つみ'],
    meanings: ['guilt', 'sin', 'crime'],
    grade: 5,
    strokes: 13,
    frequencyRank: 732,
  ),
  // halt / stopping
  '停': KanjiReading(
    kanji: '停',
    onyomi: ['てい'],
    kunyomi: ['と(める)', 'と(まる)'],
    meanings: ['halt', 'stopping'],
    grade: 5,
    strokes: 11,
    frequencyRank: 733,
  ),
  // entertain / revive / retrieve
  '興': KanjiReading(
    kanji: '興',
    onyomi: ['こう', 'きょう'],
    kunyomi: ['おこ(る)', 'おこ(す)'],
    meanings: ['entertain', 'revive', 'retrieve'],
    grade: 5,
    strokes: 16,
    frequencyRank: 734,
  ),
  // bomb / burst open / pop
  '爆': KanjiReading(
    kanji: '爆',
    onyomi: ['ばく'],
    kunyomi: ['は(ぜる)'],
    meanings: ['bomb', 'burst open', 'pop'],
    grade: 8,
    strokes: 19,
    frequencyRank: 735,
  ),
  // land / 六
  '陸': KanjiReading(
    kanji: '陸',
    onyomi: ['りく', 'ろく'],
    kunyomi: ['おか'],
    meanings: ['land', '六'],
    grade: 4,
    strokes: 11,
    frequencyRank: 736,
  ),
  // jewel / ball
  '玉': KanjiReading(
    kanji: '玉',
    onyomi: ['ぎょく'],
    kunyomi: ['たま', '(たま)', '(だま)'],
    meanings: ['jewel', 'ball'],
    grade: 1,
    strokes: 5,
    frequencyRank: 737,
  ),
  // source / origin
  '源': KanjiReading(
    kanji: '源',
    onyomi: ['げん'],
    kunyomi: ['みなもと'],
    meanings: ['source', 'origin'],
    grade: 6,
    strokes: 13,
    frequencyRank: 738,
  ),
  // ceremony / 规则 / affair
  '儀': KanjiReading(
    kanji: '儀',
    onyomi: ['ぎ'],
    kunyomi: [],
    meanings: ['ceremony', '规则', 'affair'],
    grade: 8,
    strokes: 15,
    frequencyRank: 739,
  ),
  // waves / billows / Poland
  '波': KanjiReading(
    kanji: '波',
    onyomi: ['は'],
    kunyomi: ['なみ'],
    meanings: ['waves', 'billows', 'Poland'],
    grade: 3,
    strokes: 8,
    frequencyRank: 740,
  ),
  // genesis / wound / injury
  '創': KanjiReading(
    kanji: '創',
    onyomi: ['そう', 'しょう'],
    kunyomi: ['つく(る)', 'はじ(める)', 'きず', 'けず(しける)'],
    meanings: ['genesis', 'wound', 'injury'],
    grade: 6,
    strokes: 12,
    frequencyRank: 741,
  ),
  // hinder / hurt / harm
  '障': KanjiReading(
    kanji: '障',
    onyomi: ['しょう'],
    kunyomi: ['さわ(る)'],
    meanings: ['hinder', 'hurt', 'harm'],
    grade: 6,
    strokes: 14,
    frequencyRank: 742,
  ),
  // inherit / succeed / continue
  '継': KanjiReading(
    kanji: '継',
    onyomi: ['けい'],
    kunyomi: ['つ(ぐ)', '(まま)'],
    meanings: ['inherit', 'succeed', 'continue'],
    grade: 8,
    strokes: 13,
    frequencyRank: 743,
  ),
  // muscle / sinew / tendon
  '筋': KanjiReading(
    kanji: '筋',
    onyomi: ['きん'],
    kunyomi: ['すじ'],
    meanings: ['muscle', 'sinew', 'tendon'],
    grade: 6,
    strokes: 12,
    frequencyRank: 744,
  ),
  // aim at / sight / 影
  '狙': KanjiReading(
    kanji: '狙',
    onyomi: ['そ', 'しょ'],
    kunyomi: ['ねら(う)', 'ねら(い)'],
    meanings: ['aim at', 'sight', '影'],
    grade: 8,
    strokes: 8,
    frequencyRank: 745,
  ),
  // sash / belt / obi
  '帯': KanjiReading(
    kanji: '帯',
    onyomi: ['たい'],
    kunyomi: ['お(びる)', 'おび'],
    meanings: ['sash', 'belt', 'obi'],
    grade: 4,
    strokes: 10,
    frequencyRank: 746,
  ),
  // prolong / stretching
  '延': KanjiReading(
    kanji: '延',
    onyomi: ['えん'],
    kunyomi: ['の(びる)', 'の(べる)', 'の(べ)', 'の(ばす)'],
    meanings: ['prolong', 'stretching'],
    grade: 6,
    strokes: 8,
    frequencyRank: 747,
  ),
  // feathers / counter for birds, rabbits
  '羽': KanjiReading(
    kanji: '羽',
    onyomi: ['う'],
    kunyomi: ['は', 'わ', 'はね'],
    meanings: ['feathers', 'counter for birds, rabbits'],
    grade: 2,
    strokes: 6,
    frequencyRank: 748,
  ),
  // toil / diligent / as much as possible
  '努': KanjiReading(
    kanji: '努',
    onyomi: ['ど'],
    kunyomi: ['つと(める)'],
    meanings: ['toil', 'diligent', 'as much as possible'],
    grade: 4,
    strokes: 7,
    frequencyRank: 749,
  ),
  // harden / set / clot
  '固': KanjiReading(
    kanji: '固',
    onyomi: ['こ'],
    kunyomi: ['かた(める)', 'かた(まる)', 'かた(まり)', 'かた(い)'],
    meanings: ['harden', 'set', 'clot'],
    grade: 4,
    strokes: 8,
    frequencyRank: 750,
  ),
  // 战斗 / 战争
  '闘': KanjiReading(
    kanji: '闘',
    onyomi: ['とう'],
    kunyomi: ['たたか(う)', 'あらそ(う)'],
    meanings: ['战斗', '战争'],
    grade: 8,
    strokes: 18,
    frequencyRank: 751,
  ),
  // refined / ghost / fairy
  '精': KanjiReading(
    kanji: '精',
    onyomi: ['せい', 'しょう'],
    kunyomi: ['しら(げる)', 'くわ(しい)'],
    meanings: ['refined', 'ghost', 'fairy'],
    grade: 5,
    strokes: 14,
    frequencyRank: 752,
  ),
  // 规则 / 法律 / follow
  '則': KanjiReading(
    kanji: '則',
    onyomi: ['そく'],
    kunyomi: ['のっと(る)', 'のり', 'すなわち'],
    meanings: ['规则', '法律', 'follow'],
    grade: 5,
    strokes: 9,
    frequencyRank: 753,
  ),
  // interment / bury / shelve
  '葬': KanjiReading(
    kanji: '葬',
    onyomi: ['そう'],
    kunyomi: ['ほうむ(る)'],
    meanings: ['interment', 'bury', 'shelve'],
    grade: 8,
    strokes: 12,
    frequencyRank: 754,
  ),
  // riot / 战争 / disorder
  '乱': KanjiReading(
    kanji: '乱',
    onyomi: ['らん', 'ろん'],
    kunyomi: ['みだ(れる)', 'みだ(る)', 'みだ(す)', 'みだ', 'おさ(める)', 'わた(る)'],
    meanings: ['riot', '战争', 'disorder'],
    grade: 6,
    strokes: 7,
    frequencyRank: 755,
  ),
  // evade / avoid / avert
  '避': KanjiReading(
    kanji: '避',
    onyomi: ['ひ'],
    kunyomi: ['さ(ける)', 'よ(ける)'],
    meanings: ['evade', 'avoid', 'avert'],
    grade: 8,
    strokes: 16,
    frequencyRank: 756,
  ),
  // universal / wide(ly) / generally
  '普': KanjiReading(
    kanji: '普',
    onyomi: ['ふ'],
    kunyomi: ['あまね(く)', 'あまねし'],
    meanings: ['universal', 'wide(ly)', 'generally'],
    grade: 8,
    strokes: 12,
    frequencyRank: 757,
  ),
  // scatter / disperse / spend
  '散': KanjiReading(
    kanji: '散',
    onyomi: ['さん'],
    kunyomi: ['ち(る)', 'ち(らす)', 'ち(らかす)', 'ち(らかる)', 'ち(らばる)', 'ばら', 'ばら(ける)'],
    meanings: ['scatter', 'disperse', 'spend'],
    grade: 4,
    strokes: 12,
    frequencyRank: 758,
  ),
  // director / official / govt office
  '司': KanjiReading(
    kanji: '司',
    onyomi: ['し'],
    kunyomi: ['つかさど(る)'],
    meanings: ['director', 'official', 'govt office'],
    grade: 4,
    strokes: 5,
    frequencyRank: 759,
  ),
  // ease / 和平
  '康': KanjiReading(
    kanji: '康',
    onyomi: ['こう'],
    kunyomi: [],
    meanings: ['ease', '和平'],
    grade: 4,
    strokes: 11,
    frequencyRank: 760,
  ),
  // fathom / plan / scheme
  '測': KanjiReading(
    kanji: '測',
    onyomi: ['そく'],
    kunyomi: ['はか(る)'],
    meanings: ['fathom', 'plan', 'scheme'],
    grade: 5,
    strokes: 12,
    frequencyRank: 761,
  ),
  // bountiful / excellent / 富有
  '豊': KanjiReading(
    kanji: '豊',
    onyomi: ['ほう', 'ぶ'],
    kunyomi: ['ゆた(か)', 'とよ'],
    meanings: ['bountiful', 'excellent', '富有'],
    grade: 5,
    strokes: 13,
    frequencyRank: 762,
  ),
  // ocean / sea / foreign
  '洋': KanjiReading(
    kanji: '洋',
    onyomi: ['よう'],
    kunyomi: [],
    meanings: ['ocean', 'sea', 'foreign'],
    grade: 3,
    strokes: 9,
    frequencyRank: 763,
  ),
  // quiet
  '静': KanjiReading(
    kanji: '静',
    onyomi: ['せい', 'じょう'],
    kunyomi: ['(しず)', 'しず(か)', 'しず(まる)', 'しず(める)'],
    meanings: ['quiet'],
    grade: 4,
    strokes: 14,
    frequencyRank: 764,
  ),
  // virtuous / 好 / goodness
  '善': KanjiReading(
    kanji: '善',
    onyomi: ['ぜん'],
    kunyomi: ['よ(い)', 'い(い)', 'よ(く)', 'よし(とする)'],
    meanings: ['virtuous', '好', 'goodness'],
    grade: 6,
    strokes: 12,
    frequencyRank: 765,
  ),
  // apprehend / chase
  '逮': KanjiReading(
    kanji: '逮',
    onyomi: ['たい'],
    kunyomi: [],
    meanings: ['apprehend', 'chase'],
    grade: 8,
    strokes: 11,
    frequencyRank: 766,
  ),
  // marriage
  '婚': KanjiReading(
    kanji: '婚',
    onyomi: ['こん'],
    kunyomi: [],
    meanings: ['marriage'],
    grade: 8,
    strokes: 11,
    frequencyRank: 767,
  ),
  // 厚 / 重 / 富有
  '厚': KanjiReading(
    kanji: '厚',
    onyomi: ['こう'],
    kunyomi: ['あつ(い)', 'あか'],
    meanings: ['厚', '重', '富有'],
    grade: 5,
    strokes: 9,
    frequencyRank: 768,
  ),
  // rejoice / take pleasure in
  '喜': KanjiReading(
    kanji: '喜',
    onyomi: ['き'],
    kunyomi: ['よろこ(ぶ)', 'よろこ(ばす)'],
    meanings: ['rejoice', 'take pleasure in'],
    grade: 5,
    strokes: 12,
    frequencyRank: 769,
  ),
  // age
  '齢': KanjiReading(
    kanji: '齢',
    onyomi: ['れい'],
    kunyomi: ['よわい', 'とし'],
    meanings: ['age'],
    grade: 8,
    strokes: 17,
    frequencyRank: 770,
  ),
  // surround / besiege / store
  '囲': KanjiReading(
    kanji: '囲',
    onyomi: ['い'],
    kunyomi: ['かこ(む)', 'かこ(う)', 'かこ(い)'],
    meanings: ['surround', 'besiege', 'store'],
    grade: 5,
    strokes: 7,
    frequencyRank: 771,
  ),
  // graduate / 士兵 / private
  '卒': KanjiReading(
    kanji: '卒',
    onyomi: ['そつ', 'しゅつ'],
    kunyomi: ['そっ(する)', 'お(える)', 'お(わる)', 'ついに', 'にわか'],
    meanings: ['graduate', '士兵', 'private'],
    grade: 4,
    strokes: 8,
    frequencyRank: 772,
  ),
  // urge / force / imminent
  '迫': KanjiReading(
    kanji: '迫',
    onyomi: ['はく'],
    kunyomi: ['せま(る)'],
    meanings: ['urge', 'force', 'imminent'],
    grade: 8,
    strokes: 8,
    frequencyRank: 773,
  ),
  // abbreviation / omission / outline
  '略': KanjiReading(
    kanji: '略',
    onyomi: ['りゃく'],
    kunyomi: ['ほぼ', 'はぶ(く)', 'おか(す)', 'おさ(める)', 'はかりごと', 'はか(る)'],
    meanings: ['abbreviation', 'omission', 'outline'],
    grade: 5,
    strokes: 11,
    frequencyRank: 774,
  ),
  // acquiesce / 听 / listen to
  '承': KanjiReading(
    kanji: '承',
    onyomi: ['しょう', 'じょう'],
    kunyomi: ['うけたまわ(る)', 'う(ける)'],
    meanings: ['acquiesce', '听', 'listen to'],
    grade: 6,
    strokes: 8,
    frequencyRank: 775,
  ),
  // floating / float / rise to surface
  '浮': KanjiReading(
    kanji: '浮',
    onyomi: ['ふ'],
    kunyomi: ['う(く)', 'う(かれる)', 'う(かぶ)', 'う(かべる)'],
    meanings: ['floating', 'float', 'rise to surface'],
    grade: 8,
    strokes: 10,
    frequencyRank: 776,
  ),
  // beguile / delusion / perplexity
  '惑': KanjiReading(
    kanji: '惑',
    onyomi: ['わく'],
    kunyomi: ['まど(う)'],
    meanings: ['beguile', 'delusion', 'perplexity'],
    grade: 8,
    strokes: 12,
    frequencyRank: 777,
  ),
  // crumble / 死 / demolish
  '崩': KanjiReading(
    kanji: '崩',
    onyomi: ['ほう'],
    kunyomi: ['くず(れる)', 'くず(れ)', 'くず(す)'],
    meanings: ['crumble', '死', 'demolish'],
    grade: 8,
    strokes: 11,
    frequencyRank: 778,
  ),
  // obey / order / turn
  '順': KanjiReading(
    kanji: '順',
    onyomi: ['じゅん'],
    kunyomi: [],
    meanings: ['obey', 'order', 'turn'],
    grade: 4,
    strokes: 12,
    frequencyRank: 779,
  ),
  // chronicle / account / narrative
  '紀': KanjiReading(
    kanji: '紀',
    onyomi: ['き'],
    kunyomi: [],
    meanings: ['chronicle', 'account', 'narrative'],
    grade: 5,
    strokes: 9,
    frequencyRank: 780,
  ),
  // 听 / headstrong / naughty
  '聴': KanjiReading(
    kanji: '聴',
    onyomi: ['ちょう', 'てい'],
    kunyomi: ['き(く)', 'ゆる(す)'],
    meanings: ['听', 'headstrong', 'naughty'],
    grade: 8,
    strokes: 17,
    frequencyRank: 781,
  ),
  // undress / removing / escape from
  '脱': KanjiReading(
    kanji: '脱',
    onyomi: ['だつ'],
    kunyomi: ['ぬ(ぐ)', 'ぬ(げる)'],
    meanings: ['undress', 'removing', 'escape from'],
    grade: 8,
    strokes: 11,
    frequencyRank: 782,
  ),
  // trip / travel
  '旅': KanjiReading(
    kanji: '旅',
    onyomi: ['りょ'],
    kunyomi: ['たび'],
    meanings: ['trip', 'travel'],
    grade: 3,
    strokes: 10,
    frequencyRank: 783,
  ),
  // discontinue / sever / cut off
  '絶': KanjiReading(
    kanji: '絶',
    onyomi: ['ぜつ'],
    kunyomi: ['た(える)', 'た(やす)', 'た(つ)'],
    meanings: ['discontinue', 'sever', 'cut off'],
    grade: 5,
    strokes: 12,
    frequencyRank: 784,
  ),
  // class / rank / grade
  '級': KanjiReading(
    kanji: '級',
    onyomi: ['きゅう'],
    kunyomi: [],
    meanings: ['class', 'rank', 'grade'],
    grade: 3,
    strokes: 9,
    frequencyRank: 785,
  ),
  // happiness / blessing / fortune
  '幸': KanjiReading(
    kanji: '幸',
    onyomi: ['こう'],
    kunyomi: ['さいわ(い)', 'さち', 'しあわ(せ)'],
    meanings: ['happiness', 'blessing', 'fortune'],
    grade: 3,
    strokes: 8,
    frequencyRank: 786,
  ),
  // boulder / rock / cliff
  '岩': KanjiReading(
    kanji: '岩',
    onyomi: ['がん'],
    kunyomi: ['いわ'],
    meanings: ['boulder', 'rock', 'cliff'],
    grade: 2,
    strokes: 8,
    frequencyRank: 787,
  ),
  // practice / gloss / 火车
  '練': KanjiReading(
    kanji: '練',
    onyomi: ['れん'],
    kunyomi: ['ね(る)', 'ね(り)'],
    meanings: ['practice', 'gloss', '火车'],
    grade: 3,
    strokes: 14,
    frequencyRank: 788,
  ),
  // 推 / 停止 / check
  '押': KanjiReading(
    kanji: '押',
    onyomi: ['おう'],
    kunyomi: ['お(す)', 'お(し)', 'お(っ)', 'お(さえる)', 'おさ(える)'],
    meanings: ['推', '停止', 'check'],
    grade: 8,
    strokes: 8,
    frequencyRank: 789,
  ),
  // lightly / trifling / unimportant
  '軽': KanjiReading(
    kanji: '軽',
    onyomi: ['けい', 'きょう', 'きん'],
    kunyomi: ['かる(い)', 'かろ(やか)', 'かろ(んじる)'],
    meanings: ['lightly', 'trifling', 'unimportant'],
    grade: 3,
    strokes: 12,
    frequencyRank: 790,
  ),
  // overthrow / fall / collapse
  '倒': KanjiReading(
    kanji: '倒',
    onyomi: ['とう'],
    kunyomi: ['たお(れる)', 'だお(れ)', 'たお(す)', 'さかさま', 'さかさ', 'さかしま'],
    meanings: ['overthrow', 'fall', 'collapse'],
    grade: 8,
    strokes: 10,
    frequencyRank: 791,
  ),
  // complete / 完成
  '了': KanjiReading(
    kanji: '了',
    onyomi: ['りょう'],
    kunyomi: [],
    meanings: ['complete', '完成'],
    grade: 8,
    strokes: 2,
    frequencyRank: 792,
  ),
  // government office
  '庁': KanjiReading(
    kanji: '庁',
    onyomi: ['ちょう', 'てい'],
    kunyomi: ['やくしょ'],
    meanings: ['government office'],
    grade: 6,
    strokes: 5,
    frequencyRank: 793,
  ),
  // Dr. / command / esteem
  '博': KanjiReading(
    kanji: '博',
    onyomi: ['はく', 'ばく'],
    kunyomi: [],
    meanings: ['Dr.', 'command', 'esteem'],
    grade: 4,
    strokes: 12,
    frequencyRank: 794,
  ),
  // castle
  '城': KanjiReading(
    kanji: '城',
    onyomi: ['じょう', 'せい'],
    kunyomi: ['しろ'],
    meanings: ['castle'],
    grade: 4,
    strokes: 9,
    frequencyRank: 795,
  ),
  // afflicted / disease / suffer from
  '患': KanjiReading(
    kanji: '患',
    onyomi: ['かん'],
    kunyomi: ['わずら(う)'],
    meanings: ['afflicted', 'disease', 'suffer from'],
    grade: 8,
    strokes: 11,
    frequencyRank: 796,
  ),
  // tighten / tie / shut
  '締': KanjiReading(
    kanji: '締',
    onyomi: ['てい'],
    kunyomi: ['し(まる)', 'し(まり)', 'し(める)', 'し(め)', 'じ(め)'],
    meanings: ['tighten', 'tie', 'shut'],
    grade: 8,
    strokes: 15,
    frequencyRank: 797,
  ),
  // etc. / and so forth / class (first)
  '等': KanjiReading(
    kanji: '等',
    onyomi: ['とう'],
    kunyomi: ['ひと(しい)', 'など', '(ら)'],
    meanings: ['etc.', 'and so forth', 'class (first)'],
    grade: 3,
    strokes: 12,
    frequencyRank: 798,
  ),
  // salvation / 拯救 / 帮助
  '救': KanjiReading(
    kanji: '救',
    onyomi: ['きゅう'],
    kunyomi: ['すく(う)'],
    meanings: ['salvation', '拯救', '帮助'],
    grade: 5,
    strokes: 11,
    frequencyRank: 799,
  ),
  // tenacious / take hold / grasp
  '執': KanjiReading(
    kanji: '執',
    onyomi: ['しつ', 'しゅう'],
    kunyomi: ['と(る)'],
    meanings: ['tenacious', 'take hold', 'grasp'],
    grade: 8,
    strokes: 11,
    frequencyRank: 800,
  ),
  // stratum / social class / layer
  '層': KanjiReading(
    kanji: '層',
    onyomi: ['そう'],
    kunyomi: [],
    meanings: ['stratum', 'social class', 'layer'],
    grade: 6,
    strokes: 14,
    frequencyRank: 801,
  ),
  // printing block / printing plate / edition
  '版': KanjiReading(
    kanji: '版',
    onyomi: ['はん'],
    kunyomi: [],
    meanings: ['printing block', 'printing plate', 'edition'],
    grade: 5,
    strokes: 8,
    frequencyRank: 802,
  ),
  // old man / old age / grow old
  '老': KanjiReading(
    kanji: '老',
    onyomi: ['ろう'],
    kunyomi: ['お(いる)', 'ふ(ける)'],
    meanings: ['old man', 'old age', 'grow old'],
    grade: 4,
    strokes: 6,
    frequencyRank: 803,
  ),
  // orders / laws / command
  '令': KanjiReading(
    kanji: '令',
    onyomi: ['れい'],
    kunyomi: [],
    meanings: ['orders', 'laws', 'command'],
    grade: 4,
    strokes: 5,
    frequencyRank: 804,
  ),
  // angle / corner / square
  '角': KanjiReading(
    kanji: '角',
    onyomi: ['かく'],
    kunyomi: ['かど', 'つの'],
    meanings: ['angle', 'corner', 'square'],
    grade: 2,
    strokes: 7,
    frequencyRank: 805,
  ),
  // entwine / coil around / get caught in
  '絡': KanjiReading(
    kanji: '絡',
    onyomi: ['らく'],
    kunyomi: ['から(む)', 'から(まる)'],
    meanings: ['entwine', 'coil around', 'get caught in'],
    grade: 8,
    strokes: 12,
    frequencyRank: 806,
  ),
  // damage / loss / disadvantage
  '損': KanjiReading(
    kanji: '損',
    onyomi: ['そん'],
    kunyomi: ['そこ(なう)', 'そこな(う)', 'そこ(ねる)'],
    meanings: ['damage', 'loss', 'disadvantage'],
    grade: 5,
    strokes: 13,
    frequencyRank: 807,
  ),
  // tassel / tuft / fringe
  '房': KanjiReading(
    kanji: '房',
    onyomi: ['ぼう'],
    kunyomi: ['ふさ'],
    meanings: ['tassel', 'tuft', 'fringe'],
    grade: 8,
    strokes: 8,
    frequencyRank: 808,
  ),
  // recruit / campaign / gather (contributions)
  '募': KanjiReading(
    kanji: '募',
    onyomi: ['ぼ'],
    kunyomi: ['つの(る)'],
    meanings: ['recruit', 'campaign', 'gather (contributions)'],
    grade: 8,
    strokes: 12,
    frequencyRank: 809,
  ),
  // bend / 音乐 / melody
  '曲': KanjiReading(
    kanji: '曲',
    onyomi: ['きょく'],
    kunyomi: ['ま(がる)', 'ま(げる)', 'くま'],
    meanings: ['bend', '音乐', 'melody'],
    grade: 3,
    strokes: 6,
    frequencyRank: 810,
  ),
  // remove / withdraw / disarm
  '撤': KanjiReading(
    kanji: '撤',
    onyomi: ['てつ'],
    kunyomi: [],
    meanings: ['remove', 'withdraw', 'disarm'],
    grade: 8,
    strokes: 15,
    frequencyRank: 811,
  ),
  // 后面 / amidst / in
  '裏': KanjiReading(
    kanji: '裏',
    onyomi: ['り'],
    kunyomi: ['うら'],
    meanings: ['后面', 'amidst', 'in'],
    grade: 6,
    strokes: 13,
    frequencyRank: 812,
  ),
  // pay / clear out / prune
  '払': KanjiReading(
    kanji: '払',
    onyomi: ['ふつ', 'ひつ', 'ほつ'],
    kunyomi: ['はら(う)', 'はら(い)', 'ばら(い)'],
    meanings: ['pay', 'clear out', 'prune'],
    grade: 8,
    strokes: 5,
    frequencyRank: 813,
  ),
  // plane / sharpen / whittle
  '削': KanjiReading(
    kanji: '削',
    onyomi: ['さく'],
    kunyomi: ['けず(る)', 'はつ(る)', 'そ(ぐ)'],
    meanings: ['plane', 'sharpen', 'whittle'],
    grade: 8,
    strokes: 9,
    frequencyRank: 814,
  ),
  // secrecy / density (pop) / minuteness
  '密': KanjiReading(
    kanji: '密',
    onyomi: ['みつ'],
    kunyomi: ['ひそ(か)'],
    meanings: ['secrecy', 'density (pop)', 'minuteness'],
    grade: 6,
    strokes: 11,
    frequencyRank: 815,
  ),
  // courtyard / garden / yard
  '庭': KanjiReading(
    kanji: '庭',
    onyomi: ['てい'],
    kunyomi: ['にわ'],
    meanings: ['courtyard', 'garden', 'yard'],
    grade: 3,
    strokes: 10,
    frequencyRank: 816,
  ),
  // on foot / junior / emptiness
  '徒': KanjiReading(
    kanji: '徒',
    onyomi: ['と'],
    kunyomi: ['いたずら', 'あだ'],
    meanings: ['on foot', 'junior', 'emptiness'],
    grade: 4,
    strokes: 10,
    frequencyRank: 817,
  ),
  // set aside / give up / suspend
  '措': KanjiReading(
    kanji: '措',
    onyomi: ['そ'],
    kunyomi: ['お(く)'],
    meanings: ['set aside', 'give up', 'suspend'],
    grade: 8,
    strokes: 11,
    frequencyRank: 818,
  ),
  // Buddha / the dead / France
  '仏': KanjiReading(
    kanji: '仏',
    onyomi: ['ぶつ', 'ふつ'],
    kunyomi: ['ほとけ'],
    meanings: ['Buddha', 'the dead', 'France'],
    grade: 5,
    strokes: 4,
    frequencyRank: 819,
  ),
  // exploits / achievements / unreeling cocoons
  '績': KanjiReading(
    kanji: '績',
    onyomi: ['せき'],
    kunyomi: [],
    meanings: ['exploits', 'achievements', 'unreeling cocoons'],
    grade: 5,
    strokes: 17,
    frequencyRank: 820,
  ),
  // fabricate / 建造 / construct
  '築': KanjiReading(
    kanji: '築',
    onyomi: ['ちく'],
    kunyomi: ['きず(く)'],
    meanings: ['fabricate', '建造', 'construct'],
    grade: 5,
    strokes: 16,
    frequencyRank: 821,
  ),
  // freight / goods / property
  '貨': KanjiReading(
    kanji: '貨',
    onyomi: ['か'],
    kunyomi: ['たから'],
    meanings: ['freight', 'goods', 'property'],
    grade: 4,
    strokes: 11,
    frequencyRank: 822,
  ),
  // intention / plan / resolve
  '志': KanjiReading(
    kanji: '志',
    onyomi: ['し'],
    kunyomi: ['シリング', 'こころざ(す)', 'こころざし'],
    meanings: ['intention', 'plan', 'resolve'],
    grade: 5,
    strokes: 7,
    frequencyRank: 823,
  ),
  // mix / blend / confuse
  '混': KanjiReading(
    kanji: '混',
    onyomi: ['こん'],
    kunyomi: ['ま(じる)', 'ま(じり)', 'ま(ざる)', 'ま(ぜる)', 'こ(む)'],
    meanings: ['mix', 'blend', 'confuse'],
    grade: 5,
    strokes: 11,
    frequencyRank: 824,
  ),
  // ride / board / get on
  '載': KanjiReading(
    kanji: '載',
    onyomi: ['さい'],
    kunyomi: ['の(せる)', 'の(る)'],
    meanings: ['ride', 'board', 'get on'],
    grade: 8,
    strokes: 13,
    frequencyRank: 825,
  ),
  // rise up
  '昇': KanjiReading(
    kanji: '昇',
    onyomi: ['しょう'],
    kunyomi: ['のぼ(る)'],
    meanings: ['rise up'],
    grade: 8,
    strokes: 8,
    frequencyRank: 826,
  ),
  // pond / cistern / pool
  '池': KanjiReading(
    kanji: '池',
    onyomi: ['ち'],
    kunyomi: ['いけ'],
    meanings: ['pond', 'cistern', 'pool'],
    grade: 2,
    strokes: 6,
    frequencyRank: 827,
  ),
  // camp / battle array / ranks
  '陣': KanjiReading(
    kanji: '陣',
    onyomi: ['じん'],
    kunyomi: [],
    meanings: ['camp', 'battle array', 'ranks'],
    grade: 8,
    strokes: 10,
    frequencyRank: 828,
  ),
  // ego / I / selfish
  '我': KanjiReading(
    kanji: '我',
    onyomi: ['が'],
    kunyomi: ['われ', 'わ', 'わ(が)', '(わが)'],
    meanings: ['ego', 'I', 'selfish'],
    grade: 6,
    strokes: 7,
    frequencyRank: 829,
  ),
  // diligence / become employed / serve
  '勤': KanjiReading(
    kanji: '勤',
    onyomi: ['きん', 'ごん'],
    kunyomi: ['つと(める)', 'づと(め)', 'つと(まる)', 'いそ(しむ)'],
    meanings: ['diligence', 'become employed', 'serve'],
    grade: 6,
    strokes: 12,
    frequencyRank: 830,
  ),
  // 做 / 改变 / 制作
  '為': KanjiReading(
    kanji: '為',
    onyomi: ['い'],
    kunyomi: ['ため', 'な(る)', 'な(す)', 'す(る)', 'たり', 'つく(る)', 'なり'],
    meanings: ['做', '改变', '制作'],
    grade: 8,
    strokes: 9,
    frequencyRank: 831,
  ),
  // blood
  '血': KanjiReading(
    kanji: '血',
    onyomi: ['けつ'],
    kunyomi: ['ち'],
    meanings: ['blood'],
    grade: 3,
    strokes: 6,
    frequencyRank: 832,
  ),
  // 慢 / 晚 / 后面
  '遅': KanjiReading(
    kanji: '遅',
    onyomi: ['ち'],
    kunyomi: ['おく(れる)', 'おく(らす)', 'おそ(い)'],
    meanings: ['慢', '晚', '后面'],
    grade: 8,
    strokes: 12,
    frequencyRank: 833,
  ),
  // repress / well / now
  '抑': KanjiReading(
    kanji: '抑',
    onyomi: ['よく'],
    kunyomi: ['おさ(える)'],
    meanings: ['repress', 'well', 'now'],
    grade: 8,
    strokes: 7,
    frequencyRank: 834,
  ),
  // curtain / bunting / act of play
  '幕': KanjiReading(
    kanji: '幕',
    onyomi: ['まく', 'ばく'],
    kunyomi: ['とばり'],
    meanings: ['curtain', 'bunting', 'act of play'],
    grade: 6,
    strokes: 13,
    frequencyRank: 835,
  ),
  // reside / to be / exist
  '居': KanjiReading(
    kanji: '居',
    onyomi: ['きょ', 'こ'],
    kunyomi: ['い(る)', '(い)', 'お(る)'],
    meanings: ['reside', 'to be', 'exist'],
    grade: 5,
    strokes: 8,
    frequencyRank: 836,
  ),
  // dye / 颜色 / 绘画
  '染': KanjiReading(
    kanji: '染',
    onyomi: ['せん'],
    kunyomi: ['そ(める)', 'そ(まる)', 'し(みる)', 'し(み)'],
    meanings: ['dye', '颜色', '绘画'],
    grade: 6,
    strokes: 9,
    frequencyRank: 837,
  ),
  // 温暖
  '温': KanjiReading(
    kanji: '温',
    onyomi: ['おん'],
    kunyomi: ['あたた(か)', 'あたた(かい)', 'あたた(まる)', 'あたた(める)', 'ぬく'],
    meanings: ['温暖'],
    grade: 3,
    strokes: 12,
    frequencyRank: 838,
  ),
  // miscellaneous
  '雑': KanjiReading(
    kanji: '雑',
    onyomi: ['ざつ', 'ぞう'],
    kunyomi: ['まじ(える)', 'まじ(る)'],
    meanings: ['miscellaneous'],
    grade: 5,
    strokes: 14,
    frequencyRank: 839,
  ),
  // beckon / invite / summon
  '招': KanjiReading(
    kanji: '招',
    onyomi: ['しょう'],
    kunyomi: ['まね(く)'],
    meanings: ['beckon', 'invite', 'summon'],
    grade: 5,
    strokes: 8,
    frequencyRank: 840,
  ),
  // Nara / what?
  '奈': KanjiReading(
    kanji: '奈',
    onyomi: ['な', 'ない', 'だい'],
    kunyomi: ['いかん', 'からなし'],
    meanings: ['Nara', 'what?'],
    grade: 4,
    strokes: 8,
    frequencyRank: 841,
  ),
  // seasons
  '季': KanjiReading(
    kanji: '季',
    onyomi: ['き'],
    kunyomi: [],
    meanings: ['seasons'],
    grade: 4,
    strokes: 8,
    frequencyRank: 842,
  ),
  // quandary / become distressed / annoyed
  '困': KanjiReading(
    kanji: '困',
    onyomi: ['こん'],
    kunyomi: ['こま(る)'],
    meanings: ['quandary', 'become distressed', 'annoyed'],
    grade: 6,
    strokes: 7,
    frequencyRank: 843,
  ),
  // star / spot / dot
  '星': KanjiReading(
    kanji: '星',
    onyomi: ['せい', 'しょう'],
    kunyomi: ['ほし', '(ぼし)'],
    meanings: ['star', 'spot', 'dot'],
    grade: 2,
    strokes: 9,
    frequencyRank: 844,
  ),
  // wound / hurt / injure
  '傷': KanjiReading(
    kanji: '傷',
    onyomi: ['しょう'],
    kunyomi: ['きず', 'いた(む)', 'いた(める)'],
    meanings: ['wound', 'hurt', 'injure'],
    grade: 6,
    strokes: 13,
    frequencyRank: 845,
  ),
  // eternity / 长 / lengthy
  '永': KanjiReading(
    kanji: '永',
    onyomi: ['えい'],
    kunyomi: ['なが(い)'],
    meanings: ['eternity', '长', 'lengthy'],
    grade: 5,
    strokes: 5,
    frequencyRank: 846,
  ),
  // 选择 / select / elect
  '択': KanjiReading(
    kanji: '択',
    onyomi: ['たく'],
    kunyomi: ['えら(ぶ)'],
    meanings: ['选择', 'select', 'elect'],
    grade: 8,
    strokes: 7,
    frequencyRank: 847,
  ),
  // excel / excellence / beauty
  '秀': KanjiReading(
    kanji: '秀',
    onyomi: ['しゅう'],
    kunyomi: ['ひい(でる)'],
    meanings: ['excel', 'excellence', 'beauty'],
    grade: 8,
    strokes: 7,
    frequencyRank: 848,
  ),
  // renowned / publish / 写
  '著': KanjiReading(
    kanji: '著',
    onyomi: ['ちょ', 'ちゃく'],
    kunyomi: ['あらわ(す)', 'いちじる(しい)'],
    meanings: ['renowned', 'publish', '写'],
    grade: 6,
    strokes: 11,
    frequencyRank: 849,
  ),
  // indications / sign / omen
  '徴': KanjiReading(
    kanji: '徴',
    onyomi: ['ちょう', 'ち'],
    kunyomi: ['しるし'],
    meanings: ['indications', 'sign', 'omen'],
    grade: 8,
    strokes: 14,
    frequencyRank: 850,
  ),
  // document / records
  '誌': KanjiReading(
    kanji: '誌',
    onyomi: ['し'],
    kunyomi: [],
    meanings: ['document', 'records'],
    grade: 6,
    strokes: 14,
    frequencyRank: 851,
  ),
  // warehouse / storehouse
  '庫': KanjiReading(
    kanji: '庫',
    onyomi: ['こ', 'く'],
    kunyomi: ['くら'],
    meanings: ['warehouse', 'storehouse'],
    grade: 3,
    strokes: 10,
    frequencyRank: 852,
  ),
  // bullet / twang / flip
  '弾': KanjiReading(
    kanji: '弾',
    onyomi: ['だん', 'たん'],
    kunyomi: ['ひ(く)', 'ひ(き)', 'はず(む)', 'たま', 'はじ(く)', 'はじ(ける)', 'ただ(す)', 'はじ(きゆみ)'],
    meanings: ['bullet', 'twang', 'flip'],
    grade: 8,
    strokes: 12,
    frequencyRank: 853,
  ),
  // reparation / make up for / recompense
  '償': KanjiReading(
    kanji: '償',
    onyomi: ['しょう'],
    kunyomi: ['つぐな(う)'],
    meanings: ['reparation', 'make up for', 'recompense'],
    grade: 8,
    strokes: 17,
    frequencyRank: 854,
  ),
  // publish / carve / engrave
  '刊': KanjiReading(
    kanji: '刊',
    onyomi: ['かん'],
    kunyomi: [],
    meanings: ['publish', 'carve', 'engrave'],
    grade: 5,
    strokes: 5,
    frequencyRank: 855,
  ),
  // statue / 画 / image
  '像': KanjiReading(
    kanji: '像',
    onyomi: ['ぞう'],
    kunyomi: [],
    meanings: ['statue', '画', 'image'],
    grade: 5,
    strokes: 14,
    frequencyRank: 856,
  ),
  // achievement / merits / success
  '功': KanjiReading(
    kanji: '功',
    onyomi: ['こう', 'く'],
    kunyomi: ['いさお'],
    meanings: ['achievement', 'merits', 'success'],
    grade: 4,
    strokes: 5,
    frequencyRank: 857,
  ),
  // foothold / based on / follow
  '拠': KanjiReading(
    kanji: '拠',
    onyomi: ['きょ', 'こ'],
    kunyomi: ['よ(る)'],
    meanings: ['foothold', 'based on', 'follow'],
    grade: 8,
    strokes: 8,
    frequencyRank: 858,
  ),
  // incense / smell / perfume
  '香': KanjiReading(
    kanji: '香',
    onyomi: ['こう', 'きょう'],
    kunyomi: ['か', 'かお(り)', 'かお(る)'],
    meanings: ['incense', 'smell', 'perfume'],
    grade: 4,
    strokes: 9,
    frequencyRank: 859,
  ),
  // lack / gap / fail
  '欠': KanjiReading(
    kanji: '欠',
    onyomi: ['けつ', 'けん'],
    kunyomi: ['か(ける)', 'か(く)'],
    meanings: ['lack', 'gap', 'fail'],
    grade: 4,
    strokes: 4,
    frequencyRank: 860,
  ),
  // grow late / night watch / sit up late
  '更': KanjiReading(
    kanji: '更',
    onyomi: ['こう'],
    kunyomi: ['さら', 'さら(に)', 'ふ(ける)', 'ふ(かす)'],
    meanings: ['grow late', 'night watch', 'sit up late'],
    grade: 8,
    strokes: 7,
    frequencyRank: 861,
  ),
  // secret / conceal
  '秘': KanjiReading(
    kanji: '秘',
    onyomi: ['ひ'],
    kunyomi: ['ひ(める)', 'ひそ(か)', 'かく(す)'],
    meanings: ['secret', 'conceal'],
    grade: 6,
    strokes: 10,
    frequencyRank: 862,
  ),
  // repel / refuse / reject
  '拒': KanjiReading(
    kanji: '拒',
    onyomi: ['きょ', 'ご'],
    kunyomi: ['こば(む)'],
    meanings: ['repel', 'refuse', 'reject'],
    grade: 8,
    strokes: 8,
    frequencyRank: 863,
  ),
  // punish / penalty / 句子
  '刑': KanjiReading(
    kanji: '刑',
    onyomi: ['けい'],
    kunyomi: [],
    meanings: ['punish', 'penalty', '句子'],
    grade: 8,
    strokes: 6,
    frequencyRank: 864,
  ),
  // slope / incline / hill
  '坂': KanjiReading(
    kanji: '坂',
    onyomi: ['はん'],
    kunyomi: ['さか'],
    meanings: ['slope', 'incline', 'hill'],
    grade: 3,
    strokes: 7,
    frequencyRank: 865,
  ),
  // engrave / cut fine / chop
  '刻': KanjiReading(
    kanji: '刻',
    onyomi: ['こく'],
    kunyomi: ['きざ(む)', 'きざ(み)'],
    meanings: ['engrave', 'cut fine', 'chop'],
    grade: 6,
    strokes: 8,
    frequencyRank: 866,
  ),
  // 底部 / sole / depth
  '底': KanjiReading(
    kanji: '底',
    onyomi: ['てい'],
    kunyomi: ['そこ'],
    meanings: ['底部', 'sole', 'depth'],
    grade: 4,
    strokes: 8,
    frequencyRank: 867,
  ),
  // approve / praise / title or inscription on picture
  '賛': KanjiReading(
    kanji: '賛',
    onyomi: ['さん'],
    kunyomi: ['たす(ける)', 'たた(える)'],
    meanings: ['approve', 'praise', 'title or inscription on picture'],
    grade: 5,
    strokes: 15,
    frequencyRank: 868,
  ),
  // hillock / mound
  '塚': KanjiReading(
    kanji: '塚',
    onyomi: ['ちょう'],
    kunyomi: ['つか', '(づか)'],
    meanings: ['hillock', 'mound'],
    grade: 8,
    strokes: 12,
    frequencyRank: 869,
  ),
  // doth / 做 / 发送
  '致': KanjiReading(
    kanji: '致',
    onyomi: ['ち'],
    kunyomi: ['いた(す)'],
    meanings: ['doth', '做', '发送'],
    grade: 8,
    strokes: 10,
    frequencyRank: 870,
  ),
  // embrace / hug / hold in arms
  '抱': KanjiReading(
    kanji: '抱',
    onyomi: ['ほう'],
    kunyomi: ['だ(く)', 'いだ(く)', 'かか(える)'],
    meanings: ['embrace', 'hug', 'hold in arms'],
    grade: 8,
    strokes: 8,
    frequencyRank: 871,
  ),
  // winding / reel / spin
  '繰': KanjiReading(
    kanji: '繰',
    onyomi: ['そう'],
    kunyomi: ['く(る)'],
    meanings: ['winding', 'reel', 'spin'],
    grade: 8,
    strokes: 19,
    frequencyRank: 872,
  ),
  // clothing / admit / obey
  '服': KanjiReading(
    kanji: '服',
    onyomi: ['ふく'],
    kunyomi: [],
    meanings: ['clothing', 'admit', 'obey'],
    grade: 3,
    strokes: 8,
    frequencyRank: 873,
  ),
  // crime / sin / offense
  '犯': KanjiReading(
    kanji: '犯',
    onyomi: ['はん', 'ぼん'],
    kunyomi: ['おか(す)'],
    meanings: ['crime', 'sin', 'offense'],
    grade: 5,
    strokes: 5,
    frequencyRank: 874,
  ),
  // tail / 结束 / counter for fish
  '尾': KanjiReading(
    kanji: '尾',
    onyomi: ['び'],
    kunyomi: ['お'],
    meanings: ['tail', '结束', 'counter for fish'],
    grade: 8,
    strokes: 7,
    frequencyRank: 875,
  ),
  // sketch / compose / 写
  '描': KanjiReading(
    kanji: '描',
    onyomi: ['びょう'],
    kunyomi: ['えが(く)', 'か(く)'],
    meanings: ['sketch', 'compose', '写'],
    grade: 8,
    strokes: 11,
    frequencyRank: 876,
  ),
  // linen / cloth / spread
  '布': KanjiReading(
    kanji: '布',
    onyomi: ['ふ', 'ほ'],
    kunyomi: ['ぬの', 'し(く)', 'きれ'],
    meanings: ['linen', 'cloth', 'spread'],
    grade: 5,
    strokes: 5,
    frequencyRank: 877,
  ),
  // fear / dread / awe
  '恐': KanjiReading(
    kanji: '恐',
    onyomi: ['きょう'],
    kunyomi: ['おそ(れる)', 'おそ(る)', 'おそ(ろしい)', 'こわ(い)', 'こわ(がる)'],
    meanings: ['fear', 'dread', 'awe'],
    grade: 8,
    strokes: 10,
    frequencyRank: 878,
  ),
  // Buddhist temple
  '寺': KanjiReading(
    kanji: '寺',
    onyomi: ['じ'],
    kunyomi: ['てら'],
    meanings: ['Buddhist temple'],
    grade: 2,
    strokes: 6,
    frequencyRank: 879,
  ),
  // small bell / buzzer
  '鈴': KanjiReading(
    kanji: '鈴',
    onyomi: ['れい', 'りん'],
    kunyomi: ['すず'],
    meanings: ['small bell', 'buzzer'],
    grade: 8,
    strokes: 13,
    frequencyRank: 880,
  ),
  // tray / shallow bowl / platter
  '盤': KanjiReading(
    kanji: '盤',
    onyomi: ['ばん'],
    kunyomi: [],
    meanings: ['tray', 'shallow bowl', 'platter'],
    grade: 8,
    strokes: 15,
    frequencyRank: 881,
  ),
  // breath / respiration / son
  '息': KanjiReading(
    kanji: '息',
    onyomi: ['そく'],
    kunyomi: ['いき'],
    meanings: ['breath', 'respiration', 'son'],
    grade: 3,
    strokes: 10,
    frequencyRank: 882,
  ),
  // eaves / roof / 房子
  '宇': KanjiReading(
    kanji: '宇',
    onyomi: ['う'],
    kunyomi: [],
    meanings: ['eaves', 'roof', '房子'],
    grade: 6,
    strokes: 6,
    frequencyRank: 883,
  ),
  // paragraph / nape of neck / clause
  '項': KanjiReading(
    kanji: '項',
    onyomi: ['こう'],
    kunyomi: ['うなじ'],
    meanings: ['paragraph', 'nape of neck', 'clause'],
    grade: 8,
    strokes: 12,
    frequencyRank: 884,
  ),
  // miss / mourning
  '喪': KanjiReading(
    kanji: '喪',
    onyomi: ['そう'],
    kunyomi: ['も'],
    meanings: ['miss', 'mourning'],
    grade: 8,
    strokes: 12,
    frequencyRank: 885,
  ),
  // consort / accompany / bring with
  '伴': KanjiReading(
    kanji: '伴',
    onyomi: ['はん', 'ばん'],
    kunyomi: ['ともな(う)'],
    meanings: ['consort', 'accompany', 'bring with'],
    grade: 8,
    strokes: 7,
    frequencyRank: 886,
  ),
  // distant / 远
  '遠': KanjiReading(
    kanji: '遠',
    onyomi: ['えん', 'おん'],
    kunyomi: ['とお(い)'],
    meanings: ['distant', '远'],
    grade: 2,
    strokes: 13,
    frequencyRank: 887,
  ),
  // foster / bring up / rear
  '養': KanjiReading(
    kanji: '養',
    onyomi: ['よう', 'りょう'],
    kunyomi: ['やしな(う)'],
    meanings: ['foster', 'bring up', 'rear'],
    grade: 4,
    strokes: 15,
    frequencyRank: 888,
  ),
  // state of suspension / hang / depend
  '懸': KanjiReading(
    kanji: '懸',
    onyomi: ['けん', 'け'],
    kunyomi: ['か(ける)', 'か(かる)'],
    meanings: ['state of suspension', 'hang', 'depend'],
    grade: 8,
    strokes: 20,
    frequencyRank: 889,
  ),
  // re- / 返回 / revert
  '戻': KanjiReading(
    kanji: '戻',
    onyomi: ['れい'],
    kunyomi: ['もど(す)', 'もど(る)'],
    meanings: ['re-', '返回', 'revert'],
    grade: 8,
    strokes: 7,
    frequencyRank: 890,
  ),
  // boulevard / 街道 / 城镇
  '街': KanjiReading(
    kanji: '街',
    onyomi: ['がい', 'かい'],
    kunyomi: ['まち'],
    meanings: ['boulevard', '街道', '城镇'],
    grade: 4,
    strokes: 12,
    frequencyRank: 891,
  ),
  // gigantic / 大 / large
  '巨': KanjiReading(
    kanji: '巨',
    onyomi: ['きょ'],
    kunyomi: [],
    meanings: ['gigantic', '大', 'large'],
    grade: 8,
    strokes: 5,
    frequencyRank: 892,
  ),
  // quake / shake / tremble
  '震': KanjiReading(
    kanji: '震',
    onyomi: ['しん'],
    kunyomi: ['ふる(う)', 'ふる(える)', 'ふる(わせる)', 'ふる(わす)'],
    meanings: ['quake', 'shake', 'tremble'],
    grade: 8,
    strokes: 15,
    frequencyRank: 893,
  ),
  // petition / request / vow
  '願': KanjiReading(
    kanji: '願',
    onyomi: ['がん'],
    kunyomi: ['ねが(う)', '(ねがい)'],
    meanings: ['petition', 'request', 'vow'],
    grade: 4,
    strokes: 19,
    frequencyRank: 894,
  ),
  // 画 / drawing / painting
  '絵': KanjiReading(
    kanji: '絵',
    onyomi: ['かい', 'え'],
    kunyomi: [],
    meanings: ['画', 'drawing', 'painting'],
    grade: 2,
    strokes: 12,
    frequencyRank: 895,
  ),
  // hope / beg / request
  '希': KanjiReading(
    kanji: '希',
    onyomi: ['き', 'け'],
    kunyomi: ['まれ', 'こいねが(う)'],
    meanings: ['hope', 'beg', 'request'],
    grade: 4,
    strokes: 7,
    frequencyRank: 896,
  ),
  // surpass / cross over / move to
  '越': KanjiReading(
    kanji: '越',
    onyomi: ['えつ', 'おつ'],
    kunyomi: ['こ(す)', 'ご(し)', 'こ(える)', 'ご(え)'],
    meanings: ['surpass', 'cross over', 'move to'],
    grade: 8,
    strokes: 12,
    frequencyRank: 897,
  ),
  // pledge / promise / vow
  '契': KanjiReading(
    kanji: '契',
    onyomi: ['けい'],
    kunyomi: ['ちぎ(る)'],
    meanings: ['pledge', 'promise', 'vow'],
    grade: 8,
    strokes: 9,
    frequencyRank: 898,
  ),
  // put up (a notice) / put up / hoist
  '掲': KanjiReading(
    kanji: '掲',
    onyomi: ['けい'],
    kunyomi: ['かか(げる)'],
    meanings: ['put up (a notice)', 'put up', 'hoist'],
    grade: 8,
    strokes: 11,
    frequencyRank: 899,
  ),
  // leap / 舞蹈 / skip
  '躍': KanjiReading(
    kanji: '躍',
    onyomi: ['やく'],
    kunyomi: ['おど(る)'],
    meanings: ['leap', '舞蹈', 'skip'],
    grade: 8,
    strokes: 21,
    frequencyRank: 900,
  ),
  // abandon / throw away / discard
  '棄': KanjiReading(
    kanji: '棄',
    onyomi: ['き'],
    kunyomi: ['す(てる)'],
    meanings: ['abandon', 'throw away', 'discard'],
    grade: 8,
    strokes: 13,
    frequencyRank: 901,
  ),
  // longing / covetousness / greed
  '欲': KanjiReading(
    kanji: '欲',
    onyomi: ['よく'],
    kunyomi: ['ほっ(する)', 'ほ(しい)'],
    meanings: ['longing', 'covetousness', 'greed'],
    grade: 6,
    strokes: 11,
    frequencyRank: 902,
  ),
  // pain / hurt / damage
  '痛': KanjiReading(
    kanji: '痛',
    onyomi: ['つう'],
    kunyomi: ['いた(い)', 'いた(む)', 'いた(ましい)', 'いた(める)'],
    meanings: ['pain', 'hurt', 'damage'],
    grade: 6,
    strokes: 12,
    frequencyRank: 903,
  ),
  // contact / touch / feel
  '触': KanjiReading(
    kanji: '触',
    onyomi: ['しょく'],
    kunyomi: ['ふ(れる)', 'さわ(る)', 'さわ'],
    meanings: ['contact', 'touch', 'feel'],
    grade: 8,
    strokes: 13,
    frequencyRank: 904,
  ),
  // residence / mansion
  '邸': KanjiReading(
    kanji: '邸',
    onyomi: ['てい'],
    kunyomi: ['やしき'],
    meanings: ['residence', 'mansion'],
    grade: 8,
    strokes: 8,
    frequencyRank: 905,
  ),
  // reliant / depend on / consequently
  '依': KanjiReading(
    kanji: '依',
    onyomi: ['い', 'え'],
    kunyomi: ['よ(る)'],
    meanings: ['reliant', 'depend on', 'consequently'],
    grade: 8,
    strokes: 8,
    frequencyRank: 906,
  ),
  // enroll / domiciliary register / membership
  '籍': KanjiReading(
    kanji: '籍',
    onyomi: ['せき'],
    kunyomi: [],
    meanings: ['enroll', 'domiciliary register', 'membership'],
    grade: 8,
    strokes: 20,
    frequencyRank: 907,
  ),
  // 脏 / pollute / disgrace
  '汚': KanjiReading(
    kanji: '汚',
    onyomi: ['お'],
    kunyomi: ['けが(す)', 'けが(れる)', 'けが(らわしい)', 'よご(す)', 'よご(れる)', 'きたな(い)'],
    meanings: ['脏', 'pollute', 'disgrace'],
    grade: 8,
    strokes: 6,
    frequencyRank: 908,
  ),
  // shrink / contract / shrivel
  '縮': KanjiReading(
    kanji: '縮',
    onyomi: ['しゅく'],
    kunyomi: ['ちぢ(む)', 'ちぢ(まる)', 'ちぢ(める)', 'ちぢ(れる)', 'ちぢ(らす)'],
    meanings: ['shrink', 'contract', 'shrivel'],
    grade: 6,
    strokes: 17,
    frequencyRank: 909,
  ),
  // send back / 返回
  '還': KanjiReading(
    kanji: '還',
    onyomi: ['かん'],
    kunyomi: ['かえ(る)'],
    meanings: ['send back', '返回'],
    grade: 8,
    strokes: 16,
    frequencyRank: 910,
  ),
  // sheet of... / counter for flat thin objects or sheets
  '枚': KanjiReading(
    kanji: '枚',
    onyomi: ['まい', 'ばい'],
    kunyomi: [],
    meanings: ['sheet of...', 'counter for flat thin objects or sheets'],
    grade: 6,
    strokes: 8,
    frequencyRank: 911,
  ),
  // belong / genus / subordinate official
  '属': KanjiReading(
    kanji: '属',
    onyomi: ['ぞく', 'しょく'],
    kunyomi: ['さかん', 'つく', 'やから'],
    meanings: ['belong', 'genus', 'subordinate official'],
    grade: 5,
    strokes: 12,
    frequencyRank: 912,
  ),
  // laugh
  '笑': KanjiReading(
    kanji: '笑',
    onyomi: ['しょう'],
    kunyomi: ['わら(う)', 'え(む)'],
    meanings: ['laugh'],
    grade: 4,
    strokes: 10,
    frequencyRank: 913,
  ),
  // mutually / reciprocally / together
  '互': KanjiReading(
    kanji: '互',
    onyomi: ['ご'],
    kunyomi: ['たが(い)', 'かたみ(に)'],
    meanings: ['mutually', 'reciprocally', 'together'],
    grade: 8,
    strokes: 4,
    frequencyRank: 914,
  ),
  // duplicate / double / compound
  '複': KanjiReading(
    kanji: '複',
    onyomi: ['ふく'],
    kunyomi: [],
    meanings: ['duplicate', 'double', 'compound'],
    grade: 5,
    strokes: 14,
    frequencyRank: 915,
  ),
  // prudence / thought / concern
  '慮': KanjiReading(
    kanji: '慮',
    onyomi: ['りょ'],
    kunyomi: ['おもんぱく(る)', 'おもんぱか(る)'],
    meanings: ['prudence', 'thought', 'concern'],
    grade: 8,
    strokes: 15,
    frequencyRank: 916,
  ),
  // mail / stagecoach stop
  '郵': KanjiReading(
    kanji: '郵',
    onyomi: ['ゆう'],
    kunyomi: [],
    meanings: ['mail', 'stagecoach stop'],
    grade: 6,
    strokes: 11,
    frequencyRank: 917,
  ),
  // bundle / sheaf / ream
  '束': KanjiReading(
    kanji: '束',
    onyomi: ['そく'],
    kunyomi: ['たば', 'たば(ねる)', 'つか', 'つか(ねる)'],
    meanings: ['bundle', 'sheaf', 'ream'],
    grade: 4,
    strokes: 7,
    frequencyRank: 918,
  ),
  // go-between / relationship
  '仲': KanjiReading(
    kanji: '仲',
    onyomi: ['ちゅう'],
    kunyomi: ['なか'],
    meanings: ['go-between', 'relationship'],
    grade: 4,
    strokes: 6,
    frequencyRank: 919,
  ),
  // flourish / prosperity / honor
  '栄': KanjiReading(
    kanji: '栄',
    onyomi: ['えい', 'よう'],
    kunyomi: ['さか(える)', 'は(え)', 'ば(え)', 'は(える)', 'え'],
    meanings: ['flourish', 'prosperity', 'honor'],
    grade: 4,
    strokes: 9,
    frequencyRank: 920,
  ),
  // tag / paper money / counter for bonds
  '札': KanjiReading(
    kanji: '札',
    onyomi: ['さつ'],
    kunyomi: ['ふだ'],
    meanings: ['tag', 'paper money', 'counter for bonds'],
    grade: 4,
    strokes: 5,
    frequencyRank: 921,
  ),
  // frame / framework / spindle
  '枠': KanjiReading(
    kanji: '枠',
    onyomi: [],
    kunyomi: ['わく'],
    meanings: ['frame', 'framework', 'spindle'],
    grade: 8,
    strokes: 8,
    frequencyRank: 922,
  ),
  // becoming / resemble / counterfeit
  '似': KanjiReading(
    kanji: '似',
    onyomi: ['じ'],
    kunyomi: ['に(る)', 'ひ(る)'],
    meanings: ['becoming', 'resemble', 'counterfeit'],
    grade: 5,
    strokes: 7,
    frequencyRank: 923,
  ),
  // 傍晚
  '夕': KanjiReading(
    kanji: '夕',
    onyomi: ['せき'],
    kunyomi: ['ゆう'],
    meanings: ['傍晚'],
    grade: 1,
    strokes: 3,
    frequencyRank: 924,
  ),
  // favor / blessing / grace
  '恵': KanjiReading(
    kanji: '恵',
    onyomi: ['けい', 'え'],
    kunyomi: ['めぐ(む)', 'めぐ(み)'],
    meanings: ['favor', 'blessing', 'grace'],
    grade: 8,
    strokes: 10,
    frequencyRank: 925,
  ),
  // plank / board / plate
  '板': KanjiReading(
    kanji: '板',
    onyomi: ['はん', 'ばん'],
    kunyomi: ['いた'],
    meanings: ['plank', 'board', 'plate'],
    grade: 3,
    strokes: 8,
    frequencyRank: 926,
  ),
  // file / row / rank
  '列': KanjiReading(
    kanji: '列',
    onyomi: ['れつ', 'れ'],
    kunyomi: [],
    meanings: ['file', 'row', 'rank'],
    grade: 3,
    strokes: 6,
    frequencyRank: 927,
  ),
  // dew / tears / expose
  '露': KanjiReading(
    kanji: '露',
    onyomi: ['ろ', 'ろう'],
    kunyomi: ['つゆ'],
    meanings: ['dew', 'tears', 'expose'],
    grade: 8,
    strokes: 21,
    frequencyRank: 928,
  ),
  // open sea / offing / rise high into sky
  '沖': KanjiReading(
    kanji: '沖',
    onyomi: ['ちゅう'],
    kunyomi: ['おき', 'おきつ', 'ちゅう(する)', 'わく'],
    meanings: ['open sea', 'offing', 'rise high into sky'],
    grade: 4,
    strokes: 7,
    frequencyRank: 929,
  ),
  // grope / search / look for
  '探': KanjiReading(
    kanji: '探',
    onyomi: ['たん'],
    kunyomi: ['さぐ(る)', 'さが(す)'],
    meanings: ['grope', 'search', 'look for'],
    grade: 6,
    strokes: 11,
    frequencyRank: 930,
  ),
  // escape / flee / shirk
  '逃': KanjiReading(
    kanji: '逃',
    onyomi: ['とう'],
    kunyomi: ['に(げる)', 'に(がす)', 'のが(す)', 'のが(れる)'],
    meanings: ['escape', 'flee', 'shirk'],
    grade: 8,
    strokes: 9,
    frequencyRank: 931,
  ),
  // borrow / rent
  '借': KanjiReading(
    kanji: '借',
    onyomi: ['しゃく'],
    kunyomi: ['か(りる)'],
    meanings: ['borrow', 'rent'],
    grade: 4,
    strokes: 10,
    frequencyRank: 932,
  ),
  // slacken / loosen / relax
  '緩': KanjiReading(
    kanji: '緩',
    onyomi: ['かん'],
    kunyomi: ['ゆる(い)', 'ゆる(やか)', 'ゆる(む)', 'ゆる(める)'],
    meanings: ['slacken', 'loosen', 'relax'],
    grade: 8,
    strokes: 15,
    frequencyRank: 933,
  ),
  // node / season / period
  '節': KanjiReading(
    kanji: '節',
    onyomi: ['せつ', 'せち'],
    kunyomi: ['ふし', '(ぶし)', 'のっと'],
    meanings: ['node', 'season', 'period'],
    grade: 4,
    strokes: 13,
    frequencyRank: 934,
  ),
  // demand / request / need
  '需': KanjiReading(
    kanji: '需',
    onyomi: ['じゅ'],
    kunyomi: [],
    meanings: ['demand', 'request', 'need'],
    grade: 8,
    strokes: 14,
    frequencyRank: 935,
  ),
  // skeleton / bone / remains
  '骨': KanjiReading(
    kanji: '骨',
    onyomi: ['こつ'],
    kunyomi: ['ほね'],
    meanings: ['skeleton', 'bone', 'remains'],
    grade: 6,
    strokes: 10,
    frequencyRank: 936,
  ),
  // shoot / shine into / onto
  '射': KanjiReading(
    kanji: '射',
    onyomi: ['しゃ'],
    kunyomi: ['い(る)', 'さ(す)', 'う(つ)'],
    meanings: ['shoot', 'shine into', 'onto'],
    grade: 6,
    strokes: 10,
    frequencyRank: 937,
  ),
  // lean / incline / tilt
  '傾': KanjiReading(
    kanji: '傾',
    onyomi: ['けい'],
    kunyomi: ['かたむ(く)', 'かたむ(ける)', 'かたぶ(く)', 'かた(げる)', 'かし(げる)'],
    meanings: ['lean', 'incline', 'tilt'],
    grade: 8,
    strokes: 13,
    frequencyRank: 938,
  ),
  // deliver / reach / arrive
  '届': KanjiReading(
    kanji: '届',
    onyomi: ['かい'],
    kunyomi: ['とど(ける)', 'とど(け)', 'とど(く)'],
    meanings: ['deliver', 'reach', 'arrive'],
    grade: 6,
    strokes: 8,
    frequencyRank: 939,
  ),
  // weekday
  '曜': KanjiReading(
    kanji: '曜',
    onyomi: ['よう'],
    kunyomi: [],
    meanings: ['weekday'],
    grade: 2,
    strokes: 18,
    frequencyRank: 940,
  ),
  // 玩
  '遊': KanjiReading(
    kanji: '遊',
    onyomi: ['ゆう', 'ゆ'],
    kunyomi: ['あそ(ぶ)', 'あそ(ばす)'],
    meanings: ['玩'],
    grade: 3,
    strokes: 12,
    frequencyRank: 941,
  ),
  // astray / be perplexed / in doubt
  '迷': KanjiReading(
    kanji: '迷',
    onyomi: ['めい'],
    kunyomi: ['まよ(う)'],
    meanings: ['astray', 'be perplexed', 'in doubt'],
    grade: 5,
    strokes: 9,
    frequencyRank: 942,
  ),
  // dream / vision / illusion
  '夢': KanjiReading(
    kanji: '夢',
    onyomi: ['む', 'ぼう'],
    kunyomi: ['ゆめ', 'ゆめ(みる)', 'くら(い)'],
    meanings: ['dream', 'vision', 'illusion'],
    grade: 5,
    strokes: 13,
    frequencyRank: 943,
  ),
  // scroll / volume / 书
  '巻': KanjiReading(
    kanji: '巻',
    onyomi: ['かん', 'けん'],
    kunyomi: ['ま(く)', 'まき', 'ま(き)'],
    meanings: ['scroll', 'volume', '书'],
    grade: 6,
    strokes: 9,
    frequencyRank: 944,
  ),
  // subscription / buy
  '購': KanjiReading(
    kanji: '購',
    onyomi: ['こう'],
    kunyomi: [],
    meanings: ['subscription', 'buy'],
    grade: 8,
    strokes: 17,
    frequencyRank: 945,
  ),
  // brandish / wave / wag
  '揮': KanjiReading(
    kanji: '揮',
    onyomi: ['き'],
    kunyomi: ['ふる(う)'],
    meanings: ['brandish', 'wave', 'wag'],
    grade: 6,
    strokes: 12,
    frequencyRank: 946,
  ),
  // mister / you / ruler
  '君': KanjiReading(
    kanji: '君',
    onyomi: ['くん'],
    kunyomi: ['きみ', '(ぎみ)'],
    meanings: ['mister', 'you', 'ruler'],
    grade: 3,
    strokes: 7,
    frequencyRank: 947,
  ),
  // burn / blaze / glow
  '燃': KanjiReading(
    kanji: '燃',
    onyomi: ['ねん'],
    kunyomi: ['も(える)', 'も(やす)', 'も(す)'],
    meanings: ['burn', 'blaze', 'glow'],
    grade: 5,
    strokes: 16,
    frequencyRank: 948,
  ),
  // allot / fill
  '充': KanjiReading(
    kanji: '充',
    onyomi: ['じゅう'],
    kunyomi: ['あ(てる)', 'み(たす)'],
    meanings: ['allot', 'fill'],
    grade: 8,
    strokes: 6,
    frequencyRank: 949,
  ),
  // 雨
  '雨': KanjiReading(
    kanji: '雨',
    onyomi: ['う'],
    kunyomi: ['あめ', '(あま)', '(さめ)'],
    meanings: ['雨'],
    grade: 1,
    strokes: 8,
    frequencyRank: 950,
  ),
  // closed / shut
  '閉': KanjiReading(
    kanji: '閉',
    onyomi: ['へい'],
    kunyomi: ['と(じる)', 'と(ざす)', 'し(める)', 'し(まる)', 'た(てる)'],
    meanings: ['closed', 'shut'],
    grade: 6,
    strokes: 11,
    frequencyRank: 951,
  ),
  // thong / beginning / inception
  '緒': KanjiReading(
    kanji: '緒',
    onyomi: ['しょ', 'ちょ'],
    kunyomi: ['お', 'いとぐち'],
    meanings: ['thong', 'beginning', 'inception'],
    grade: 8,
    strokes: 14,
    frequencyRank: 952,
  ),
  // tracks / mark / print
  '跡': KanjiReading(
    kanji: '跡',
    onyomi: ['せき'],
    kunyomi: ['あと'],
    meanings: ['tracks', 'mark', 'print'],
    grade: 8,
    strokes: 13,
    frequencyRank: 953,
  ),
  // wrap / pack up / cover
  '包': KanjiReading(
    kanji: '包',
    onyomi: ['ほう'],
    kunyomi: ['つつ(む)', 'くる(む)'],
    meanings: ['wrap', 'pack up', 'cover'],
    grade: 4,
    strokes: 5,
    frequencyRank: 954,
  ),
  // stop-over / reside in / resident
  '駐': KanjiReading(
    kanji: '駐',
    onyomi: ['ちゅう'],
    kunyomi: [],
    meanings: ['stop-over', 'reside in', 'resident'],
    grade: 8,
    strokes: 15,
    frequencyRank: 955,
  ),
  // tribute / support / finance
  '貢': KanjiReading(
    kanji: '貢',
    onyomi: ['こう', 'く'],
    kunyomi: ['みつ(ぐ)'],
    meanings: ['tribute', 'support', 'finance'],
    grade: 8,
    strokes: 10,
    frequencyRank: 956,
  ),
  // deer
  '鹿': KanjiReading(
    kanji: '鹿',
    onyomi: ['ろく'],
    kunyomi: ['しか', 'か'],
    meanings: ['deer'],
    grade: 4,
    strokes: 11,
    frequencyRank: 957,
  ),
  // 弱 / frail
  '弱': KanjiReading(
    kanji: '弱',
    onyomi: ['じゃく'],
    kunyomi: ['よわ(い)', 'よわ(る)', 'よわ(まる)', 'よわ(める)'],
    meanings: ['弱', 'frail'],
    grade: 2,
    strokes: 10,
    frequencyRank: 958,
  ),
  // instead / on the contrary / rather
  '却': KanjiReading(
    kanji: '却',
    onyomi: ['きゃく'],
    kunyomi: ['かえ(って)', 'しりぞ(く)', 'しりぞ(ける)'],
    meanings: ['instead', 'on the contrary', 'rather'],
    grade: 8,
    strokes: 7,
    frequencyRank: 959,
  ),
  // edge / origin / 结束
  '端': KanjiReading(
    kanji: '端',
    onyomi: ['たん'],
    kunyomi: ['はし', 'は', 'はた', '(ばた)', 'はな'],
    meanings: ['edge', 'origin', '结束'],
    grade: 8,
    strokes: 14,
    frequencyRank: 960,
  ),
  // fare / fee / hire
  '賃': KanjiReading(
    kanji: '賃',
    onyomi: ['ちん'],
    kunyomi: [],
    meanings: ['fare', 'fee', 'hire'],
    grade: 6,
    strokes: 13,
    frequencyRank: 961,
  ),
  // fold / 打破 / fracture
  '折': KanjiReading(
    kanji: '折',
    onyomi: ['せつ', 'しゃく'],
    kunyomi: ['お(る)', 'おり', 'お(り)', 'お(れる)'],
    meanings: ['fold', '打破', 'fracture'],
    grade: 4,
    strokes: 7,
    frequencyRank: 962,
  ),
  // introduce / inherit / 帮助
  '紹': KanjiReading(
    kanji: '紹',
    onyomi: ['しょう'],
    kunyomi: [],
    meanings: ['introduce', 'inherit', '帮助'],
    grade: 8,
    strokes: 11,
    frequencyRank: 963,
  ),
  // seize / get / find
  '獲': KanjiReading(
    kanji: '獲',
    onyomi: ['かく'],
    kunyomi: ['え(る)'],
    meanings: ['seize', 'get', 'find'],
    grade: 8,
    strokes: 16,
    frequencyRank: 964,
  ),
  // county / district
  '郡': KanjiReading(
    kanji: '郡',
    onyomi: ['ぐん'],
    kunyomi: ['こおり'],
    meanings: ['county', 'district'],
    grade: 4,
    strokes: 10,
    frequencyRank: 965,
  ),
  // join / get together / unite
  '併': KanjiReading(
    kanji: '併',
    onyomi: ['へい'],
    kunyomi: ['あわ(せる)'],
    meanings: ['join', 'get together', 'unite'],
    grade: 8,
    strokes: 8,
    frequencyRank: 966,
  ),
  // 草 / weeds / herbs
  '草': KanjiReading(
    kanji: '草',
    onyomi: ['そう'],
    kunyomi: ['くさ', '(くさ)', '(ぐさ)'],
    meanings: ['草', 'weeds', 'herbs'],
    grade: 1,
    strokes: 9,
    frequencyRank: 967,
  ),
  // penetrate / clear / pierce
  '徹': KanjiReading(
    kanji: '徹',
    onyomi: ['てつ'],
    kunyomi: [],
    meanings: ['penetrate', 'clear', 'pierce'],
    grade: 8,
    strokes: 15,
    frequencyRank: 968,
  ),
  // 喝 / smoke / take
  '飲': KanjiReading(
    kanji: '飲',
    onyomi: ['いん', 'おん'],
    kunyomi: ['の(む)', 'の(み)'],
    meanings: ['喝', 'smoke', 'take'],
    grade: 3,
    strokes: 12,
    frequencyRank: 969,
  ),
  // precious / value / prize
  '貴': KanjiReading(
    kanji: '貴',
    onyomi: ['き'],
    kunyomi: ['たっと(い)', 'とうと(い)', 'たっと(ぶ)', 'とうと(ぶ)'],
    meanings: ['precious', 'value', 'prize'],
    grade: 6,
    strokes: 12,
    frequencyRank: 970,
  ),
  // cape / spit / promontory
  '埼': KanjiReading(
    kanji: '埼',
    onyomi: ['き'],
    kunyomi: ['さき', 'さい', 'みさき'],
    meanings: ['cape', 'spit', 'promontory'],
    grade: 4,
    strokes: 11,
    frequencyRank: 971,
  ),
  // collide / brunt / highway
  '衝': KanjiReading(
    kanji: '衝',
    onyomi: ['しょう'],
    kunyomi: ['つ(く)'],
    meanings: ['collide', 'brunt', 'highway'],
    grade: 8,
    strokes: 15,
    frequencyRank: 972,
  ),
  // char / hurry / impatient
  '焦': KanjiReading(
    kanji: '焦',
    onyomi: ['しょう'],
    kunyomi: ['こ(げる)', 'こ(がす)', 'こ(がれる)', 'あせ(る)', 'じ(れる)', 'じ(らす)'],
    meanings: ['char', 'hurry', 'impatient'],
    grade: 8,
    strokes: 12,
    frequencyRank: 973,
  ),
  // rob / take by force / snatch away
  '奪': KanjiReading(
    kanji: '奪',
    onyomi: ['だつ'],
    kunyomi: ['うば(う)'],
    meanings: ['rob', 'take by force', 'snatch away'],
    grade: 8,
    strokes: 14,
    frequencyRank: 974,
  ),
  // employ / hire
  '雇': KanjiReading(
    kanji: '雇',
    onyomi: ['こ'],
    kunyomi: ['やと(う)'],
    meanings: ['employ', 'hire'],
    grade: 8,
    strokes: 12,
    frequencyRank: 975,
  ),
  // disaster / calamity / woe
  '災': KanjiReading(
    kanji: '災',
    onyomi: ['さい'],
    kunyomi: ['わざわ(い)'],
    meanings: ['disaster', 'calamity', 'woe'],
    grade: 5,
    strokes: 7,
    frequencyRank: 976,
  ),
  // bay / creek / inlet
  '浦': KanjiReading(
    kanji: '浦',
    onyomi: ['ほ'],
    kunyomi: ['うら'],
    meanings: ['bay', 'creek', 'inlet'],
    grade: 8,
    strokes: 10,
    frequencyRank: 977,
  ),
  // 傍晚 / twilight / season's end
  '暮': KanjiReading(
    kanji: '暮',
    onyomi: ['ぼ'],
    kunyomi: ['く(れる)', 'く(らす)'],
    meanings: ['傍晚', 'twilight', 'season\'s end'],
    grade: 6,
    strokes: 14,
    frequencyRank: 978,
  ),
  // exchange / spare / substitute
  '替': KanjiReading(
    kanji: '替',
    onyomi: ['たい'],
    kunyomi: ['か(える)', 'か(え)', 'か(わる)'],
    meanings: ['exchange', 'spare', 'substitute'],
    grade: 8,
    strokes: 12,
    frequencyRank: 979,
  ),
  // chop / divide / tear
  '析': KanjiReading(
    kanji: '析',
    onyomi: ['せき'],
    kunyomi: [],
    meanings: ['chop', 'divide', 'tear'],
    grade: 8,
    strokes: 8,
    frequencyRank: 980,
  ),
  // deposit / custody / leave with
  '預': KanjiReading(
    kanji: '預',
    onyomi: ['よ'],
    kunyomi: ['あず(ける)', 'あず(かる)'],
    meanings: ['deposit', 'custody', 'leave with'],
    grade: 6,
    strokes: 13,
    frequencyRank: 981,
  ),
  // bake / burning
  '焼': KanjiReading(
    kanji: '焼',
    onyomi: ['しょう'],
    kunyomi: ['や(く)', 'や(き)', 'や(ける)'],
    meanings: ['bake', 'burning'],
    grade: 4,
    strokes: 12,
    frequencyRank: 982,
  ),
  // simplicity / brevity
  '簡': KanjiReading(
    kanji: '簡',
    onyomi: ['かん', 'けん'],
    kunyomi: ['えら(ぶ)', 'ふだ'],
    meanings: ['simplicity', 'brevity'],
    grade: 6,
    strokes: 18,
    frequencyRank: 983,
  ),
  // defer / turnover / transfer
  '譲': KanjiReading(
    kanji: '譲',
    onyomi: ['じょう'],
    kunyomi: ['ゆず(る)'],
    meanings: ['defer', 'turnover', 'transfer'],
    grade: 8,
    strokes: 20,
    frequencyRank: 984,
  ),
  // appellation / praise / admire
  '称': KanjiReading(
    kanji: '称',
    onyomi: ['しょう'],
    kunyomi: ['たた(える)', 'とな(える)', 'あ(げる)', 'かな(う)', 'はか(り)', 'はか(る)', 'ほめ(る)'],
    meanings: ['appellation', 'praise', 'admire'],
    grade: 8,
    strokes: 10,
    frequencyRank: 985,
  ),
  // 肉
  '肉': KanjiReading(
    kanji: '肉',
    onyomi: ['にく'],
    kunyomi: ['しし'],
    meanings: ['肉'],
    grade: 2,
    strokes: 6,
    frequencyRank: 986,
  ),
  // settlement / obtain / reap
  '納': KanjiReading(
    kanji: '納',
    onyomi: ['のう', 'なっ', 'な', 'なん', 'とう'],
    kunyomi: ['おさ(める)', 'おさ(まる)'],
    meanings: ['settlement', 'obtain', 'reap'],
    grade: 6,
    strokes: 10,
    frequencyRank: 987,
  ),
  // timber / trees / 木
  '樹': KanjiReading(
    kanji: '樹',
    onyomi: ['じゅ'],
    kunyomi: ['き'],
    meanings: ['timber', 'trees', '木'],
    grade: 6,
    strokes: 16,
    frequencyRank: 988,
  ),
  // challenge / contend for / make love to
  '挑': KanjiReading(
    kanji: '挑',
    onyomi: ['ちょう'],
    kunyomi: ['いど(む)'],
    meanings: ['challenge', 'contend for', 'make love to'],
    grade: 8,
    strokes: 9,
    frequencyRank: 989,
  ),
  // badge / chapter / composition
  '章': KanjiReading(
    kanji: '章',
    onyomi: ['しょう'],
    kunyomi: [],
    meanings: ['badge', 'chapter', 'composition'],
    grade: 3,
    strokes: 11,
    frequencyRank: 990,
  ),
  // entrails / viscera / bowels
  '臓': KanjiReading(
    kanji: '臓',
    onyomi: ['ぞう'],
    kunyomi: ['はらわた'],
    meanings: ['entrails', 'viscera', 'bowels'],
    grade: 6,
    strokes: 19,
    frequencyRank: 991,
  ),
  // rhythm / 法律 / regulation
  '律': KanjiReading(
    kanji: '律',
    onyomi: ['りつ', 'りち', 'れつ'],
    kunyomi: [],
    meanings: ['rhythm', '法律', 'regulation'],
    grade: 6,
    strokes: 9,
    frequencyRank: 992,
  ),
  // entice / lead / tempt
  '誘': KanjiReading(
    kanji: '誘',
    onyomi: ['ゆう'],
    kunyomi: ['さそ(う)', 'いざな(う)'],
    meanings: ['entice', 'lead', 'tempt'],
    grade: 8,
    strokes: 14,
    frequencyRank: 993,
  ),
  // distract / be mistaken for / go astray
  '紛': KanjiReading(
    kanji: '紛',
    onyomi: ['ふん'],
    kunyomi: ['まぎ(れる)', 'まぎ(れ)', 'まぎ(らす)', 'まぎ(らわす)', 'まぎ(らわしい)'],
    meanings: ['distract', 'be mistaken for', 'go astray'],
    grade: 8,
    strokes: 10,
    frequencyRank: 994,
  ),
  // lend
  '貸': KanjiReading(
    kanji: '貸',
    onyomi: ['たい'],
    kunyomi: ['か(す)', 'か(し)', '(かし)'],
    meanings: ['lend'],
    grade: 5,
    strokes: 12,
    frequencyRank: 995,
  ),
  // climax / arrive / proceed
  '至': KanjiReading(
    kanji: '至',
    onyomi: ['し'],
    kunyomi: ['いた(る)'],
    meanings: ['climax', 'arrive', 'proceed'],
    grade: 6,
    strokes: 6,
    frequencyRank: 996,
  ),
  // religion / sect / denomination
  '宗': KanjiReading(
    kanji: '宗',
    onyomi: ['しゅう', 'そう'],
    kunyomi: ['むね'],
    meanings: ['religion', 'sect', 'denomination'],
    grade: 6,
    strokes: 8,
    frequencyRank: 997,
  ),
  // stimulate / urge / press
  '促': KanjiReading(
    kanji: '促',
    onyomi: ['そく'],
    kunyomi: ['うなが(す)'],
    meanings: ['stimulate', 'urge', 'press'],
    grade: 8,
    strokes: 9,
    frequencyRank: 998,
  ),
  // humility / be careful / discreet
  '慎': KanjiReading(
    kanji: '慎',
    onyomi: ['しん'],
    kunyomi: ['つつし(む)', 'つつ(ましい)', 'つつし', 'つつし(み)'],
    meanings: ['humility', 'be careful', 'discreet'],
    grade: 8,
    strokes: 13,
    frequencyRank: 999,
  ),
  // withdraw / draw in / hold back
  '控': KanjiReading(
    kanji: '控',
    onyomi: ['こう'],
    kunyomi: ['ひか(える)', 'ひか(え)'],
    meanings: ['withdraw', 'draw in', 'hold back'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1000,
  ),
  // presents / 发送 / give to
  '贈': KanjiReading(
    kanji: '贈',
    onyomi: ['ぞう', 'そう'],
    kunyomi: ['おく(る)'],
    meanings: ['presents', '发送', 'give to'],
    grade: 8,
    strokes: 18,
    frequencyRank: 1001,
  ),
  // wisdom / intellect / reason
  '智': KanjiReading(
    kanji: '智',
    onyomi: ['ち'],
    kunyomi: [],
    meanings: ['wisdom', 'intellect', 'reason'],
    grade: 9,
    strokes: 12,
    frequencyRank: 1002,
  ),
  // grip / 持有 / mould sushi
  '握': KanjiReading(
    kanji: '握',
    onyomi: ['あく'],
    kunyomi: ['にぎ(る)'],
    meanings: ['grip', '持有', 'mould sushi'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1003,
  ),
  // illuminate / shine / 比较
  '照': KanjiReading(
    kanji: '照',
    onyomi: ['しょう'],
    kunyomi: ['て(る)', 'て(らす)', 'て(れる)'],
    meanings: ['illuminate', 'shine', '比较'],
    grade: 4,
    strokes: 13,
    frequencyRank: 1004,
  ),
  // mid-air / air / space
  '宙': KanjiReading(
    kanji: '宙',
    onyomi: ['ちゅう'],
    kunyomi: [],
    meanings: ['mid-air', 'air', 'space'],
    grade: 6,
    strokes: 8,
    frequencyRank: 1005,
  ),
  // sake / alcohol
  '酒': KanjiReading(
    kanji: '酒',
    onyomi: ['しゅ'],
    kunyomi: ['さけ', '(さか)'],
    meanings: ['sake', 'alcohol'],
    grade: 3,
    strokes: 10,
    frequencyRank: 1006,
  ),
  // sagacious / genius / excellence
  '俊': KanjiReading(
    kanji: '俊',
    onyomi: ['しゅん'],
    kunyomi: [],
    meanings: ['sagacious', 'genius', 'excellence'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1007,
  ),
  // coin / .01 yen / 钱
  '銭': KanjiReading(
    kanji: '銭',
    onyomi: ['せん', 'ぜん'],
    kunyomi: ['ぜに', 'すき'],
    meanings: ['coin', '.01 yen', '钱'],
    grade: 6,
    strokes: 14,
    frequencyRank: 1008,
  ),
  // dilute / 薄 / weak (tea)
  '薄': KanjiReading(
    kanji: '薄',
    onyomi: ['はく'],
    kunyomi: ['うす(い)', '(うす)', 'うす(める)', 'うす(まる)', 'うす(らぐ)', 'うす(ら)', 'うす(れる)', 'すすき'],
    meanings: ['dilute', '薄', 'weak (tea)'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1009,
  ),
  // public chamber / hall
  '堂': KanjiReading(
    kanji: '堂',
    onyomi: ['どう'],
    kunyomi: [],
    meanings: ['public chamber', 'hall'],
    grade: 5,
    strokes: 11,
    frequencyRank: 1010,
  ),
  // astringent / hesitate / reluctant
  '渋': KanjiReading(
    kanji: '渋',
    onyomi: ['じゅう', 'しゅう'],
    kunyomi: ['しぶ', 'しぶ(い)', 'しぶ(る)'],
    meanings: ['astringent', 'hesitate', 'reluctant'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1011,
  ),
  // flock / group / crowd
  '群': KanjiReading(
    kanji: '群',
    onyomi: ['ぐん'],
    kunyomi: ['む(れる)', 'む(れ)', 'むら', 'むら(がる)'],
    meanings: ['flock', 'group', 'crowd'],
    grade: 4,
    strokes: 13,
    frequencyRank: 1012,
  ),
  // gun / arms
  '銃': KanjiReading(
    kanji: '銃',
    onyomi: ['じゅう'],
    kunyomi: ['つつ'],
    meanings: ['gun', 'arms'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1013,
  ),
  // grieve / sad / deplore
  '悲': KanjiReading(
    kanji: '悲',
    onyomi: ['ひ'],
    kunyomi: ['かな(しい)', 'かな(しむ)'],
    meanings: ['grieve', 'sad', 'deplore'],
    grade: 3,
    strokes: 12,
    frequencyRank: 1014,
  ),
  // second (1/60 minute)
  '秒': KanjiReading(
    kanji: '秒',
    onyomi: ['びょう'],
    kunyomi: [],
    meanings: ['second (1/60 minute)'],
    grade: 3,
    strokes: 9,
    frequencyRank: 1015,
  ),
  // maneuver / manipulate / operate
  '操': KanjiReading(
    kanji: '操',
    onyomi: ['そう', 'さん'],
    kunyomi: ['みさお', 'あやつ(る)'],
    meanings: ['maneuver', 'manipulate', 'operate'],
    grade: 6,
    strokes: 16,
    frequencyRank: 1016,
  ),
  // portable / carry (in hand) / armed with
  '携': KanjiReading(
    kanji: '携',
    onyomi: ['けい'],
    kunyomi: ['たずさ(える)', 'たずさ(わる)'],
    meanings: ['portable', 'carry (in hand)', 'armed with'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1017,
  ),
  // 心 / interior
  '奥': KanjiReading(
    kanji: '奥',
    onyomi: ['おう'],
    kunyomi: ['おく', 'おく(まる)', 'くま'],
    meanings: ['心', 'interior'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1018,
  ),
  // checkup / seeing / diagnose
  '診': KanjiReading(
    kanji: '診',
    onyomi: ['しん'],
    kunyomi: ['み(る)'],
    meanings: ['checkup', 'seeing', 'diagnose'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1019,
  ),
  // packed / 关 / pressed
  '詰': KanjiReading(
    kanji: '詰',
    onyomi: ['きつ', 'きち'],
    kunyomi: ['つ(める)', 'つ(め)', 'づ(め)', 'つ(まる)', 'つ(む)'],
    meanings: ['packed', '关', 'pressed'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1020,
  ),
  // consign / requesting / entrusting with
  '託': KanjiReading(
    kanji: '託',
    onyomi: ['たく'],
    kunyomi: ['かこつ(ける)', 'かこ(つ)', 'かこ(つける)'],
    meanings: ['consign', 'requesting', 'entrusting with'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1021,
  ),
  // clear up
  '晴': KanjiReading(
    kanji: '晴',
    onyomi: ['せい'],
    kunyomi: ['は(れる)', 'は(れ)', 'ば(れ)', 'は(らす)'],
    meanings: ['clear up'],
    grade: 2,
    strokes: 12,
    frequencyRank: 1022,
  ),
  // snapshot / take pictures
  '撮': KanjiReading(
    kanji: '撮',
    onyomi: ['さつ'],
    kunyomi: ['と(る)', 'つま(む)', 'ど(り)'],
    meanings: ['snapshot', 'take pictures'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1023,
  ),
  // nativity / be born / declension
  '誕': KanjiReading(
    kanji: '誕',
    onyomi: ['たん'],
    kunyomi: [],
    meanings: ['nativity', 'be born', 'declension'],
    grade: 6,
    strokes: 15,
    frequencyRank: 1024,
  ),
  // encroach / invade / raid
  '侵': KanjiReading(
    kanji: '侵',
    onyomi: ['しん'],
    kunyomi: ['おか(す)'],
    meanings: ['encroach', 'invade', 'raid'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1025,
  ),
  // fasten / tie up / arrest
  '括': KanjiReading(
    kanji: '括',
    onyomi: ['かつ'],
    kunyomi: ['くく(る)'],
    meanings: ['fasten', 'tie up', 'arrest'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1026,
  ),
  // hang / suspend / depend
  '掛': KanjiReading(
    kanji: '掛',
    onyomi: ['かい', 'けい'],
    kunyomi: ['か(ける)', 'か(け)', 'が(け)', 'か(かる)', 'が(かる)', 'か(かり)', 'が(かり)', 'かかり', '(がかり)'],
    meanings: ['hang', 'suspend', 'depend'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1027,
  ),
  // apologize / thank / refuse
  '謝': KanjiReading(
    kanji: '謝',
    onyomi: ['しゃ'],
    kunyomi: ['あやま(る)'],
    meanings: ['apologize', 'thank', 'refuse'],
    grade: 5,
    strokes: 17,
    frequencyRank: 1028,
  ),
  // pair / set / comparison
  '双': KanjiReading(
    kanji: '双',
    onyomi: ['そう'],
    kunyomi: ['ふた', 'たぐい', 'ならぶ', 'ふたつ'],
    meanings: ['pair', 'set', 'comparison'],
    grade: 8,
    strokes: 4,
    frequencyRank: 1029,
  ),
  // filial piety / child's respect
  '孝': KanjiReading(
    kanji: '孝',
    onyomi: ['こう', 'きょう'],
    kunyomi: [],
    meanings: ['filial piety', 'child\'s respect'],
    grade: 6,
    strokes: 7,
    frequencyRank: 1030,
  ),
  // thorn / pierce / stab
  '刺': KanjiReading(
    kanji: '刺',
    onyomi: ['し'],
    kunyomi: ['さ(す)', 'さ(さる)', 'さ(し)', 'さし', 'とげ'],
    meanings: ['thorn', 'pierce', 'stab'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1031,
  ),
  // arrival / proceed / reach
  '到': KanjiReading(
    kanji: '到',
    onyomi: ['とう'],
    kunyomi: ['いた(る)'],
    meanings: ['arrival', 'proceed', 'reach'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1032,
  ),
  // drive / 跑 / gallop
  '駆': KanjiReading(
    kanji: '駆',
    onyomi: ['く'],
    kunyomi: ['か(ける)', 'か(る)'],
    meanings: ['drive', '跑', 'gallop'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1033,
  ),
  // lie down / 睡 / 休息
  '寝': KanjiReading(
    kanji: '寝',
    onyomi: ['しん'],
    kunyomi: ['ね(る)', 'ね(かす)', 'い(ぬ)', 'みたまや', 'や(める)'],
    meanings: ['lie down', '睡', '休息'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1034,
  ),
  // transparent / permeate / filter
  '透': KanjiReading(
    kanji: '透',
    onyomi: ['とう'],
    kunyomi: ['す(く)', 'す(かす)', 'す(ける)', 'とう(る)', 'とう(す)'],
    meanings: ['transparent', 'permeate', 'filter'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1035,
  ),
  // haven / port / harbor
  '津': KanjiReading(
    kanji: '津',
    onyomi: ['しん'],
    kunyomi: ['つ'],
    meanings: ['haven', 'port', 'harbor'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1036,
  ),
  // 墙 / lining (stomach) / fence
  '壁': KanjiReading(
    kanji: '壁',
    onyomi: ['へき'],
    kunyomi: ['かべ'],
    meanings: ['墙', 'lining (stomach)', 'fence'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1037,
  ),
  // rice plant
  '稲': KanjiReading(
    kanji: '稲',
    onyomi: ['とう', 'て'],
    kunyomi: ['いね', '(いな)'],
    meanings: ['rice plant'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1038,
  ),
  // sham / temporary / interim
  '仮': KanjiReading(
    kanji: '仮',
    onyomi: ['か', 'け'],
    kunyomi: ['かり', '(かり)'],
    meanings: ['sham', 'temporary', 'interim'],
    grade: 5,
    strokes: 6,
    frequencyRank: 1039,
  ),
  // darkness / disappear / shade
  '暗': KanjiReading(
    kanji: '暗',
    onyomi: ['あん'],
    kunyomi: ['くら(い)', 'くら(む)', 'くれ(る)'],
    meanings: ['darkness', 'disappear', 'shade'],
    grade: 3,
    strokes: 13,
    frequencyRank: 1040,
  ),
  // split / rend / tear
  '裂': KanjiReading(
    kanji: '裂',
    onyomi: ['れつ'],
    kunyomi: ['さ(く)', 'さ(ける)', 'ぎ(れ)'],
    meanings: ['split', 'rend', 'tear'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1041,
  ),
  // cleverness / agile / alert
  '敏': KanjiReading(
    kanji: '敏',
    onyomi: ['びん'],
    kunyomi: ['さとい'],
    meanings: ['cleverness', 'agile', 'alert'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1042,
  ),
  // 鸟 / chicken
  '鳥': KanjiReading(
    kanji: '鳥',
    onyomi: ['ちょう'],
    kunyomi: ['とり'],
    meanings: ['鸟', 'chicken'],
    grade: 2,
    strokes: 11,
    frequencyRank: 1043,
  ),
  // genuine / purity / innocence
  '純': KanjiReading(
    kanji: '純',
    onyomi: ['じゅん'],
    kunyomi: [],
    meanings: ['genuine', 'purity', 'innocence'],
    grade: 6,
    strokes: 10,
    frequencyRank: 1044,
  ),
  // just so / this / 右
  '是': KanjiReading(
    kanji: '是',
    onyomi: ['ぜ', 'し'],
    kunyomi: ['これ', 'この', 'ここ'],
    meanings: ['just so', 'this', '右'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1045,
  ),
  // meal / boiled rice
  '飯': KanjiReading(
    kanji: '飯',
    onyomi: ['はん'],
    kunyomi: ['めし'],
    meanings: ['meal', 'boiled rice'],
    grade: 4,
    strokes: 12,
    frequencyRank: 1046,
  ),
  // repudiate / exclude / expel
  '排': KanjiReading(
    kanji: '排',
    onyomi: ['はい'],
    kunyomi: [],
    meanings: ['repudiate', 'exclude', 'expel'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1047,
  ),
  // abundant / 富有 / fertile
  '裕': KanjiReading(
    kanji: '裕',
    onyomi: ['ゆう'],
    kunyomi: [],
    meanings: ['abundant', '富有', 'fertile'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1048,
  ),
  // strict / hard / solid
  '堅': KanjiReading(
    kanji: '堅',
    onyomi: ['けん'],
    kunyomi: ['かた(い)', 'がた(い)'],
    meanings: ['strict', 'hard', 'solid'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1049,
  ),
  // translate / reason / circumstance
  '訳': KanjiReading(
    kanji: '訳',
    onyomi: ['やく'],
    kunyomi: ['わけ'],
    meanings: ['translate', 'reason', 'circumstance'],
    grade: 6,
    strokes: 11,
    frequencyRank: 1050,
  ),
  // steal / rob / pilfer
  '盗': KanjiReading(
    kanji: '盗',
    onyomi: ['とう'],
    kunyomi: ['ぬす(む)', 'ぬす(み)'],
    meanings: ['steal', 'rob', 'pilfer'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1051,
  ),
  // turf / lawn
  '芝': KanjiReading(
    kanji: '芝',
    onyomi: ['し'],
    kunyomi: ['しば'],
    meanings: ['turf', 'lawn'],
    grade: 8,
    strokes: 6,
    frequencyRank: 1052,
  ),
  // hawser / class (genus) / rope
  '綱': KanjiReading(
    kanji: '綱',
    onyomi: ['こう'],
    kunyomi: ['つな'],
    meanings: ['hawser', 'class (genus)', 'rope'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1053,
  ),
  // suck / imbibe / inhale
  '吸': KanjiReading(
    kanji: '吸',
    onyomi: ['きゅう'],
    kunyomi: ['す(う)'],
    meanings: ['suck', 'imbibe', 'inhale'],
    grade: 6,
    strokes: 6,
    frequencyRank: 1054,
  ),
  // code / ceremony / 法律
  '典': KanjiReading(
    kanji: '典',
    onyomi: ['てん', 'でん'],
    kunyomi: ['ふみ', 'のり'],
    meanings: ['code', 'ceremony', '法律'],
    grade: 4,
    strokes: 8,
    frequencyRank: 1055,
  ),
  // congratulations / joy
  '賀': KanjiReading(
    kanji: '賀',
    onyomi: ['が'],
    kunyomi: [],
    meanings: ['congratulations', 'joy'],
    grade: 4,
    strokes: 12,
    frequencyRank: 1056,
  ),
  // handle / entertain / thresh
  '扱': KanjiReading(
    kanji: '扱',
    onyomi: ['そう', 'きゅう'],
    kunyomi: ['あつか(い)', 'あつか(う)', 'あつか(る)', 'こ(く)'],
    meanings: ['handle', 'entertain', 'thresh'],
    grade: 8,
    strokes: 6,
    frequencyRank: 1057,
  ),
  // look back / review / examine oneself
  '顧': KanjiReading(
    kanji: '顧',
    onyomi: ['こ'],
    kunyomi: ['かえり(みる)'],
    meanings: ['look back', 'review', 'examine oneself'],
    grade: 8,
    strokes: 21,
    frequencyRank: 1058,
  ),
  // vast / broad / 宽
  '弘': KanjiReading(
    kanji: '弘',
    onyomi: ['こう', 'ぐ'],
    kunyomi: ['ひろ(い)'],
    meanings: ['vast', 'broad', '宽'],
    grade: 9,
    strokes: 5,
    frequencyRank: 1059,
  ),
  // watch over / 看
  '看': KanjiReading(
    kanji: '看',
    onyomi: ['かん'],
    kunyomi: ['み(る)'],
    meanings: ['watch over', '看'],
    grade: 6,
    strokes: 9,
    frequencyRank: 1060,
  ),
  // sue / accuse
  '訟': KanjiReading(
    kanji: '訟',
    onyomi: ['しょう'],
    kunyomi: [],
    meanings: ['sue', 'accuse'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1061,
  ),
  // commandment
  '戒': KanjiReading(
    kanji: '戒',
    onyomi: ['かい'],
    kunyomi: ['いまし(める)'],
    meanings: ['commandment'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1062,
  ),
  // welfare / happiness
  '祉': KanjiReading(
    kanji: '祉',
    onyomi: ['し'],
    kunyomi: [],
    meanings: ['welfare', 'happiness'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1063,
  ),
  // reputation / praise / honor
  '誉': KanjiReading(
    kanji: '誉',
    onyomi: ['よ'],
    kunyomi: ['ほま(れ)', 'ほ(める)'],
    meanings: ['reputation', 'praise', 'honor'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1064,
  ),
  // delight / joy
  '歓': KanjiReading(
    kanji: '歓',
    onyomi: ['かん'],
    kunyomi: ['よろこ(ぶ)'],
    meanings: ['delight', 'joy'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1065,
  ),
  // exertion / endeavour / encourage
  '勉': KanjiReading(
    kanji: '勉',
    onyomi: ['べん'],
    kunyomi: ['つと(める)'],
    meanings: ['exertion', 'endeavour', 'encourage'],
    grade: 3,
    strokes: 10,
    frequencyRank: 1066,
  ),
  // play music / speak to a ruler / complete
  '奏': KanjiReading(
    kanji: '奏',
    onyomi: ['そう'],
    kunyomi: ['かな(でる)'],
    meanings: ['play music', 'speak to a ruler', 'complete'],
    grade: 6,
    strokes: 9,
    frequencyRank: 1067,
  ),
  // persuade / recommend / advise
  '勧': KanjiReading(
    kanji: '勧',
    onyomi: ['かん', 'けん'],
    kunyomi: ['すす(める)'],
    meanings: ['persuade', 'recommend', 'advise'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1068,
  ),
  // boisterous / make noise / clamor
  '騒': KanjiReading(
    kanji: '騒',
    onyomi: ['そう'],
    kunyomi: ['さわ(ぐ)', 'うれい', 'さわ(がしい)'],
    meanings: ['boisterous', 'make noise', 'clamor'],
    grade: 8,
    strokes: 18,
    frequencyRank: 1069,
  ),
  // the following / next
  '翌': KanjiReading(
    kanji: '翌',
    onyomi: ['よく'],
    kunyomi: [],
    meanings: ['the following', 'next'],
    grade: 6,
    strokes: 11,
    frequencyRank: 1070,
  ),
  // sunshine / yang principle / positive
  '陽': KanjiReading(
    kanji: '陽',
    onyomi: ['よう'],
    kunyomi: ['ひ'],
    meanings: ['sunshine', 'yang principle', 'positive'],
    grade: 3,
    strokes: 12,
    frequencyRank: 1071,
  ),
  // clique / lineage / pedigree
  '閥': KanjiReading(
    kanji: '閥',
    onyomi: ['ばつ'],
    kunyomi: [],
    meanings: ['clique', 'lineage', 'pedigree'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1072,
  ),
  // armor / high (voice) / A grade
  '甲': KanjiReading(
    kanji: '甲',
    onyomi: ['こう', 'かん'],
    kunyomi: ['きのえ'],
    meanings: ['armor', 'high (voice)', 'A grade'],
    grade: 8,
    strokes: 5,
    frequencyRank: 1073,
  ),
  // cheerful / pleasant / agreeable
  '快': KanjiReading(
    kanji: '快',
    onyomi: ['かい'],
    kunyomi: ['こころよ(い)'],
    meanings: ['cheerful', 'pleasant', 'agreeable'],
    grade: 5,
    strokes: 7,
    frequencyRank: 1074,
  ),
  // straw rope / cord
  '縄': KanjiReading(
    kanji: '縄',
    onyomi: ['じょう'],
    kunyomi: ['なわ', 'ただ(す)'],
    meanings: ['straw rope', 'cord'],
    grade: 4,
    strokes: 15,
    frequencyRank: 1075,
  ),
  // one-sided / 叶 / sheet
  '片': KanjiReading(
    kanji: '片',
    onyomi: ['へん'],
    kunyomi: ['(かた)', 'かた'],
    meanings: ['one-sided', '叶', 'sheet'],
    grade: 6,
    strokes: 4,
    frequencyRank: 1076,
  ),
  // home town / 村庄 / native place
  '郷': KanjiReading(
    kanji: '郷',
    onyomi: ['きょう', 'ごう'],
    kunyomi: ['さと'],
    meanings: ['home town', '村庄', 'native place'],
    grade: 6,
    strokes: 11,
    frequencyRank: 1077,
  ),
  // awe / respect / honor
  '敬': KanjiReading(
    kanji: '敬',
    onyomi: ['けい', 'きょう'],
    kunyomi: ['うやま(う)'],
    meanings: ['awe', 'respect', 'honor'],
    grade: 6,
    strokes: 12,
    frequencyRank: 1078,
  ),
  // swing / shake / sway
  '揺': KanjiReading(
    kanji: '揺',
    onyomi: ['よう'],
    kunyomi: ['ゆ(れる)', 'ゆ(る)', 'ゆ(らぐ)', 'ゆ(るぐ)', 'ゆ(する)', 'ゆ(さぶる)', 'ゆ(すぶる)', 'うご(く)'],
    meanings: ['swing', 'shake', 'sway'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1079,
  ),
  // excuse / dismissal
  '免': KanjiReading(
    kanji: '免',
    onyomi: ['めん'],
    kunyomi: ['まぬか(れる)', 'まぬが(れる)'],
    meanings: ['excuse', 'dismissal'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1080,
  ),
  // previously / already / long ago
  '既': KanjiReading(
    kanji: '既',
    onyomi: ['き'],
    kunyomi: ['すで(に)'],
    meanings: ['previously', 'already', 'long ago'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1081,
  ),
  // recommend / mat / advise
  '薦': KanjiReading(
    kanji: '薦',
    onyomi: ['せん'],
    kunyomi: ['すす(める)'],
    meanings: ['recommend', 'mat', 'advise'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1082,
  ),
  // neighboring
  '隣': KanjiReading(
    kanji: '隣',
    onyomi: ['りん'],
    kunyomi: ['とな(る)', 'となり'],
    meanings: ['neighboring'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1083,
  ),
  // trouble / worry / in pain
  '悩': KanjiReading(
    kanji: '悩',
    onyomi: ['のう'],
    kunyomi: ['なや(む)', 'なや(ます)', 'なや(ましい)', 'なやみ'],
    meanings: ['trouble', 'worry', 'in pain'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1084,
  ),
  // splendor / 花 / petal
  '華': KanjiReading(
    kanji: '華',
    onyomi: ['か', 'け'],
    kunyomi: ['はな'],
    meanings: ['splendor', '花', 'petal'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1085,
  ),
  // 春 / fountain
  '泉': KanjiReading(
    kanji: '泉',
    onyomi: ['せん'],
    kunyomi: ['いずみ'],
    meanings: ['春', 'fountain'],
    grade: 6,
    strokes: 9,
    frequencyRank: 1086,
  ),
  // honorable / manipulate / govern
  '御': KanjiReading(
    kanji: '御',
    onyomi: ['ぎょ', 'ご'],
    kunyomi: ['(おん)', '(お)', '(み)'],
    meanings: ['honorable', 'manipulate', 'govern'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1087,
  ),
  // pattern / example / model
  '範': KanjiReading(
    kanji: '範',
    onyomi: ['はん'],
    kunyomi: [],
    meanings: ['pattern', 'example', 'model'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1088,
  ),
  // conceal / hide / cover
  '隠': KanjiReading(
    kanji: '隠',
    onyomi: ['いん', 'おん'],
    kunyomi: ['かく(す)', 'かく(し)', 'かく(れる)', 'よ(る)'],
    meanings: ['conceal', 'hide', 'cover'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1089,
  ),
  // 冬
  '冬': KanjiReading(
    kanji: '冬',
    onyomi: ['とう'],
    kunyomi: ['ふゆ'],
    meanings: ['冬'],
    grade: 2,
    strokes: 5,
    frequencyRank: 1090,
  ),
  // benevolence / virtue / goodness
  '徳': KanjiReading(
    kanji: '徳',
    onyomi: ['とく'],
    kunyomi: [],
    meanings: ['benevolence', 'virtue', 'goodness'],
    grade: 4,
    strokes: 14,
    frequencyRank: 1091,
  ),
  // pelt / skin / hide
  '皮': KanjiReading(
    kanji: '皮',
    onyomi: ['ひ'],
    kunyomi: ['かわ'],
    meanings: ['pelt', 'skin', 'hide'],
    grade: 3,
    strokes: 5,
    frequencyRank: 1092,
  ),
  // philosophy / clear
  '哲': KanjiReading(
    kanji: '哲',
    onyomi: ['てつ'],
    kunyomi: ['さとい', 'あきらか'],
    meanings: ['philosophy', 'clear'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1093,
  ),
  // fishing / fishery
  '漁': KanjiReading(
    kanji: '漁',
    onyomi: ['ぎょ', 'りょう'],
    kunyomi: ['あさ(る)'],
    meanings: ['fishing', 'fishery'],
    grade: 4,
    strokes: 14,
    frequencyRank: 1094,
  ),
  // cedar / cryptomeria
  '杉': KanjiReading(
    kanji: '杉',
    onyomi: ['さん'],
    kunyomi: ['すぎ'],
    meanings: ['cedar', 'cryptomeria'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1095,
  ),
  // ri / 村庄 / parent's home
  '里': KanjiReading(
    kanji: '里',
    onyomi: ['り'],
    kunyomi: ['さと'],
    meanings: ['ri', '村庄', 'parent\'s home'],
    grade: 2,
    strokes: 7,
    frequencyRank: 1096,
  ),
  // explanation
  '釈': KanjiReading(
    kanji: '釈',
    onyomi: ['しゃく', 'せき'],
    kunyomi: ['とく', 'す(てる)', 'ゆる(す)'],
    meanings: ['explanation'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1097,
  ),
  // self
  '己': KanjiReading(
    kanji: '己',
    onyomi: ['こ', 'き'],
    kunyomi: ['おのれ', 'つちのと', 'な'],
    meanings: ['self'],
    grade: 6,
    strokes: 3,
    frequencyRank: 1098,
  ),
  // laid waste / rough / rude
  '荒': KanjiReading(
    kanji: '荒',
    onyomi: ['こう'],
    kunyomi: ['あ(らす)', 'あ(れる)', 'あら(い)', 'すさ(ぶ)', 'すさ(む)', 'あ(らし)'],
    meanings: ['laid waste', 'rough', 'rude'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1099,
  ),
  // savings / store / lay in
  '貯': KanjiReading(
    kanji: '貯',
    onyomi: ['ちょ'],
    kunyomi: ['た(める)', 'たくわ(える)'],
    meanings: ['savings', 'store', 'lay in'],
    grade: 5,
    strokes: 12,
    frequencyRank: 1100,
  ),
  // stiff / hard
  '硬': KanjiReading(
    kanji: '硬',
    onyomi: ['こう'],
    kunyomi: ['かた(い)'],
    meanings: ['stiff', 'hard'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1101,
  ),
  // gentle / 和平 / satisfactory
  '妥': KanjiReading(
    kanji: '妥',
    onyomi: ['だ'],
    kunyomi: [],
    meanings: ['gentle', '和平', 'satisfactory'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1102,
  ),
  // intimidate / dignity / majesty
  '威': KanjiReading(
    kanji: '威',
    onyomi: ['い'],
    kunyomi: ['おど(す)', 'おど(し)', 'おど(かす)'],
    meanings: ['intimidate', 'dignity', 'majesty'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1103,
  ),
  // overpowering / great / powerful
  '豪': KanjiReading(
    kanji: '豪',
    onyomi: ['ごう'],
    kunyomi: ['えら(い)'],
    meanings: ['overpowering', 'great', 'powerful'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1104,
  ),
  // bear
  '熊': KanjiReading(
    kanji: '熊',
    onyomi: ['ゆう'],
    kunyomi: ['くま'],
    meanings: ['bear'],
    grade: 4,
    strokes: 14,
    frequencyRank: 1105,
  ),
  // tooth / cog
  '歯': KanjiReading(
    kanji: '歯',
    onyomi: ['し'],
    kunyomi: ['よわい', 'は', 'よわ(い)', 'よわい(する)'],
    meanings: ['tooth', 'cog'],
    grade: 3,
    strokes: 12,
    frequencyRank: 1106,
  ),
  // stagnate / be delayed / overdue
  '滞': KanjiReading(
    kanji: '滞',
    onyomi: ['たい', 'てい'],
    kunyomi: ['とどこお(る)'],
    meanings: ['stagnate', 'be delayed', 'overdue'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1107,
  ),
  // delicate / minuteness / insignificance
  '微': KanjiReading(
    kanji: '微',
    onyomi: ['び'],
    kunyomi: ['かす(か)'],
    meanings: ['delicate', 'minuteness', 'insignificance'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1108,
  ),
  // hump / 高 / noble
  '隆': KanjiReading(
    kanji: '隆',
    onyomi: ['りゅう'],
    kunyomi: [],
    meanings: ['hump', '高', 'noble'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1109,
  ),
  // bury / be filled up / embedded
  '埋': KanjiReading(
    kanji: '埋',
    onyomi: ['まい'],
    kunyomi: ['う(める)', 'う(まる)', 'う(もれる)', 'うず(める)', 'うず(まる)', 'い(ける)'],
    meanings: ['bury', 'be filled up', 'embedded'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1110,
  ),
  // symptoms / 疾病
  '症': KanjiReading(
    kanji: '症',
    onyomi: ['しょう'],
    kunyomi: [],
    meanings: ['symptoms', '疾病'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1111,
  ),
  // temporarily / a while / moment
  '暫': KanjiReading(
    kanji: '暫',
    onyomi: ['ざん'],
    kunyomi: ['しばら(く)'],
    meanings: ['temporarily', 'a while', 'moment'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1112,
  ),
  // loyalty / fidelity / faithfulness
  '忠': KanjiReading(
    kanji: '忠',
    onyomi: ['ちゅう'],
    kunyomi: [],
    meanings: ['loyalty', 'fidelity', 'faithfulness'],
    grade: 6,
    strokes: 8,
    frequencyRank: 1113,
  ),
  // godown / warehouse / storehouse
  '倉': KanjiReading(
    kanji: '倉',
    onyomi: ['そう'],
    kunyomi: ['くら'],
    meanings: ['godown', 'warehouse', 'storehouse'],
    grade: 4,
    strokes: 10,
    frequencyRank: 1114,
  ),
  // daytime / noon
  '昼': KanjiReading(
    kanji: '昼',
    onyomi: ['ちゅう'],
    kunyomi: ['ひる'],
    meanings: ['daytime', 'noon'],
    grade: 2,
    strokes: 9,
    frequencyRank: 1115,
  ),
  // tea
  '茶': KanjiReading(
    kanji: '茶',
    onyomi: ['ちゃ', 'さ'],
    kunyomi: [],
    meanings: ['tea'],
    grade: 2,
    strokes: 9,
    frequencyRank: 1116,
  ),
  // lad / boy / fine young man
  '彦': KanjiReading(
    kanji: '彦',
    onyomi: ['げん'],
    kunyomi: ['ひこ'],
    meanings: ['lad', 'boy', 'fine young man'],
    grade: 9,
    strokes: 9,
    frequencyRank: 1117,
  ),
  // liver / pluck / nerve
  '肝': KanjiReading(
    kanji: '肝',
    onyomi: ['かん'],
    kunyomi: ['きも'],
    meanings: ['liver', 'pluck', 'nerve'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1118,
  ),
  // pillar / post / cylinder
  '柱': KanjiReading(
    kanji: '柱',
    onyomi: ['ちゅう'],
    kunyomi: ['はしら'],
    meanings: ['pillar', 'post', 'cylinder'],
    grade: 3,
    strokes: 9,
    frequencyRank: 1119,
  ),
  // yell / cry / call
  '喚': KanjiReading(
    kanji: '喚',
    onyomi: ['かん'],
    kunyomi: ['わめ(く)'],
    meanings: ['yell', 'cry', 'call'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1120,
  ),
  // run alongside / follow along / run along
  '沿': KanjiReading(
    kanji: '沿',
    onyomi: ['えん'],
    kunyomi: ['そ(う)', 'ぞ(い)'],
    meanings: ['run alongside', 'follow along', 'run along'],
    grade: 6,
    strokes: 8,
    frequencyRank: 1121,
  ),
  // exquisite / strange / queer
  '妙': KanjiReading(
    kanji: '妙',
    onyomi: ['みょう', 'びょう'],
    kunyomi: ['たえ'],
    meanings: ['exquisite', 'strange', 'queer'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1122,
  ),
  // chant / recite / call upon
  '唱': KanjiReading(
    kanji: '唱',
    onyomi: ['しょう'],
    kunyomi: ['とな(える)'],
    meanings: ['chant', 'recite', 'call upon'],
    grade: 4,
    strokes: 11,
    frequencyRank: 1123,
  ),
  // ritual / offer prayers / celebrate
  '祭': KanjiReading(
    kanji: '祭',
    onyomi: ['さい'],
    kunyomi: ['まつ(る)', 'まつ(り)', 'まつり'],
    meanings: ['ritual', 'offer prayers', 'celebrate'],
    grade: 3,
    strokes: 11,
    frequencyRank: 1124,
  ),
  // sack / bag / pouch
  '袋': KanjiReading(
    kanji: '袋',
    onyomi: ['たい', 'だい'],
    kunyomi: ['ふくろ'],
    meanings: ['sack', 'bag', 'pouch'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1125,
  ),
  // Africa / flatter / fawn upon
  '阿': KanjiReading(
    kanji: '阿',
    onyomi: ['あ', 'お'],
    kunyomi: ['おもね(る)', 'くま'],
    meanings: ['Africa', 'flatter', 'fawn upon'],
    grade: 9,
    strokes: 8,
    frequencyRank: 1126,
  ),
  // cord / rope / searching
  '索': KanjiReading(
    kanji: '索',
    onyomi: ['さく'],
    kunyomi: [],
    meanings: ['cord', 'rope', 'searching'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1127,
  ),
  // sincerity / admonish / warn
  '誠': KanjiReading(
    kanji: '誠',
    onyomi: ['せい'],
    kunyomi: ['まこと'],
    meanings: ['sincerity', 'admonish', 'warn'],
    grade: 6,
    strokes: 13,
    frequencyRank: 1128,
  ),
  // forget
  '忘': KanjiReading(
    kanji: '忘',
    onyomi: ['ぼう'],
    kunyomi: ['わす(れる)'],
    meanings: ['forget'],
    grade: 6,
    strokes: 7,
    frequencyRank: 1129,
  ),
  // 攻击 / advance on / succeed to
  '襲': KanjiReading(
    kanji: '襲',
    onyomi: ['しゅう'],
    kunyomi: ['おそ(う)', 'かさ(ね)'],
    meanings: ['攻击', 'advance on', 'succeed to'],
    grade: 8,
    strokes: 22,
    frequencyRank: 1130,
  ),
  // 雪
  '雪': KanjiReading(
    kanji: '雪',
    onyomi: ['せつ'],
    kunyomi: ['ゆき'],
    meanings: ['雪'],
    grade: 2,
    strokes: 11,
    frequencyRank: 1131,
  ),
  // writing brush / writing / painting brush
  '筆': KanjiReading(
    kanji: '筆',
    onyomi: ['ひつ'],
    kunyomi: ['ふで'],
    meanings: ['writing brush', 'writing', 'painting brush'],
    grade: 3,
    strokes: 12,
    frequencyRank: 1132,
  ),
  // blow / breathe / puff
  '吹': KanjiReading(
    kanji: '吹',
    onyomi: ['すい'],
    kunyomi: ['ふ(く)'],
    meanings: ['blow', 'breathe', 'puff'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1133,
  ),
  // instruction / Japanese character reading / explanation
  '訓': KanjiReading(
    kanji: '訓',
    onyomi: ['くん', 'きん'],
    kunyomi: ['おし(える)', 'よ(む)', 'くん(ずる)'],
    meanings: ['instruction', 'Japanese character reading', 'explanation'],
    grade: 4,
    strokes: 10,
    frequencyRank: 1134,
  ),
  // sociable / kind / courteous
  '懇': KanjiReading(
    kanji: '懇',
    onyomi: ['こん'],
    kunyomi: ['ねんご(ろ)'],
    meanings: ['sociable', 'kind', 'courteous'],
    grade: 8,
    strokes: 17,
    frequencyRank: 1135,
  ),
  // bathe / be favored with / bask in
  '浴': KanjiReading(
    kanji: '浴',
    onyomi: ['よく'],
    kunyomi: ['あ(びる)', 'あ(びせる)'],
    meanings: ['bathe', 'be favored with', 'bask in'],
    grade: 4,
    strokes: 10,
    frequencyRank: 1136,
  ),
  // haiku / actor
  '俳': KanjiReading(
    kanji: '俳',
    onyomi: ['はい'],
    kunyomi: [],
    meanings: ['haiku', 'actor'],
    grade: 6,
    strokes: 10,
    frequencyRank: 1137,
  ),
  // juvenile / 孩子
  '童': KanjiReading(
    kanji: '童',
    onyomi: ['どう'],
    kunyomi: ['わらべ'],
    meanings: ['juvenile', '孩子'],
    grade: 3,
    strokes: 12,
    frequencyRank: 1138,
  ),
  // treasure / wealth / valuables
  '宝': KanjiReading(
    kanji: '宝',
    onyomi: ['ほう'],
    kunyomi: ['たから'],
    meanings: ['treasure', 'wealth', 'valuables'],
    grade: 6,
    strokes: 8,
    frequencyRank: 1139,
  ),
  // design / pattern / 建造
  '柄': KanjiReading(
    kanji: '柄',
    onyomi: ['へい'],
    kunyomi: ['がら', 'え', 'つか'],
    meanings: ['design', 'pattern', '建造'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1140,
  ),
  // wonder / be surprised / frightened
  '驚': KanjiReading(
    kanji: '驚',
    onyomi: ['きょう'],
    kunyomi: ['おどろ(く)', 'おどろ(かす)'],
    meanings: ['wonder', 'be surprised', 'frightened'],
    grade: 8,
    strokes: 22,
    frequencyRank: 1141,
  ),
  // hemp / flax / numb
  '麻': KanjiReading(
    kanji: '麻',
    onyomi: ['ま', 'まあ'],
    kunyomi: ['あさ'],
    meanings: ['hemp', 'flax', 'numb'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1142,
  ),
  // seal / closing
  '封': KanjiReading(
    kanji: '封',
    onyomi: ['ふう', 'ほう'],
    kunyomi: [],
    meanings: ['seal', 'closing'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1143,
  ),
  // bosom / breast / chest
  '胸': KanjiReading(
    kanji: '胸',
    onyomi: ['きょう'],
    kunyomi: ['むね', '(むな)'],
    meanings: ['bosom', 'breast', 'chest'],
    grade: 6,
    strokes: 10,
    frequencyRank: 1144,
  ),
  // daughter / girl
  '娘': KanjiReading(
    kanji: '娘',
    onyomi: ['じょう'],
    kunyomi: ['むすめ', 'こ'],
    meanings: ['daughter', 'girl'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1145,
  ),
  // sand
  '砂': KanjiReading(
    kanji: '砂',
    onyomi: ['さ', 'しゃ'],
    kunyomi: ['すな'],
    meanings: ['sand'],
    grade: 6,
    strokes: 9,
    frequencyRank: 1146,
  ),
  // plum
  '李': KanjiReading(
    kanji: '李',
    onyomi: ['り'],
    kunyomi: ['すもも'],
    meanings: ['plum'],
    grade: 9,
    strokes: 7,
    frequencyRank: 1147,
  ),
  // salt
  '塩': KanjiReading(
    kanji: '塩',
    onyomi: ['えん'],
    kunyomi: ['しお'],
    meanings: ['salt'],
    grade: 4,
    strokes: 13,
    frequencyRank: 1148,
  ),
  // wide expanse / abundance / vigorous
  '浩': KanjiReading(
    kanji: '浩',
    onyomi: ['こう'],
    kunyomi: ['おおき(い)', 'ひろ(い)'],
    meanings: ['wide expanse', 'abundance', 'vigorous'],
    grade: 9,
    strokes: 10,
    frequencyRank: 1149,
  ),
  // mistake / err / do wrong
  '誤': KanjiReading(
    kanji: '誤',
    onyomi: ['ご'],
    kunyomi: ['あやま(る)'],
    meanings: ['mistake', 'err', 'do wrong'],
    grade: 6,
    strokes: 14,
    frequencyRank: 1150,
  ),
  // dose / 药 / drug
  '剤': KanjiReading(
    kanji: '剤',
    onyomi: ['ざい', 'すい', 'せい'],
    kunyomi: ['かる', 'けず(る)'],
    meanings: ['dose', '药', 'drug'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1151,
  ),
  // rapids / current / torrent
  '瀬': KanjiReading(
    kanji: '瀬',
    onyomi: ['らい'],
    kunyomi: ['せ'],
    meanings: ['rapids', 'current', 'torrent'],
    grade: 8,
    strokes: 19,
    frequencyRank: 1152,
  ),
  // purport / gist / elegance
  '趣': KanjiReading(
    kanji: '趣',
    onyomi: ['しゅ'],
    kunyomi: ['おもむき', 'おもむ(く)'],
    meanings: ['purport', 'gist', 'elegance'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1153,
  ),
  // collapse / fall into / cave in
  '陥': KanjiReading(
    kanji: '陥',
    onyomi: ['かん'],
    kunyomi: ['おちい(る)', 'おとしい(れる)'],
    meanings: ['collapse', 'fall into', 'cave in'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1154,
  ),
  // purification / Buddhist food / 房间
  '斎': KanjiReading(
    kanji: '斎',
    onyomi: ['さい'],
    kunyomi: ['とき', 'つつし(む)', 'ものいみ', 'い(む)', 'いわ(う)', 'いつ(く)'],
    meanings: ['purification', 'Buddhist food', '房间'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1155,
  ),
  // pierce / 8 1/3lbs / penetrate
  '貫': KanjiReading(
    kanji: '貫',
    onyomi: ['かん'],
    kunyomi: ['つらぬ(く)', 'ぬ(く)', 'ぬき'],
    meanings: ['pierce', '8 1/3lbs', 'penetrate'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1156,
  ),
  // hermit / wizard / cent
  '仙': KanjiReading(
    kanji: '仙',
    onyomi: ['せん', 'せんと'],
    kunyomi: [],
    meanings: ['hermit', 'wizard', 'cent'],
    grade: 8,
    strokes: 5,
    frequencyRank: 1157,
  ),
  // consolation / amusement / seduce
  '慰': KanjiReading(
    kanji: '慰',
    onyomi: ['い'],
    kunyomi: ['なぐさ(める)', 'なぐさ(む)'],
    meanings: ['consolation', 'amusement', 'seduce'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1158,
  ),
  // intelligent / wise / wisdom
  '賢': KanjiReading(
    kanji: '賢',
    onyomi: ['けん'],
    kunyomi: ['かしこ(い)'],
    meanings: ['intelligent', 'wise', 'wisdom'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1159,
  ),
  // preface / beginning / order
  '序': KanjiReading(
    kanji: '序',
    onyomi: ['じょ'],
    kunyomi: ['つい(で)', 'ついで'],
    meanings: ['preface', 'beginning', 'order'],
    grade: 5,
    strokes: 7,
    frequencyRank: 1160,
  ),
  // 弟弟 / faithful service to elders
  '弟': KanjiReading(
    kanji: '弟',
    onyomi: ['てい', 'だい', 'で'],
    kunyomi: ['おとうと'],
    meanings: ['弟弟', 'faithful service to elders'],
    grade: 2,
    strokes: 7,
    frequencyRank: 1161,
  ),
  // decameron / ten-day period / season (for specific products)
  '旬': KanjiReading(
    kanji: '旬',
    onyomi: ['じゅん', 'しゅん'],
    kunyomi: [],
    meanings: ['decameron', 'ten-day period', 'season (for specific products)'],
    grade: 8,
    strokes: 6,
    frequencyRank: 1162,
  ),
  // arm / ability / talent
  '腕': KanjiReading(
    kanji: '腕',
    onyomi: ['わん'],
    kunyomi: ['うで'],
    meanings: ['arm', 'ability', 'talent'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1163,
  ),
  // concurrently / and / beforehand
  '兼': KanjiReading(
    kanji: '兼',
    onyomi: ['けん'],
    kunyomi: ['か(ねる)'],
    meanings: ['concurrently', 'and', 'beforehand'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1164,
  ),
  // holy / saint / sage
  '聖': KanjiReading(
    kanji: '聖',
    onyomi: ['せい', 'しょう'],
    kunyomi: ['ひじり'],
    meanings: ['holy', 'saint', 'sage'],
    grade: 6,
    strokes: 13,
    frequencyRank: 1165,
  ),
  // delicious / relish / show a liking for
  '旨': KanjiReading(
    kanji: '旨',
    onyomi: ['し'],
    kunyomi: ['むね', 'うま(い)'],
    meanings: ['delicious', 'relish', 'show a liking for'],
    grade: 8,
    strokes: 6,
    frequencyRank: 1166,
  ),
  // instant / namely / as is
  '即': KanjiReading(
    kanji: '即',
    onyomi: ['そく'],
    kunyomi: ['つ(く)', 'つ(ける)', 'すなわ(ち)'],
    meanings: ['instant', 'namely', 'as is'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1167,
  ),
  // wash / inquire into / probe
  '洗': KanjiReading(
    kanji: '洗',
    onyomi: ['せん'],
    kunyomi: ['あら(う)'],
    meanings: ['wash', 'inquire into', 'probe'],
    grade: 6,
    strokes: 9,
    frequencyRank: 1168,
  ),
  // willow
  '柳': KanjiReading(
    kanji: '柳',
    onyomi: ['りゅう'],
    kunyomi: ['やなぎ'],
    meanings: ['willow'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1169,
  ),
  // cottage / inn / hut
  '舎': KanjiReading(
    kanji: '舎',
    onyomi: ['しゃ', 'せき'],
    kunyomi: ['やど(る)'],
    meanings: ['cottage', 'inn', 'hut'],
    grade: 5,
    strokes: 8,
    frequencyRank: 1170,
  ),
  // falsehood / 谎言 / deceive
  '偽': KanjiReading(
    kanji: '偽',
    onyomi: ['ぎ', 'か'],
    kunyomi: ['いつわ(る)', 'にせ', 'いつわ(り)'],
    meanings: ['falsehood', '谎言', 'deceive'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1171,
  ),
  // contrast / 比较
  '較': KanjiReading(
    kanji: '較',
    onyomi: ['かく', 'こう'],
    kunyomi: ['くら(べる)'],
    meanings: ['contrast', '比较'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1172,
  ),
  // hegemony / supremacy / leadership
  '覇': KanjiReading(
    kanji: '覇',
    onyomi: ['は', 'はく'],
    kunyomi: ['はたがしら'],
    meanings: ['hegemony', 'supremacy', 'leadership'],
    grade: 8,
    strokes: 19,
    frequencyRank: 1173,
  ),
  // portent / 10**12 / trillion
  '兆': KanjiReading(
    kanji: '兆',
    onyomi: ['ちょう'],
    kunyomi: ['きざ(す)', 'きざ(し)'],
    meanings: ['portent', '10**12', 'trillion'],
    grade: 4,
    strokes: 6,
    frequencyRank: 1174,
  ),
  // bed / counter for beds / floor
  '床': KanjiReading(
    kanji: '床',
    onyomi: ['しょう'],
    kunyomi: ['とこ', 'ゆか'],
    meanings: ['bed', 'counter for beds', 'floor'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1175,
  ),
  // farm / 田地 / garden
  '畑': KanjiReading(
    kanji: '畑',
    onyomi: [],
    kunyomi: ['はた', 'はたけ', '(ばたけ)'],
    meanings: ['farm', '田地', 'garden'],
    grade: 3,
    strokes: 9,
    frequencyRank: 1176,
  ),
  // accustomed / get used to / become experienced
  '慣': KanjiReading(
    kanji: '慣',
    onyomi: ['かん'],
    kunyomi: ['な(れる)', 'な(らす)'],
    meanings: ['accustomed', 'get used to', 'become experienced'],
    grade: 5,
    strokes: 14,
    frequencyRank: 1177,
  ),
  // detailed / full / 分钟
  '詳': KanjiReading(
    kanji: '詳',
    onyomi: ['しょう'],
    kunyomi: ['くわ(しい)', 'つまび(らか)'],
    meanings: ['detailed', 'full', '分钟'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1178,
  ),
  // fur / 头发 / feather
  '毛': KanjiReading(
    kanji: '毛',
    onyomi: ['もう'],
    kunyomi: ['け'],
    meanings: ['fur', '头发', 'feather'],
    grade: 2,
    strokes: 4,
    frequencyRank: 1179,
  ),
  // 绿
  '緑': KanjiReading(
    kanji: '緑',
    onyomi: ['りょく', 'ろく'],
    kunyomi: ['みどり'],
    meanings: ['绿'],
    grade: 3,
    strokes: 14,
    frequencyRank: 1180,
  ),
  // revered / valuable / precious
  '尊': KanjiReading(
    kanji: '尊',
    onyomi: ['そん'],
    kunyomi: ['たっと(い)', 'とうと(い)', 'たっと(ぶ)', 'とうと(ぶ)'],
    meanings: ['revered', 'valuable', 'precious'],
    grade: 6,
    strokes: 12,
    frequencyRank: 1181,
  ),
  // resist / reach / touch
  '抵': KanjiReading(
    kanji: '抵',
    onyomi: ['てい'],
    kunyomi: [],
    meanings: ['resist', 'reach', 'touch'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1182,
  ),
  // threaten / coerce
  '脅': KanjiReading(
    kanji: '脅',
    onyomi: ['きょう'],
    kunyomi: ['おびや(かす)', 'おど(す)', 'おど(かす)'],
    meanings: ['threaten', 'coerce'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1183,
  ),
  // celebrate / congratulate
  '祝': KanjiReading(
    kanji: '祝',
    onyomi: ['しゅく', 'しゅう'],
    kunyomi: ['いわ(う)'],
    meanings: ['celebrate', 'congratulate'],
    grade: 4,
    strokes: 9,
    frequencyRank: 1184,
  ),
  // salute / bow / ceremony
  '礼': KanjiReading(
    kanji: '礼',
    onyomi: ['れい', 'らい'],
    kunyomi: [],
    meanings: ['salute', 'bow', 'ceremony'],
    grade: 3,
    strokes: 5,
    frequencyRank: 1185,
  ),
  // 窗户 / pane
  '窓': KanjiReading(
    kanji: '窓',
    onyomi: ['そう', 'す'],
    kunyomi: ['まど', 'てんまど', 'けむだし'],
    meanings: ['窗户', 'pane'],
    grade: 6,
    strokes: 11,
    frequencyRank: 1186,
  ),
  // tender / weakness / gentleness
  '柔': KanjiReading(
    kanji: '柔',
    onyomi: ['じゅう', 'にゅう'],
    kunyomi: ['やわ(らか)', 'やわ(らかい)', 'やわ', 'やわ(ら)'],
    meanings: ['tender', 'weakness', 'gentleness'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1187,
  ),
  // overgrown / grow thick / be luxuriant
  '茂': KanjiReading(
    kanji: '茂',
    onyomi: ['も'],
    kunyomi: ['しげ(る)'],
    meanings: ['overgrown', 'grow thick', 'be luxuriant'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1188,
  ),
  // sacrifice
  '犠': KanjiReading(
    kanji: '犠',
    onyomi: ['ぎ', 'き'],
    kunyomi: ['いけにえ'],
    meanings: ['sacrifice'],
    grade: 8,
    strokes: 17,
    frequencyRank: 1189,
  ),
  // flag / banner / standard
  '旗': KanjiReading(
    kanji: '旗',
    onyomi: ['き'],
    kunyomi: ['はた'],
    meanings: ['flag', 'banner', 'standard'],
    grade: 4,
    strokes: 14,
    frequencyRank: 1190,
  ),
  // long-distance / spur / fetlock
  '距': KanjiReading(
    kanji: '距',
    onyomi: ['きょ'],
    kunyomi: ['へだ(たる)', 'けづめ'],
    meanings: ['long-distance', 'spur', 'fetlock'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1191,
  ),
  // gracious / elegant / graceful
  '雅': KanjiReading(
    kanji: '雅',
    onyomi: ['が'],
    kunyomi: ['みや(び)'],
    meanings: ['gracious', 'elegant', 'graceful'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1192,
  ),
  // decorate / ornament / adorn
  '飾': KanjiReading(
    kanji: '飾',
    onyomi: ['しょく'],
    kunyomi: ['かざ(る)', 'かざ(り)'],
    meanings: ['decorate', 'ornament', 'adorn'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1193,
  ),
  // netting / network
  '網': KanjiReading(
    kanji: '網',
    onyomi: ['もう'],
    kunyomi: ['あみ'],
    meanings: ['netting', 'network'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1194,
  ),
  // dragon / imperial
  '竜': KanjiReading(
    kanji: '竜',
    onyomi: ['りゅう', 'りょう', 'ろう'],
    kunyomi: ['たつ', 'いせ'],
    meanings: ['dragon', 'imperial'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1195,
  ),
  // poem / poetry
  '詩': KanjiReading(
    kanji: '詩',
    onyomi: ['し'],
    kunyomi: ['うた'],
    meanings: ['poem', 'poetry'],
    grade: 3,
    strokes: 13,
    frequencyRank: 1196,
  ),
  // once upon a time / antiquity / old times
  '昔': KanjiReading(
    kanji: '昔',
    onyomi: ['せき', 'しゃく'],
    kunyomi: ['むかし'],
    meanings: ['once upon a time', 'antiquity', 'old times'],
    grade: 3,
    strokes: 8,
    frequencyRank: 1197,
  ),
  // luxuriant / 厚 / overgrown
  '繁': KanjiReading(
    kanji: '繁',
    onyomi: ['はん'],
    kunyomi: ['しげ(る)', 'しげ(く)'],
    meanings: ['luxuriant', '厚', 'overgrown'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1198,
  ),
  // Mr. / hall / mansion
  '殿': KanjiReading(
    kanji: '殿',
    onyomi: ['でん', 'てん'],
    kunyomi: ['との', '(どの)'],
    meanings: ['Mr.', 'hall', 'mansion'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1199,
  ),
  // concentrated / 厚 / dark
  '濃': KanjiReading(
    kanji: '濃',
    onyomi: ['のう'],
    kunyomi: ['こ(い)'],
    meanings: ['concentrated', '厚', 'dark'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1200,
  ),
  // wing / plane / flank
  '翼': KanjiReading(
    kanji: '翼',
    onyomi: ['よく'],
    kunyomi: ['つばさ'],
    meanings: ['wing', 'plane', 'flank'],
    grade: 8,
    strokes: 17,
    frequencyRank: 1201,
  ),
  // 牛
  '牛': KanjiReading(
    kanji: '牛',
    onyomi: ['ぎゅう'],
    kunyomi: ['うし'],
    meanings: ['牛'],
    grade: 2,
    strokes: 4,
    frequencyRank: 1202,
  ),
  // briar / thorn
  '茨': KanjiReading(
    kanji: '茨',
    onyomi: ['し', 'じ'],
    kunyomi: ['いばら', 'かや', 'くさぶき'],
    meanings: ['briar', 'thorn'],
    grade: 4,
    strokes: 9,
    frequencyRank: 1203,
  ),
  // lagoon
  '潟': KanjiReading(
    kanji: '潟',
    onyomi: ['せき'],
    kunyomi: ['かた', '(がた)'],
    meanings: ['lagoon'],
    grade: 4,
    strokes: 15,
    frequencyRank: 1204,
  ),
  // enemy / foe / opponent
  '敵': KanjiReading(
    kanji: '敵',
    onyomi: ['てき'],
    kunyomi: ['かたき', 'あだ', 'かな(う)'],
    meanings: ['enemy', 'foe', 'opponent'],
    grade: 6,
    strokes: 15,
    frequencyRank: 1205,
  ),
  // fascination / charm / bewitch
  '魅': KanjiReading(
    kanji: '魅',
    onyomi: ['み'],
    kunyomi: [],
    meanings: ['fascination', 'charm', 'bewitch'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1206,
  ),
  // dislike / detest / hate
  '嫌': KanjiReading(
    kanji: '嫌',
    onyomi: ['けん', 'げん'],
    kunyomi: ['きら(う)', 'きら(い)', 'いや'],
    meanings: ['dislike', 'detest', 'hate'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1207,
  ),
  // 鱼
  '魚': KanjiReading(
    kanji: '魚',
    onyomi: ['ぎょ'],
    kunyomi: ['うお', 'さかな', '(ざかな)'],
    meanings: ['鱼'],
    grade: 2,
    strokes: 11,
    frequencyRank: 1208,
  ),
  // adjusted / alike / equal
  '斉': KanjiReading(
    kanji: '斉',
    onyomi: ['せい', 'さい'],
    kunyomi: ['そろ(う)', 'ひと(しい)', 'ひと(しく)', 'あたる', 'はやい'],
    meanings: ['adjusted', 'alike', 'equal'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1209,
  ),
  // fluid / liquid / juice
  '液': KanjiReading(
    kanji: '液',
    onyomi: ['えき'],
    kunyomi: [],
    meanings: ['fluid', 'liquid', 'juice'],
    grade: 5,
    strokes: 11,
    frequencyRank: 1210,
  ),
  // poverty / 贫穷
  '貧': KanjiReading(
    kanji: '貧',
    onyomi: ['ひん', 'びん'],
    kunyomi: ['まず(しい)'],
    meanings: ['poverty', '贫穷'],
    grade: 5,
    strokes: 11,
    frequencyRank: 1211,
  ),
  // spread / pave / 坐
  '敷': KanjiReading(
    kanji: '敷',
    onyomi: ['ふ'],
    kunyomi: ['し(く)', 'し(き)'],
    meanings: ['spread', 'pave', '坐'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1212,
  ),
  // hug / embrace / possess
  '擁': KanjiReading(
    kanji: '擁',
    onyomi: ['よう'],
    kunyomi: [],
    meanings: ['hug', 'embrace', 'possess'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1213,
  ),
  // garment / clothes / dressing
  '衣': KanjiReading(
    kanji: '衣',
    onyomi: ['い', 'え'],
    kunyomi: ['ころも', 'きぬ', '(ぎ)'],
    meanings: ['garment', 'clothes', 'dressing'],
    grade: 4,
    strokes: 6,
    frequencyRank: 1214,
  ),
  // shoulder
  '肩': KanjiReading(
    kanji: '肩',
    onyomi: ['けん'],
    kunyomi: ['かた'],
    meanings: ['shoulder'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1215,
  ),
  // sphere / circle / radius
  '圏': KanjiReading(
    kanji: '圏',
    onyomi: ['けん'],
    kunyomi: ['かこ(い)'],
    meanings: ['sphere', 'circle', 'radius'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1216,
  ),
  // zero / spill / overflow
  '零': KanjiReading(
    kanji: '零',
    onyomi: ['れい'],
    kunyomi: ['ぜろ', 'こぼ(す)', 'こぼ(れる)'],
    meanings: ['zero', 'spill', 'overflow'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1217,
  ),
  // acid / bitterness / sour
  '酸': KanjiReading(
    kanji: '酸',
    onyomi: ['さん'],
    kunyomi: ['す(い)'],
    meanings: ['acid', 'bitterness', 'sour'],
    grade: 5,
    strokes: 14,
    frequencyRank: 1218,
  ),
  // 哥哥 / big brother
  '兄': KanjiReading(
    kanji: '兄',
    onyomi: ['けい', 'きょう'],
    kunyomi: ['あに'],
    meanings: ['哥哥', 'big brother'],
    grade: 2,
    strokes: 5,
    frequencyRank: 1219,
  ),
  // penalty / punishment
  '罰': KanjiReading(
    kanji: '罰',
    onyomi: ['ばつ', 'ばち', 'はつ'],
    kunyomi: ['ばっ(する)'],
    meanings: ['penalty', 'punishment'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1220,
  ),
  // angry / be offended
  '怒': KanjiReading(
    kanji: '怒',
    onyomi: ['ど', 'ぬ'],
    kunyomi: ['いか(る)', 'おこ(る)'],
    meanings: ['angry', 'be offended'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1221,
  ),
  // 破坏 / ruin / overthrow
  '滅': KanjiReading(
    kanji: '滅',
    onyomi: ['めつ'],
    kunyomi: ['ほろ(びる)', 'ほろ(ぶ)', 'ほろ(ぼす)'],
    meanings: ['破坏', 'ruin', 'overthrow'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1222,
  ),
  // swim
  '泳': KanjiReading(
    kanji: '泳',
    onyomi: ['えい'],
    kunyomi: ['およ(ぐ)'],
    meanings: ['swim'],
    grade: 3,
    strokes: 8,
    frequencyRank: 1223,
  ),
  // cornerstone / foundation stone
  '礎': KanjiReading(
    kanji: '礎',
    onyomi: ['そ'],
    kunyomi: ['いしずえ'],
    meanings: ['cornerstone', 'foundation stone'],
    grade: 8,
    strokes: 18,
    frequencyRank: 1224,
  ),
  // rot / decay / sour
  '腐': KanjiReading(
    kanji: '腐',
    onyomi: ['ふ'],
    kunyomi: ['くさ(る)', 'くさ(れる)', 'くさ(れ)', 'くさ(らす)', 'くさ(す)'],
    meanings: ['rot', 'decay', 'sour'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1225,
  ),
  // ancestor / pioneer / founder
  '祖': KanjiReading(
    kanji: '祖',
    onyomi: ['そ'],
    kunyomi: [],
    meanings: ['ancestor', 'pioneer', 'founder'],
    grade: 5,
    strokes: 9,
    frequencyRank: 1226,
  ),
  // infancy / childhood
  '幼': KanjiReading(
    kanji: '幼',
    onyomi: ['よう'],
    kunyomi: ['おさな(い)'],
    meanings: ['infancy', 'childhood'],
    grade: 6,
    strokes: 5,
    frequencyRank: 1227,
  ),
  // skids / leg / undercarriage
  '脚': KanjiReading(
    kanji: '脚',
    onyomi: ['きゃく', 'きゃ', 'かく'],
    kunyomi: ['あし'],
    meanings: ['skids', 'leg', 'undercarriage'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1228,
  ),
  // diamond (shape) / water chestnut / rhombus
  '菱': KanjiReading(
    kanji: '菱',
    onyomi: ['りょう'],
    kunyomi: ['ひし'],
    meanings: ['diamond (shape)', 'water chestnut', 'rhombus'],
    grade: 9,
    strokes: 11,
    frequencyRank: 1229,
  ),
  // baggage / shoulder-pole load / bear (a burden)
  '荷': KanjiReading(
    kanji: '荷',
    onyomi: ['か'],
    kunyomi: ['に'],
    meanings: ['baggage', 'shoulder-pole load', 'bear (a burden)'],
    grade: 3,
    strokes: 10,
    frequencyRank: 1230,
  ),
  // tide / salt water / opportunity
  '潮': KanjiReading(
    kanji: '潮',
    onyomi: ['ちょう'],
    kunyomi: ['しお', 'うしお'],
    meanings: ['tide', 'salt water', 'opportunity'],
    grade: 6,
    strokes: 15,
    frequencyRank: 1231,
  ),
  // plum
  '梅': KanjiReading(
    kanji: '梅',
    onyomi: ['ばい'],
    kunyomi: ['うめ'],
    meanings: ['plum'],
    grade: 4,
    strokes: 10,
    frequencyRank: 1232,
  ),
  // overnight stay / put up at / ride at anchor
  '泊': KanjiReading(
    kanji: '泊',
    onyomi: ['はく'],
    kunyomi: ['と(まる)', 'と(める)'],
    meanings: ['overnight stay', 'put up at', 'ride at anchor'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1233,
  ),
  // exhaust / use up / run out of
  '尽': KanjiReading(
    kanji: '尽',
    onyomi: ['じん', 'さん'],
    kunyomi: ['つ(きる)', 'つ(くす)', 'つ(かす)', 'づ(く)', 'ず(く)', 'ことごと(く)'],
    meanings: ['exhaust', 'use up', 'run out of'],
    grade: 8,
    strokes: 6,
    frequencyRank: 1234,
  ),
  // counter for cupfuls / wine glass / glass
  '杯': KanjiReading(
    kanji: '杯',
    onyomi: ['はい'],
    kunyomi: ['さかずき'],
    meanings: ['counter for cupfuls', 'wine glass', 'glass'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1235,
  ),
  // me / I (male) / servant
  '僕': KanjiReading(
    kanji: '僕',
    onyomi: ['ぼく'],
    kunyomi: ['しもべ'],
    meanings: ['me', 'I (male)', 'servant'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1236,
  ),
  // cherry
  '桜': KanjiReading(
    kanji: '桜',
    onyomi: ['おう', 'よう'],
    kunyomi: ['さくら'],
    meanings: ['cherry'],
    grade: 5,
    strokes: 10,
    frequencyRank: 1237,
  ),
  // slippery / slide / slip
  '滑': KanjiReading(
    kanji: '滑',
    onyomi: ['かつ', 'こつ'],
    kunyomi: ['すべ(る)', 'なめ(らか)'],
    meanings: ['slippery', 'slide', 'slip'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1238,
  ),
  // orphan / alone
  '孤': KanjiReading(
    kanji: '孤',
    onyomi: ['こ'],
    kunyomi: [],
    meanings: ['orphan', 'alone'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1239,
  ),
  // 黄
  '黄': KanjiReading(
    kanji: '黄',
    onyomi: ['こう', 'おう'],
    kunyomi: ['き', '(こ)'],
    meanings: ['黄'],
    grade: 2,
    strokes: 11,
    frequencyRank: 1240,
  ),
  // inflammation / flame / blaze
  '炎': KanjiReading(
    kanji: '炎',
    onyomi: ['えん'],
    kunyomi: ['ほのお'],
    meanings: ['inflammation', 'flame', 'blaze'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1242,
  ),
  // compensation / indemnify
  '賠': KanjiReading(
    kanji: '賠',
    onyomi: ['ばい'],
    kunyomi: [],
    meanings: ['compensation', 'indemnify'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1243,
  ),
  // phrase / clause / 句子
  '句': KanjiReading(
    kanji: '句',
    onyomi: ['く'],
    kunyomi: [],
    meanings: ['phrase', 'clause', '句子'],
    grade: 5,
    strokes: 5,
    frequencyRank: 1244,
  ),
  // longevity / congratulations / one's natural life
  '寿': KanjiReading(
    kanji: '寿',
    onyomi: ['じゅ', 'す', 'しゅう'],
    kunyomi: ['ことぶき', 'ことぶ(く)', 'ことほ(ぐ)'],
    meanings: ['longevity', 'congratulations', 'one\'s natural life'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1245,
  ),
  // steel
  '鋼': KanjiReading(
    kanji: '鋼',
    onyomi: ['こう'],
    kunyomi: ['はがね'],
    meanings: ['steel'],
    grade: 6,
    strokes: 16,
    frequencyRank: 1246,
  ),
  // stubborn / foolish / firmly
  '頑': KanjiReading(
    kanji: '頑',
    onyomi: ['がん'],
    kunyomi: ['かたく(な)'],
    meanings: ['stubborn', 'foolish', 'firmly'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1247,
  ),
  // sweet / coax / pamper
  '甘': KanjiReading(
    kanji: '甘',
    onyomi: ['かん'],
    kunyomi: ['あま(い)', 'あま(える)', 'あま(やかす)', 'うま(い)'],
    meanings: ['sweet', 'coax', 'pamper'],
    grade: 8,
    strokes: 5,
    frequencyRank: 1248,
  ),
  // retainer / subject
  '臣': KanjiReading(
    kanji: '臣',
    onyomi: ['しん', 'じん'],
    kunyomi: [],
    meanings: ['retainer', 'subject'],
    grade: 4,
    strokes: 7,
    frequencyRank: 1249,
  ),
  // chain / irons / connection
  '鎖': KanjiReading(
    kanji: '鎖',
    onyomi: ['さ'],
    kunyomi: ['くさり', 'とざ(す)'],
    meanings: ['chain', 'irons', 'connection'],
    grade: 8,
    strokes: 18,
    frequencyRank: 1250,
  ),
  // coloring / 绘画 / makeup
  '彩': KanjiReading(
    kanji: '彩',
    onyomi: ['さい'],
    kunyomi: ['いろど(る)'],
    meanings: ['coloring', '绘画', 'makeup'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1251,
  ),
  // chafe / rub / polish
  '摩': KanjiReading(
    kanji: '摩',
    onyomi: ['ま'],
    kunyomi: ['ま(する)', 'さす(る)', 'す(る)'],
    meanings: ['chafe', 'rub', 'polish'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1252,
  ),
  // 浅 / superficial / frivolous
  '浅': KanjiReading(
    kanji: '浅',
    onyomi: ['せん'],
    kunyomi: ['あさ(い)'],
    meanings: ['浅', 'superficial', 'frivolous'],
    grade: 4,
    strokes: 9,
    frequencyRank: 1253,
  ),
  // encourage / be diligent / inspire
  '励': KanjiReading(
    kanji: '励',
    onyomi: ['れい'],
    kunyomi: ['はげ(む)', 'はげ(ます)'],
    meanings: ['encourage', 'be diligent', 'inspire'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1254,
  ),
  // sweep / 毛笔
  '掃': KanjiReading(
    kanji: '掃',
    onyomi: ['そう', 'しゅ'],
    kunyomi: ['は(く)'],
    meanings: ['sweep', '毛笔'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1255,
  ),
  // 云
  '雲': KanjiReading(
    kanji: '雲',
    onyomi: ['うん'],
    kunyomi: ['くも', '(ぐも)'],
    meanings: ['云'],
    grade: 2,
    strokes: 12,
    frequencyRank: 1256,
  ),
  // dig / delve / excavate
  '掘': KanjiReading(
    kanji: '掘',
    onyomi: ['くつ'],
    kunyomi: ['ほ(る)'],
    meanings: ['dig', 'delve', 'excavate'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1257,
  ),
  // vertical / length / height
  '縦': KanjiReading(
    kanji: '縦',
    onyomi: ['じゅう'],
    kunyomi: ['たて'],
    meanings: ['vertical', 'length', 'height'],
    grade: 6,
    strokes: 16,
    frequencyRank: 1258,
  ),
  // radiance / shine / sparkle
  '輝': KanjiReading(
    kanji: '輝',
    onyomi: ['き'],
    kunyomi: ['かがや(く)'],
    meanings: ['radiance', 'shine', 'sparkle'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1259,
  ),
  // amass / raise / hoard
  '蓄': KanjiReading(
    kanji: '蓄',
    onyomi: ['ちく'],
    kunyomi: ['たくわ(える)'],
    meanings: ['amass', 'raise', 'hoard'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1260,
  ),
  // axis / pivot / stem
  '軸': KanjiReading(
    kanji: '軸',
    onyomi: ['じく'],
    kunyomi: [],
    meanings: ['axis', 'pivot', 'stem'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1261,
  ),
  // patrol / go around / circumference
  '巡': KanjiReading(
    kanji: '巡',
    onyomi: ['じゅん'],
    kunyomi: ['めぐ(る)', 'めぐ(り)'],
    meanings: ['patrol', 'go around', 'circumference'],
    grade: 8,
    strokes: 6,
    frequencyRank: 1262,
  ),
  // exhausted / tire / weary
  '疲': KanjiReading(
    kanji: '疲',
    onyomi: ['ひ'],
    kunyomi: ['つか(れる)', 'づか(れ)', 'つか(らす)'],
    meanings: ['exhausted', 'tire', 'weary'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1263,
  ),
  // earnings / 工作 / earn money
  '稼': KanjiReading(
    kanji: '稼',
    onyomi: ['か'],
    kunyomi: ['かせ(ぐ)'],
    meanings: ['earnings', '工作', 'earn money'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1264,
  ),
  // wink / blink / twinkle
  '瞬': KanjiReading(
    kanji: '瞬',
    onyomi: ['しゅん'],
    kunyomi: ['またた(く)', 'まじろ(ぐ)'],
    meanings: ['wink', 'blink', 'twinkle'],
    grade: 8,
    strokes: 18,
    frequencyRank: 1265,
  ),
  // discard / throw away / abandon
  '捨': KanjiReading(
    kanji: '捨',
    onyomi: ['しゃ'],
    kunyomi: ['す(てる)'],
    meanings: ['discard', 'throw away', 'abandon'],
    grade: 6,
    strokes: 11,
    frequencyRank: 1266,
  ),
  // 全部 / 一切
  '皆': KanjiReading(
    kanji: '皆',
    onyomi: ['かい'],
    kunyomi: ['みな', 'みんな'],
    meanings: ['全部', '一切'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1267,
  ),
  // cannon / gun
  '砲': KanjiReading(
    kanji: '砲',
    onyomi: ['ほう'],
    kunyomi: [],
    meanings: ['cannon', 'gun'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1268,
  ),
  // soft
  '軟': KanjiReading(
    kanji: '軟',
    onyomi: ['なん'],
    kunyomi: ['やわ(らか)', 'やわ(らかい)'],
    meanings: ['soft'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1269,
  ),
  // erupt / spout / emit
  '噴': KanjiReading(
    kanji: '噴',
    onyomi: ['ふん'],
    kunyomi: ['ふ(く)'],
    meanings: ['erupt', 'spout', 'emit'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1270,
  ),
  // sink / be submerged / subside
  '沈': KanjiReading(
    kanji: '沈',
    onyomi: ['ちん', 'じん'],
    kunyomi: ['しず(む)', 'しず(める)'],
    meanings: ['sink', 'be submerged', 'subside'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1271,
  ),
  // boast / be proud / pride
  '誇': KanjiReading(
    kanji: '誇',
    onyomi: ['こ'],
    kunyomi: ['ほこ(る)'],
    meanings: ['boast', 'be proud', 'pride'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1272,
  ),
  // auspicious / happiness / blessedness
  '祥': KanjiReading(
    kanji: '祥',
    onyomi: ['しょう'],
    kunyomi: ['さいわ(い)', 'きざ(し)', 'よ(い)', 'つまび(らか)'],
    meanings: ['auspicious', 'happiness', 'blessedness'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1273,
  ),
  // animal sacrifice / offering
  '牲': KanjiReading(
    kanji: '牲',
    onyomi: ['せい'],
    kunyomi: [],
    meanings: ['animal sacrifice', 'offering'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1274,
  ),
  // regularity / salary / order
  '秩': KanjiReading(
    kanji: '秩',
    onyomi: ['ちつ'],
    kunyomi: [],
    meanings: ['regularity', 'salary', 'order'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1275,
  ),
  // sovereign / the emperor / god
  '帝': KanjiReading(
    kanji: '帝',
    onyomi: ['てい'],
    kunyomi: ['みかど'],
    meanings: ['sovereign', 'the emperor', 'god'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1276,
  ),
  // 宽 / large
  '宏': KanjiReading(
    kanji: '宏',
    onyomi: ['こう'],
    kunyomi: ['ひろ(い)'],
    meanings: ['宽', 'large'],
    grade: 9,
    strokes: 7,
    frequencyRank: 1277,
  ),
  // tempt / seduce / instigate
  '唆': KanjiReading(
    kanji: '唆',
    onyomi: ['さ'],
    kunyomi: ['そそ(る)', 'そそのか(す)'],
    meanings: ['tempt', 'seduce', 'instigate'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1278,
  ),
  // chirp / cry / bark
  '鳴': KanjiReading(
    kanji: '鳴',
    onyomi: ['めい'],
    kunyomi: ['な(く)', 'な(る)', 'な(らす)'],
    meanings: ['chirp', 'cry', 'bark'],
    grade: 2,
    strokes: 14,
    frequencyRank: 1279,
  ),
  // thwart / separate from / prevent
  '阻': KanjiReading(
    kanji: '阻',
    onyomi: ['そ'],
    kunyomi: ['はば(む)'],
    meanings: ['thwart', 'separate from', 'prevent'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1280,
  ),
  // peaceful / calm / 和平
  '泰': KanjiReading(
    kanji: '泰',
    onyomi: ['たい'],
    kunyomi: [],
    meanings: ['peaceful', 'calm', '和平'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1281,
  ),
  // bribe / board / supply
  '賄': KanjiReading(
    kanji: '賄',
    onyomi: ['わい'],
    kunyomi: ['まかな(う)'],
    meanings: ['bribe', 'board', 'supply'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1282,
  ),
  // slap / strike / hit
  '撲': KanjiReading(
    kanji: '撲',
    onyomi: ['ぼく'],
    kunyomi: [],
    meanings: ['slap', 'strike', 'hit'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1283,
  ),
  // frozen / congeal / refrigerate
  '凍': KanjiReading(
    kanji: '凍',
    onyomi: ['とう'],
    kunyomi: ['こお(る)', 'こご(える)', 'こご(る)', 'い(てる)', 'し(みる)'],
    meanings: ['frozen', 'congeal', 'refrigerate'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1284,
  ),
  // ditch / moat / canal
  '堀': KanjiReading(
    kanji: '堀',
    onyomi: ['くつ'],
    kunyomi: ['ほり'],
    meanings: ['ditch', 'moat', 'canal'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1285,
  ),
  // abdomen / belly / stomach
  '腹': KanjiReading(
    kanji: '腹',
    onyomi: ['ふく'],
    kunyomi: ['はら'],
    meanings: ['abdomen', 'belly', 'stomach'],
    grade: 6,
    strokes: 13,
    frequencyRank: 1286,
  ),
  // chrysanthemum
  '菊': KanjiReading(
    kanji: '菊',
    onyomi: ['きく'],
    kunyomi: [],
    meanings: ['chrysanthemum'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1287,
  ),
  // strangle / constrict / wring
  '絞': KanjiReading(
    kanji: '絞',
    onyomi: ['こう'],
    kunyomi: ['しぼ(る)', 'し(める)', 'し(まる)'],
    meanings: ['strangle', 'constrict', 'wring'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1288,
  ),
  // milk / breasts
  '乳': KanjiReading(
    kanji: '乳',
    onyomi: ['にゅう'],
    kunyomi: ['ちち', 'ち'],
    meanings: ['milk', 'breasts'],
    grade: 6,
    strokes: 8,
    frequencyRank: 1289,
  ),
  // smoke
  '煙': KanjiReading(
    kanji: '煙',
    onyomi: ['えん'],
    kunyomi: ['けむ(る)', 'けむり', 'けむ(い)'],
    meanings: ['smoke'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1290,
  ),
  // affinity / relation / connection
  '縁': KanjiReading(
    kanji: '縁',
    onyomi: ['えん', '-ねん'],
    kunyomi: ['ふち', 'ふち(どる)', 'ゆかり', 'よすが', 'へり', 'えにし'],
    meanings: ['affinity', 'relation', 'connection'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1291,
  ),
  // solely / only / merely
  '唯': KanjiReading(
    kanji: '唯',
    onyomi: ['ゆい', 'い'],
    kunyomi: ['ただ'],
    meanings: ['solely', 'only', 'merely'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1292,
  ),
  // swell / get fat / 厚
  '膨': KanjiReading(
    kanji: '膨',
    onyomi: ['ぼう'],
    kunyomi: ['ふく(らむ)', 'ふく(れる)'],
    meanings: ['swell', 'get fat', '厚'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1293,
  ),
  // dart / arrow
  '矢': KanjiReading(
    kanji: '矢',
    onyomi: ['し'],
    kunyomi: ['や'],
    meanings: ['dart', 'arrow'],
    grade: 2,
    strokes: 5,
    frequencyRank: 1294,
  ),
  // -proof / enduring
  '耐': KanjiReading(
    kanji: '耐',
    onyomi: ['たい'],
    kunyomi: ['た(える)'],
    meanings: ['-proof', 'enduring'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1295,
  ),
  // romance / in love / yearn for
  '恋': KanjiReading(
    kanji: '恋',
    onyomi: ['れん'],
    kunyomi: ['こ(う)', 'こい', 'こい(しい)'],
    meanings: ['romance', 'in love', 'yearn for'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1296,
  ),
  // cram school / private school
  '塾': KanjiReading(
    kanji: '塾',
    onyomi: ['じゅく'],
    kunyomi: [],
    meanings: ['cram school', 'private school'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1297,
  ),
  // leak / escape / 时间
  '漏': KanjiReading(
    kanji: '漏',
    onyomi: ['ろう'],
    kunyomi: ['も(る)', 'も(れる)', 'も(らす)'],
    meanings: ['leak', 'escape', '时间'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1298,
  ),
  // crimson / deep red
  '紅': KanjiReading(
    kanji: '紅',
    onyomi: ['こう', 'く'],
    kunyomi: ['べに', 'くれない', 'あか(い)'],
    meanings: ['crimson', 'deep red'],
    grade: 6,
    strokes: 9,
    frequencyRank: 1299,
  ),
  // jubilation / congratulate / rejoice
  '慶': KanjiReading(
    kanji: '慶',
    onyomi: ['けい'],
    kunyomi: ['よろこ(び)'],
    meanings: ['jubilation', 'congratulate', 'rejoice'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1300,
  ),
  // fierce / rave / rush
  '猛': KanjiReading(
    kanji: '猛',
    onyomi: ['もう'],
    kunyomi: [],
    meanings: ['fierce', 'rave', 'rush'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1301,
  ),
  // perfume / balmy / favorable
  '芳': KanjiReading(
    kanji: '芳',
    onyomi: ['ほう'],
    kunyomi: ['かんば(しい)'],
    meanings: ['perfume', 'balmy', 'favorable'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1302,
  ),
  // penal / chastise / punish
  '懲': KanjiReading(
    kanji: '懲',
    onyomi: ['ちょう'],
    kunyomi: ['こ(りる)', 'こ(らす)', 'こ(らしめる)'],
    meanings: ['penal', 'chastise', 'punish'],
    grade: 8,
    strokes: 18,
    frequencyRank: 1303,
  ),
  // outskirts / suburbs / rural area
  '郊': KanjiReading(
    kanji: '郊',
    onyomi: ['こう'],
    kunyomi: [],
    meanings: ['outskirts', 'suburbs', 'rural area'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1304,
  ),
  // sabre / sword / blade
  '剣': KanjiReading(
    kanji: '剣',
    onyomi: ['けん'],
    kunyomi: ['つるぎ'],
    meanings: ['sabre', 'sword', 'blade'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1305,
  ),
  // loins / hips / waist
  '腰': KanjiReading(
    kanji: '腰',
    onyomi: ['よう'],
    kunyomi: ['こし'],
    meanings: ['loins', 'hips', 'waist'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1306,
  ),
  // charcoal / coal
  '炭': KanjiReading(
    kanji: '炭',
    onyomi: ['たん'],
    kunyomi: ['すみ'],
    meanings: ['charcoal', 'coal'],
    grade: 3,
    strokes: 9,
    frequencyRank: 1307,
  ),
  // jump / 舞蹈 / leap
  '踊': KanjiReading(
    kanji: '踊',
    onyomi: ['よう'],
    kunyomi: ['おど(る)'],
    meanings: ['jump', '舞蹈', 'leap'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1308,
  ),
  // canopy / awning / hood
  '幌': KanjiReading(
    kanji: '幌',
    onyomi: ['こう'],
    kunyomi: ['ほろ', 'とばり'],
    meanings: ['canopy', 'awning', 'hood'],
    grade: 9,
    strokes: 13,
    frequencyRank: 1309,
  ),
  // patent / clear
  '彰': KanjiReading(
    kanji: '彰',
    onyomi: ['しょう'],
    kunyomi: [],
    meanings: ['patent', 'clear'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1310,
  ),
  // chess piece / Japanese chess / shogi
  '棋': KanjiReading(
    kanji: '棋',
    onyomi: ['き'],
    kunyomi: ['ご'],
    meanings: ['chess piece', 'Japanese chess', 'shogi'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1311,
  ),
  // 街道 / ward / 城镇
  '丁': KanjiReading(
    kanji: '丁',
    onyomi: ['ちょう', 'てい', 'ちん', 'とう', 'ち'],
    kunyomi: ['ひのと'],
    meanings: ['街道', 'ward', '城镇'],
    grade: 3,
    strokes: 2,
    frequencyRank: 1312,
  ),
  // tome / counter for books / volume
  '冊': KanjiReading(
    kanji: '冊',
    onyomi: ['さつ', 'さく'],
    kunyomi: ['ふみ'],
    meanings: ['tome', 'counter for books', 'volume'],
    grade: 6,
    strokes: 5,
    frequencyRank: 1313,
  ),
  // constancy / always
  '恒': KanjiReading(
    kanji: '恒',
    onyomi: ['こう'],
    kunyomi: ['つね', 'つねに'],
    meanings: ['constancy', 'always'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1314,
  ),
  // 睡 / 死 / sleepy
  '眠': KanjiReading(
    kanji: '眠',
    onyomi: ['みん'],
    kunyomi: ['ねむ(る)', 'ねむ(い)'],
    meanings: ['睡', '死', 'sleepy'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1315,
  ),
  // raise / elevate / hoist
  '揚': KanjiReading(
    kanji: '揚',
    onyomi: ['よう'],
    kunyomi: ['あ(げる)', 'あ(げ)', 'あ(がる)'],
    meanings: ['raise', 'elevate', 'hoist'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1316,
  ),
  // risk / 脸 / defy
  '冒': KanjiReading(
    kanji: '冒',
    onyomi: ['ぼう'],
    kunyomi: ['おか(す)'],
    meanings: ['risk', '脸', 'defy'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1317,
  ),
  // of / this
  '之': KanjiReading(
    kanji: '之',
    onyomi: ['し'],
    kunyomi: ['の', 'これ', 'ゆく', 'この'],
    meanings: ['of', 'this'],
    grade: 9,
    strokes: 3,
    frequencyRank: 1318,
  ),
  // courage / cheer up / be in high spirits
  '勇': KanjiReading(
    kanji: '勇',
    onyomi: ['ゆう'],
    kunyomi: ['いさ(む)'],
    meanings: ['courage', 'cheer up', 'be in high spirits'],
    grade: 4,
    strokes: 9,
    frequencyRank: 1319,
  ),
  // formerly / once / 前
  '曽': KanjiReading(
    kanji: '曽',
    onyomi: ['そう', 'そ', 'ぞう'],
    kunyomi: ['かつ', 'かつて', 'すなわち'],
    meanings: ['formerly', 'once', '前'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1320,
  ),
  // contraption / fetter / machine
  '械': KanjiReading(
    kanji: '械',
    onyomi: ['かい'],
    kunyomi: ['かせ'],
    meanings: ['contraption', 'fetter', 'machine'],
    grade: 4,
    strokes: 11,
    frequencyRank: 1321,
  ),
  // ethics / companion
  '倫': KanjiReading(
    kanji: '倫',
    onyomi: ['りん'],
    kunyomi: [],
    meanings: ['ethics', 'companion'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1322,
  ),
  // exhibit / state / relate
  '陳': KanjiReading(
    kanji: '陳',
    onyomi: ['ちん'],
    kunyomi: ['ひ(ねる)'],
    meanings: ['exhibit', 'state', 'relate'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1323,
  ),
  // recollection / 思考 / remember
  '憶': KanjiReading(
    kanji: '憶',
    onyomi: ['おく'],
    kunyomi: [],
    meanings: ['recollection', '思考', 'remember'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1324,
  ),
  // dreadful / be frightened / fearful
  '怖': KanjiReading(
    kanji: '怖',
    onyomi: ['ふ', 'ほ'],
    kunyomi: ['こわ(い)', 'こわ(がる)', 'お(じる)', 'おそ(れる)'],
    meanings: ['dreadful', 'be frightened', 'fearful'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1325,
  ),
  // 狗
  '犬': KanjiReading(
    kanji: '犬',
    onyomi: ['けん'],
    kunyomi: ['いぬ', '(いぬ)'],
    meanings: ['狗'],
    grade: 1,
    strokes: 4,
    frequencyRank: 1326,
  ),
  // vegetable / side dish / greens
  '菜': KanjiReading(
    kanji: '菜',
    onyomi: ['さい'],
    kunyomi: ['な'],
    meanings: ['vegetable', 'side dish', 'greens'],
    grade: 4,
    strokes: 11,
    frequencyRank: 1327,
  ),
  // 耳
  '耳': KanjiReading(
    kanji: '耳',
    onyomi: ['じ'],
    kunyomi: ['みみ'],
    meanings: ['耳'],
    grade: 1,
    strokes: 6,
    frequencyRank: 1328,
  ),
  // submerge / conceal / hide
  '潜': KanjiReading(
    kanji: '潜',
    onyomi: ['せん'],
    kunyomi: ['ひそ(む)', 'もぐ(る)', 'かく(れる)', 'くぐ(る)', 'ひそ(める)'],
    meanings: ['submerge', 'conceal', 'hide'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1329,
  ),
  // rare / curious / strange
  '珍': KanjiReading(
    kanji: '珍',
    onyomi: ['ちん'],
    kunyomi: ['めずら(しい)', 'たから'],
    meanings: ['rare', 'curious', 'strange'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1330,
  ),
  // pear tree
  '梨': KanjiReading(
    kanji: '梨',
    onyomi: ['り'],
    kunyomi: ['なし'],
    meanings: ['pear tree'],
    grade: 4,
    strokes: 11,
    frequencyRank: 1331,
  ),
  // humanity / virtue / benevolence
  '仁': KanjiReading(
    kanji: '仁',
    onyomi: ['じん', 'に', 'にん'],
    kunyomi: [],
    meanings: ['humanity', 'virtue', 'benevolence'],
    grade: 6,
    strokes: 4,
    frequencyRank: 1332,
  ),
  // overcome / kindly / skillfully
  '克': KanjiReading(
    kanji: '克',
    onyomi: ['こく'],
    kunyomi: ['か(つ)'],
    meanings: ['overcome', 'kindly', 'skillfully'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1333,
  ),
  // point / peak / 山
  '岳': KanjiReading(
    kanji: '岳',
    onyomi: ['がく'],
    kunyomi: ['たけ'],
    meanings: ['point', 'peak', '山'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1334,
  ),
  // outline / condition / approximation
  '概': KanjiReading(
    kanji: '概',
    onyomi: ['がい'],
    kunyomi: ['おおむ(ね)'],
    meanings: ['outline', 'condition', 'approximation'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1335,
  ),
  // arrest / seize / concerned
  '拘': KanjiReading(
    kanji: '拘',
    onyomi: ['こう'],
    kunyomi: ['かか(わる)'],
    meanings: ['arrest', 'seize', 'concerned'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1336,
  ),
  // grave / tomb
  '墓': KanjiReading(
    kanji: '墓',
    onyomi: ['ぼ'],
    kunyomi: ['はか'],
    meanings: ['grave', 'tomb'],
    grade: 5,
    strokes: 13,
    frequencyRank: 1337,
  ),
  // silence / become silent / stop speaking
  '黙': KanjiReading(
    kanji: '黙',
    onyomi: ['もく', 'ぼく'],
    kunyomi: ['だま(る)', 'もだ(す)'],
    meanings: ['silence', 'become silent', 'stop speaking'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1338,
  ),
  // ought / by all means / necessarily
  '須': KanjiReading(
    kanji: '須',
    onyomi: ['す', 'しゅ'],
    kunyomi: ['すべから(く)', 'すべし', 'ひげ', 'まつ', 'もち(いる)', 'もと(める)'],
    meanings: ['ought', 'by all means', 'necessarily'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1339,
  ),
  // partial / 侧面 / left-side radical
  '偏': KanjiReading(
    kanji: '偏',
    onyomi: ['へん'],
    kunyomi: ['かたよ(る)'],
    meanings: ['partial', '侧面', 'left-side radical'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1340,
  ),
  // atmosphere / fog
  '雰': KanjiReading(
    kanji: '雰',
    onyomi: ['ふん'],
    kunyomi: [],
    meanings: ['atmosphere', 'fog'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1341,
  ),
  // 蛋 / ovum / spawn
  '卵': KanjiReading(
    kanji: '卵',
    onyomi: ['らん'],
    kunyomi: ['たまご'],
    meanings: ['蛋', 'ovum', 'spawn'],
    grade: 6,
    strokes: 7,
    frequencyRank: 1342,
  ),
  // 见面 / encounter / interview
  '遇': KanjiReading(
    kanji: '遇',
    onyomi: ['ぐう'],
    kunyomi: ['あ(う)'],
    meanings: ['见面', 'encounter', 'interview'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1343,
  ),
  // lake
  '湖': KanjiReading(
    kanji: '湖',
    onyomi: ['こ'],
    kunyomi: ['みずうみ'],
    meanings: ['lake'],
    grade: 3,
    strokes: 12,
    frequencyRank: 1344,
  ),
  // consult with
  '諮': KanjiReading(
    kanji: '諮',
    onyomi: ['し'],
    kunyomi: ['はか(る)'],
    meanings: ['consult with'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1345,
  ),
  // cramped / 窄 / contract
  '狭': KanjiReading(
    kanji: '狭',
    onyomi: ['きょう', 'こう'],
    kunyomi: ['せま(い)', 'せば(める)', 'せば(まる)', 'さ'],
    meanings: ['cramped', '窄', 'contract'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1346,
  ),
  // consume / 吃 / 喝
  '喫': KanjiReading(
    kanji: '喫',
    onyomi: ['きつ'],
    kunyomi: ['の(む)'],
    meanings: ['consume', '吃', '喝'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1347,
  ),
  // eminent / 桌子 / desk
  '卓': KanjiReading(
    kanji: '卓',
    onyomi: ['たく'],
    kunyomi: [],
    meanings: ['eminent', '桌子', 'desk'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1348,
  ),
  // dry / parch / ebb
  '干': KanjiReading(
    kanji: '干',
    onyomi: ['かん'],
    kunyomi: ['ほ(す)', 'ほ(し)', 'ぼ(し)', 'ひ(る)'],
    meanings: ['dry', 'parch', 'ebb'],
    grade: 6,
    strokes: 3,
    frequencyRank: 1349,
  ),
  // place on the head / 接受 / top of head
  '頂': KanjiReading(
    kanji: '頂',
    onyomi: ['ちょう'],
    kunyomi: ['いただ(く)', 'いただき'],
    meanings: ['place on the head', '接受', 'top of head'],
    grade: 6,
    strokes: 11,
    frequencyRank: 1350,
  ),
  // 昆虫 / bug / temper
  '虫': KanjiReading(
    kanji: '虫',
    onyomi: ['ちゅう', 'き'],
    kunyomi: ['むし'],
    meanings: ['昆虫', 'bug', 'temper'],
    grade: 1,
    strokes: 6,
    frequencyRank: 1351,
  ),
  // printing / print / 毛笔
  '刷': KanjiReading(
    kanji: '刷',
    onyomi: ['さつ'],
    kunyomi: ['す(る)', 'ず(り)', '(ずり)', 'は(く)'],
    meanings: ['printing', 'print', '毛笔'],
    grade: 4,
    strokes: 8,
    frequencyRank: 1352,
  ),
  // tortoise / turtle
  '亀': KanjiReading(
    kanji: '亀',
    onyomi: ['き', 'きゅう', 'きん'],
    kunyomi: ['かめ'],
    meanings: ['tortoise', 'turtle'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1353,
  ),
  // provisions / 食物 / bread
  '糧': KanjiReading(
    kanji: '糧',
    onyomi: ['りょう', 'ろう'],
    kunyomi: ['かて'],
    meanings: ['provisions', '食物', 'bread'],
    grade: 8,
    strokes: 18,
    frequencyRank: 1354,
  ),
  // sculling oar
  '梶': KanjiReading(
    kanji: '梶',
    onyomi: ['び'],
    kunyomi: ['かじ', 'こずえ'],
    meanings: ['sculling oar'],
    grade: 9,
    strokes: 11,
    frequencyRank: 1355,
  ),
  // hot water / bath / hot spring
  '湯': KanjiReading(
    kanji: '湯',
    onyomi: ['とう'],
    kunyomi: ['ゆ'],
    meanings: ['hot water', 'bath', 'hot spring'],
    grade: 3,
    strokes: 12,
    frequencyRank: 1356,
  ),
  // box / chest / case
  '箱': KanjiReading(
    kanji: '箱',
    onyomi: ['そう'],
    kunyomi: ['はこ'],
    meanings: ['box', 'chest', 'case'],
    grade: 3,
    strokes: 15,
    frequencyRank: 1357,
  ),
  // register / record book
  '簿': KanjiReading(
    kanji: '簿',
    onyomi: ['ぼ'],
    kunyomi: [],
    meanings: ['register', 'record book'],
    grade: 8,
    strokes: 19,
    frequencyRank: 1358,
  ),
  // hearth / furnace / kiln
  '炉': KanjiReading(
    kanji: '炉',
    onyomi: ['ろ'],
    kunyomi: ['いろり'],
    meanings: ['hearth', 'furnace', 'kiln'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1359,
  ),
  // breed / care for / shepherd
  '牧': KanjiReading(
    kanji: '牧',
    onyomi: ['ぼく'],
    kunyomi: ['まき'],
    meanings: ['breed', 'care for', 'shepherd'],
    grade: 4,
    strokes: 8,
    frequencyRank: 1360,
  ),
  // particularly / especially / exceptionally
  '殊': KanjiReading(
    kanji: '殊',
    onyomi: ['しゅ'],
    kunyomi: ['こと'],
    meanings: ['particularly', 'especially', 'exceptionally'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1361,
  ),
  // augment / increase / multiply
  '殖': KanjiReading(
    kanji: '殖',
    onyomi: ['しょく'],
    kunyomi: ['ふ(える)', 'ふ(やす)'],
    meanings: ['augment', 'increase', 'multiply'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1362,
  ),
  // warship
  '艦': KanjiReading(
    kanji: '艦',
    onyomi: ['かん'],
    kunyomi: [],
    meanings: ['warship'],
    grade: 8,
    strokes: 21,
    frequencyRank: 1363,
  ),
  // melt / dissolve / thaw
  '溶': KanjiReading(
    kanji: '溶',
    onyomi: ['よう'],
    kunyomi: ['と(ける)', 'と(かす)', 'と(く)'],
    meanings: ['melt', 'dissolve', 'thaw'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1364,
  ),
  // comrade / fellow / 人民
  '輩': KanjiReading(
    kanji: '輩',
    onyomi: ['はい'],
    kunyomi: ['(ばら)', 'やから', 'やかい', 'ともがら'],
    meanings: ['comrade', 'fellow', '人民'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1365,
  ),
  // hole / aperture / slit
  '穴': KanjiReading(
    kanji: '穴',
    onyomi: ['けつ'],
    kunyomi: ['あな'],
    meanings: ['hole', 'aperture', 'slit'],
    grade: 6,
    strokes: 5,
    frequencyRank: 1366,
  ),
  // strange / strangeness / curiosity
  '奇': KanjiReading(
    kanji: '奇',
    onyomi: ['き'],
    kunyomi: ['く(しき)', 'あや(しい)', 'くし', 'めずら(しい)'],
    meanings: ['strange', 'strangeness', 'curiosity'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1367,
  ),
  // ridicule / laziness
  '慢': KanjiReading(
    kanji: '慢',
    onyomi: ['まん'],
    kunyomi: [],
    meanings: ['ridicule', 'laziness'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1368,
  ),
  // crane / stork
  '鶴': KanjiReading(
    kanji: '鶴',
    onyomi: ['かく'],
    kunyomi: ['つる'],
    meanings: ['crane', 'stork'],
    grade: 8,
    strokes: 21,
    frequencyRank: 1369,
  ),
  // conspire / cheat / impose on
  '謀': KanjiReading(
    kanji: '謀',
    onyomi: ['ぼう', 'む'],
    kunyomi: ['はか(る)', 'たばか(る)', 'はかりごと'],
    meanings: ['conspire', 'cheat', 'impose on'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1370,
  ),
  // warmth
  '暖': KanjiReading(
    kanji: '暖',
    onyomi: ['だん', 'のん'],
    kunyomi: ['あたた(か)', 'あたた(かい)', 'あたた(まる)', 'あたた(める)'],
    meanings: ['warmth'],
    grade: 6,
    strokes: 13,
    frequencyRank: 1371,
  ),
  // prosperous / bright / clear
  '昌': KanjiReading(
    kanji: '昌',
    onyomi: ['しょう'],
    kunyomi: ['さかん'],
    meanings: ['prosperous', 'bright', 'clear'],
    grade: 9,
    strokes: 8,
    frequencyRank: 1372,
  ),
  // clap / beat (music)
  '拍': KanjiReading(
    kanji: '拍',
    onyomi: ['はく', 'ひょう'],
    kunyomi: [],
    meanings: ['clap', 'beat (music)'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1373,
  ),
  // melodious / clear / bright
  '朗': KanjiReading(
    kanji: '朗',
    onyomi: ['ろう'],
    kunyomi: ['ほが(らか)', 'あき(らか)'],
    meanings: ['melodious', 'clear', 'bright'],
    grade: 6,
    strokes: 10,
    frequencyRank: 1374,
  ),
  // length / ten shaku / 测量
  '丈': KanjiReading(
    kanji: '丈',
    onyomi: ['じょう'],
    kunyomi: ['たけ', 'だけ'],
    meanings: ['length', 'ten shaku', '测量'],
    grade: 8,
    strokes: 3,
    frequencyRank: 1375,
  ),
  // mineral / ore
  '鉱': KanjiReading(
    kanji: '鉱',
    onyomi: ['こう'],
    kunyomi: ['あらがね'],
    meanings: ['mineral', 'ore'],
    grade: 5,
    strokes: 13,
    frequencyRank: 1376,
  ),
  // tolerant / leniency / generosity
  '寛': KanjiReading(
    kanji: '寛',
    onyomi: ['かん'],
    kunyomi: ['くつろ(ぐ)', 'ひろ(い)', 'ゆる(やか)'],
    meanings: ['tolerant', 'leniency', 'generosity'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1377,
  ),
  // capsize / cover / shade
  '覆': KanjiReading(
    kanji: '覆',
    onyomi: ['ふく'],
    kunyomi: ['おお(う)', 'くつがえ(す)', 'くつがえ(る)'],
    meanings: ['capsize', 'cover', 'shade'],
    grade: 8,
    strokes: 18,
    frequencyRank: 1378,
  ),
  // placenta / sac / sheath
  '胞': KanjiReading(
    kanji: '胞',
    onyomi: ['ほう'],
    kunyomi: [],
    meanings: ['placenta', 'sac', 'sheath'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1379,
  ),
  // cry / weep / moan
  '泣': KanjiReading(
    kanji: '泣',
    onyomi: ['きゅう'],
    kunyomi: ['な(く)'],
    meanings: ['cry', 'weep', 'moan'],
    grade: 4,
    strokes: 8,
    frequencyRank: 1380,
  ),
  // tears / sympathy
  '涙': KanjiReading(
    kanji: '涙',
    onyomi: ['るい', 'れい'],
    kunyomi: ['なみだ'],
    meanings: ['tears', 'sympathy'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1381,
  ),
  // isolate / alternate / distance
  '隔': KanjiReading(
    kanji: '隔',
    onyomi: ['かく'],
    kunyomi: ['へだ(てる)', 'へだ(たる)'],
    meanings: ['isolate', 'alternate', 'distance'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1382,
  ),
  // 干净 / purify / cleanse
  '浄': KanjiReading(
    kanji: '浄',
    onyomi: ['じょう', 'せい'],
    kunyomi: ['きよ(める)', 'きよ(い)'],
    meanings: ['干净', 'purify', 'cleanse'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1383,
  ),
  // equal / 头 / counter for small animals
  '匹': KanjiReading(
    kanji: '匹',
    onyomi: ['ひつ'],
    kunyomi: ['ひき'],
    meanings: ['equal', '头', 'counter for small animals'],
    grade: 8,
    strokes: 4,
    frequencyRank: 1384,
  ),
  // drown / sink / hide
  '没': KanjiReading(
    kanji: '没',
    onyomi: ['ぼつ', 'もつ'],
    kunyomi: ['おぼ(れる)', 'しず(む)', 'ない'],
    meanings: ['drown', 'sink', 'hide'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1385,
  ),
  // spare time / 休息 / leisure
  '暇': KanjiReading(
    kanji: '暇',
    onyomi: ['か'],
    kunyomi: ['ひま', 'いとま'],
    meanings: ['spare time', '休息', 'leisure'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1386,
  ),
  // lungs
  '肺': KanjiReading(
    kanji: '肺',
    onyomi: ['はい'],
    kunyomi: [],
    meanings: ['lungs'],
    grade: 6,
    strokes: 9,
    frequencyRank: 1387,
  ),
  // grandchild / descendants
  '孫': KanjiReading(
    kanji: '孫',
    onyomi: ['そん'],
    kunyomi: ['まご'],
    meanings: ['grandchild', 'descendants'],
    grade: 4,
    strokes: 10,
    frequencyRank: 1388,
  ),
  // upright / chastity / constancy
  '貞': KanjiReading(
    kanji: '貞',
    onyomi: ['てい', 'じょう'],
    kunyomi: ['ただし(い)', 'さだ'],
    meanings: ['upright', 'chastity', 'constancy'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1389,
  ),
  // peaceful
  '靖': KanjiReading(
    kanji: '靖',
    onyomi: ['せい', 'じょう'],
    kunyomi: ['やす(んじる)'],
    meanings: ['peaceful'],
    grade: 9,
    strokes: 13,
    frequencyRank: 1390,
  ),
  // specimen / take warning from / learn from
  '鑑': KanjiReading(
    kanji: '鑑',
    onyomi: ['かん'],
    kunyomi: ['かんが(みる)', 'かがみ'],
    meanings: ['specimen', 'take warning from', 'learn from'],
    grade: 8,
    strokes: 23,
    frequencyRank: 1391,
  ),
  // domesticate / raise / keep
  '飼': KanjiReading(
    kanji: '飼',
    onyomi: ['し'],
    kunyomi: ['か(う)'],
    meanings: ['domesticate', 'raise', 'keep'],
    grade: 5,
    strokes: 13,
    frequencyRank: 1392,
  ),
  // shade / yin / negative
  '陰': KanjiReading(
    kanji: '陰',
    onyomi: ['いん'],
    kunyomi: ['かげ', 'かげ(る)'],
    meanings: ['shade', 'yin', 'negative'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1393,
  ),
  // inscription / signature (of artisan)
  '銘': KanjiReading(
    kanji: '銘',
    onyomi: ['めい'],
    kunyomi: [],
    meanings: ['inscription', 'signature (of artisan)'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1394,
  ),
  // pointed / sharpness / edge
  '鋭': KanjiReading(
    kanji: '鋭',
    onyomi: ['えい'],
    kunyomi: ['するど(い)'],
    meanings: ['pointed', 'sharpness', 'edge'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1395,
  ),
  // follow / though / notwithstanding
  '随': KanjiReading(
    kanji: '随',
    onyomi: ['ずい'],
    kunyomi: ['まにま(に)', 'したが(う)'],
    meanings: ['follow', 'though', 'notwithstanding'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1396,
  ),
  // ardent / violent / vehement
  '烈': KanjiReading(
    kanji: '烈',
    onyomi: ['れつ'],
    kunyomi: ['はげ(しい)'],
    meanings: ['ardent', 'violent', 'vehement'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1397,
  ),
  // inquire / fathom / look for
  '尋': KanjiReading(
    kanji: '尋',
    onyomi: ['じん'],
    kunyomi: ['たず(ねる)', 'ひろ'],
    meanings: ['inquire', 'fathom', 'look for'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1398,
  ),
  // draft / copy / manuscript
  '稿': KanjiReading(
    kanji: '稿',
    onyomi: ['こう'],
    kunyomi: ['わら', 'したがき'],
    meanings: ['draft', 'copy', 'manuscript'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1400,
  ),
  // bough / branch / twig
  '枝': KanjiReading(
    kanji: '枝',
    onyomi: ['し'],
    kunyomi: ['えだ'],
    meanings: ['bough', 'branch', 'twig'],
    grade: 5,
    strokes: 8,
    frequencyRank: 1401,
  ),
  // rust-colored / 红 / red lead
  '丹': KanjiReading(
    kanji: '丹',
    onyomi: ['たん'],
    kunyomi: ['に'],
    meanings: ['rust-colored', '红', 'red lead'],
    grade: 8,
    strokes: 4,
    frequencyRank: 1402,
  ),
  // disclose / 开 / 说
  '啓': KanjiReading(
    kanji: '啓',
    onyomi: ['けい'],
    kunyomi: ['ひら(く)', 'さと(す)'],
    meanings: ['disclose', '开', '说'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1403,
  ),
  // to be (classical)
  '也': KanjiReading(
    kanji: '也',
    onyomi: ['や', 'え'],
    kunyomi: ['なり', 'か', 'また'],
    meanings: ['to be (classical)'],
    grade: 9,
    strokes: 3,
    frequencyRank: 1404,
  ),
  // hill / knoll
  '丘': KanjiReading(
    kanji: '丘',
    onyomi: ['きゅう'],
    kunyomi: ['おか'],
    meanings: ['hill', 'knoll'],
    grade: 8,
    strokes: 5,
    frequencyRank: 1405,
  ),
  // ridgepole / ridge
  '棟': KanjiReading(
    kanji: '棟',
    onyomi: ['とう'],
    kunyomi: ['むね', '(むな)'],
    meanings: ['ridgepole', 'ridge'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1406,
  ),
  // lot / 土 / soil
  '壌': KanjiReading(
    kanji: '壌',
    onyomi: ['じょう'],
    kunyomi: ['つち'],
    meanings: ['lot', '土', 'soil'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1407,
  ),
  // cartoon / involuntarily / unrestrained
  '漫': KanjiReading(
    kanji: '漫',
    onyomi: ['まん'],
    kunyomi: ['みだり(に)', 'そぞ(ろ)'],
    meanings: ['cartoon', 'involuntarily', 'unrestrained'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1408,
  ),
  // mysterious / occultness / 黑
  '玄': KanjiReading(
    kanji: '玄',
    onyomi: ['げん'],
    kunyomi: ['くろ', 'くろ(い)'],
    meanings: ['mysterious', 'occultness', '黑'],
    grade: 8,
    strokes: 5,
    frequencyRank: 1409,
  ),
  // sticky / glutinous / greasy
  '粘': KanjiReading(
    kanji: '粘',
    onyomi: ['ねん'],
    kunyomi: ['ねば(る)'],
    meanings: ['sticky', 'glutinous', 'greasy'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1410,
  ),
  // enlightenment / perceive / discern
  '悟': KanjiReading(
    kanji: '悟',
    onyomi: ['ご'],
    kunyomi: ['さと(る)'],
    meanings: ['enlightenment', 'perceive', 'discern'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1411,
  ),
  // 商店 / store / pave
  '舗': KanjiReading(
    kanji: '舗',
    onyomi: ['ほ'],
    kunyomi: [],
    meanings: ['商店', 'store', 'pave'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1412,
  ),
  // pregnancy
  '妊': KanjiReading(
    kanji: '妊',
    onyomi: ['にん', 'じん'],
    kunyomi: ['はら(む)', 'みごも(る)'],
    meanings: ['pregnancy'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1413,
  ),
  // 绘画 / plaster / daub
  '塗': KanjiReading(
    kanji: '塗',
    onyomi: ['と'],
    kunyomi: ['ぬ(る)', 'ぬ(り)', 'まみ(れる)'],
    meanings: ['绘画', 'plaster', 'daub'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1414,
  ),
  // mellow / ripen / mature
  '熟': KanjiReading(
    kanji: '熟',
    onyomi: ['じゅく'],
    kunyomi: ['う(れる)'],
    meanings: ['mellow', 'ripen', 'mature'],
    grade: 6,
    strokes: 15,
    frequencyRank: 1415,
  ),
  // flats / counter for houses / eaves
  '軒': KanjiReading(
    kanji: '軒',
    onyomi: ['けん'],
    kunyomi: ['のき'],
    meanings: ['flats', 'counter for houses', 'eaves'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1416,
  ),
  // rising sun / morning sun
  '旭': KanjiReading(
    kanji: '旭',
    onyomi: ['きょく'],
    kunyomi: ['あさひ'],
    meanings: ['rising sun', 'morning sun'],
    grade: 9,
    strokes: 6,
    frequencyRank: 1417,
  ),
  // grace / kindness / goodness
  '恩': KanjiReading(
    kanji: '恩',
    onyomi: ['おん'],
    kunyomi: [],
    meanings: ['grace', 'kindness', 'goodness'],
    grade: 6,
    strokes: 10,
    frequencyRank: 1418,
  ),
  // poison / virus / venom
  '毒': KanjiReading(
    kanji: '毒',
    onyomi: ['どく'],
    kunyomi: [],
    meanings: ['poison', 'virus', 'venom'],
    grade: 5,
    strokes: 8,
    frequencyRank: 1419,
  ),
  // leaping up / jumping up / rising
  '騰': KanjiReading(
    kanji: '騰',
    onyomi: ['とう'],
    kunyomi: ['あが(る)', 'のぼ(る)'],
    meanings: ['leaping up', 'jumping up', 'rising'],
    grade: 8,
    strokes: 20,
    frequencyRank: 1420,
  ),
  // journey / travel / chase away
  '往': KanjiReading(
    kanji: '往',
    onyomi: ['おう'],
    kunyomi: ['い(く)', 'いにしえ', 'さき(に)', 'ゆ(く)'],
    meanings: ['journey', 'travel', 'chase away'],
    grade: 5,
    strokes: 8,
    frequencyRank: 1421,
  ),
  // beans / pea / midget
  '豆': KanjiReading(
    kanji: '豆',
    onyomi: ['とう', 'ず'],
    kunyomi: ['まめ', '(まめ)'],
    meanings: ['beans', 'pea', 'midget'],
    grade: 3,
    strokes: 7,
    frequencyRank: 1422,
  ),
  // consummate / accomplish / attain
  '遂': KanjiReading(
    kanji: '遂',
    onyomi: ['すい'],
    kunyomi: ['と(げる)', 'つい(に)'],
    meanings: ['consummate', 'accomplish', 'attain'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1423,
  ),
  // nightfall / 夜晚
  '晩': KanjiReading(
    kanji: '晩',
    onyomi: ['ばん'],
    kunyomi: [],
    meanings: ['nightfall', '夜晚'],
    grade: 6,
    strokes: 12,
    frequencyRank: 1424,
  ),
  // lunatic / insane / crazy
  '狂': KanjiReading(
    kanji: '狂',
    onyomi: ['きょう'],
    kunyomi: ['くる(う)', 'くる(おしい)', 'くるお(しい)'],
    meanings: ['lunatic', 'insane', 'crazy'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1425,
  ),
  // shout / exclaim / yell
  '叫': KanjiReading(
    kanji: '叫',
    onyomi: ['きょう'],
    kunyomi: ['さけ(ぶ)'],
    meanings: ['shout', 'exclaim', 'yell'],
    grade: 8,
    strokes: 6,
    frequencyRank: 1426,
  ),
  // horse chestnut / (kokuji)
  '栃': KanjiReading(
    kanji: '栃',
    onyomi: [],
    kunyomi: ['とち'],
    meanings: ['horse chestnut', '(kokuji)'],
    grade: 4,
    strokes: 9,
    frequencyRank: 1427,
  ),
  // branch off / fork in road / scene
  '岐': KanjiReading(
    kanji: '岐',
    onyomi: ['き', 'ぎ'],
    kunyomi: [],
    meanings: ['branch off', 'fork in road', 'scene'],
    grade: 4,
    strokes: 7,
    frequencyRank: 1428,
  ),
  // highness / steps (of throne)
  '陛': KanjiReading(
    kanji: '陛',
    onyomi: ['へい'],
    kunyomi: [],
    meanings: ['highness', 'steps (of throne)'],
    grade: 6,
    strokes: 10,
    frequencyRank: 1429,
  ),
  // horizontal / woof / left &amp; right
  '緯': KanjiReading(
    kanji: '緯',
    onyomi: ['い'],
    kunyomi: ['よこいと', 'ぬき'],
    meanings: ['horizontal', 'woof', 'left &amp; right'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1430,
  ),
  // cultivate / foster
  '培': KanjiReading(
    kanji: '培',
    onyomi: ['ばい'],
    kunyomi: ['つちか(う)'],
    meanings: ['cultivate', 'foster'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1431,
  ),
  // decline / wane / weaken
  '衰': KanjiReading(
    kanji: '衰',
    onyomi: ['すい'],
    kunyomi: ['おとろ(える)'],
    meanings: ['decline', 'wane', 'weaken'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1432,
  ),
  // rowboat / small boat
  '艇': KanjiReading(
    kanji: '艇',
    onyomi: ['てい'],
    kunyomi: [],
    meanings: ['rowboat', 'small boat'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1433,
  ),
  // yield / bend / flinch
  '屈': KanjiReading(
    kanji: '屈',
    onyomi: ['くつ'],
    kunyomi: ['かが(む)', 'かが(める)'],
    meanings: ['yield', 'bend', 'flinch'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1434,
  ),
  // diameter / path / method
  '径': KanjiReading(
    kanji: '径',
    onyomi: ['けい'],
    kunyomi: ['みち', 'こみち', 'さしわたし', 'ただちに'],
    meanings: ['diameter', 'path', 'method'],
    grade: 4,
    strokes: 8,
    frequencyRank: 1435,
  ),
  // 薄 / faint / pale
  '淡': KanjiReading(
    kanji: '淡',
    onyomi: ['たん'],
    kunyomi: ['あわ(い)'],
    meanings: ['薄', 'faint', 'pale'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1436,
  ),
  // pluck / 拉 / extract
  '抽': KanjiReading(
    kanji: '抽',
    onyomi: ['ちゅう'],
    kunyomi: ['(ひき)'],
    meanings: ['pluck', '拉', 'extract'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1437,
  ),
  // expose / 开
  '披': KanjiReading(
    kanji: '披',
    onyomi: ['ひ'],
    kunyomi: [],
    meanings: ['expose', '开'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1438,
  ),
  // courts / imperial court / government office
  '廷': KanjiReading(
    kanji: '廷',
    onyomi: ['てい'],
    kunyomi: [],
    meanings: ['courts', 'imperial court', 'government office'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1439,
  ),
  // brocade / fine dress / honors
  '錦': KanjiReading(
    kanji: '錦',
    onyomi: ['きん'],
    kunyomi: ['にしき'],
    meanings: ['brocade', 'fine dress', 'honors'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1440,
  ),
  // quasi- / semi- / associate
  '准': KanjiReading(
    kanji: '准',
    onyomi: ['じゅん'],
    kunyomi: [],
    meanings: ['quasi-', 'semi-', 'associate'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1441,
  ),
  // sultry / 热 / summer heat
  '暑': KanjiReading(
    kanji: '暑',
    onyomi: ['しょ'],
    kunyomi: ['あつ(い)'],
    meanings: ['sultry', '热', 'summer heat'],
    grade: 3,
    strokes: 12,
    frequencyRank: 1442,
  ),
  // worship / adore / pray to
  '拝': KanjiReading(
    kanji: '拝',
    onyomi: ['はい'],
    kunyomi: ['おが(む)', 'おろが(む)'],
    meanings: ['worship', 'adore', 'pray to'],
    grade: 6,
    strokes: 8,
    frequencyRank: 1443,
  ),
  // seashore / beach
  '磯': KanjiReading(
    kanji: '磯',
    onyomi: ['き'],
    kunyomi: ['いそ'],
    meanings: ['seashore', 'beach'],
    grade: 9,
    strokes: 17,
    frequencyRank: 1444,
  ),
  // exhort / urge / encourage
  '奨': KanjiReading(
    kanji: '奨',
    onyomi: ['しょう', 'そう'],
    kunyomi: ['すす(める)'],
    meanings: ['exhort', 'urge', 'encourage'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1445,
  ),
  // 妹妹
  '妹': KanjiReading(
    kanji: '妹',
    onyomi: ['まい'],
    kunyomi: ['いもうと'],
    meanings: ['妹妹'],
    grade: 2,
    strokes: 8,
    frequencyRank: 1446,
  ),
  // immersed / soak / dip
  '浸': KanjiReading(
    kanji: '浸',
    onyomi: ['しん'],
    kunyomi: ['ひた(す)', 'ひた(る)', 'つ(かる)'],
    meanings: ['immersed', 'soak', 'dip'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1447,
  ),
  // surplus / besides
  '剰': KanjiReading(
    kanji: '剰',
    onyomi: ['じょう'],
    kunyomi: ['あまつさえ', 'あま(り)', 'あま(る)'],
    meanings: ['surplus', 'besides'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1448,
  ),
  // gall bladder / courage / pluck
  '胆': KanjiReading(
    kanji: '胆',
    onyomi: ['たん'],
    kunyomi: ['きも'],
    meanings: ['gall bladder', 'courage', 'pluck'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1449,
  ),
  // icicle / ice / hail
  '氷': KanjiReading(
    kanji: '氷',
    onyomi: ['ひょう'],
    kunyomi: ['こおり', 'ひ', 'こお(る)'],
    meanings: ['icicle', 'ice', 'hail'],
    grade: 3,
    strokes: 5,
    frequencyRank: 1450,
  ),
  // slender / fine / thin kimono
  '繊': KanjiReading(
    kanji: '繊',
    onyomi: ['せん'],
    kunyomi: [],
    meanings: ['slender', 'fine', 'thin kimono'],
    grade: 8,
    strokes: 17,
    frequencyRank: 1451,
  ),
  // pony / 马 / colt
  '駒': KanjiReading(
    kanji: '駒',
    onyomi: ['く'],
    kunyomi: ['こま'],
    meanings: ['pony', '马', 'colt'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1452,
  ),
  // drought / dry / desiccate
  '乾': KanjiReading(
    kanji: '乾',
    onyomi: ['かん', 'けん'],
    kunyomi: ['かわ(く)', 'かわ(かす)', 'ほ(す)', 'ひ(る)', 'いぬい'],
    meanings: ['drought', 'dry', 'desiccate'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1453,
  ),
  // void / emptiness / unpreparedness
  '虚': KanjiReading(
    kanji: '虚',
    onyomi: ['きょ', 'こ'],
    kunyomi: ['むな(しい)', 'うつ(ろ)'],
    meanings: ['void', 'emptiness', 'unpreparedness'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1454,
  ),
  // rod / stick / cane
  '棒': KanjiReading(
    kanji: '棒',
    onyomi: ['ぼう'],
    kunyomi: [],
    meanings: ['rod', 'stick', 'cane'],
    grade: 6,
    strokes: 12,
    frequencyRank: 1455,
  ),
  // 冷
  '寒': KanjiReading(
    kanji: '寒',
    onyomi: ['かん'],
    kunyomi: ['さむ(い)'],
    meanings: ['冷'],
    grade: 3,
    strokes: 12,
    frequencyRank: 1456,
  ),
  // industriousness
  '孜': KanjiReading(
    kanji: '孜',
    onyomi: ['し'],
    kunyomi: ['つと(める)'],
    meanings: ['industriousness'],
    grade: 9,
    strokes: 7,
    frequencyRank: 1457,
  ),
  // spirits / soul
  '霊': KanjiReading(
    kanji: '霊',
    onyomi: ['れい', 'りょう'],
    kunyomi: ['たま'],
    meanings: ['spirits', 'soul'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1458,
  ),
  // notebook / account book / album
  '帳': KanjiReading(
    kanji: '帳',
    onyomi: ['ちょう'],
    kunyomi: ['とばり'],
    meanings: ['notebook', 'account book', 'album'],
    grade: 3,
    strokes: 11,
    frequencyRank: 1459,
  ),
  // repent / regret
  '悔': KanjiReading(
    kanji: '悔',
    onyomi: ['かい'],
    kunyomi: ['く(いる)', 'く(やむ)', 'くや(しい)'],
    meanings: ['repent', 'regret'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1460,
  ),
  // rebuke / admonish / charge
  '諭': KanjiReading(
    kanji: '諭',
    onyomi: ['ゆ'],
    kunyomi: ['さと(す)'],
    meanings: ['rebuke', 'admonish', 'charge'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1461,
  ),
  // pray / wish
  '祈': KanjiReading(
    kanji: '祈',
    onyomi: ['き'],
    kunyomi: ['いの(る)'],
    meanings: ['pray', 'wish'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1462,
  ),
  // wretched / disaster / cruelty
  '惨': KanjiReading(
    kanji: '惨',
    onyomi: ['さん', 'ざん'],
    kunyomi: ['みじ(め)', 'いた(む)', 'むご(い)'],
    meanings: ['wretched', 'disaster', 'cruelty'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1463,
  ),
  // tyrannize / oppress
  '虐': KanjiReading(
    kanji: '虐',
    onyomi: ['ぎゃく'],
    kunyomi: ['しいた(げる)'],
    meanings: ['tyrannize', 'oppress'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1464,
  ),
  // flip / turn over / wave
  '翻': KanjiReading(
    kanji: '翻',
    onyomi: ['ほん', 'はん'],
    kunyomi: ['ひるがえ(る)', 'ひるがえ(す)'],
    meanings: ['flip', 'turn over', 'wave'],
    grade: 8,
    strokes: 18,
    frequencyRank: 1465,
  ),
  // crash / fall (down)
  '墜': KanjiReading(
    kanji: '墜',
    onyomi: ['つい'],
    kunyomi: ['お(ちる)', 'お(つ)'],
    meanings: ['crash', 'fall (down)'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1466,
  ),
  // marsh / lake / bog
  '沼': KanjiReading(
    kanji: '沼',
    onyomi: ['しょう'],
    kunyomi: ['ぬま'],
    meanings: ['marsh', 'lake', 'bog'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1467,
  ),
  // set / lay a foundation / install
  '据': KanjiReading(
    kanji: '据',
    onyomi: ['きょ'],
    kunyomi: ['す(える)', 'す(わる)'],
    meanings: ['set', 'lay a foundation', 'install'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1468,
  ),
  // fertilizer / get fat / fertile
  '肥': KanjiReading(
    kanji: '肥',
    onyomi: ['ひ'],
    kunyomi: ['こ(える)', 'こえ', 'こ(やす)', 'こ(やし)', 'ふと(る)'],
    meanings: ['fertilizer', 'get fat', 'fertile'],
    grade: 5,
    strokes: 8,
    frequencyRank: 1469,
  ),
  // gradually / slowly / deliberately
  '徐': KanjiReading(
    kanji: '徐',
    onyomi: ['じょ'],
    kunyomi: ['おもむ(ろに)'],
    meanings: ['gradually', 'slowly', 'deliberately'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1470,
  ),
  // sugar
  '糖': KanjiReading(
    kanji: '糖',
    onyomi: ['とう'],
    kunyomi: [],
    meanings: ['sugar'],
    grade: 6,
    strokes: 16,
    frequencyRank: 1471,
  ),
  // board / load (a vehicle) / ride
  '搭': KanjiReading(
    kanji: '搭',
    onyomi: ['とう'],
    kunyomi: [],
    meanings: ['board', 'load (a vehicle)', 'ride'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1472,
  ),
  // 姐姐
  '姉': KanjiReading(
    kanji: '姉',
    onyomi: ['し'],
    kunyomi: ['あね', 'はは'],
    meanings: ['姐姐'],
    grade: 2,
    strokes: 8,
    frequencyRank: 1473,
  ),
  // hair of the head
  '髪': KanjiReading(
    kanji: '髪',
    onyomi: ['はつ'],
    kunyomi: ['かみ'],
    meanings: ['hair of the head'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1474,
  ),
  // busy / occupied / restless
  '忙': KanjiReading(
    kanji: '忙',
    onyomi: ['ぼう', 'もう'],
    kunyomi: ['いそが(しい)', 'せわ(しい)', 'おそ(れる)', 'うれえるさま'],
    meanings: ['busy', 'occupied', 'restless'],
    grade: 8,
    strokes: 6,
    frequencyRank: 1475,
  ),
  // shield / escutcheon / pretext
  '盾': KanjiReading(
    kanji: '盾',
    onyomi: ['じゅん'],
    kunyomi: ['たて'],
    meanings: ['shield', 'escutcheon', 'pretext'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1476,
  ),
  // vein / pulse / hope
  '脈': KanjiReading(
    kanji: '脈',
    onyomi: ['みゃく'],
    kunyomi: ['すじ'],
    meanings: ['vein', 'pulse', 'hope'],
    grade: 5,
    strokes: 10,
    frequencyRank: 1477,
  ),
  // waterfall / rapids / cascade
  '滝': KanjiReading(
    kanji: '滝',
    onyomi: ['ろう', 'そう'],
    kunyomi: ['たき'],
    meanings: ['waterfall', 'rapids', 'cascade'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1478,
  ),
  // pick up / gather / find
  '拾': KanjiReading(
    kanji: '拾',
    onyomi: ['しゅう', 'じゅう'],
    kunyomi: ['ひろ(う)'],
    meanings: ['pick up', 'gather', 'find'],
    grade: 3,
    strokes: 9,
    frequencyRank: 1479,
  ),
  // rut / wheel / track
  '軌': KanjiReading(
    kanji: '軌',
    onyomi: ['き'],
    kunyomi: [],
    meanings: ['rut', 'wheel', 'track'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1480,
  ),
  // bag / bale / sack
  '俵': KanjiReading(
    kanji: '俵',
    onyomi: ['ひょう'],
    kunyomi: ['たわら'],
    meanings: ['bag', 'bale', 'sack'],
    grade: 6,
    strokes: 10,
    frequencyRank: 1481,
  ),
  // disturb / prevent / hamper
  '妨': KanjiReading(
    kanji: '妨',
    onyomi: ['ぼう'],
    kunyomi: ['さまた(げる)'],
    meanings: ['disturb', 'prevent', 'hamper'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1482,
  ),
  // flour / powder / dust
  '粉': KanjiReading(
    kanji: '粉',
    onyomi: ['ふん'],
    kunyomi: ['デシメートル', 'こ', 'こな'],
    meanings: ['flour', 'powder', 'dust'],
    grade: 5,
    strokes: 10,
    frequencyRank: 1484,
  ),
  // grate / rub / scratch
  '擦': KanjiReading(
    kanji: '擦',
    onyomi: ['さつ'],
    kunyomi: ['す(る)', 'す(れる)', 'ず(れ)', 'こす(る)', 'こす(れる)'],
    meanings: ['grate', 'rub', 'scratch'],
    grade: 8,
    strokes: 17,
    frequencyRank: 1485,
  ),
  // whale
  '鯨': KanjiReading(
    kanji: '鯨',
    onyomi: ['げい'],
    kunyomi: ['くじら'],
    meanings: ['whale'],
    grade: 8,
    strokes: 19,
    frequencyRank: 1486,
  ),
  // Sino- / China
  '漢': KanjiReading(
    kanji: '漢',
    onyomi: ['かん'],
    kunyomi: [],
    meanings: ['Sino-', 'China'],
    grade: 3,
    strokes: 13,
    frequencyRank: 1487,
  ),
  // thread
  '糸': KanjiReading(
    kanji: '糸',
    onyomi: ['し'],
    kunyomi: ['いと'],
    meanings: ['thread'],
    grade: 1,
    strokes: 6,
    frequencyRank: 1488,
  ),
  // villa / inn / cottage
  '荘': KanjiReading(
    kanji: '荘',
    onyomi: ['そう', 'しょう', 'ちゃん'],
    kunyomi: ['ほうき', 'おごそ(か)'],
    meanings: ['villa', 'inn', 'cottage'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1489,
  ),
  // consent / assent / agreement
  '諾': KanjiReading(
    kanji: '諾',
    onyomi: ['だく'],
    kunyomi: [],
    meanings: ['consent', 'assent', 'agreement'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1490,
  ),
  // thunder / lightning bolt
  '雷': KanjiReading(
    kanji: '雷',
    onyomi: ['らい'],
    kunyomi: ['かみなり', 'いかずち', 'いかづち'],
    meanings: ['thunder', 'lightning bolt'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1491,
  ),
  // drift / float (on liquid)
  '漂': KanjiReading(
    kanji: '漂',
    onyomi: ['ひょう'],
    kunyomi: ['ただよ(う)'],
    meanings: ['drift', 'float (on liquid)'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1492,
  ),
  // feelings / 心 / yearn
  '懐': KanjiReading(
    kanji: '懐',
    onyomi: ['かい', 'え'],
    kunyomi: ['ふところ', 'なつ(かしい)', 'なつ(かしむ)', 'なつ(く)', 'なつ(ける)', 'なず(ける)', 'いだ(く)', 'おも(う)'],
    meanings: ['feelings', '心', 'yearn'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1493,
  ),
  // intuition / perception / check
  '勘': KanjiReading(
    kanji: '勘',
    onyomi: ['かん'],
    kunyomi: [],
    meanings: ['intuition', 'perception', 'check'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1494,
  ),
  // cotton
  '綿': KanjiReading(
    kanji: '綿',
    onyomi: ['めん'],
    kunyomi: ['わた'],
    meanings: ['cotton'],
    grade: 5,
    strokes: 14,
    frequencyRank: 1495,
  ),
  // plantation / planting
  '栽': KanjiReading(
    kanji: '栽',
    onyomi: ['さい'],
    kunyomi: [],
    meanings: ['plantation', 'planting'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1496,
  ),
  // genius / years old / cubic shaku
  '才': KanjiReading(
    kanji: '才',
    onyomi: ['さい'],
    kunyomi: [],
    meanings: ['genius', 'years old', 'cubic shaku'],
    grade: 2,
    strokes: 3,
    frequencyRank: 1497,
  ),
  // kidnap / falsify
  '拐': KanjiReading(
    kanji: '拐',
    onyomi: ['かい'],
    kunyomi: [],
    meanings: ['kidnap', 'falsify'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1498,
  ),
  // bamboo hat / one's influence
  '笠': KanjiReading(
    kanji: '笠',
    onyomi: ['りゅう'],
    kunyomi: ['かさ'],
    meanings: ['bamboo hat', 'one\'s influence'],
    grade: 9,
    strokes: 11,
    frequencyRank: 1499,
  ),
  // burdensome / pack horse / horse load
  '駄': KanjiReading(
    kanji: '駄',
    onyomi: ['だ', 'た'],
    kunyomi: [],
    meanings: ['burdensome', 'pack horse', 'horse load'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1500,
  ),
  // annexed / accompany / marry
  '添': KanjiReading(
    kanji: '添',
    onyomi: ['てん'],
    kunyomi: ['そ(える)', 'そ(う)'],
    meanings: ['annexed', 'accompany', 'marry'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1501,
  ),
  // sweat / perspire
  '汗': KanjiReading(
    kanji: '汗',
    onyomi: ['かん'],
    kunyomi: ['あせ'],
    meanings: ['sweat', 'perspire'],
    grade: 8,
    strokes: 6,
    frequencyRank: 1502,
  ),
  // crown / best / peerless
  '冠': KanjiReading(
    kanji: '冠',
    onyomi: ['かん'],
    kunyomi: ['かんむり'],
    meanings: ['crown', 'best', 'peerless'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1503,
  ),
  // diagonal / slanting / oblique
  '斜': KanjiReading(
    kanji: '斜',
    onyomi: ['しゃ'],
    kunyomi: ['なな(め)', 'はす'],
    meanings: ['diagonal', 'slanting', 'oblique'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1504,
  ),
  // copper
  '銅': KanjiReading(
    kanji: '銅',
    onyomi: ['どう'],
    kunyomi: ['あかがね'],
    meanings: ['copper'],
    grade: 5,
    strokes: 14,
    frequencyRank: 1505,
  ),
  // mirror / speculum / barrel-head
  '鏡': KanjiReading(
    kanji: '鏡',
    onyomi: ['きょう', 'けい'],
    kunyomi: ['かがみ'],
    meanings: ['mirror', 'speculum', 'barrel-head'],
    grade: 4,
    strokes: 19,
    frequencyRank: 1506,
  ),
  // wise / fast learner
  '聡': KanjiReading(
    kanji: '聡',
    onyomi: ['そう'],
    kunyomi: ['さと(い)', 'みみざと(い)'],
    meanings: ['wise', 'fast learner'],
    grade: 9,
    strokes: 14,
    frequencyRank: 1507,
  ),
  // wandering / waves / billows
  '浪': KanjiReading(
    kanji: '浪',
    onyomi: ['ろう'],
    kunyomi: [],
    meanings: ['wandering', 'waves', 'billows'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1508,
  ),
  // Asia / rank next / come after
  '亜': KanjiReading(
    kanji: '亜',
    onyomi: ['あ'],
    kunyomi: ['つ(ぐ)'],
    meanings: ['Asia', 'rank next', 'come after'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1509,
  ),
  // perusal / 看
  '覧': KanjiReading(
    kanji: '覧',
    onyomi: ['らん'],
    kunyomi: ['み(る)'],
    meanings: ['perusal', '看'],
    grade: 6,
    strokes: 17,
    frequencyRank: 1510,
  ),
  // 谎言 / falsehood / deceive
  '詐': KanjiReading(
    kanji: '詐',
    onyomi: ['さ'],
    kunyomi: ['いつわ(る)'],
    meanings: ['谎言', 'falsehood', 'deceive'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1511,
  ),
  // podium / stage / rostrum
  '壇': KanjiReading(
    kanji: '壇',
    onyomi: ['だん', 'たん'],
    kunyomi: [],
    meanings: ['podium', 'stage', 'rostrum'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1512,
  ),
  // meritorious deed / merit
  '勲': KanjiReading(
    kanji: '勲',
    onyomi: ['くん'],
    kunyomi: ['いさお'],
    meanings: ['meritorious deed', 'merit'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1513,
  ),
  // witch / demon / evil spirit
  '魔': KanjiReading(
    kanji: '魔',
    onyomi: ['ま'],
    kunyomi: [],
    meanings: ['witch', 'demon', 'evil spirit'],
    grade: 8,
    strokes: 21,
    frequencyRank: 1514,
  ),
  // repay / reward / retribution
  '酬': KanjiReading(
    kanji: '酬',
    onyomi: ['しゅう', 'しゅ', 'とう'],
    kunyomi: ['むく(いる)'],
    meanings: ['repay', 'reward', 'retribution'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1515,
  ),
  // purple / violet
  '紫': KanjiReading(
    kanji: '紫',
    onyomi: ['し'],
    kunyomi: ['むらさき'],
    meanings: ['purple', 'violet'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1516,
  ),
  // damp / wet / moist
  '湿': KanjiReading(
    kanji: '湿',
    onyomi: ['しつ', 'しゅう'],
    kunyomi: ['しめ(る)', 'しめ(す)', 'うるお(う)', 'うるお(す)'],
    meanings: ['damp', 'wet', 'moist'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1517,
  ),
  // dawn / daybreak
  '曙': KanjiReading(
    kanji: '曙',
    onyomi: ['しょ'],
    kunyomi: ['あけぼの'],
    meanings: ['dawn', 'daybreak'],
    grade: 9,
    strokes: 17,
    frequencyRank: 1518,
  ),
  // family crest / figures
  '紋': KanjiReading(
    kanji: '紋',
    onyomi: ['もん'],
    kunyomi: [],
    meanings: ['family crest', 'figures'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1519,
  ),
  // wholesale
  '卸': KanjiReading(
    kanji: '卸',
    onyomi: ['しゃ'],
    kunyomi: ['おろ(す)', 'おろし', 'おろ(し)'],
    meanings: ['wholesale'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1520,
  ),
  // stirred up / be invigorated / flourish
  '奮': KanjiReading(
    kanji: '奮',
    onyomi: ['ふん'],
    kunyomi: ['ふる(う)'],
    meanings: ['stirred up', 'be invigorated', 'flourish'],
    grade: 6,
    strokes: 16,
    frequencyRank: 1521,
  ),
  // column / handrail / blank
  '欄': KanjiReading(
    kanji: '欄',
    onyomi: ['らん'],
    kunyomi: ['てすり'],
    meanings: ['column', 'handrail', 'blank'],
    grade: 8,
    strokes: 20,
    frequencyRank: 1523,
  ),
  // deviate / idleness / leisure
  '逸': KanjiReading(
    kanji: '逸',
    onyomi: ['いつ'],
    kunyomi: ['そ(れる)', 'そ(らす)', 'はぐ(れる)'],
    meanings: ['deviate', 'idleness', 'leisure'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1524,
  ),
  // horizon / shore / limit
  '涯': KanjiReading(
    kanji: '涯',
    onyomi: ['がい'],
    kunyomi: ['はて'],
    meanings: ['horizon', 'shore', 'limit'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1525,
  ),
  // clear (the land) / 开 / break up (land)
  '拓': KanjiReading(
    kanji: '拓',
    onyomi: ['たく'],
    kunyomi: ['ひら(く)'],
    meanings: ['clear (the land)', '开', 'break up (land)'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1526,
  ),
  // eyeball
  '眼': KanjiReading(
    kanji: '眼',
    onyomi: ['がん', 'げん'],
    kunyomi: ['まなこ', 'め'],
    meanings: ['eyeball'],
    grade: 5,
    strokes: 11,
    frequencyRank: 1527,
  ),
  // bottle / vial / jar
  '瓶': KanjiReading(
    kanji: '瓶',
    onyomi: ['びん', 'へい'],
    kunyomi: ['かめ'],
    meanings: ['bottle', 'vial', 'jar'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1528,
  ),
  // prison / jail
  '獄': KanjiReading(
    kanji: '獄',
    onyomi: ['ごく'],
    kunyomi: [],
    meanings: ['prison', 'jail'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1529,
  ),
  // an ancient musical instrument
  '筑': KanjiReading(
    kanji: '筑',
    onyomi: ['ちく'],
    kunyomi: [],
    meanings: ['an ancient musical instrument'],
    grade: 9,
    strokes: 12,
    frequencyRank: 1530,
  ),
  // esteem / furthermore / still
  '尚': KanjiReading(
    kanji: '尚',
    onyomi: ['しょう'],
    kunyomi: ['なお'],
    meanings: ['esteem', 'furthermore', 'still'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1531,
  ),
  // hill / mound / left village radical (no. 170)
  '阜': KanjiReading(
    kanji: '阜',
    onyomi: ['ふ', 'ふう'],
    kunyomi: [],
    meanings: ['hill', 'mound', 'left village radical (no. 170)'],
    grade: 4,
    strokes: 8,
    frequencyRank: 1532,
  ),
  // carve / engrave / chisel
  '彫': KanjiReading(
    kanji: '彫',
    onyomi: ['ちょう'],
    kunyomi: ['ほ(る)', 'ぼ(り)'],
    meanings: ['carve', 'engrave', 'chisel'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1533,
  ),
  // blossom / bloom
  '咲': KanjiReading(
    kanji: '咲',
    onyomi: ['しょう'],
    kunyomi: ['さ(く)', '(ざき)'],
    meanings: ['blossom', 'bloom'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1534,
  ),
  // calm / quiet / moderation
  '穏': KanjiReading(
    kanji: '穏',
    onyomi: ['おん'],
    kunyomi: ['おだ(やか)'],
    meanings: ['calm', 'quiet', 'moderation'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1535,
  ),
  // appear / existing
  '顕': KanjiReading(
    kanji: '顕',
    onyomi: ['けん'],
    kunyomi: ['あきらか', 'あらわ(れる)'],
    meanings: ['appear', 'existing'],
    grade: 8,
    strokes: 18,
    frequencyRank: 1536,
  ),
  // adroit / skilled / ingenuity
  '巧': KanjiReading(
    kanji: '巧',
    onyomi: ['こう'],
    kunyomi: ['たく(み)', 'たく(む)', 'うま(い)'],
    meanings: ['adroit', 'skilled', 'ingenuity'],
    grade: 8,
    strokes: 5,
    frequencyRank: 1537,
  ),
  // halberd / arms / festival float
  '矛': KanjiReading(
    kanji: '矛',
    onyomi: ['む', 'ぼう'],
    kunyomi: ['ほこ'],
    meanings: ['halberd', 'arms', 'festival float'],
    grade: 8,
    strokes: 5,
    frequencyRank: 1538,
  ),
  // hedge / fence / 墙
  '垣': KanjiReading(
    kanji: '垣',
    onyomi: ['えん'],
    kunyomi: ['かき'],
    meanings: ['hedge', 'fence', '墙'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1539,
  ),
  // seduce / call / send for
  '召': KanjiReading(
    kanji: '召',
    onyomi: ['しょう'],
    kunyomi: ['め(す)'],
    meanings: ['seduce', 'call', 'send for'],
    grade: 8,
    strokes: 5,
    frequencyRank: 1540,
  ),
  // deceit / cheat / delude
  '欺': KanjiReading(
    kanji: '欺',
    onyomi: ['ぎ'],
    kunyomi: ['あざむ(く)'],
    meanings: ['deceit', 'cheat', 'delude'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1541,
  ),
  // angling / 鱼 / catch
  '釣': KanjiReading(
    kanji: '釣',
    onyomi: ['ちょう'],
    kunyomi: ['つ(る)', 'つ(り)'],
    meanings: ['angling', '鱼', 'catch'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1542,
  ),
  // tin can / container / jar radical (no. 121)
  '缶': KanjiReading(
    kanji: '缶',
    onyomi: ['かん'],
    kunyomi: ['かま'],
    meanings: ['tin can', 'container', 'jar radical (no. 121)'],
    grade: 8,
    strokes: 6,
    frequencyRank: 1543,
  ),
  // bush clover
  '萩': KanjiReading(
    kanji: '萩',
    onyomi: ['しゅう'],
    kunyomi: ['はぎ'],
    meanings: ['bush clover'],
    grade: 9,
    strokes: 12,
    frequencyRank: 1544,
  ),
  // cosmetics / adorn (one's person)
  '粧': KanjiReading(
    kanji: '粧',
    onyomi: ['しょう'],
    kunyomi: [],
    meanings: ['cosmetics', 'adorn (one\'s person)'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1545,
  ),
  // vessels / counter for ships / 鱼
  '隻': KanjiReading(
    kanji: '隻',
    onyomi: ['せき'],
    kunyomi: [],
    meanings: ['vessels', 'counter for ships', '鱼'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1546,
  ),
  // arrowroot / kudzu
  '葛': KanjiReading(
    kanji: '葛',
    onyomi: ['かつ', 'かち'],
    kunyomi: ['つづら', 'くず'],
    meanings: ['arrowroot', 'kudzu'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1547,
  ),
  // fat / grease / tallow
  '脂': KanjiReading(
    kanji: '脂',
    onyomi: ['し'],
    kunyomi: ['あぶら'],
    meanings: ['fat', 'grease', 'tallow'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1548,
  ),
  // solemn / quietly / softly
  '粛': KanjiReading(
    kanji: '粛',
    onyomi: ['しゅく', 'すく'],
    kunyomi: ['つつし(む)'],
    meanings: ['solemn', 'quietly', 'softly'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1549,
  ),
  // chestnut
  '栗': KanjiReading(
    kanji: '栗',
    onyomi: ['りつ', 'り'],
    kunyomi: ['くり', 'おののく'],
    meanings: ['chestnut'],
    grade: 9,
    strokes: 10,
    frequencyRank: 1550,
  ),
  // foolish / folly / absurdity
  '愚': KanjiReading(
    kanji: '愚',
    onyomi: ['ぐ'],
    kunyomi: ['おろ(か)'],
    meanings: ['foolish', 'folly', 'absurdity'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1551,
  ),
  // steam / heat / sultry
  '蒸': KanjiReading(
    kanji: '蒸',
    onyomi: ['じょう', 'せい'],
    kunyomi: ['む(す)', 'む(れる)', 'む(らす)'],
    meanings: ['steam', 'heat', 'sultry'],
    grade: 6,
    strokes: 13,
    frequencyRank: 1552,
  ),
  // applaud / praise / esteem
  '嘉': KanjiReading(
    kanji: '嘉',
    onyomi: ['か'],
    kunyomi: ['よみ(する)', 'よい'],
    meanings: ['applaud', 'praise', 'esteem'],
    grade: 9,
    strokes: 14,
    frequencyRank: 1553,
  ),
  // encounter / 见面 / party
  '遭': KanjiReading(
    kanji: '遭',
    onyomi: ['そう'],
    kunyomi: ['あ(う)', 'あ(わせる)'],
    meanings: ['encounter', '见面', 'party'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1554,
  ),
  // erect / frame / mount
  '架': KanjiReading(
    kanji: '架',
    onyomi: ['か'],
    kunyomi: ['か(ける)', 'か(かる)'],
    meanings: ['erect', 'frame', 'mount'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1555,
  ),
  // bamboo grass
  '篠': KanjiReading(
    kanji: '篠',
    onyomi: ['ぞう', 'しょう'],
    kunyomi: ['しの', 'ささ', 'すず'],
    meanings: ['bamboo grass'],
    grade: 9,
    strokes: 17,
    frequencyRank: 1556,
  ),
  // ghost / devil
  '鬼': KanjiReading(
    kanji: '鬼',
    onyomi: ['き'],
    kunyomi: ['おに', '(おに)'],
    meanings: ['ghost', 'devil'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1557,
  ),
  // commoner / 全部 / bastard
  '庶': KanjiReading(
    kanji: '庶',
    onyomi: ['しょ'],
    kunyomi: [],
    meanings: ['commoner', '全部', 'bastard'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1558,
  ),
  // texture / skin / 身体
  '肌': KanjiReading(
    kanji: '肌',
    onyomi: ['き'],
    kunyomi: ['はだ'],
    meanings: ['texture', 'skin', '身体'],
    grade: 8,
    strokes: 6,
    frequencyRank: 1559,
  ),
  // immature / young
  '稚': KanjiReading(
    kanji: '稚',
    onyomi: ['ち', 'じ'],
    kunyomi: ['いとけない', 'おさない', 'おくて', 'おでる'],
    meanings: ['immature', 'young'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1560,
  ),
  // shoes
  '靴': KanjiReading(
    kanji: '靴',
    onyomi: ['か'],
    kunyomi: ['くつ'],
    meanings: ['shoes'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1561,
  ),
  // sedge
  '菅': KanjiReading(
    kanji: '菅',
    onyomi: ['かん', 'けん'],
    kunyomi: ['すげ'],
    meanings: ['sedge'],
    grade: 9,
    strokes: 11,
    frequencyRank: 1562,
  ),
  // nourishing / more &amp; more / be luxuriant
  '滋': KanjiReading(
    kanji: '滋',
    onyomi: ['じ', 'し'],
    kunyomi: [],
    meanings: ['nourishing', 'more &amp; more', 'be luxuriant'],
    grade: 4,
    strokes: 12,
    frequencyRank: 1563,
  ),
  // phantasm / vision / dream
  '幻': KanjiReading(
    kanji: '幻',
    onyomi: ['げん'],
    kunyomi: ['まぼろし'],
    meanings: ['phantasm', 'vision', 'dream'],
    grade: 8,
    strokes: 4,
    frequencyRank: 1564,
  ),
  // boil / cook
  '煮': KanjiReading(
    kanji: '煮',
    onyomi: ['しゃ'],
    kunyomi: ['に(る)', '(に)', 'に(える)', 'に(やす)'],
    meanings: ['boil', 'cook'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1565,
  ),
  // princess
  '姫': KanjiReading(
    kanji: '姫',
    onyomi: ['き'],
    kunyomi: ['ひめ', '(ひめ)'],
    meanings: ['princess'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1566,
  ),
  // vow / swear / pledge
  '誓': KanjiReading(
    kanji: '誓',
    onyomi: ['せい'],
    kunyomi: ['ちか(う)'],
    meanings: ['vow', 'swear', 'pledge'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1567,
  ),
  // till / plow / cultivate
  '耕': KanjiReading(
    kanji: '耕',
    onyomi: ['こう'],
    kunyomi: ['たがや(す)'],
    meanings: ['till', 'plow', 'cultivate'],
    grade: 5,
    strokes: 10,
    frequencyRank: 1568,
  ),
  // grasp / faggot / bunch
  '把': KanjiReading(
    kanji: '把',
    onyomi: ['は', 'わ'],
    kunyomi: [],
    meanings: ['grasp', 'faggot', 'bunch'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1569,
  ),
  // tread / step on / trample
  '践': KanjiReading(
    kanji: '践',
    onyomi: ['せん'],
    kunyomi: ['ふ(む)'],
    meanings: ['tread', 'step on', 'trample'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1570,
  ),
  // display / offer / present
  '呈': KanjiReading(
    kanji: '呈',
    onyomi: ['てい'],
    kunyomi: [],
    meanings: ['display', 'offer', 'present'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1571,
  ),
  // alienate / rough / neglect
  '疎': KanjiReading(
    kanji: '疎',
    onyomi: ['そ', 'しょ'],
    kunyomi: ['うと(い)', 'うと(む)', 'まば(ら)'],
    meanings: ['alienate', 'rough', 'neglect'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1572,
  ),
  // face-up / look up / depend
  '仰': KanjiReading(
    kanji: '仰',
    onyomi: ['ぎょう', 'こう'],
    kunyomi: ['あお(ぐ)', 'おお(せ)', 'お(っしゃる)', 'おっしゃ(る)'],
    meanings: ['face-up', 'look up', 'depend'],
    grade: 8,
    strokes: 6,
    frequencyRank: 1573,
  ),
  // dull / 慢 / foolish
  '鈍': KanjiReading(
    kanji: '鈍',
    onyomi: ['どん'],
    kunyomi: ['にぶ(い)', 'にぶ(る)', '(にぶ)', 'なま(る)', 'なまく(ら)'],
    meanings: ['dull', '慢', 'foolish'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1574,
  ),
  // shame / dishonor
  '恥': KanjiReading(
    kanji: '恥',
    onyomi: ['ち'],
    kunyomi: ['は(じる)', 'はじ', 'は(じらう)', 'は(ずかしい)'],
    meanings: ['shame', 'dishonor'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1575,
  ),
  // sturdy / 力量
  '剛': KanjiReading(
    kanji: '剛',
    onyomi: ['ごう'],
    kunyomi: [],
    meanings: ['sturdy', '力量'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1576,
  ),
  // rapidly
  '疾': KanjiReading(
    kanji: '疾',
    onyomi: ['しつ'],
    kunyomi: ['はや(い)'],
    meanings: ['rapidly'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1577,
  ),
  // subjugate / attack the rebellious / collect taxes
  '征': KanjiReading(
    kanji: '征',
    onyomi: ['せい'],
    kunyomi: [],
    meanings: ['subjugate', 'attack the rebellious', 'collect taxes'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1578,
  ),
  // smash / 打破 / crush
  '砕': KanjiReading(
    kanji: '砕',
    onyomi: ['さい'],
    kunyomi: ['くだ(く)', 'くだ(ける)'],
    meanings: ['smash', '打破', 'crush'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1579,
  ),
  // 歌 / 唱 / ballad
  '謡': KanjiReading(
    kanji: '謡',
    onyomi: ['よう'],
    kunyomi: ['うた(い)', 'うた(う)'],
    meanings: ['歌', '唱', 'ballad'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1580,
  ),
  // marry into / bride
  '嫁': KanjiReading(
    kanji: '嫁',
    onyomi: ['か'],
    kunyomi: ['よめ', 'とつ(ぐ)', 'い(く)', 'ゆ(く)'],
    meanings: ['marry into', 'bride'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1581,
  ),
  // self-effacing / humble oneself / condescend
  '謙': KanjiReading(
    kanji: '謙',
    onyomi: ['けん'],
    kunyomi: ['へりくだ(る)'],
    meanings: ['self-effacing', 'humble oneself', 'condescend'],
    grade: 8,
    strokes: 17,
    frequencyRank: 1582,
  ),
  // empress / queen / 后
  '后': KanjiReading(
    kanji: '后',
    onyomi: ['こう', 'ご'],
    kunyomi: ['きさき'],
    meanings: ['empress', 'queen', '后'],
    grade: 6,
    strokes: 6,
    frequencyRank: 1583,
  ),
  // sigh / lament / moan
  '嘆': KanjiReading(
    kanji: '嘆',
    onyomi: ['たん'],
    kunyomi: ['なげ(く)', 'なげ(かわしい)'],
    meanings: ['sigh', 'lament', 'moan'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1584,
  ),
  // crotch / thigh / groin
  '俣': KanjiReading(
    kanji: '俣',
    onyomi: [],
    kunyomi: ['また'],
    meanings: ['crotch', 'thigh', 'groin'],
    grade: 9,
    strokes: 9,
    frequencyRank: 1585,
  ),
  // germ / fungus / bacteria
  '菌': KanjiReading(
    kanji: '菌',
    onyomi: ['きん'],
    kunyomi: [],
    meanings: ['germ', 'fungus', 'bacteria'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1586,
  ),
  // sickle / scythe / trick
  '鎌': KanjiReading(
    kanji: '鎌',
    onyomi: ['れん', 'けん'],
    kunyomi: ['かま'],
    meanings: ['sickle', 'scythe', 'trick'],
    grade: 8,
    strokes: 18,
    frequencyRank: 1587,
  ),
  // nest / rookery / hive
  '巣': KanjiReading(
    kanji: '巣',
    onyomi: ['そう'],
    kunyomi: ['す', 'す(くう)'],
    meanings: ['nest', 'rookery', 'hive'],
    grade: 4,
    strokes: 11,
    frequencyRank: 1588,
  ),
  // mud / mire / adhere to
  '泥': KanjiReading(
    kanji: '泥',
    onyomi: ['でい', 'ない', 'で', 'に'],
    kunyomi: ['どろ', 'なず(む)'],
    meanings: ['mud', 'mire', 'adhere to'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1589,
  ),
  // repeatedly / recur
  '頻': KanjiReading(
    kanji: '頻',
    onyomi: ['ひん'],
    kunyomi: ['しき(りに)'],
    meanings: ['repeatedly', 'recur'],
    grade: 8,
    strokes: 17,
    frequencyRank: 1590,
  ),
  // harp / koto
  '琴': KanjiReading(
    kanji: '琴',
    onyomi: ['きん', 'ごん'],
    kunyomi: ['こと'],
    meanings: ['harp', 'koto'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1591,
  ),
  // squad / corps / unit
  '班': KanjiReading(
    kanji: '班',
    onyomi: ['はん'],
    kunyomi: [],
    meanings: ['squad', 'corps', 'unit'],
    grade: 6,
    strokes: 10,
    frequencyRank: 1592,
  ),
  // abyss / edge / deep pool
  '淵': KanjiReading(
    kanji: '淵',
    onyomi: ['えん', 'かく', 'こう'],
    kunyomi: ['ふち', 'かた(い)', 'はなわ'],
    meanings: ['abyss', 'edge', 'deep pool'],
    grade: 9,
    strokes: 12,
    frequencyRank: 1593,
  ),
  // shelf / ledge / rack
  '棚': KanjiReading(
    kanji: '棚',
    onyomi: ['ほう'],
    kunyomi: ['たな', '(だな)'],
    meanings: ['shelf', 'ledge', 'rack'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1594,
  ),
  // undefiled / pure / 干净
  '潔': KanjiReading(
    kanji: '潔',
    onyomi: ['けつ'],
    kunyomi: ['いさぎよ(い)'],
    meanings: ['undefiled', 'pure', '干净'],
    grade: 5,
    strokes: 15,
    frequencyRank: 1595,
  ),
  // cruel / severe / atrocious
  '酷': KanjiReading(
    kanji: '酷',
    onyomi: ['こく'],
    kunyomi: ['ひど(い)'],
    meanings: ['cruel', 'severe', 'atrocious'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1596,
  ),
  // superintend / manager / 规则
  '宰': KanjiReading(
    kanji: '宰',
    onyomi: ['さい'],
    kunyomi: [],
    meanings: ['superintend', 'manager', '规则'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1597,
  ),
  // corridor / hall / tower
  '廊': KanjiReading(
    kanji: '廊',
    onyomi: ['ろう'],
    kunyomi: [],
    meanings: ['corridor', 'hall', 'tower'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1598,
  ),
  // loneliness / quietly / mellow
  '寂': KanjiReading(
    kanji: '寂',
    onyomi: ['じゃく', 'せき'],
    kunyomi: ['さび', 'さび(しい)', 'さび(れる)', 'さみ(しい)'],
    meanings: ['loneliness', 'quietly', 'mellow'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1599,
  ),
  // sign of the dragon / 7-9AM / fifth sign of Chinese zodiac
  '辰': KanjiReading(
    kanji: '辰',
    onyomi: ['しん', 'じん'],
    kunyomi: ['たつ'],
    meanings: ['sign of the dragon', '7-9AM', 'fifth sign of Chinese zodiac'],
    grade: 9,
    strokes: 7,
    frequencyRank: 1600,
  ),
  // corner / nook
  '隅': KanjiReading(
    kanji: '隅',
    onyomi: ['ぐう'],
    kunyomi: ['すみ'],
    meanings: ['corner', 'nook'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1601,
  ),
  // accidentally / even number / couple
  '偶': KanjiReading(
    kanji: '偶',
    onyomi: ['ぐう'],
    kunyomi: ['たま'],
    meanings: ['accidentally', 'even number', 'couple'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1602,
  ),
  // be hazy / grow dim / blurred
  '霞': KanjiReading(
    kanji: '霞',
    onyomi: ['か', 'げ'],
    kunyomi: ['かすみ', 'かす(む)'],
    meanings: ['be hazy', 'grow dim', 'blurred'],
    grade: 9,
    strokes: 17,
    frequencyRank: 1603,
  ),
  // prostrated / bend down / bow
  '伏': KanjiReading(
    kanji: '伏',
    onyomi: ['ふく'],
    kunyomi: ['ふ(せる)', 'ふ(す)'],
    meanings: ['prostrated', 'bend down', 'bow'],
    grade: 8,
    strokes: 6,
    frequencyRank: 1604,
  ),
  // lamp / a light / 光
  '灯': KanjiReading(
    kanji: '灯',
    onyomi: ['とう'],
    kunyomi: ['ひ', '(ほ)', 'ともしび', 'とも(す)', 'あかり'],
    meanings: ['lamp', 'a light', '光'],
    grade: 4,
    strokes: 6,
    frequencyRank: 1605,
  ),
  // oak / cypress
  '柏': KanjiReading(
    kanji: '柏',
    onyomi: ['はく', 'ひゃく', 'びゃく'],
    kunyomi: ['かしわ'],
    meanings: ['oak', 'cypress'],
    grade: 9,
    strokes: 9,
    frequencyRank: 1606,
  ),
  // spicy / bitter / 热
  '辛': KanjiReading(
    kanji: '辛',
    onyomi: ['しん'],
    kunyomi: ['から(い)', 'つら(い)', 'づら(い)', 'かのと'],
    meanings: ['spicy', 'bitter', '热'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1607,
  ),
  // grind / polish / scour
  '磨': KanjiReading(
    kanji: '磨',
    onyomi: ['ま'],
    kunyomi: ['みが(く)', 'す(る)'],
    meanings: ['grind', 'polish', 'scour'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1608,
  ),
  // 去
  '碁': KanjiReading(
    kanji: '碁',
    onyomi: ['ご'],
    kunyomi: [],
    meanings: ['去'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1609,
  ),
  // vulgar / customs / manners
  '俗': KanjiReading(
    kanji: '俗',
    onyomi: ['ぞく'],
    kunyomi: [],
    meanings: ['vulgar', 'customs', 'manners'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1610,
  ),
  // vague / obscure / desert
  '漠': KanjiReading(
    kanji: '漠',
    onyomi: ['ばく'],
    kunyomi: [],
    meanings: ['vague', 'obscure', 'desert'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1611,
  ),
  // wicked / injustice / 错误
  '邪': KanjiReading(
    kanji: '邪',
    onyomi: ['じゃ'],
    kunyomi: ['よこし(ま)'],
    meanings: ['wicked', 'injustice', '错误'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1612,
  ),
  // sparkle / clear / crystal
  '晶': KanjiReading(
    kanji: '晶',
    onyomi: ['しょう'],
    kunyomi: [],
    meanings: ['sparkle', 'clear', 'crystal'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1613,
  ),
  // crossing / crossroad / street corners
  '辻': KanjiReading(
    kanji: '辻',
    onyomi: [],
    kunyomi: ['つじ'],
    meanings: ['crossing', 'crossroad', 'street corners'],
    grade: 9,
    strokes: 5,
    frequencyRank: 1614,
  ),
  // barley / wheat
  '麦': KanjiReading(
    kanji: '麦',
    onyomi: ['ばく'],
    kunyomi: ['むぎ'],
    meanings: ['barley', 'wheat'],
    grade: 2,
    strokes: 7,
    frequencyRank: 1615,
  ),
  // black ink / India ink / ink stick
  '墨': KanjiReading(
    kanji: '墨',
    onyomi: ['ぼく'],
    kunyomi: ['すみ'],
    meanings: ['black ink', 'India ink', 'ink stick'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1616,
  ),
  // tranquilize / ancient peace-preservation centers
  '鎮': KanjiReading(
    kanji: '鎮',
    onyomi: ['ちん'],
    kunyomi: ['しず(める)', 'しず(まる)', 'おさえ'],
    meanings: ['tranquilize', 'ancient peace-preservation centers'],
    grade: 8,
    strokes: 18,
    frequencyRank: 1617,
  ),
  // den / cave / excavation
  '洞': KanjiReading(
    kanji: '洞',
    onyomi: ['どう'],
    kunyomi: ['ほら'],
    meanings: ['den', 'cave', 'excavation'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1618,
  ),
  // perform / complete / footgear
  '履': KanjiReading(
    kanji: '履',
    onyomi: ['り'],
    kunyomi: ['は(く)'],
    meanings: ['perform', 'complete', 'footgear'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1619,
  ),
  // inferiority / be inferior to / be worse
  '劣': KanjiReading(
    kanji: '劣',
    onyomi: ['れつ'],
    kunyomi: ['おと(る)'],
    meanings: ['inferiority', 'be inferior to', 'be worse'],
    grade: 8,
    strokes: 6,
    frequencyRank: 1620,
  ),
  // what?
  '那': KanjiReading(
    kanji: '那',
    onyomi: ['な', 'だ'],
    kunyomi: ['なに', 'なんぞ', 'いかん'],
    meanings: ['what?'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1621,
  ),
  // assault / hit / beat
  '殴': KanjiReading(
    kanji: '殴',
    onyomi: ['おう'],
    kunyomi: ['なぐ(る)'],
    meanings: ['assault', 'hit', 'beat'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1622,
  ),
  // with child / pregnancy
  '娠': KanjiReading(
    kanji: '娠',
    onyomi: ['しん'],
    kunyomi: [],
    meanings: ['with child', 'pregnancy'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1623,
  ),
  // observance / offer / present
  '奉': KanjiReading(
    kanji: '奉',
    onyomi: ['ほう', 'ぶ'],
    kunyomi: ['たてまつ(る)', 'まつ(る)', 'ほう(ずる)'],
    meanings: ['observance', 'offer', 'present'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1624,
  ),
  // melancholy / grieve / lament
  '憂': KanjiReading(
    kanji: '憂',
    onyomi: ['ゆう'],
    kunyomi: ['うれ(える)', 'うれ(い)', 'う(い)', 'う(き)'],
    meanings: ['melancholy', 'grieve', 'lament'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1625,
  ),
  // crude / simple / plain
  '朴': KanjiReading(
    kanji: '朴',
    onyomi: ['ぼく'],
    kunyomi: ['ほう', 'ほお', 'えのき'],
    meanings: ['crude', 'simple', 'plain'],
    grade: 8,
    strokes: 6,
    frequencyRank: 1626,
  ),
  // pavilion / restaurant / mansion
  '亭': KanjiReading(
    kanji: '亭',
    onyomi: ['てい', 'ちん'],
    kunyomi: [],
    meanings: ['pavilion', 'restaurant', 'mansion'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1627,
  ),
  // surname
  '姓': KanjiReading(
    kanji: '姓',
    onyomi: ['せい', 'しょう'],
    kunyomi: [],
    meanings: ['surname'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1628,
  ),
  // pure
  '淳': KanjiReading(
    kanji: '淳',
    onyomi: ['じゅん', 'しゅん'],
    kunyomi: ['あつ(い)'],
    meanings: ['pure'],
    grade: 9,
    strokes: 11,
    frequencyRank: 1629,
  ),
  // reed / rush
  '荻': KanjiReading(
    kanji: '荻',
    onyomi: ['てき'],
    kunyomi: ['おぎ'],
    meanings: ['reed', 'rush'],
    grade: 9,
    strokes: 10,
    frequencyRank: 1630,
  ),
  // cylinder / pipe / tube
  '筒': KanjiReading(
    kanji: '筒',
    onyomi: ['とう'],
    kunyomi: ['つつ'],
    meanings: ['cylinder', 'pipe', 'tube'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1631,
  ),
  // nose / snout
  '鼻': KanjiReading(
    kanji: '鼻',
    onyomi: ['び'],
    kunyomi: ['はな'],
    meanings: ['nose', 'snout'],
    grade: 3,
    strokes: 14,
    frequencyRank: 1632,
  ),
  // island
  '嶋': KanjiReading(
    kanji: '嶋',
    onyomi: ['とう'],
    kunyomi: ['しま'],
    meanings: ['island'],
    grade: 10,
    strokes: 14,
    frequencyRank: 1633,
  ),
  // suspicious / mystery / apparition
  '怪': KanjiReading(
    kanji: '怪',
    onyomi: ['かい', 'け'],
    kunyomi: ['あや(しい)', 'あや(しむ)'],
    meanings: ['suspicious', 'mystery', 'apparition'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1634,
  ),
  // grains / drop / counter for tiny particles
  '粒': KanjiReading(
    kanji: '粒',
    onyomi: ['りゅう'],
    kunyomi: ['つぶ'],
    meanings: ['grains', 'drop', 'counter for tiny particles'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1635,
  ),
  // part of speech / words / poetry
  '詞': KanjiReading(
    kanji: '詞',
    onyomi: ['し'],
    kunyomi: ['ことば'],
    meanings: ['part of speech', 'words', 'poetry'],
    grade: 6,
    strokes: 12,
    frequencyRank: 1636,
  ),
  // pigeon / dove
  '鳩': KanjiReading(
    kanji: '鳩',
    onyomi: ['きゅう', 'く'],
    kunyomi: ['はと', 'あつ(める)'],
    meanings: ['pigeon', 'dove'],
    grade: 9,
    strokes: 13,
    frequencyRank: 1637,
  ),
  // 毛笔 / firewood
  '柴': KanjiReading(
    kanji: '柴',
    onyomi: ['さい', 'し'],
    kunyomi: ['しば'],
    meanings: ['毛笔', 'firewood'],
    grade: 9,
    strokes: 10,
    frequencyRank: 1638,
  ),
  // admirable / greatness / remarkable
  '偉': KanjiReading(
    kanji: '偉',
    onyomi: ['い'],
    kunyomi: ['えら(い)'],
    meanings: ['admirable', 'greatness', 'remarkable'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1639,
  ),
  // drunk / feel sick / poisoned
  '酔': KanjiReading(
    kanji: '酔',
    onyomi: ['すい'],
    kunyomi: ['よ(う)', 'よ(い)', 'よ'],
    meanings: ['drunk', 'feel sick', 'poisoned'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1640,
  ),
  // pity / be sparing of / frugal
  '惜': KanjiReading(
    kanji: '惜',
    onyomi: ['せき'],
    kunyomi: ['お(しい)', 'お(しむ)'],
    meanings: ['pity', 'be sparing of', 'frugal'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1641,
  ),
  // harvest / reap
  '穫': KanjiReading(
    kanji: '穫',
    onyomi: ['かく'],
    kunyomi: [],
    meanings: ['harvest', 'reap'],
    grade: 8,
    strokes: 18,
    frequencyRank: 1642,
  ),
  // excellent / 美丽 / 好
  '佳': KanjiReading(
    kanji: '佳',
    onyomi: ['か'],
    kunyomi: [],
    meanings: ['excellent', '美丽', '好'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1643,
  ),
  // wet / be watered / profit by
  '潤': KanjiReading(
    kanji: '潤',
    onyomi: ['じゅん'],
    kunyomi: ['うるお(う)', 'うるお(す)', 'うる(む)'],
    meanings: ['wet', 'be watered', 'profit by'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1644,
  ),
  // lament / grieve over
  '悼': KanjiReading(
    kanji: '悼',
    onyomi: ['とう'],
    kunyomi: ['いた(む)'],
    meanings: ['lament', 'grieve over'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1645,
  ),
  // destitution / scarce / limited
  '乏': KanjiReading(
    kanji: '乏',
    onyomi: ['ぼう'],
    kunyomi: ['とぼ(しい)', 'とも(しい)'],
    meanings: ['destitution', 'scarce', 'limited'],
    grade: 8,
    strokes: 4,
    frequencyRank: 1646,
  ),
  // stomach / paunch / crop
  '胃': KanjiReading(
    kanji: '胃',
    onyomi: ['い'],
    kunyomi: [],
    meanings: ['stomach', 'paunch', 'crop'],
    grade: 6,
    strokes: 9,
    frequencyRank: 1647,
  ),
  // above-stated / the said / that specific
  '該': KanjiReading(
    kanji: '該',
    onyomi: ['がい'],
    kunyomi: [],
    meanings: ['above-stated', 'the said', 'that specific'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1648,
  ),
  // proceed / get / become
  '赴': KanjiReading(
    kanji: '赴',
    onyomi: ['ふ'],
    kunyomi: ['おもむ(く)'],
    meanings: ['proceed', 'get', 'become'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1649,
  ),
  // mulberry
  '桑': KanjiReading(
    kanji: '桑',
    onyomi: ['そう'],
    kunyomi: ['くわ'],
    meanings: ['mulberry'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1650,
  ),
  // Japanese Judas-tree / cinnamon tree
  '桂': KanjiReading(
    kanji: '桂',
    onyomi: ['けい'],
    kunyomi: ['かつら'],
    meanings: ['Japanese Judas-tree', 'cinnamon tree'],
    grade: 9,
    strokes: 10,
    frequencyRank: 1651,
  ),
  // marrow / pith / essence
  '髄': KanjiReading(
    kanji: '髄',
    onyomi: ['ずい'],
    kunyomi: [],
    meanings: ['marrow', 'pith', 'essence'],
    grade: 8,
    strokes: 19,
    frequencyRank: 1652,
  ),
  // tiger / drunkard
  '虎': KanjiReading(
    kanji: '虎',
    onyomi: ['こ'],
    kunyomi: ['とら'],
    meanings: ['tiger', 'drunkard'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1653,
  ),
  // basin / lantern festival / tray
  '盆': KanjiReading(
    kanji: '盆',
    onyomi: ['ぼん'],
    kunyomi: [],
    meanings: ['basin', 'lantern festival', 'tray'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1654,
  ),
  // advance
  '晋': KanjiReading(
    kanji: '晋',
    onyomi: ['しん'],
    kunyomi: ['すす(む)'],
    meanings: ['advance'],
    grade: 9,
    strokes: 10,
    frequencyRank: 1655,
  ),
  // 耳 / ear (grain) / 头
  '穂': KanjiReading(
    kanji: '穂',
    onyomi: ['すい'],
    kunyomi: ['ほ'],
    meanings: ['耳', 'ear (grain)', '头'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1656,
  ),
  // robust / manhood / prosperity
  '壮': KanjiReading(
    kanji: '壮',
    onyomi: ['そう'],
    kunyomi: ['さかん'],
    meanings: ['robust', 'manhood', 'prosperity'],
    grade: 8,
    strokes: 6,
    frequencyRank: 1657,
  ),
  // dike / bank / embankment
  '堤': KanjiReading(
    kanji: '堤',
    onyomi: ['てい'],
    kunyomi: ['つつみ'],
    meanings: ['dike', 'bank', 'embankment'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1658,
  ),
  // hungry / starve
  '飢': KanjiReading(
    kanji: '飢',
    onyomi: ['き'],
    kunyomi: ['う(える)'],
    meanings: ['hungry', 'starve'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1659,
  ),
  // bystander / 侧面 / besides
  '傍': KanjiReading(
    kanji: '傍',
    onyomi: ['ぼう'],
    kunyomi: ['かたわ(ら)', 'わき', '(おか)', 'はた', 'そば'],
    meanings: ['bystander', '侧面', 'besides'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1660,
  ),
  // epidemic
  '疫': KanjiReading(
    kanji: '疫',
    onyomi: ['えき', 'やく'],
    kunyomi: [],
    meanings: ['epidemic'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1661,
  ),
  // accumulate / involvement / trouble
  '累': KanjiReading(
    kanji: '累',
    onyomi: ['るい'],
    kunyomi: [],
    meanings: ['accumulate', 'involvement', 'trouble'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1662,
  ),
  // stupid / foolish
  '痴': KanjiReading(
    kanji: '痴',
    onyomi: ['ち'],
    kunyomi: ['し(れる)', 'おろか'],
    meanings: ['stupid', 'foolish'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1663,
  ),
  // conveyor / 搬运 / transport
  '搬': KanjiReading(
    kanji: '搬',
    onyomi: ['はん'],
    kunyomi: [],
    meanings: ['conveyor', '搬运', 'transport'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1664,
  ),
  // tatami mat / counter for tatami mats / fold
  '畳': KanjiReading(
    kanji: '畳',
    onyomi: ['じょう', 'ちょう'],
    kunyomi: ['たた(む)', 'たたみ', 'かさ(なる)'],
    meanings: ['tatami mat', 'counter for tatami mats', 'fold'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1665,
  ),
  // clear
  '晃': KanjiReading(
    kanji: '晃',
    onyomi: ['こう'],
    kunyomi: ['あきらか'],
    meanings: ['clear'],
    grade: 9,
    strokes: 10,
    frequencyRank: 1666,
  ),
  // healing / cure / quench (thirst)
  '癒': KanjiReading(
    kanji: '癒',
    onyomi: ['ゆ'],
    kunyomi: ['い(える)', 'いや(す)', 'い(やす)'],
    meanings: ['healing', 'cure', 'quench (thirst)'],
    grade: 8,
    strokes: 18,
    frequencyRank: 1667,
  ),
  // paulownia
  '桐': KanjiReading(
    kanji: '桐',
    onyomi: ['とう', 'どう'],
    kunyomi: ['きり'],
    meanings: ['paulownia'],
    grade: 9,
    strokes: 10,
    frequencyRank: 1668,
  ),
  // measurement / tenth of a shaku / a little
  '寸': KanjiReading(
    kanji: '寸',
    onyomi: ['すん'],
    kunyomi: [],
    meanings: ['measurement', 'tenth of a shaku', 'a little'],
    grade: 6,
    strokes: 3,
    frequencyRank: 1669,
  ),
  // enclosure / quarters / fortification
  '郭': KanjiReading(
    kanji: '郭',
    onyomi: ['かく'],
    kunyomi: ['くるわ'],
    meanings: ['enclosure', 'quarters', 'fortification'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1670,
  ),
  // desk / 桌子
  '机': KanjiReading(
    kanji: '机',
    onyomi: ['き'],
    kunyomi: ['つくえ'],
    meanings: ['desk', '桌子'],
    grade: 6,
    strokes: 6,
    frequencyRank: 1671,
  ),
  // urine
  '尿': KanjiReading(
    kanji: '尿',
    onyomi: ['にょう'],
    kunyomi: ['ゆばり', 'いばり', 'しと'],
    meanings: ['urine'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1672,
  ),
  // villain / evil / bad luck
  '凶': KanjiReading(
    kanji: '凶',
    onyomi: ['きょう'],
    kunyomi: [],
    meanings: ['villain', 'evil', 'bad luck'],
    grade: 8,
    strokes: 4,
    frequencyRank: 1673,
  ),
  // spit / vomit / belch
  '吐': KanjiReading(
    kanji: '吐',
    onyomi: ['と'],
    kunyomi: ['は(く)', 'つ(く)'],
    meanings: ['spit', 'vomit', 'belch'],
    grade: 8,
    strokes: 6,
    frequencyRank: 1674,
  ),
  // banquet / feast / party
  '宴': KanjiReading(
    kanji: '宴',
    onyomi: ['えん'],
    kunyomi: ['うたげ'],
    meanings: ['banquet', 'feast', 'party'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1675,
  ),
  // hawk
  '鷹': KanjiReading(
    kanji: '鷹',
    onyomi: ['よう', 'おう'],
    kunyomi: ['たか'],
    meanings: ['hawk'],
    grade: 9,
    strokes: 24,
    frequencyRank: 1676,
  ),
  // V.I.P. / guest
  '賓': KanjiReading(
    kanji: '賓',
    onyomi: ['ひん'],
    kunyomi: ['まろうど', 'したがう'],
    meanings: ['V.I.P.', 'guest'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1677,
  ),
  // captive / barbarian / low epithet for the enemy
  '虜': KanjiReading(
    kanji: '虜',
    onyomi: ['りょ', 'ろ'],
    kunyomi: ['とりこ', 'とりく'],
    meanings: ['captive', 'barbarian', 'low epithet for the enemy'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1678,
  ),
  // skin / 身体 / grain
  '膚': KanjiReading(
    kanji: '膚',
    onyomi: ['ふ'],
    kunyomi: ['はだ'],
    meanings: ['skin', '身体', 'grain'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1679,
  ),
  // pottery / porcelain
  '陶': KanjiReading(
    kanji: '陶',
    onyomi: ['とう'],
    kunyomi: ['すえ'],
    meanings: ['pottery', 'porcelain'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1680,
  ),
  // bell / gong / chimes
  '鐘': KanjiReading(
    kanji: '鐘',
    onyomi: ['しょう'],
    kunyomi: ['かね'],
    meanings: ['bell', 'gong', 'chimes'],
    grade: 8,
    strokes: 20,
    frequencyRank: 1681,
  ),
  // remorse / regret / be sorry
  '憾': KanjiReading(
    kanji: '憾',
    onyomi: ['かん'],
    kunyomi: ['うら(む)'],
    meanings: ['remorse', 'regret', 'be sorry'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1682,
  ),
  // 首都 / suburbs of capital
  '畿': KanjiReading(
    kanji: '畿',
    onyomi: ['き'],
    kunyomi: ['みやこ'],
    meanings: ['首都', 'suburbs of capital'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1683,
  ),
  // boar
  '猪': KanjiReading(
    kanji: '猪',
    onyomi: ['ちょ'],
    kunyomi: ['い', 'いのしし'],
    meanings: ['boar'],
    grade: 9,
    strokes: 11,
    frequencyRank: 1684,
  ),
  // large
  '紘': KanjiReading(
    kanji: '紘',
    onyomi: ['こう'],
    kunyomi: ['おおづな', 'つな', 'つなぐ'],
    meanings: ['large'],
    grade: 9,
    strokes: 10,
    frequencyRank: 1685,
  ),
  // magnet / porcelain
  '磁': KanjiReading(
    kanji: '磁',
    onyomi: ['じ'],
    kunyomi: [],
    meanings: ['magnet', 'porcelain'],
    grade: 6,
    strokes: 14,
    frequencyRank: 1686,
  ),
  // all the more / increasingly
  '弥': KanjiReading(
    kanji: '弥',
    onyomi: ['み', 'び'],
    kunyomi: ['や', 'いや', 'いよ(いよ)', 'わた(る)'],
    meanings: ['all the more', 'increasingly'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1687,
  ),
  // descendants / 哥哥 / 昆虫
  '昆': KanjiReading(
    kanji: '昆',
    onyomi: ['こん'],
    kunyomi: [],
    meanings: ['descendants', '哥哥', '昆虫'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1688,
  ),
  // coarse / rough / rugged
  '粗': KanjiReading(
    kanji: '粗',
    onyomi: ['そ'],
    kunyomi: ['あら(い)', '(あら)'],
    meanings: ['coarse', 'rough', 'rugged'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1689,
  ),
  // revise / 正确 / 决定
  '訂': KanjiReading(
    kanji: '訂',
    onyomi: ['てい'],
    kunyomi: ['ただ(す)'],
    meanings: ['revise', '正确', '决定'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1690,
  ),
  // bud / sprout / spear
  '芽': KanjiReading(
    kanji: '芽',
    onyomi: ['が'],
    kunyomi: ['め'],
    meanings: ['bud', 'sprout', 'spear'],
    grade: 4,
    strokes: 8,
    frequencyRank: 1691,
  ),
  // buttocks / hips / butt
  '尻': KanjiReading(
    kanji: '尻',
    onyomi: ['こう'],
    kunyomi: ['しり'],
    meanings: ['buttocks', 'hips', 'butt'],
    grade: 8,
    strokes: 5,
    frequencyRank: 1692,
  ),
  // level / in the country / manor
  '庄': KanjiReading(
    kanji: '庄',
    onyomi: ['しょう', 'そ', 'そう', 'ほう'],
    kunyomi: [],
    meanings: ['level', 'in the country', 'manor'],
    grade: 9,
    strokes: 6,
    frequencyRank: 1693,
  ),
  // umbrella
  '傘': KanjiReading(
    kanji: '傘',
    onyomi: ['さん'],
    kunyomi: ['かさ'],
    meanings: ['umbrella'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1694,
  ),
  // industry / kindliness
  '敦': KanjiReading(
    kanji: '敦',
    onyomi: ['とん', 'たい', 'だん', 'ちょう'],
    kunyomi: ['あつ(い)'],
    meanings: ['industry', 'kindliness'],
    grade: 9,
    strokes: 12,
    frequencyRank: 1695,
  ),
  // equestrian / riding on horses / counter for equestrians
  '騎': KanjiReading(
    kanji: '騎',
    onyomi: ['き'],
    kunyomi: [],
    meanings: ['equestrian', 'riding on horses', 'counter for equestrians'],
    grade: 8,
    strokes: 18,
    frequencyRank: 1696,
  ),
  // rather / preferably / peaceful
  '寧': KanjiReading(
    kanji: '寧',
    onyomi: ['ねい'],
    kunyomi: ['むし(ろ)'],
    meanings: ['rather', 'preferably', 'peaceful'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1697,
  ),
  // laundry / wash / pour on
  '濯': KanjiReading(
    kanji: '濯',
    onyomi: ['たく'],
    kunyomi: ['すす(ぐ)', 'ゆす(ぐ)'],
    meanings: ['laundry', 'wash', 'pour on'],
    grade: 8,
    strokes: 17,
    frequencyRank: 1698,
  ),
  // sequential / follow
  '循': KanjiReading(
    kanji: '循',
    onyomi: ['じゅん'],
    kunyomi: [],
    meanings: ['sequential', 'follow'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1699,
  ),
  // endure / bear / put up with
  '忍': KanjiReading(
    kanji: '忍',
    onyomi: ['にん'],
    kunyomi: ['しの(ぶ)', 'しの(ばせる)'],
    meanings: ['endure', 'bear', 'put up with'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1700,
  ),
  // rock / crag / cliff
  '磐': KanjiReading(
    kanji: '磐',
    onyomi: ['ばん', 'はん'],
    kunyomi: ['いわ'],
    meanings: ['rock', 'crag', 'cliff'],
    grade: 9,
    strokes: 15,
    frequencyRank: 1701,
  ),
  // 猫
  '猫': KanjiReading(
    kanji: '猫',
    onyomi: ['びょう'],
    kunyomi: ['ねこ'],
    meanings: ['猫'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1702,
  ),
  // neglect / laziness
  '怠': KanjiReading(
    kanji: '怠',
    onyomi: ['たい'],
    kunyomi: ['おこた(る)', 'なま(ける)'],
    meanings: ['neglect', 'laziness'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1703,
  ),
  // likeness / like / such as
  '如': KanjiReading(
    kanji: '如',
    onyomi: ['じょ', 'にょ'],
    kunyomi: ['ごと(し)'],
    meanings: ['likeness', 'like', 'such as'],
    grade: 8,
    strokes: 6,
    frequencyRank: 1704,
  ),
  // dormitory / hostel / villa
  '寮': KanjiReading(
    kanji: '寮',
    onyomi: ['りょう'],
    kunyomi: [],
    meanings: ['dormitory', 'hostel', 'villa'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1705,
  ),
  // 帮助
  '祐': KanjiReading(
    kanji: '祐',
    onyomi: ['ゆう', 'う'],
    kunyomi: ['たす(ける)'],
    meanings: ['帮助'],
    grade: 9,
    strokes: 9,
    frequencyRank: 1706,
  ),
  // phoenix
  '鵬': KanjiReading(
    kanji: '鵬',
    onyomi: ['ほう'],
    kunyomi: ['おおとり'],
    meanings: ['phoenix'],
    grade: 9,
    strokes: 19,
    frequencyRank: 1707,
  ),
  // pagoda / tower / steeple
  '塔': KanjiReading(
    kanji: '塔',
    onyomi: ['とう'],
    kunyomi: [],
    meanings: ['pagoda', 'tower', 'steeple'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1708,
  ),
  // seethe / boil / ferment
  '沸': KanjiReading(
    kanji: '沸',
    onyomi: ['ふつ'],
    kunyomi: ['わ(く)', 'わ(かす)'],
    meanings: ['seethe', 'boil', 'ferment'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1709,
  ),
  // lead
  '鉛': KanjiReading(
    kanji: '鉛',
    onyomi: ['えん'],
    kunyomi: ['なまり'],
    meanings: ['lead'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1710,
  ),
  // pearl / gem / jewel
  '珠': KanjiReading(
    kanji: '珠',
    onyomi: ['しゅ'],
    kunyomi: ['たま'],
    meanings: ['pearl', 'gem', 'jewel'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1711,
  ),
  // congeal / freeze / stiff
  '凝': KanjiReading(
    kanji: '凝',
    onyomi: ['ぎょう'],
    kunyomi: ['こ(る)', 'こ(らす)', 'こご(らす)', 'こご(らせる)', 'こご(る)'],
    meanings: ['congeal', 'freeze', 'stiff'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1712,
  ),
  // seedling / sapling / shoot
  '苗': KanjiReading(
    kanji: '苗',
    onyomi: ['びょう', 'みょう'],
    kunyomi: ['なえ', '(なわ)'],
    meanings: ['seedling', 'sapling', 'shoot'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1713,
  ),
  // animal / beast
  '獣': KanjiReading(
    kanji: '獣',
    onyomi: ['じゅう'],
    kunyomi: ['けもの', 'けだもの'],
    meanings: ['animal', 'beast'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1714,
  ),
  // pathetic / grief / sorrow
  '哀': KanjiReading(
    kanji: '哀',
    onyomi: ['あい'],
    kunyomi: ['あわ(れ)', 'あわ(れむ)', 'かな(しい)'],
    meanings: ['pathetic', 'grief', 'sorrow'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1715,
  ),
  // hop / leap up / 春
  '跳': KanjiReading(
    kanji: '跳',
    onyomi: ['ちょう'],
    kunyomi: ['は(ねる)', 'と(ぶ)', 'と(び)'],
    meanings: ['hop', 'leap up', '春'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1716,
  ),
  // ashes / puckery juice / cremate
  '灰': KanjiReading(
    kanji: '灰',
    onyomi: ['かい'],
    kunyomi: ['はい'],
    meanings: ['ashes', 'puckery juice', 'cremate'],
    grade: 6,
    strokes: 6,
    frequencyRank: 1717,
  ),
  // artisan / workman / carpenter
  '匠': KanjiReading(
    kanji: '匠',
    onyomi: ['しょう'],
    kunyomi: ['たくみ'],
    meanings: ['artisan', 'workman', 'carpenter'],
    grade: 8,
    strokes: 6,
    frequencyRank: 1718,
  ),
  // candy / cakes / 果
  '菓': KanjiReading(
    kanji: '菓',
    onyomi: ['か'],
    kunyomi: [],
    meanings: ['candy', 'cakes', '果'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1719,
  ),
  // droop / suspend / hang
  '垂': KanjiReading(
    kanji: '垂',
    onyomi: ['すい'],
    kunyomi: ['た(れる)', 'た(らす)', 'た(れ)', 'なんなんと(す)'],
    meanings: ['droop', 'suspend', 'hang'],
    grade: 6,
    strokes: 8,
    frequencyRank: 1720,
  ),
  // snake / serpent / hard drinker
  '蛇': KanjiReading(
    kanji: '蛇',
    onyomi: ['じゃ', 'だ', 'い', 'や'],
    kunyomi: ['へび'],
    meanings: ['snake', 'serpent', 'hard drinker'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1721,
  ),
  // lucidity / be clear / clear
  '澄': KanjiReading(
    kanji: '澄',
    onyomi: ['ちょう'],
    kunyomi: ['す(む)', 'す(ます)'],
    meanings: ['lucidity', 'be clear', 'clear'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1722,
  ),
  // sew / stitch / embroider
  '縫': KanjiReading(
    kanji: '縫',
    onyomi: ['ほう'],
    kunyomi: ['ぬ(う)'],
    meanings: ['sew', 'stitch', 'embroider'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1723,
  ),
  // Buddhist priest / monk
  '僧': KanjiReading(
    kanji: '僧',
    onyomi: ['そう'],
    kunyomi: [],
    meanings: ['Buddhist priest', 'monk'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1724,
  ),
  // how many / how much / how far
  '幾': KanjiReading(
    kanji: '幾',
    onyomi: ['き'],
    kunyomi: ['(いく)', 'いく(つ)', 'いく(ら)'],
    meanings: ['how many', 'how much', 'how far'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1725,
  ),
  // stare / watch / look at
  '眺': KanjiReading(
    kanji: '眺',
    onyomi: ['ちょう'],
    kunyomi: ['なが(める)'],
    meanings: ['stare', 'watch', 'look at'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1726,
  ),
  // T'ang / China / foreign
  '唐': KanjiReading(
    kanji: '唐',
    onyomi: ['とう'],
    kunyomi: ['から'],
    meanings: ['T\'ang', 'China', 'foreign'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1727,
  ),
  // span / range / extend over
  '亘': KanjiReading(
    kanji: '亘',
    onyomi: ['こう', 'かん', 'せん'],
    kunyomi: ['わた(る)', 'もと(める)'],
    meanings: ['span', 'range', 'extend over'],
    grade: 9,
    strokes: 6,
    frequencyRank: 1728,
  ),
  // 给 / do something for / kingdom of Wu
  '呉': KanjiReading(
    kanji: '呉',
    onyomi: ['ご'],
    kunyomi: ['く(れる)', 'くれ'],
    meanings: ['给', 'do something for', 'kingdom of Wu'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1729,
  ),
  // commonplace / ordinary / mediocre
  '凡': KanjiReading(
    kanji: '凡',
    onyomi: ['ぼん', 'はん'],
    kunyomi: ['およ(そ)', 'おうよ(そ)', 'すべ(て)'],
    meanings: ['commonplace', 'ordinary', 'mediocre'],
    grade: 8,
    strokes: 3,
    frequencyRank: 1730,
  ),
  // recess / 休息 / relax
  '憩': KanjiReading(
    kanji: '憩',
    onyomi: ['けい'],
    kunyomi: ['いこ(い)', 'いこ(う)'],
    meanings: ['recess', '休息', 'relax'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1731,
  ),
  // an ancient Chinese province
  '鄭': KanjiReading(
    kanji: '鄭',
    onyomi: ['てい', 'じょう'],
    kunyomi: [],
    meanings: ['an ancient Chinese province'],
    grade: 9,
    strokes: 15,
    frequencyRank: 1732,
  ),
  // reed / bullrush
  '芦': KanjiReading(
    kanji: '芦',
    onyomi: ['ろ'],
    kunyomi: ['あし', 'よし'],
    meanings: ['reed', 'bullrush'],
    grade: 9,
    strokes: 7,
    frequencyRank: 1733,
  ),
  // dragon / imperial
  '龍': KanjiReading(
    kanji: '龍',
    onyomi: ['りゅう', 'りょう', 'ろう'],
    kunyomi: ['たつ'],
    meanings: ['dragon', 'imperial'],
    grade: 10,
    strokes: 16,
    frequencyRank: 1734,
  ),
  // beautiful woman / princess
  '媛': KanjiReading(
    kanji: '媛',
    onyomi: ['えん'],
    kunyomi: ['ひめ'],
    meanings: ['beautiful woman', 'princess'],
    grade: 4,
    strokes: 12,
    frequencyRank: 1735,
  ),
  // gutter / ditch / sewer
  '溝': KanjiReading(
    kanji: '溝',
    onyomi: ['こう'],
    kunyomi: ['みぞ'],
    meanings: ['gutter', 'ditch', 'sewer'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1736,
  ),
  // respect / reverent
  '恭': KanjiReading(
    kanji: '恭',
    onyomi: ['きょう'],
    kunyomi: ['うやうや(しい)'],
    meanings: ['respect', 'reverent'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1737,
  ),
  // reap / 切 / clip
  '刈': KanjiReading(
    kanji: '刈',
    onyomi: ['がい', 'かい'],
    kunyomi: ['か(る)'],
    meanings: ['reap', '切', 'clip'],
    grade: 8,
    strokes: 4,
    frequencyRank: 1738,
  ),
  // drowsy / 睡 / 死
  '睡': KanjiReading(
    kanji: '睡',
    onyomi: ['すい'],
    kunyomi: ['ねむ(る)', 'ねむ(い)'],
    meanings: ['drowsy', '睡', '死'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1739,
  ),
  // confused / mix / be in disorder
  '錯': KanjiReading(
    kanji: '錯',
    onyomi: ['さく', 'しゃく'],
    kunyomi: [],
    meanings: ['confused', 'mix', 'be in disorder'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1740,
  ),
  // chief / 计数 / earl
  '伯': KanjiReading(
    kanji: '伯',
    onyomi: ['はく'],
    kunyomi: [],
    meanings: ['chief', '计数', 'earl'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1741,
  ),
  // cap / headgear
  '帽': KanjiReading(
    kanji: '帽',
    onyomi: ['ぼう', 'もう'],
    kunyomi: ['ずきん', 'おお(う)'],
    meanings: ['cap', 'headgear'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1742,
  ),
  // bamboo grass / (kokuji)
  '笹': KanjiReading(
    kanji: '笹',
    onyomi: [],
    kunyomi: ['ささ'],
    meanings: ['bamboo grass', '(kokuji)'],
    grade: 9,
    strokes: 11,
    frequencyRank: 1743,
  ),
  // cereals / grain
  '穀': KanjiReading(
    kanji: '穀',
    onyomi: ['こく'],
    kunyomi: [],
    meanings: ['cereals', 'grain'],
    grade: 6,
    strokes: 14,
    frequencyRank: 1744,
  ),
  // persimmon
  '柿': KanjiReading(
    kanji: '柿',
    onyomi: ['し'],
    kunyomi: ['かき'],
    meanings: ['persimmon'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1745,
  ),
  // mausoleum / imperial tomb / mound
  '陵': KanjiReading(
    kanji: '陵',
    onyomi: ['りょう'],
    kunyomi: ['みささぎ'],
    meanings: ['mausoleum', 'imperial tomb', 'mound'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1746,
  ),
  // fog / mist
  '霧': KanjiReading(
    kanji: '霧',
    onyomi: ['む', 'ぼう', 'ぶ'],
    kunyomi: ['きり'],
    meanings: ['fog', 'mist'],
    grade: 8,
    strokes: 19,
    frequencyRank: 1747,
  ),
  // soul / spirit
  '魂': KanjiReading(
    kanji: '魂',
    onyomi: ['こん'],
    kunyomi: ['たましい', 'たま'],
    meanings: ['soul', 'spirit'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1748,
  ),
  // wither / 死 / dry up
  '枯': KanjiReading(
    kanji: '枯',
    onyomi: ['こ'],
    kunyomi: ['か(れる)', 'か(らす)'],
    meanings: ['wither', '死', 'dry up'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1749,
  ),
  // abuse / evil / vice
  '弊': KanjiReading(
    kanji: '弊',
    onyomi: ['へい'],
    kunyomi: [],
    meanings: ['abuse', 'evil', 'vice'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1750,
  ),
  // bracelet
  '釧': KanjiReading(
    kanji: '釧',
    onyomi: ['せん'],
    kunyomi: ['くしろ', 'うでわ'],
    meanings: ['bracelet'],
    grade: 9,
    strokes: 11,
    frequencyRank: 1751,
  ),
  // queen / princess
  '妃': KanjiReading(
    kanji: '妃',
    onyomi: ['ひ'],
    kunyomi: ['きさき'],
    meanings: ['queen', 'princess'],
    grade: 8,
    strokes: 6,
    frequencyRank: 1752,
  ),
  // liner / 船
  '舶': KanjiReading(
    kanji: '舶',
    onyomi: ['はく'],
    kunyomi: [],
    meanings: ['liner', '船'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1753,
  ),
  // starve / hungry / thirst
  '餓': KanjiReading(
    kanji: '餓',
    onyomi: ['が'],
    kunyomi: ['う(える)'],
    meanings: ['starve', 'hungry', 'thirst'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1754,
  ),
  // kidney
  '腎': KanjiReading(
    kanji: '腎',
    onyomi: ['じん'],
    kunyomi: [],
    meanings: ['kidney'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1755,
  ),
  // hard up / destitute / suffer
  '窮': KanjiReading(
    kanji: '窮',
    onyomi: ['きゅう', 'きょう'],
    kunyomi: ['きわ(める)', 'きわ(まる)', 'きわ(まり)', 'きわ(み)'],
    meanings: ['hard up', 'destitute', 'suffer'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1756,
  ),
  // palm of hand / 规则 / administer
  '掌': KanjiReading(
    kanji: '掌',
    onyomi: ['しょう'],
    kunyomi: ['てのひら', 'たなごころ'],
    meanings: ['palm of hand', '规则', 'administer'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1757,
  ),
  // lovely / 美丽 / graceful
  '麗': KanjiReading(
    kanji: '麗',
    onyomi: ['れい'],
    kunyomi: ['うるわ(しい)', 'うら(らか)'],
    meanings: ['lovely', '美丽', 'graceful'],
    grade: 8,
    strokes: 19,
    frequencyRank: 1758,
  ),
  // design / figured cloth / twill
  '綾': KanjiReading(
    kanji: '綾',
    onyomi: ['りん'],
    kunyomi: ['あや'],
    meanings: ['design', 'figured cloth', 'twill'],
    grade: 9,
    strokes: 14,
    frequencyRank: 1759,
  ),
  // stinking / ill-smelling / suspicious looking
  '臭': KanjiReading(
    kanji: '臭',
    onyomi: ['しゅう'],
    kunyomi: ['くさ(い)', 'にお(う)', 'にお(い)'],
    meanings: ['stinking', 'ill-smelling', 'suspicious looking'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1760,
  ),
  // kettle / cauldron / iron pot
  '釜': KanjiReading(
    kanji: '釜',
    onyomi: ['ふ'],
    kunyomi: ['かま'],
    meanings: ['kettle', 'cauldron', 'iron pot'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1761,
  ),
  // ecstasy / joy / rapture
  '悦': KanjiReading(
    kanji: '悦',
    onyomi: ['えつ'],
    kunyomi: ['よろこ(ぶ)', 'よろこ(ばす)'],
    meanings: ['ecstasy', 'joy', 'rapture'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1762,
  ),
  // blade / sword / edge
  '刃': KanjiReading(
    kanji: '刃',
    onyomi: ['じん', 'にん'],
    kunyomi: ['は', 'やいば', 'き(る)'],
    meanings: ['blade', 'sword', 'edge'],
    grade: 8,
    strokes: 3,
    frequencyRank: 1763,
  ),
  // truss / arrest / bind
  '縛': KanjiReading(
    kanji: '縛',
    onyomi: ['ばく'],
    kunyomi: ['しば(る)'],
    meanings: ['truss', 'arrest', 'bind'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1764,
  ),
  // calendar / almanac
  '暦': KanjiReading(
    kanji: '暦',
    onyomi: ['れき', 'りゃく'],
    kunyomi: ['こよみ'],
    meanings: ['calendar', 'almanac'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1765,
  ),
  // best regards / 好
  '宜': KanjiReading(
    kanji: '宜',
    onyomi: ['ぎ'],
    kunyomi: ['よろ(しい)', 'よろ(しく)'],
    meanings: ['best regards', '好'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1766,
  ),
  // blind / blind man / ignoramus
  '盲': KanjiReading(
    kanji: '盲',
    onyomi: ['もう'],
    kunyomi: ['めくら'],
    meanings: ['blind', 'blind man', 'ignoramus'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1767,
  ),
  // chic / style / purity
  '粋': KanjiReading(
    kanji: '粋',
    onyomi: ['すい'],
    kunyomi: ['いき'],
    meanings: ['chic', 'style', 'purity'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1768,
  ),
  // embarrass / humiliate / shame
  '辱': KanjiReading(
    kanji: '辱',
    onyomi: ['じょく'],
    kunyomi: ['はずかし(める)'],
    meanings: ['embarrass', 'humiliate', 'shame'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1769,
  ),
  // 强
  '毅': KanjiReading(
    kanji: '毅',
    onyomi: ['き', 'ぎ'],
    kunyomi: ['つよ(い)'],
    meanings: ['强'],
    grade: 9,
    strokes: 15,
    frequencyRank: 1770,
  ),
  // control / wedge
  '轄': KanjiReading(
    kanji: '轄',
    onyomi: ['かつ'],
    kunyomi: ['くさび'],
    meanings: ['control', 'wedge'],
    grade: 8,
    strokes: 17,
    frequencyRank: 1771,
  ),
  // monkey
  '猿': KanjiReading(
    kanji: '猿',
    onyomi: ['えん'],
    kunyomi: ['さる'],
    meanings: ['monkey'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1772,
  ),
  // bowstring / chord / hypotenuse
  '弦': KanjiReading(
    kanji: '弦',
    onyomi: ['げん'],
    kunyomi: ['つる'],
    meanings: ['bowstring', 'chord', 'hypotenuse'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1773,
  ),
  // harvest / ripen
  '稔': KanjiReading(
    kanji: '稔',
    onyomi: ['ねん', 'じん', 'にん'],
    kunyomi: ['みの(る)', 'みのり'],
    meanings: ['harvest', 'ripen'],
    grade: 9,
    strokes: 13,
    frequencyRank: 1775,
  ),
  // plug up / obstruct
  '窒': KanjiReading(
    kanji: '窒',
    onyomi: ['ちつ'],
    kunyomi: [],
    meanings: ['plug up', 'obstruct'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1776,
  ),
  // cook / boil
  '炊': KanjiReading(
    kanji: '炊',
    onyomi: ['すい'],
    kunyomi: ['た(く)', 'だ(き)'],
    meanings: ['cook', 'boil'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1777,
  ),
  // deluge / flood / vast
  '洪': KanjiReading(
    kanji: '洪',
    onyomi: ['こう'],
    kunyomi: [],
    meanings: ['deluge', 'flood', 'vast'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1778,
  ),
  // vicarious / surrogate / act in addition to
  '摂': KanjiReading(
    kanji: '摂',
    onyomi: ['せつ', 'しょう'],
    kunyomi: ['おさ(める)', 'かね(る)', 'と(る)'],
    meanings: ['vicarious', 'surrogate', 'act in addition to'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1779,
  ),
  // sated / tired of / bored
  '飽': KanjiReading(
    kanji: '飽',
    onyomi: ['ほう'],
    kunyomi: ['あ(きる)', 'あ(かす)', 'あ(く)'],
    meanings: ['sated', 'tired of', 'bored'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1780,
  ),
  // box (archaic)
  '函': KanjiReading(
    kanji: '函',
    onyomi: ['かん'],
    kunyomi: ['はこ', 'い(れる)'],
    meanings: ['box (archaic)'],
    grade: 9,
    strokes: 8,
    frequencyRank: 1781,
  ),
  // superfluous / uselessness
  '冗': KanjiReading(
    kanji: '冗',
    onyomi: ['じょう'],
    kunyomi: [],
    meanings: ['superfluous', 'uselessness'],
    grade: 8,
    strokes: 4,
    frequencyRank: 1782,
  ),
  // refreshing / nice and cool
  '涼': KanjiReading(
    kanji: '涼',
    onyomi: ['りょう'],
    kunyomi: ['すず(しい)', 'すず(む)', 'すず(やか)', 'うす(い)', 'ひや(す)', 'まことに'],
    meanings: ['refreshing', 'nice and cool'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1783,
  ),
  // peach
  '桃': KanjiReading(
    kanji: '桃',
    onyomi: ['とう'],
    kunyomi: ['もも'],
    meanings: ['peach'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1784,
  ),
  // hunt / raid / gather
  '狩': KanjiReading(
    kanji: '狩',
    onyomi: ['しゅ'],
    kunyomi: ['か(る)', 'か(り)', 'が(り)'],
    meanings: ['hunt', 'raid', 'gather'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1785,
  ),
  // boat / 船
  '舟': KanjiReading(
    kanji: '舟',
    onyomi: ['しゅう'],
    kunyomi: ['ふね', '(ふな)', '(ぶね)'],
    meanings: ['boat', '船'],
    grade: 8,
    strokes: 6,
    frequencyRank: 1786,
  ),
  // shellfish
  '貝': KanjiReading(
    kanji: '貝',
    onyomi: ['ばい'],
    kunyomi: ['かい'],
    meanings: ['shellfish'],
    grade: 1,
    strokes: 7,
    frequencyRank: 1787,
  ),
  // vermilion / cinnabar / scarlet
  '朱': KanjiReading(
    kanji: '朱',
    onyomi: ['しゅ'],
    kunyomi: ['あけ'],
    meanings: ['vermilion', 'cinnabar', 'scarlet'],
    grade: 8,
    strokes: 6,
    frequencyRank: 1788,
  ),
  // whirlpool / eddy / vortex
  '渦': KanjiReading(
    kanji: '渦',
    onyomi: ['か'],
    kunyomi: ['うず'],
    meanings: ['whirlpool', 'eddy', 'vortex'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1789,
  ),
  // sire / good belt / gentleman
  '紳': KanjiReading(
    kanji: '紳',
    onyomi: ['しん'],
    kunyomi: [],
    meanings: ['sire', 'good belt', 'gentleman'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1790,
  ),
  // hinge / pivot / 门
  '枢': KanjiReading(
    kanji: '枢',
    onyomi: ['すう', 'しゅ'],
    kunyomi: ['とぼそ', 'からくり'],
    meanings: ['hinge', 'pivot', '门'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1791,
  ),
  // tombstone / monument
  '碑': KanjiReading(
    kanji: '碑',
    onyomi: ['ひ'],
    kunyomi: ['いしぶみ'],
    meanings: ['tombstone', 'monument'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1792,
  ),
  // forge / discipline / 火车
  '鍛': KanjiReading(
    kanji: '鍛',
    onyomi: ['たん'],
    kunyomi: ['きた(える)'],
    meanings: ['forge', 'discipline', '火车'],
    grade: 8,
    strokes: 17,
    frequencyRank: 1793,
  ),
  // sword / saber / knife
  '刀': KanjiReading(
    kanji: '刀',
    onyomi: ['とう'],
    kunyomi: ['かたな', 'そり'],
    meanings: ['sword', 'saber', 'knife'],
    grade: 2,
    strokes: 2,
    frequencyRank: 1794,
  ),
  // drum / beat / rouse
  '鼓': KanjiReading(
    kanji: '鼓',
    onyomi: ['こ'],
    kunyomi: ['つづみ'],
    meanings: ['drum', 'beat', 'rouse'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1795,
  ),
  // naked / nude / uncovered
  '裸': KanjiReading(
    kanji: '裸',
    onyomi: ['ら'],
    kunyomi: ['はだか'],
    meanings: ['naked', 'nude', 'uncovered'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1796,
  ),
  // wild duck / easy mark
  '鴨': KanjiReading(
    kanji: '鴨',
    onyomi: ['おう'],
    kunyomi: ['かも', 'あひる'],
    meanings: ['wild duck', 'easy mark'],
    grade: 9,
    strokes: 16,
    frequencyRank: 1797,
  ),
  // token / sign / mark
  '符': KanjiReading(
    kanji: '符',
    onyomi: ['ふ'],
    kunyomi: [],
    meanings: ['token', 'sign', 'mark'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1798,
  ),
  // furthermore / still / yet
  '猶': KanjiReading(
    kanji: '猶',
    onyomi: ['ゆう', 'ゆ'],
    kunyomi: ['なお'],
    meanings: ['furthermore', 'still', 'yet'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1799,
  ),
  // clod / lump / chunk
  '塊': KanjiReading(
    kanji: '塊',
    onyomi: ['かい', 'け'],
    kunyomi: ['かたまり', 'つちくれ'],
    meanings: ['clod', 'lump', 'chunk'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1800,
  ),
  // rotation / go around
  '旋': KanjiReading(
    kanji: '旋',
    onyomi: ['せん'],
    kunyomi: ['め(ぐる)', 'いばり'],
    meanings: ['rotation', 'go around'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1801,
  ),
  // bow / bow (archery, violin)
  '弓': KanjiReading(
    kanji: '弓',
    onyomi: ['きゅう'],
    kunyomi: ['ゆみ'],
    meanings: ['bow', 'bow (archery, violin)'],
    grade: 2,
    strokes: 3,
    frequencyRank: 1802,
  ),
  // cash / bad habit / humble prefix
  '幣': KanjiReading(
    kanji: '幣',
    onyomi: ['へい'],
    kunyomi: ['ぬさ'],
    meanings: ['cash', 'bad habit', 'humble prefix'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1803,
  ),
  // membrane
  '膜': KanjiReading(
    kanji: '膜',
    onyomi: ['まく'],
    kunyomi: [],
    meanings: ['membrane'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1804,
  ),
  // fan / folding fan
  '扇': KanjiReading(
    kanji: '扇',
    onyomi: ['せん'],
    kunyomi: ['おうぎ'],
    meanings: ['fan', 'folding fan'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1805,
  ),
  // armpit / the other way / another place
  '脇': KanjiReading(
    kanji: '脇',
    onyomi: ['きょう'],
    kunyomi: ['わき', 'わけ'],
    meanings: ['armpit', 'the other way', 'another place'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1806,
  ),
  // intestines / guts / bowels
  '腸': KanjiReading(
    kanji: '腸',
    onyomi: ['ちょう'],
    kunyomi: ['はらわた', 'わた'],
    meanings: ['intestines', 'guts', 'bowels'],
    grade: 6,
    strokes: 13,
    frequencyRank: 1807,
  ),
  // hate / detest
  '憎': KanjiReading(
    kanji: '憎',
    onyomi: ['ぞう'],
    kunyomi: ['にく(む)', 'にく(い)', 'にく(らしい)', 'にく(しみ)'],
    meanings: ['hate', 'detest'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1808,
  ),
  // vat / tub / tank
  '槽': KanjiReading(
    kanji: '槽',
    onyomi: ['そう'],
    kunyomi: ['ふね'],
    meanings: ['vat', 'tub', 'tank'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1809,
  ),
  // pot / pan / kettle
  '鍋': KanjiReading(
    kanji: '鍋',
    onyomi: ['か'],
    kunyomi: ['なべ'],
    meanings: ['pot', 'pan', 'kettle'],
    grade: 8,
    strokes: 17,
    frequencyRank: 1810,
  ),
  // mercy
  '慈': KanjiReading(
    kanji: '慈',
    onyomi: ['じ'],
    kunyomi: ['いつく(しむ)'],
    meanings: ['mercy'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1811,
  ),
  // dish / a helping / plate
  '皿': KanjiReading(
    kanji: '皿',
    onyomi: ['べい'],
    kunyomi: ['さら'],
    meanings: ['dish', 'a helping', 'plate'],
    grade: 3,
    strokes: 5,
    frequencyRank: 1812,
  ),
  // agreement / consent / comply with
  '肯': KanjiReading(
    kanji: '肯',
    onyomi: ['こう'],
    kunyomi: ['がえんじ(る)'],
    meanings: ['agreement', 'consent', 'comply with'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1813,
  ),
  // water pipe / gutter / downspout
  '樋': KanjiReading(
    kanji: '樋',
    onyomi: ['とう'],
    kunyomi: ['ひ', 'とい'],
    meanings: ['water pipe', 'gutter', 'downspout'],
    grade: 9,
    strokes: 14,
    frequencyRank: 1814,
  ),
  // willow
  '楊': KanjiReading(
    kanji: '楊',
    onyomi: ['よう'],
    kunyomi: ['やなぎ'],
    meanings: ['willow'],
    grade: 9,
    strokes: 13,
    frequencyRank: 1815,
  ),
  // fell / strike / 攻击
  '伐': KanjiReading(
    kanji: '伐',
    onyomi: ['ばつ', 'はつ', 'か', 'ぼち'],
    kunyomi: ['き(る)', 'そむ(く)', 'う(つ)'],
    meanings: ['fell', 'strike', '攻击'],
    grade: 8,
    strokes: 6,
    frequencyRank: 1816,
  ),
  // a good horse / speed / a fast person
  '駿': KanjiReading(
    kanji: '駿',
    onyomi: ['しゅん', 'すん'],
    kunyomi: ['すぐ(れる)'],
    meanings: ['a good horse', 'speed', 'a fast person'],
    grade: 9,
    strokes: 17,
    frequencyRank: 1817,
  ),
  // pickling / soak / moisten
  '漬': KanjiReading(
    kanji: '漬',
    onyomi: ['し'],
    kunyomi: ['つ(ける)', 'つ(かる)', 'づ(け)', '(づけ)'],
    meanings: ['pickling', 'soak', 'moisten'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1818,
  ),
  // parch / dry up
  '燥': KanjiReading(
    kanji: '燥',
    onyomi: ['そう'],
    kunyomi: ['はしゃ(ぐ)'],
    meanings: ['parch', 'dry up'],
    grade: 8,
    strokes: 17,
    frequencyRank: 1819,
  ),
  // twist / ask / investigate
  '糾': KanjiReading(
    kanji: '糾',
    onyomi: ['きゅう'],
    kunyomi: ['ただ(す)'],
    meanings: ['twist', 'ask', 'investigate'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1820,
  ),
  // clear / 帮助
  '亮': KanjiReading(
    kanji: '亮',
    onyomi: ['りょう'],
    kunyomi: ['あきらか'],
    meanings: ['clear', '帮助'],
    grade: 9,
    strokes: 9,
    frequencyRank: 1821,
  ),
  // tomb / mound
  '墳': KanjiReading(
    kanji: '墳',
    onyomi: ['ふん'],
    kunyomi: [],
    meanings: ['tomb', 'mound'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1822,
  ),
  // two-mat area / approx. thirty-six sq ft
  '坪': KanjiReading(
    kanji: '坪',
    onyomi: ['へい'],
    kunyomi: ['つぼ'],
    meanings: ['two-mat area', 'approx. thirty-six sq ft'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1823,
  ),
  // livestock / domestic fowl and animals
  '畜': KanjiReading(
    kanji: '畜',
    onyomi: ['ちく'],
    kunyomi: [],
    meanings: ['livestock', 'domestic fowl and animals'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1824,
  ),
  // dark blue / navy
  '紺': KanjiReading(
    kanji: '紺',
    onyomi: ['こん'],
    kunyomi: [],
    meanings: ['dark blue', 'navy'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1825,
  ),
  // disconcerted / be confused / lose one's head
  '慌': KanjiReading(
    kanji: '慌',
    onyomi: ['こう'],
    kunyomi: ['あわ(てる)', 'あわ(ただしい)'],
    meanings: ['disconcerted', 'be confused', 'lose one\'s head'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1826,
  ),
  // recreation / pleasure
  '娯': KanjiReading(
    kanji: '娯',
    onyomi: ['ご'],
    kunyomi: [],
    meanings: ['recreation', 'pleasure'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1827,
  ),
  // I / my / our
  '吾': KanjiReading(
    kanji: '吾',
    onyomi: ['ご'],
    kunyomi: ['われ', '(わが)', '(あ)'],
    meanings: ['I', 'my', 'our'],
    grade: 9,
    strokes: 7,
    frequencyRank: 1828,
  ),
  // camellia
  '椿': KanjiReading(
    kanji: '椿',
    onyomi: ['ちん', 'ちゅん'],
    kunyomi: ['つばき'],
    meanings: ['camellia'],
    grade: 9,
    strokes: 13,
    frequencyRank: 1829,
  ),
  // tongue / reed / clapper
  '舌': KanjiReading(
    kanji: '舌',
    onyomi: ['ぜつ'],
    kunyomi: ['した'],
    meanings: ['tongue', 'reed', 'clapper'],
    grade: 6,
    strokes: 6,
    frequencyRank: 1830,
  ),
  // gauze / thin silk / Rome
  '羅': KanjiReading(
    kanji: '羅',
    onyomi: ['ら'],
    kunyomi: ['うすもの'],
    meanings: ['gauze', 'thin silk', 'Rome'],
    grade: 8,
    strokes: 19,
    frequencyRank: 1831,
  ),
  // boy / priest's residence / priest
  '坊': KanjiReading(
    kanji: '坊',
    onyomi: ['ぼう', 'ぼっ'],
    kunyomi: [],
    meanings: ['boy', 'priest\'s residence', 'priest'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1832,
  ),
  // gorge / ravine
  '峡': KanjiReading(
    kanji: '峡',
    onyomi: ['きょう', 'こう'],
    kunyomi: ['はざま'],
    meanings: ['gorge', 'ravine'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1833,
  ),
  // stipend / salary
  '俸': KanjiReading(
    kanji: '俸',
    onyomi: ['ほう'],
    kunyomi: [],
    meanings: ['stipend', 'salary'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1834,
  ),
  // rin / 1/10 sen / 1/10 bu
  '厘': KanjiReading(
    kanji: '厘',
    onyomi: ['りん'],
    kunyomi: [],
    meanings: ['rin', '1/10 sen', '1/10 bu'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1835,
  ),
  // summit / peak
  '峰': KanjiReading(
    kanji: '峰',
    onyomi: ['ほう'],
    kunyomi: ['みね', 'ね'],
    meanings: ['summit', 'peak'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1836,
  ),
  // square jewel / corner / angle
  '圭': KanjiReading(
    kanji: '圭',
    onyomi: ['けい', 'け'],
    kunyomi: [],
    meanings: ['square jewel', 'corner', 'angle'],
    grade: 9,
    strokes: 6,
    frequencyRank: 1837,
  ),
  // brew / cause
  '醸': KanjiReading(
    kanji: '醸',
    onyomi: ['じょう'],
    kunyomi: ['かも(す)'],
    meanings: ['brew', 'cause'],
    grade: 8,
    strokes: 20,
    frequencyRank: 1838,
  ),
  // lotus
  '蓮': KanjiReading(
    kanji: '蓮',
    onyomi: ['れん'],
    kunyomi: ['はす', 'はちす'],
    meanings: ['lotus'],
    grade: 9,
    strokes: 13,
    frequencyRank: 1839,
  ),
  // condolences / mourning / funeral
  '弔': KanjiReading(
    kanji: '弔',
    onyomi: ['ちょう'],
    kunyomi: ['とむら(う)', 'とぶら(う)'],
    meanings: ['condolences', 'mourning', 'funeral'],
    grade: 8,
    strokes: 4,
    frequencyRank: 1840,
  ),
  // the latter / duplicate / strange
  '乙': KanjiReading(
    kanji: '乙',
    onyomi: ['おつ', 'いつ'],
    kunyomi: ['(おと)', 'きのと'],
    meanings: ['the latter', 'duplicate', 'strange'],
    grade: 8,
    strokes: 1,
    frequencyRank: 1841,
  ),
  // soup / juice / broth
  '汁': KanjiReading(
    kanji: '汁',
    onyomi: ['じゅう'],
    kunyomi: ['しる', '(しる)', 'つゆ'],
    meanings: ['soup', 'juice', 'broth'],
    grade: 8,
    strokes: 5,
    frequencyRank: 1843,
  ),
  // nun
  '尼': KanjiReading(
    kanji: '尼',
    onyomi: ['に'],
    kunyomi: ['あま'],
    meanings: ['nun'],
    grade: 8,
    strokes: 5,
    frequencyRank: 1844,
  ),
  // everywhere / times / widely
  '遍': KanjiReading(
    kanji: '遍',
    onyomi: ['へん'],
    kunyomi: ['あまね(く)'],
    meanings: ['everywhere', 'times', 'widely'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1845,
  ),
  // 世界
  '堺': KanjiReading(
    kanji: '堺',
    onyomi: ['かい'],
    kunyomi: ['さかい'],
    meanings: ['世界'],
    grade: 9,
    strokes: 12,
    frequencyRank: 1846,
  ),
  // equilibrium / measuring rod / scale
  '衡': KanjiReading(
    kanji: '衡',
    onyomi: ['こう'],
    kunyomi: [],
    meanings: ['equilibrium', 'measuring rod', 'scale'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1847,
  ),
  // send forth fragrance / fragrant / be scented
  '薫': KanjiReading(
    kanji: '薫',
    onyomi: ['くん'],
    kunyomi: ['かお(る)'],
    meanings: ['send forth fragrance', 'fragrant', 'be scented'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1849,
  ),
  // tile / gram
  '瓦': KanjiReading(
    kanji: '瓦',
    onyomi: ['が'],
    kunyomi: ['かわら', 'ぐらむ'],
    meanings: ['tile', 'gram'],
    grade: 8,
    strokes: 5,
    frequencyRank: 1850,
  ),
  // game-hunting / shooting / game
  '猟': KanjiReading(
    kanji: '猟',
    onyomi: ['りょう'],
    kunyomi: ['かり', 'か(る)'],
    meanings: ['game-hunting', 'shooting', 'game'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1851,
  ),
  // sheep
  '羊': KanjiReading(
    kanji: '羊',
    onyomi: ['よう'],
    kunyomi: ['ひつじ'],
    meanings: ['sheep'],
    grade: 3,
    strokes: 6,
    frequencyRank: 1852,
  ),
  // depression / cave in / sink
  '窪': KanjiReading(
    kanji: '窪',
    onyomi: ['わ', 'あ'],
    kunyomi: ['くぼ(む)', 'くぼ(み)', 'くぼ(まる)', 'くぼ'],
    meanings: ['depression', 'cave in', 'sink'],
    grade: 9,
    strokes: 14,
    frequencyRank: 1853,
  ),
  // goodwill / article / section
  '款': KanjiReading(
    kanji: '款',
    onyomi: ['かん'],
    kunyomi: [],
    meanings: ['goodwill', 'article', 'section'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1854,
  ),
  // review / inspection / revision
  '閲': KanjiReading(
    kanji: '閲',
    onyomi: ['えつ'],
    kunyomi: ['けみ(する)'],
    meanings: ['review', 'inspection', 'revision'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1855,
  ),
  // sparrow
  '雀': KanjiReading(
    kanji: '雀',
    onyomi: ['じゃく', 'じゃん', 'さく', 'しゃく'],
    kunyomi: ['すずめ'],
    meanings: ['sparrow'],
    grade: 9,
    strokes: 11,
    frequencyRank: 1856,
  ),
  // spy
  '偵': KanjiReading(
    kanji: '偵',
    onyomi: ['てい'],
    kunyomi: [],
    meanings: ['spy'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1857,
  ),
  // hoarse / scold
  '喝': KanjiReading(
    kanji: '喝',
    onyomi: ['かつ'],
    kunyomi: [],
    meanings: ['hoarse', 'scold'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1858,
  ),
  // daring / brave / bold
  '敢': KanjiReading(
    kanji: '敢',
    onyomi: ['かん'],
    kunyomi: ['あ(えて)', 'あ(えない)', 'あ(えず)'],
    meanings: ['daring', 'brave', 'bold'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1859,
  ),
  // 田地 / farm / garden
  '畠': KanjiReading(
    kanji: '畠',
    onyomi: [],
    kunyomi: ['はたけ', 'はた'],
    meanings: ['田地', 'farm', 'garden'],
    grade: 9,
    strokes: 10,
    frequencyRank: 1860,
  ),
  // womb / uterus
  '胎': KanjiReading(
    kanji: '胎',
    onyomi: ['たい'],
    kunyomi: [],
    meanings: ['womb', 'uterus'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1861,
  ),
  // fermentation
  '酵': KanjiReading(
    kanji: '酵',
    onyomi: ['こう'],
    kunyomi: [],
    meanings: ['fermentation'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1862,
  ),
  // aroused / resent / be indignant
  '憤': KanjiReading(
    kanji: '憤',
    onyomi: ['ふん'],
    kunyomi: ['いきどお(る)'],
    meanings: ['aroused', 'resent', 'be indignant'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1863,
  ),
  // pork / pig
  '豚': KanjiReading(
    kanji: '豚',
    onyomi: ['とん'],
    kunyomi: ['ぶた'],
    meanings: ['pork', 'pig'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1864,
  ),
  // intercept / interrupt / obstruct
  '遮': KanjiReading(
    kanji: '遮',
    onyomi: ['しゃ'],
    kunyomi: ['さえぎ(る)'],
    meanings: ['intercept', 'interrupt', 'obstruct'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1865,
  ),
  // front door / title page / front page
  '扉': KanjiReading(
    kanji: '扉',
    onyomi: ['ひ'],
    kunyomi: ['とびら'],
    meanings: ['front door', 'title page', 'front page'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1866,
  ),
  // sulphur
  '硫': KanjiReading(
    kanji: '硫',
    onyomi: ['りゅう'],
    kunyomi: [],
    meanings: ['sulphur'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1867,
  ),
  // pardon / forgiveness
  '赦': KanjiReading(
    kanji: '赦',
    onyomi: ['しゃ'],
    kunyomi: ['ゆる(す)'],
    meanings: ['pardon', 'forgiveness'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1868,
  ),
  // crush / 打破 / sprain
  '挫': KanjiReading(
    kanji: '挫',
    onyomi: ['ざ', 'さ'],
    kunyomi: ['くじ(く)', 'くじ(ける)'],
    meanings: ['crush', '打破', 'sprain'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1869,
  ),
  // pinch / between
  '挟': KanjiReading(
    kanji: '挟',
    onyomi: ['きょう', 'しょう'],
    kunyomi: ['はさ(む)', 'はさ(まる)', 'わきばさ(む)', 'さしはさ(む)'],
    meanings: ['pinch', 'between'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1870,
  ),
  // stealth / steal / secret
  '窃': KanjiReading(
    kanji: '窃',
    onyomi: ['せつ'],
    kunyomi: ['ぬす(む)', 'ひそ(か)'],
    meanings: ['stealth', 'steal', 'secret'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1871,
  ),
  // bubbles / foam / suds
  '泡': KanjiReading(
    kanji: '泡',
    onyomi: ['ほう'],
    kunyomi: ['あわ'],
    meanings: ['bubbles', 'foam', 'suds'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1872,
  ),
  // congratulations
  '瑞': KanjiReading(
    kanji: '瑞',
    onyomi: ['ずい', 'すい'],
    kunyomi: ['(みず)', 'しるし'],
    meanings: ['congratulations'],
    grade: 9,
    strokes: 13,
    frequencyRank: 1873,
  ),
  // or again / furthermore / on the other hand
  '又': KanjiReading(
    kanji: '又',
    onyomi: ['ゆう'],
    kunyomi: ['また', '(また)', 'また(の)'],
    meanings: ['or again', 'furthermore', 'on the other hand'],
    grade: 8,
    strokes: 2,
    frequencyRank: 1874,
  ),
  // rue / be sad / sigh
  '慨': KanjiReading(
    kanji: '慨',
    onyomi: ['がい'],
    kunyomi: ['なげ(く)'],
    meanings: ['rue', 'be sad', 'sigh'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1875,
  ),
  // spinning
  '紡': KanjiReading(
    kanji: '紡',
    onyomi: ['ぼう'],
    kunyomi: ['つむ(ぐ)'],
    meanings: ['spinning'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1876,
  ),
  // regret / bear a grudge / resentment
  '恨': KanjiReading(
    kanji: '恨',
    onyomi: ['こん'],
    kunyomi: ['うら(む)', 'うら(めしい)'],
    meanings: ['regret', 'bear a grudge', 'resentment'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1877,
  ),
  // obese / fat
  '肪': KanjiReading(
    kanji: '肪',
    onyomi: ['ぼう'],
    kunyomi: [],
    meanings: ['obese', 'fat'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1878,
  ),
  // aid / 帮助 / assist
  '扶': KanjiReading(
    kanji: '扶',
    onyomi: ['ふ'],
    kunyomi: ['たす(ける)'],
    meanings: ['aid', '帮助', 'assist'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1879,
  ),
  // frolic / 玩 / sport
  '戯': KanjiReading(
    kanji: '戯',
    onyomi: ['ぎ', 'げ'],
    kunyomi: ['たわむ(れる)', 'ざ(れる)', 'じゃ(れる)'],
    meanings: ['frolic', '玩', 'sport'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1880,
  ),
  // 五 / five-man squad / file
  '伍': KanjiReading(
    kanji: '伍',
    onyomi: ['ご'],
    kunyomi: ['いつつ'],
    meanings: ['五', 'five-man squad', 'file'],
    grade: 9,
    strokes: 6,
    frequencyRank: 1881,
  ),
  // mourning / abhor / detestable
  '忌': KanjiReading(
    kanji: '忌',
    onyomi: ['き'],
    kunyomi: ['い(む)', 'い(み)', 'い(まわしい)'],
    meanings: ['mourning', 'abhor', 'detestable'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1882,
  ),
  // voiced / uncleanness / 错误
  '濁': KanjiReading(
    kanji: '濁',
    onyomi: ['だく', 'じょく'],
    kunyomi: ['にご(る)', 'にご(す)'],
    meanings: ['voiced', 'uncleanness', '错误'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1883,
  ),
  // 跑 / bustle
  '奔': KanjiReading(
    kanji: '奔',
    onyomi: ['ほん'],
    kunyomi: ['はし(る)'],
    meanings: ['跑', 'bustle'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1884,
  ),
  // Big Dipper / ten sho (vol) / sake dipper
  '斗': KanjiReading(
    kanji: '斗',
    onyomi: ['と', 'とう'],
    kunyomi: [],
    meanings: ['Big Dipper', 'ten sho (vol)', 'sake dipper'],
    grade: 8,
    strokes: 4,
    frequencyRank: 1885,
  ),
  // orchid / Holland
  '蘭': KanjiReading(
    kanji: '蘭',
    onyomi: ['らん', 'ら'],
    kunyomi: [],
    meanings: ['orchid', 'Holland'],
    grade: 9,
    strokes: 19,
    frequencyRank: 1886,
  ),
  // bullrush / flag / cattail
  '蒲': KanjiReading(
    kanji: '蒲',
    onyomi: ['ほ', 'ぼ', 'ふ', 'ぶ'],
    kunyomi: ['がま', 'かば', 'かま'],
    meanings: ['bullrush', 'flag', 'cattail'],
    grade: 9,
    strokes: 13,
    frequencyRank: 1887,
  ),
  // swift / 快
  '迅': KanjiReading(
    kanji: '迅',
    onyomi: ['じん'],
    kunyomi: [],
    meanings: ['swift', '快'],
    grade: 8,
    strokes: 6,
    frequencyRank: 1888,
  ),
  // resemblance
  '肖': KanjiReading(
    kanji: '肖',
    onyomi: ['しょう'],
    kunyomi: ['あやか(る)'],
    meanings: ['resemblance'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1889,
  ),
  // bowl / rice tub / pot
  '鉢': KanjiReading(
    kanji: '鉢',
    onyomi: ['はち', 'はつ'],
    kunyomi: [],
    meanings: ['bowl', 'rice tub', 'pot'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1890,
  ),
  // decay / rot / remain in seclusion
  '朽': KanjiReading(
    kanji: '朽',
    onyomi: ['きゅう'],
    kunyomi: ['く(ちる)'],
    meanings: ['decay', 'rot', 'remain in seclusion'],
    grade: 8,
    strokes: 6,
    frequencyRank: 1891,
  ),
  // husk / nut shell
  '殻': KanjiReading(
    kanji: '殻',
    onyomi: ['かく', 'こく', 'ばい'],
    kunyomi: ['から', 'がら'],
    meanings: ['husk', 'nut shell'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1892,
  ),
  // enjoy / 接受 / undergo
  '享': KanjiReading(
    kanji: '享',
    onyomi: ['きょう', 'こう'],
    kunyomi: ['う(ける)'],
    meanings: ['enjoy', '接受', 'undergo'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1893,
  ),
  // Qin dynasty / name given to naturalized foreigners
  '秦': KanjiReading(
    kanji: '秦',
    onyomi: ['しん'],
    kunyomi: ['はた'],
    meanings: ['Qin dynasty', 'name given to naturalized foreigners'],
    grade: 9,
    strokes: 10,
    frequencyRank: 1894,
  ),
  // miscanthus reed
  '茅': KanjiReading(
    kanji: '茅',
    onyomi: ['ぼう', 'みょう'],
    kunyomi: ['かや', 'ちがや'],
    meanings: ['miscanthus reed'],
    grade: 9,
    strokes: 8,
    frequencyRank: 1895,
  ),
  // clan / enclosure
  '藩': KanjiReading(
    kanji: '藩',
    onyomi: ['はん'],
    kunyomi: [],
    meanings: ['clan', 'enclosure'],
    grade: 8,
    strokes: 18,
    frequencyRank: 1896,
  ),
  // sand
  '沙': KanjiReading(
    kanji: '沙',
    onyomi: ['さ', 'しゃ'],
    kunyomi: ['すな', 'よなげる'],
    meanings: ['sand'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1897,
  ),
  // 帮助
  '輔': KanjiReading(
    kanji: '輔',
    onyomi: ['ほ', 'ふ'],
    kunyomi: ['たす(ける)'],
    meanings: ['帮助'],
    grade: 9,
    strokes: 14,
    frequencyRank: 1898,
  ),
  // cloudy weather / cloud up
  '曇': KanjiReading(
    kanji: '曇',
    onyomi: ['どん'],
    kunyomi: ['くも(る)'],
    meanings: ['cloudy weather', 'cloud up'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1899,
  ),
  // mediator / go-between
  '媒': KanjiReading(
    kanji: '媒',
    onyomi: ['ばい'],
    kunyomi: ['なこうど'],
    meanings: ['mediator', 'go-between'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1900,
  ),
  // chicken
  '鶏': KanjiReading(
    kanji: '鶏',
    onyomi: ['けい'],
    kunyomi: ['にわとり', 'とり'],
    meanings: ['chicken'],
    grade: 8,
    strokes: 19,
    frequencyRank: 1901,
  ),
  // Zen / silent meditation
  '禅': KanjiReading(
    kanji: '禅',
    onyomi: ['ぜん', 'せん'],
    kunyomi: ['しずか', 'ゆず(る)'],
    meanings: ['Zen', 'silent meditation'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1902,
  ),
  // entrust / request / send a message
  '嘱': KanjiReading(
    kanji: '嘱',
    onyomi: ['しょく'],
    kunyomi: ['しょく(する)', 'たの(む)'],
    meanings: ['entrust', 'request', 'send a message'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1903,
  ),
  // trunk / torso / hull (ship)
  '胴': KanjiReading(
    kanji: '胴',
    onyomi: ['どう'],
    kunyomi: [],
    meanings: ['trunk', 'torso', 'hull (ship)'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1904,
  ),
  // enrich / wealthy / abundant
  '冨': KanjiReading(
    kanji: '冨',
    onyomi: ['ふ', 'ふう'],
    kunyomi: ['と(む)', 'とみ'],
    meanings: ['enrich', 'wealthy', 'abundant'],
    grade: 10,
    strokes: 11,
    frequencyRank: 1906,
  ),
  // transfer / alternation
  '迭': KanjiReading(
    kanji: '迭',
    onyomi: ['てつ'],
    kunyomi: [],
    meanings: ['transfer', 'alternation'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1907,
  ),
  // insert / put in / graft
  '挿': KanjiReading(
    kanji: '挿',
    onyomi: ['そう'],
    kunyomi: ['さ(す)', 'はさ(む)'],
    meanings: ['insert', 'put in', 'graft'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1908,
  ),
  // name of Chinese river / the Sagami river
  '湘': KanjiReading(
    kanji: '湘',
    onyomi: ['しょう'],
    kunyomi: [],
    meanings: ['name of Chinese river', 'the Sagami river'],
    grade: 9,
    strokes: 12,
    frequencyRank: 1909,
  ),
  // storm / tempest
  '嵐': KanjiReading(
    kanji: '嵐',
    onyomi: ['らん'],
    kunyomi: ['あらし'],
    meanings: ['storm', 'tempest'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1910,
  ),
  // chinquapin / mallet / spine
  '椎': KanjiReading(
    kanji: '椎',
    onyomi: ['つい', 'すい'],
    kunyomi: ['つち', 'う(つ)'],
    meanings: ['chinquapin', 'mallet', 'spine'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1911,
  ),
  // open sea
  '灘': KanjiReading(
    kanji: '灘',
    onyomi: ['たん', 'だん'],
    kunyomi: ['なだ', 'せ'],
    meanings: ['open sea'],
    grade: 9,
    strokes: 21,
    frequencyRank: 1912,
  ),
  // dam / prevent / stop up
  '堰': KanjiReading(
    kanji: '堰',
    onyomi: ['えん'],
    kunyomi: ['せき', 'せ(く)'],
    meanings: ['dam', 'prevent', 'stop up'],
    grade: 9,
    strokes: 12,
    frequencyRank: 1913,
  ),
  // lion
  '獅': KanjiReading(
    kanji: '獅',
    onyomi: ['し'],
    kunyomi: ['しし'],
    meanings: ['lion'],
    grade: 9,
    strokes: 13,
    frequencyRank: 1914,
  ),
  // silk
  '絹': KanjiReading(
    kanji: '絹',
    onyomi: ['けん'],
    kunyomi: ['きぬ'],
    meanings: ['silk'],
    grade: 6,
    strokes: 13,
    frequencyRank: 1916,
  ),
  // obeisance / follow / accompany
  '陪': KanjiReading(
    kanji: '陪',
    onyomi: ['ばい'],
    kunyomi: [],
    meanings: ['obeisance', 'follow', 'accompany'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1917,
  ),
  // divide
  '剖': KanjiReading(
    kanji: '剖',
    onyomi: ['ぼう'],
    kunyomi: [],
    meanings: ['divide'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1918,
  ),
  // musical score / 音乐 / note
  '譜': KanjiReading(
    kanji: '譜',
    onyomi: ['ふ'],
    kunyomi: [],
    meanings: ['musical score', '音乐', 'note'],
    grade: 8,
    strokes: 19,
    frequencyRank: 1919,
  ),
  // cultural progress / perfume
  '郁': KanjiReading(
    kanji: '郁',
    onyomi: ['いく'],
    kunyomi: [],
    meanings: ['cultural progress', 'perfume'],
    grade: 9,
    strokes: 9,
    frequencyRank: 1920,
  ),
  // permanence / distant / long time
  '悠': KanjiReading(
    kanji: '悠',
    onyomi: ['ゆう'],
    kunyomi: [],
    meanings: ['permanence', 'distant', 'long time'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1921,
  ),
  // graceful / gentle / pure
  '淑': KanjiReading(
    kanji: '淑',
    onyomi: ['しゅく'],
    kunyomi: ['しと(やか)'],
    meanings: ['graceful', 'gentle', 'pure'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1922,
  ),
  // sail
  '帆': KanjiReading(
    kanji: '帆',
    onyomi: ['はん'],
    kunyomi: ['ほ'],
    meanings: ['sail'],
    grade: 8,
    strokes: 6,
    frequencyRank: 1923,
  ),
  // daybreak / dawn / in the event
  '暁': KanjiReading(
    kanji: '暁',
    onyomi: ['ぎょう', 'きょう'],
    kunyomi: ['あかつき', 'さと(る)'],
    meanings: ['daybreak', 'dawn', 'in the event'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1924,
  ),
  // eagle
  '鷲': KanjiReading(
    kanji: '鷲',
    onyomi: ['しゅう', 'じゅ'],
    kunyomi: ['わし'],
    meanings: ['eagle'],
    grade: 9,
    strokes: 23,
    frequencyRank: 1925,
  ),
  // greatness / excellence
  '傑': KanjiReading(
    kanji: '傑',
    onyomi: ['けつ'],
    kunyomi: ['すぐ(れる)'],
    meanings: ['greatness', 'excellence'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1926,
  ),
  // camphor tree
  '楠': KanjiReading(
    kanji: '楠',
    onyomi: ['なん', 'だん', 'ぜん', 'ねん'],
    kunyomi: ['くす', 'くすのき'],
    meanings: ['camphor tree'],
    grade: 9,
    strokes: 13,
    frequencyRank: 1927,
  ),
  // flute / clarinet / pipe
  '笛': KanjiReading(
    kanji: '笛',
    onyomi: ['てき'],
    kunyomi: ['ふえ'],
    meanings: ['flute', 'clarinet', 'pipe'],
    grade: 3,
    strokes: 11,
    frequencyRank: 1928,
  ),
  // mustard / rape / dust
  '芥': KanjiReading(
    kanji: '芥',
    onyomi: ['かい', 'け'],
    kunyomi: ['からし', 'ごみ', 'あくた'],
    meanings: ['mustard', 'rape', 'dust'],
    grade: 9,
    strokes: 7,
    frequencyRank: 1929,
  ),
  // that
  '其': KanjiReading(
    kanji: '其',
    onyomi: ['き', 'ぎ', 'ご'],
    kunyomi: ['それ', 'その'],
    meanings: ['that'],
    grade: 9,
    strokes: 8,
    frequencyRank: 1930,
  ),
  // sound of jewels
  '玲': KanjiReading(
    kanji: '玲',
    onyomi: ['れい'],
    kunyomi: [],
    meanings: ['sound of jewels'],
    grade: 9,
    strokes: 9,
    frequencyRank: 1931,
  ),
  // guy / slave / manservant
  '奴': KanjiReading(
    kanji: '奴',
    onyomi: ['ど'],
    kunyomi: ['やつ', 'やっこ'],
    meanings: ['guy', 'slave', 'manservant'],
    grade: 8,
    strokes: 5,
    frequencyRank: 1932,
  ),
  // who / someone / somebody
  '誰': KanjiReading(
    kanji: '誰',
    onyomi: ['すい'],
    kunyomi: ['だれ', 'たれ', 'た'],
    meanings: ['who', 'someone', 'somebody'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1933,
  ),
  // lock / fetters / shackles
  '錠': KanjiReading(
    kanji: '錠',
    onyomi: ['じょう'],
    kunyomi: [],
    meanings: ['lock', 'fetters', 'shackles'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1934,
  ),
  // fist
  '拳': KanjiReading(
    kanji: '拳',
    onyomi: ['けん', 'げん'],
    kunyomi: ['こぶし'],
    meanings: ['fist'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1935,
  ),
  // soar / fly
  '翔': KanjiReading(
    kanji: '翔',
    onyomi: ['しょう'],
    kunyomi: ['かけ(る)', 'と(ぶ)'],
    meanings: ['soar', 'fly'],
    grade: 9,
    strokes: 12,
    frequencyRank: 1936,
  ),
  // transition / 移动 / 改变
  '遷': KanjiReading(
    kanji: '遷',
    onyomi: ['せん'],
    kunyomi: ['うつ(る)', 'うつ(す)', 'みやこがえ'],
    meanings: ['transition', '移动', '改变'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1937,
  ),
  // bungling / clumsy / unskillful
  '拙': KanjiReading(
    kanji: '拙',
    onyomi: ['せつ'],
    kunyomi: ['つたな(い)'],
    meanings: ['bungling', 'clumsy', 'unskillful'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1938,
  ),
  // waiter / samurai / wait upon
  '侍': KanjiReading(
    kanji: '侍',
    onyomi: ['じ', 'し'],
    kunyomi: ['さむらい', 'はべ(る)'],
    meanings: ['waiter', 'samurai', 'wait upon'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1939,
  ),
  // shaku / Japanese foot / 测量
  '尺': KanjiReading(
    kanji: '尺',
    onyomi: ['しゃく', 'せき'],
    kunyomi: ['さし'],
    meanings: ['shaku', 'Japanese foot', '测量'],
    grade: 6,
    strokes: 4,
    frequencyRank: 1940,
  ),
  // mountain peak / mountain pass / climax
  '峠': KanjiReading(
    kanji: '峠',
    onyomi: [],
    kunyomi: ['とうげ'],
    meanings: ['mountain peak', 'mountain pass', 'climax'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1941,
  ),
  // fervent / kind / cordial
  '篤': KanjiReading(
    kanji: '篤',
    onyomi: ['とく'],
    kunyomi: ['あつ(い)'],
    meanings: ['fervent', 'kind', 'cordial'],
    grade: 8,
    strokes: 16,
    frequencyRank: 1942,
  ),
  // beginning
  '肇': KanjiReading(
    kanji: '肇',
    onyomi: ['ちょう', 'じょう', 'とう'],
    kunyomi: ['はじ(める)', 'はじめ'],
    meanings: ['beginning'],
    grade: 9,
    strokes: 14,
    frequencyRank: 1943,
  ),
  // thirst / dry up / parch
  '渇': KanjiReading(
    kanji: '渇',
    onyomi: ['かつ'],
    kunyomi: ['かわ(く)'],
    meanings: ['thirst', 'dry up', 'parch'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1944,
  ),
  // lotus tree / nettle tree / hackberry
  '榎': KanjiReading(
    kanji: '榎',
    onyomi: ['か'],
    kunyomi: ['えのき'],
    meanings: ['lotus tree', 'nettle tree', 'hackberry'],
    grade: 9,
    strokes: 14,
    frequencyRank: 1945,
  ),
  // I / myself
  '俺': KanjiReading(
    kanji: '俺',
    onyomi: ['えん'],
    kunyomi: ['おれ', 'われ'],
    meanings: ['I', 'myself'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1946,
  ),
  // weapon of war / logging axe / kill en masse
  '劉': KanjiReading(
    kanji: '劉',
    onyomi: ['りゅう', 'る'],
    kunyomi: ['ころ(す)'],
    meanings: ['weapon of war', 'logging axe', 'kill en masse'],
    grade: 9,
    strokes: 15,
    frequencyRank: 1947,
  ),
  // flag
  '幡': KanjiReading(
    kanji: '幡',
    onyomi: ['まん', 'はん', 'ばん', 'ほん'],
    kunyomi: ['はた'],
    meanings: ['flag'],
    grade: 9,
    strokes: 15,
    frequencyRank: 1948,
  ),
  // consult
  '諏': KanjiReading(
    kanji: '諏',
    onyomi: ['しゅ', 'す'],
    kunyomi: ['そう', 'はか(る)'],
    meanings: ['consult'],
    grade: 9,
    strokes: 15,
    frequencyRank: 1949,
  ),
  // uncle / youth
  '叔': KanjiReading(
    kanji: '叔',
    onyomi: ['しゅく'],
    kunyomi: [],
    meanings: ['uncle', 'youth'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1950,
  ),
  // feminine / female
  '雌': KanjiReading(
    kanji: '雌',
    onyomi: ['し'],
    kunyomi: ['(め)', 'めす', 'めん'],
    meanings: ['feminine', 'female'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1951,
  ),
  // pass through / go smoothly
  '亨': KanjiReading(
    kanji: '亨',
    onyomi: ['こう', 'きょう', 'ほう'],
    kunyomi: ['とお(る)'],
    meanings: ['pass through', 'go smoothly'],
    grade: 9,
    strokes: 7,
    frequencyRank: 1952,
  ),
  // withstand / endure / support
  '堪': KanjiReading(
    kanji: '堪',
    onyomi: ['かん', 'たん'],
    kunyomi: ['た(える)', 'たま(る)', 'こら(える)', 'こた(える)'],
    meanings: ['withstand', 'endure', 'support'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1953,
  ),
  // confer / relate / narrate
  '叙': KanjiReading(
    kanji: '叙',
    onyomi: ['じょ'],
    kunyomi: ['つい(ず)', 'ついで'],
    meanings: ['confer', 'relate', 'narrate'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1954,
  ),
  // vinegar / sour / acid
  '酢': KanjiReading(
    kanji: '酢',
    onyomi: ['さく'],
    kunyomi: ['す'],
    meanings: ['vinegar', 'sour', 'acid'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1955,
  ),
  // versify / singing / recital
  '吟': KanjiReading(
    kanji: '吟',
    onyomi: ['ぎん'],
    kunyomi: [],
    meanings: ['versify', 'singing', 'recital'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1956,
  ),
  // relay / in turn / sending
  '逓': KanjiReading(
    kanji: '逓',
    onyomi: ['てい'],
    kunyomi: ['かわ(る)', 'たがいに'],
    meanings: ['relay', 'in turn', 'sending'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1957,
  ),
  // mark / foot print
  '痕': KanjiReading(
    kanji: '痕',
    onyomi: ['こん'],
    kunyomi: ['あと'],
    meanings: ['mark', 'foot print'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1958,
  ),
  // peak / summit
  '嶺': KanjiReading(
    kanji: '嶺',
    onyomi: ['れい', 'りょう'],
    kunyomi: ['みね'],
    meanings: ['peak', 'summit'],
    grade: 9,
    strokes: 17,
    frequencyRank: 1959,
  ),
  // sleeve / wing (building) / extension
  '袖': KanjiReading(
    kanji: '袖',
    onyomi: ['しゅう'],
    kunyomi: ['そで'],
    meanings: ['sleeve', 'wing (building)', 'extension'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1960,
  ),
  // tremendously / very / great
  '甚': KanjiReading(
    kanji: '甚',
    onyomi: ['じん'],
    kunyomi: ['はなは(だ)', 'はなは(だしい)'],
    meanings: ['tremendously', 'very', 'great'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1961,
  ),
  // 高 / boasting
  '喬': KanjiReading(
    kanji: '喬',
    onyomi: ['きょう'],
    kunyomi: ['たか(い)'],
    meanings: ['高', 'boasting'],
    grade: 9,
    strokes: 12,
    frequencyRank: 1962,
  ),
  // attractive / bewitching / calamity
  '妖': KanjiReading(
    kanji: '妖',
    onyomi: ['よう'],
    kunyomi: ['あや(しい)', 'なま(めく)', 'わざわ(い)'],
    meanings: ['attractive', 'bewitching', 'calamity'],
    grade: 8,
    strokes: 7,
    frequencyRank: 1964,
  ),
  // glissando on strings / lute
  '琵': KanjiReading(
    kanji: '琵',
    onyomi: ['び', 'ひ'],
    kunyomi: [],
    meanings: ['glissando on strings', 'lute'],
    grade: 9,
    strokes: 12,
    frequencyRank: 1965,
  ),
  // lute
  '琶': KanjiReading(
    kanji: '琶',
    onyomi: ['は', 'べ', 'わ'],
    kunyomi: [],
    meanings: ['lute'],
    grade: 9,
    strokes: 12,
    frequencyRank: 1966,
  ),
  // be resuscitated / revived / perilla
  '蘇': KanjiReading(
    kanji: '蘇',
    onyomi: ['そ', 'す'],
    kunyomi: ['よみがえ(る)'],
    meanings: ['be resuscitated', 'revived', 'perilla'],
    grade: 9,
    strokes: 19,
    frequencyRank: 1968,
  ),
  // get dark / gloom / disorder
  '闇': KanjiReading(
    kanji: '闇',
    onyomi: ['あん', 'おん'],
    kunyomi: ['やみ', 'くら(い)'],
    meanings: ['get dark', 'gloom', 'disorder'],
    grade: 8,
    strokes: 17,
    frequencyRank: 1969,
  ),
  // adore / respect / revere
  '崇': KanjiReading(
    kanji: '崇',
    onyomi: ['すう'],
    kunyomi: ['あが(める)'],
    meanings: ['adore', 'respect', 'revere'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1970,
  ),
  // lacquer / varnish / 七
  '漆': KanjiReading(
    kanji: '漆',
    onyomi: ['しつ'],
    kunyomi: ['うるし'],
    meanings: ['lacquer', 'varnish', '七'],
    grade: 8,
    strokes: 14,
    frequencyRank: 1971,
  ),
  // headland / cape / spit
  '岬': KanjiReading(
    kanji: '岬',
    onyomi: ['こう'],
    kunyomi: ['みさき'],
    meanings: ['headland', 'cape', 'spit'],
    grade: 8,
    strokes: 8,
    frequencyRank: 1972,
  ),
  // mannerism / habit / vice
  '癖': KanjiReading(
    kanji: '癖',
    onyomi: ['へき'],
    kunyomi: ['くせ', 'くせ(に)'],
    meanings: ['mannerism', 'habit', 'vice'],
    grade: 8,
    strokes: 18,
    frequencyRank: 1973,
  ),
  // pleasure / happy / rejoice
  '愉': KanjiReading(
    kanji: '愉',
    onyomi: ['ゆ'],
    kunyomi: ['たの(しい)', 'たの(しむ)'],
    meanings: ['pleasure', 'happy', 'rejoice'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1974,
  ),
  // sign of the tiger / 3-5AM / third sign of Chinese zodiac
  '寅': KanjiReading(
    kanji: '寅',
    onyomi: ['いん'],
    kunyomi: ['とら'],
    meanings: ['sign of the tiger', '3-5AM', 'third sign of Chinese zodiac'],
    grade: 9,
    strokes: 11,
    frequencyRank: 1975,
  ),
  // catch / capture
  '捉': KanjiReading(
    kanji: '捉',
    onyomi: ['そく', 'さく'],
    kunyomi: ['とら(える)'],
    meanings: ['catch', 'capture'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1976,
  ),
  // reef / sunken rock
  '礁': KanjiReading(
    kanji: '礁',
    onyomi: ['しょう'],
    kunyomi: [],
    meanings: ['reef', 'sunken rock'],
    grade: 8,
    strokes: 17,
    frequencyRank: 1977,
  ),
  // from / possessive particle / whereupon
  '乃': KanjiReading(
    kanji: '乃',
    onyomi: ['ない', 'だい', 'の', 'あい'],
    kunyomi: ['の', 'すなわ(ち)', 'なんじ'],
    meanings: ['from', 'possessive particle', 'whereupon'],
    grade: 9,
    strokes: 2,
    frequencyRank: 1978,
  ),
  // continent / sandbar / island
  '洲': KanjiReading(
    kanji: '洲',
    onyomi: ['しゅう', 'す'],
    kunyomi: ['しま'],
    meanings: ['continent', 'sandbar', 'island'],
    grade: 9,
    strokes: 9,
    frequencyRank: 1979,
  ),
  // barracks / police station / camp
  '屯': KanjiReading(
    kanji: '屯',
    onyomi: ['とん'],
    kunyomi: ['たむろ'],
    meanings: ['barracks', 'police station', 'camp'],
    grade: 8,
    strokes: 4,
    frequencyRank: 1980,
  ),
  // barrel / cask / keg
  '樽': KanjiReading(
    kanji: '樽',
    onyomi: ['そん'],
    kunyomi: ['たる'],
    meanings: ['barrel', 'cask', 'keg'],
    grade: 9,
    strokes: 16,
    frequencyRank: 1981,
  ),
  // birch / dark red
  '樺': KanjiReading(
    kanji: '樺',
    onyomi: ['か'],
    kunyomi: ['かば', 'かんば'],
    meanings: ['birch', 'dark red'],
    grade: 9,
    strokes: 14,
    frequencyRank: 1982,
  ),
  // twig / ornamental evergreen
  '槙': KanjiReading(
    kanji: '槙',
    onyomi: ['てん', 'しん'],
    kunyomi: ['まき', 'こずえ'],
    meanings: ['twig', 'ornamental evergreen'],
    grade: 9,
    strokes: 14,
    frequencyRank: 1983,
  ),
  // salvation / Buddha
  '薩': KanjiReading(
    kanji: '薩',
    onyomi: ['さつ', 'さち'],
    kunyomi: [],
    meanings: ['salvation', 'Buddha'],
    grade: 9,
    strokes: 17,
    frequencyRank: 1984,
  ),
  // matrimony / marry
  '姻': KanjiReading(
    kanji: '姻',
    onyomi: ['いん'],
    kunyomi: [],
    meanings: ['matrimony', 'marry'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1985,
  ),
  // rock / crag / boulder
  '巌': KanjiReading(
    kanji: '巌',
    onyomi: ['がん'],
    kunyomi: ['いわ', 'いわお', 'けわ(しい)'],
    meanings: ['rock', 'crag', 'boulder'],
    grade: 9,
    strokes: 20,
    frequencyRank: 1986,
  ),
  // pool / eddy
  '淀': KanjiReading(
    kanji: '淀',
    onyomi: ['てん', 'でん'],
    kunyomi: ['よど(む)'],
    meanings: ['pool', 'eddy'],
    grade: 9,
    strokes: 11,
    frequencyRank: 1987,
  ),
  // gamble / wager / bet
  '賭': KanjiReading(
    kanji: '賭',
    onyomi: ['と'],
    kunyomi: ['か(ける)', 'かけ'],
    meanings: ['gamble', 'wager', 'bet'],
    grade: 8,
    strokes: 15,
    frequencyRank: 1989,
  ),
  // mimic / aim (a gun) at / nominate
  '擬': KanjiReading(
    kanji: '擬',
    onyomi: ['ぎ'],
    kunyomi: ['まが(い)', 'もど(き)'],
    meanings: ['mimic', 'aim (a gun) at', 'nominate'],
    grade: 8,
    strokes: 17,
    frequencyRank: 1990,
  ),
  // fence / 墙 / (kokuji)
  '塀': KanjiReading(
    kanji: '塀',
    onyomi: ['へい', 'べい'],
    kunyomi: [],
    meanings: ['fence', '墙', '(kokuji)'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1991,
  ),
  // lips
  '唇': KanjiReading(
    kanji: '唇',
    onyomi: ['しん'],
    kunyomi: ['くちびる'],
    meanings: ['lips'],
    grade: 8,
    strokes: 10,
    frequencyRank: 1992,
  ),
  // intimate / friendly / harmonious
  '睦': KanjiReading(
    kanji: '睦',
    onyomi: ['ぼく', 'もく'],
    kunyomi: ['むつ(まじい)', 'むつ(む)', 'むつ(ぶ)'],
    meanings: ['intimate', 'friendly', 'harmonious'],
    grade: 8,
    strokes: 13,
    frequencyRank: 1993,
  ),
  // leisure
  '閑': KanjiReading(
    kanji: '閑',
    onyomi: ['かん'],
    kunyomi: [],
    meanings: ['leisure'],
    grade: 8,
    strokes: 12,
    frequencyRank: 1994,
  ),
  // barbarian / foreign
  '胡': KanjiReading(
    kanji: '胡',
    onyomi: ['う', 'こ', 'ご'],
    kunyomi: ['なんぞ'],
    meanings: ['barbarian', 'foreign'],
    grade: 9,
    strokes: 9,
    frequencyRank: 1995,
  ),
  // seclude / confine to a room / 深
  '幽': KanjiReading(
    kanji: '幽',
    onyomi: ['ゆう'],
    kunyomi: ['ふか(い)', 'かす(か)', 'くら(い)', 'しろ(い)'],
    meanings: ['seclude', 'confine to a room', '深'],
    grade: 8,
    strokes: 9,
    frequencyRank: 1996,
  ),
  // 高 / steep
  '峻': KanjiReading(
    kanji: '峻',
    onyomi: ['しゅん'],
    kunyomi: ['けわ(しい)', 'たか(い)'],
    meanings: ['高', 'steep'],
    grade: 9,
    strokes: 10,
    frequencyRank: 1997,
  ),
  // office / official / comrade
  '曹': KanjiReading(
    kanji: '曹',
    onyomi: ['そう', 'ぞう'],
    kunyomi: [],
    meanings: ['office', 'official', 'comrade'],
    grade: 8,
    strokes: 11,
    frequencyRank: 1998,
  ),
  // scout / sentinel
  '哨': KanjiReading(
    kanji: '哨',
    onyomi: ['しょう'],
    kunyomi: ['みはり'],
    meanings: ['scout', 'sentinel'],
    grade: 9,
    strokes: 10,
    frequencyRank: 1999,
  ),
  // recitation / poem / 歌
  '詠': KanjiReading(
    kanji: '詠',
    onyomi: ['えい'],
    kunyomi: ['よ(む)', 'うた(う)'],
    meanings: ['recitation', 'poem', '歌'],
    grade: 8,
    strokes: 12,
    frequencyRank: 2000,
  ),
  // lowly / base / vile
  '卑': KanjiReading(
    kanji: '卑',
    onyomi: ['ひ'],
    kunyomi: ['いや(しい)', 'いや(しむ)', 'いや(しめる)'],
    meanings: ['lowly', 'base', 'vile'],
    grade: 8,
    strokes: 9,
    frequencyRank: 2003,
  ),
  // scorn / despise / make light of
  '侮': KanjiReading(
    kanji: '侮',
    onyomi: ['ぶ'],
    kunyomi: ['あなど(る)', 'あなず(る)'],
    meanings: ['scorn', 'despise', 'make light of'],
    grade: 8,
    strokes: 8,
    frequencyRank: 2004,
  ),
  // casting / mint
  '鋳': KanjiReading(
    kanji: '鋳',
    onyomi: ['ちゅう', 'い', 'しゅ', 'しゅう'],
    kunyomi: ['い(る)'],
    meanings: ['casting', 'mint'],
    grade: 8,
    strokes: 15,
    frequencyRank: 2005,
  ),
  // rub / 绘画 / erase
  '抹': KanjiReading(
    kanji: '抹',
    onyomi: ['まつ'],
    kunyomi: [],
    meanings: ['rub', '绘画', 'erase'],
    grade: 8,
    strokes: 8,
    frequencyRank: 2006,
  ),
  // military officer / jailer / old man
  '尉': KanjiReading(
    kanji: '尉',
    onyomi: ['い', 'じょう'],
    kunyomi: [],
    meanings: ['military officer', 'jailer', 'old man'],
    grade: 8,
    strokes: 11,
    frequencyRank: 2007,
  ),
  // Zelkova tree
  '槻': KanjiReading(
    kanji: '槻',
    onyomi: ['き'],
    kunyomi: ['つき'],
    meanings: ['Zelkova tree'],
    grade: 9,
    strokes: 15,
    frequencyRank: 2008,
  ),
  // slave / servant / prisoner
  '隷': KanjiReading(
    kanji: '隷',
    onyomi: ['れい'],
    kunyomi: ['したが(う)', 'しもべ'],
    meanings: ['slave', 'servant', 'prisoner'],
    grade: 8,
    strokes: 16,
    frequencyRank: 2009,
  ),
  // calamity / misfortune / evil
  '禍': KanjiReading(
    kanji: '禍',
    onyomi: ['か'],
    kunyomi: ['わざわい'],
    meanings: ['calamity', 'misfortune', 'evil'],
    grade: 8,
    strokes: 13,
    frequencyRank: 2010,
  ),
  // butterfly
  '蝶': KanjiReading(
    kanji: '蝶',
    onyomi: ['ちょう'],
    kunyomi: [],
    meanings: ['butterfly'],
    grade: 9,
    strokes: 15,
    frequencyRank: 2011,
  ),
  // dairy products / whey / broth
  '酪': KanjiReading(
    kanji: '酪',
    onyomi: ['らく'],
    kunyomi: [],
    meanings: ['dairy products', 'whey', 'broth'],
    grade: 8,
    strokes: 13,
    frequencyRank: 2012,
  ),
  // stalk / stem
  '茎': KanjiReading(
    kanji: '茎',
    onyomi: ['けい', 'きょう'],
    kunyomi: ['くき'],
    meanings: ['stalk', 'stem'],
    grade: 8,
    strokes: 8,
    frequencyRank: 2013,
  ),
  // pan-
  '汎': KanjiReading(
    kanji: '汎',
    onyomi: ['はん', 'ぶ', 'ふう', 'ほう', 'ほん'],
    kunyomi: ['ただよ(う)', 'ひろ(い)'],
    meanings: ['pan-'],
    grade: 8,
    strokes: 6,
    frequencyRank: 2014,
  ),
  // 时间 / about / toward
  '頃': KanjiReading(
    kanji: '頃',
    onyomi: ['けい', 'きょう'],
    kunyomi: ['ころ', 'ごろ', 'しばら(く)'],
    meanings: ['时间', 'about', 'toward'],
    grade: 8,
    strokes: 11,
    frequencyRank: 2015,
  ),
  // commander / leading troops / governor
  '帥': KanjiReading(
    kanji: '帥',
    onyomi: ['すい'],
    kunyomi: [],
    meanings: ['commander', 'leading troops', 'governor'],
    grade: 8,
    strokes: 9,
    frequencyRank: 2016,
  ),
  // weir / fish trap / beam
  '梁': KanjiReading(
    kanji: '梁',
    onyomi: ['りょう'],
    kunyomi: ['はり', 'うつばり', 'うちばり', 'やな', 'はし'],
    meanings: ['weir', 'fish trap', 'beam'],
    grade: 9,
    strokes: 11,
    frequencyRank: 2017,
  ),
  // departed / 死
  '逝': KanjiReading(
    kanji: '逝',
    onyomi: ['せい'],
    kunyomi: ['ゆ(く)', 'い(く)'],
    meanings: ['departed', '死'],
    grade: 8,
    strokes: 10,
    frequencyRank: 2018,
  ),
  // drip / drop
  '滴': KanjiReading(
    kanji: '滴',
    onyomi: ['てき'],
    kunyomi: ['しずく', 'したた(る)'],
    meanings: ['drip', 'drop'],
    grade: 8,
    strokes: 14,
    frequencyRank: 2019,
  ),
  // vapor / steam
  '汽': KanjiReading(
    kanji: '汽',
    onyomi: ['き'],
    kunyomi: [],
    meanings: ['vapor', 'steam'],
    grade: 2,
    strokes: 7,
    frequencyRank: 2020,
  ),
  // riddle / puzzle / enigma
  '謎': KanjiReading(
    kanji: '謎',
    onyomi: ['めい', 'べい'],
    kunyomi: ['なぞ'],
    meanings: ['riddle', 'puzzle', 'enigma'],
    grade: 8,
    strokes: 16,
    frequencyRank: 2021,
  ),
  // polish
  '琢': KanjiReading(
    kanji: '琢',
    onyomi: ['たく'],
    kunyomi: ['みが(く)'],
    meanings: ['polish'],
    grade: 9,
    strokes: 11,
    frequencyRank: 2022,
  ),
  // winnowing
  '箕': KanjiReading(
    kanji: '箕',
    onyomi: ['き'],
    kunyomi: ['み'],
    meanings: ['winnowing'],
    grade: 9,
    strokes: 14,
    frequencyRank: 2023,
  ),
  // hide / shelter / shield
  '匿': KanjiReading(
    kanji: '匿',
    onyomi: ['とく'],
    kunyomi: ['かくま(う)'],
    meanings: ['hide', 'shelter', 'shield'],
    grade: 8,
    strokes: 10,
    frequencyRank: 2024,
  ),
  // claw / nail / talon
  '爪': KanjiReading(
    kanji: '爪',
    onyomi: ['そう'],
    kunyomi: ['つめ', '(つま)'],
    meanings: ['claw', 'nail', 'talon'],
    grade: 8,
    strokes: 4,
    frequencyRank: 2025,
  ),
  // banana
  '芭': KanjiReading(
    kanji: '芭',
    onyomi: ['ば', 'は'],
    kunyomi: [],
    meanings: ['banana'],
    grade: 9,
    strokes: 7,
    frequencyRank: 2026,
  ),
  // 停止
  '逗': KanjiReading(
    kanji: '逗',
    onyomi: ['とう', 'ず'],
    kunyomi: ['とど(まる)'],
    meanings: ['停止'],
    grade: 9,
    strokes: 10,
    frequencyRank: 2027,
  ),
  // key
  '鍵': KanjiReading(
    kanji: '鍵',
    onyomi: ['けん'],
    kunyomi: ['かぎ'],
    meanings: ['key'],
    grade: 8,
    strokes: 17,
    frequencyRank: 2029,
  ),
  // collar / neck / lapel
  '襟': KanjiReading(
    kanji: '襟',
    onyomi: ['きん'],
    kunyomi: ['えり'],
    meanings: ['collar', 'neck', 'lapel'],
    grade: 8,
    strokes: 18,
    frequencyRank: 2030,
  ),
  // lightning-bug / firefly
  '蛍': KanjiReading(
    kanji: '蛍',
    onyomi: ['けい'],
    kunyomi: ['ほたる'],
    meanings: ['lightning-bug', 'firefly'],
    grade: 8,
    strokes: 11,
    frequencyRank: 2031,
  ),
  // oak
  '楢': KanjiReading(
    kanji: '楢',
    onyomi: ['しゅう', 'ゆう'],
    kunyomi: ['なら'],
    meanings: ['oak'],
    grade: 9,
    strokes: 13,
    frequencyRank: 2032,
  ),
  // banana / plantain
  '蕉': KanjiReading(
    kanji: '蕉',
    onyomi: ['しょう'],
    kunyomi: [],
    meanings: ['banana', 'plantain'],
    grade: 9,
    strokes: 15,
    frequencyRank: 2033,
  ),
  // helmet / head piece
  '兜': KanjiReading(
    kanji: '兜',
    onyomi: ['とう', 'と'],
    kunyomi: ['かぶと'],
    meanings: ['helmet', 'head piece'],
    grade: 9,
    strokes: 11,
    frequencyRank: 2034,
  ),
  // widow / minority / 少
  '寡': KanjiReading(
    kanji: '寡',
    onyomi: ['か'],
    kunyomi: [],
    meanings: ['widow', 'minority', '少'],
    grade: 8,
    strokes: 14,
    frequencyRank: 2035,
  ),
  // precious stone / gem / lapis lazuli
  '琉': KanjiReading(
    kanji: '琉',
    onyomi: ['りゅう', 'る'],
    kunyomi: [],
    meanings: ['precious stone', 'gem', 'lapis lazuli'],
    grade: 9,
    strokes: 11,
    frequencyRank: 2036,
  ),
  // diarrhea
  '痢': KanjiReading(
    kanji: '痢',
    onyomi: ['り'],
    kunyomi: [],
    meanings: ['diarrhea'],
    grade: 8,
    strokes: 12,
    frequencyRank: 2037,
  ),
  // commonplace / ordinary / employment
  '庸': KanjiReading(
    kanji: '庸',
    onyomi: ['よう'],
    kunyomi: [],
    meanings: ['commonplace', 'ordinary', 'employment'],
    grade: 8,
    strokes: 11,
    frequencyRank: 2038,
  ),
  // companion / 朋友
  '朋': KanjiReading(
    kanji: '朋',
    onyomi: ['ほう'],
    kunyomi: ['とも'],
    meanings: ['companion', '朋友'],
    grade: 9,
    strokes: 8,
    frequencyRank: 2039,
  ),
  // pit / hole
  '坑': KanjiReading(
    kanji: '坑',
    onyomi: ['こう'],
    kunyomi: [],
    meanings: ['pit', 'hole'],
    grade: 8,
    strokes: 7,
    frequencyRank: 2040,
  ),
  // crow / raven
  '烏': KanjiReading(
    kanji: '烏',
    onyomi: ['う', 'お'],
    kunyomi: ['からす', 'いずくんぞ', 'なんぞ'],
    meanings: ['crow', 'raven'],
    grade: 9,
    strokes: 10,
    frequencyRank: 2042,
  ),
  // indigo
  '藍': KanjiReading(
    kanji: '藍',
    onyomi: ['らん'],
    kunyomi: ['あい'],
    meanings: ['indigo'],
    grade: 8,
    strokes: 18,
    frequencyRank: 2043,
  ),
  // burglar / rebel / traitor
  '賊': KanjiReading(
    kanji: '賊',
    onyomi: ['ぞく'],
    kunyomi: [],
    meanings: ['burglar', 'rebel', 'traitor'],
    grade: 8,
    strokes: 13,
    frequencyRank: 2045,
  ),
  // squeeze
  '搾': KanjiReading(
    kanji: '搾',
    onyomi: ['さく'],
    kunyomi: ['しぼ(る)'],
    meanings: ['squeeze'],
    grade: 8,
    strokes: 13,
    frequencyRank: 2046,
  ),
  // cover / suffocate / obstruct
  '奄': KanjiReading(
    kanji: '奄',
    onyomi: ['えん'],
    kunyomi: ['おお(う)', 'たちまち'],
    meanings: ['cover', 'suffocate', 'obstruct'],
    grade: 9,
    strokes: 8,
    frequencyRank: 2047,
  ),
  // mortar
  '臼': KanjiReading(
    kanji: '臼',
    onyomi: ['きゅう', 'ぐ'],
    kunyomi: ['うす', 'うすづ(く)'],
    meanings: ['mortar'],
    grade: 8,
    strokes: 6,
    frequencyRank: 2048,
  ),
  // paddy ridge / levee
  '畔': KanjiReading(
    kanji: '畔',
    onyomi: ['はん'],
    kunyomi: ['あぜ', 'くろ', 'ほとり'],
    meanings: ['paddy ridge', 'levee'],
    grade: 8,
    strokes: 10,
    frequencyRank: 2049,
  ),
  // distant
  '遼': KanjiReading(
    kanji: '遼',
    onyomi: ['りょう'],
    kunyomi: [],
    meanings: ['distant'],
    grade: 9,
    strokes: 15,
    frequencyRank: 2050,
  ),
  // 歌 / ballad
  '唄': KanjiReading(
    kanji: '唄',
    onyomi: ['ばい'],
    kunyomi: ['うた', 'うた(う)'],
    meanings: ['歌', 'ballad'],
    grade: 8,
    strokes: 10,
    frequencyRank: 2051,
  ),
  // cavity / hole / slit
  '孔': KanjiReading(
    kanji: '孔',
    onyomi: ['こう', 'く'],
    kunyomi: ['あな'],
    meanings: ['cavity', 'hole', 'slit'],
    grade: 8,
    strokes: 4,
    frequencyRank: 2052,
  ),
  // mandarin orange
  '橘': KanjiReading(
    kanji: '橘',
    onyomi: ['きつ'],
    kunyomi: ['たちばな'],
    meanings: ['mandarin orange'],
    grade: 9,
    strokes: 16,
    frequencyRank: 2053,
  ),
  // gargle / rinse mouth
  '漱': KanjiReading(
    kanji: '漱',
    onyomi: ['そう', 'しゅう', 'す'],
    kunyomi: ['くちすす(ぐ)', 'くちそそ(ぐ)', 'うがい', 'すす(ぐ)'],
    meanings: ['gargle', 'rinse mouth'],
    grade: 9,
    strokes: 14,
    frequencyRank: 2054,
  ),
  // spine / backbone
  '呂': KanjiReading(
    kanji: '呂',
    onyomi: ['ろ', 'りょ'],
    kunyomi: ['せぼね'],
    meanings: ['spine', 'backbone'],
    grade: 8,
    strokes: 7,
    frequencyRank: 2055,
  ),
  // Japanese cypress
  '桧': KanjiReading(
    kanji: '桧',
    onyomi: ['かい'],
    kunyomi: ['ひのき', 'ひ'],
    meanings: ['Japanese cypress'],
    grade: 9,
    strokes: 10,
    frequencyRank: 2056,
  ),
  // torture / beat
  '拷': KanjiReading(
    kanji: '拷',
    onyomi: ['ごう'],
    kunyomi: [],
    meanings: ['torture', 'beat'],
    grade: 8,
    strokes: 9,
    frequencyRank: 2057,
  ),
  // dwell / Sung dynasty
  '宋': KanjiReading(
    kanji: '宋',
    onyomi: ['そう'],
    kunyomi: [],
    meanings: ['dwell', 'Sung dynasty'],
    grade: 9,
    strokes: 7,
    frequencyRank: 2058,
  ),
  // lass / girl / Miss
  '嬢': KanjiReading(
    kanji: '嬢',
    onyomi: ['じょう'],
    kunyomi: ['むすめ'],
    meanings: ['lass', 'girl', 'Miss'],
    grade: 8,
    strokes: 16,
    frequencyRank: 2059,
  ),
  // garden / farm / park
  '苑': KanjiReading(
    kanji: '苑',
    onyomi: ['えん', 'おん'],
    kunyomi: ['その', 'う(つ)'],
    meanings: ['garden', 'farm', 'park'],
    grade: 9,
    strokes: 8,
    frequencyRank: 2060,
  ),
  // southeast
  '巽': KanjiReading(
    kanji: '巽',
    onyomi: ['そん'],
    kunyomi: ['たつみ'],
    meanings: ['southeast'],
    grade: 9,
    strokes: 12,
    frequencyRank: 2061,
  ),
  // woods / grove
  '杜': KanjiReading(
    kanji: '杜',
    onyomi: ['と', 'とう', 'ず'],
    kunyomi: ['もり', 'ふさ(ぐ)', 'やまなし'],
    meanings: ['woods', 'grove'],
    grade: 9,
    strokes: 7,
    frequencyRank: 2062,
  ),
  // mountain stream / valley
  '渓': KanjiReading(
    kanji: '渓',
    onyomi: ['けい'],
    kunyomi: ['たに', 'たにがわ'],
    meanings: ['mountain stream', 'valley'],
    grade: 8,
    strokes: 11,
    frequencyRank: 2063,
  ),
  // venerable old man
  '翁': KanjiReading(
    kanji: '翁',
    onyomi: ['おう'],
    kunyomi: ['おきな'],
    meanings: ['venerable old man'],
    grade: 8,
    strokes: 10,
    frequencyRank: 2064,
  ),
  // 艺术 / craft / performance
  '藝': KanjiReading(
    kanji: '藝',
    onyomi: ['げい', 'うん'],
    kunyomi: ['う(える)', 'のり', 'わざ'],
    meanings: ['艺术', 'craft', 'performance'],
    grade: 10,
    strokes: 18,
    frequencyRank: 2065,
  ),
  // bargain / reason / charge
  '廉': KanjiReading(
    kanji: '廉',
    onyomi: ['れん'],
    kunyomi: [],
    meanings: ['bargain', 'reason', 'charge'],
    grade: 8,
    strokes: 13,
    frequencyRank: 2066,
  ),
  // tusk / fang / tusk radical (no. 92)
  '牙': KanjiReading(
    kanji: '牙',
    onyomi: ['が', 'げ'],
    kunyomi: ['きば', 'は'],
    meanings: ['tusk', 'fang', 'tusk radical (no. 92)'],
    grade: 8,
    strokes: 5,
    frequencyRank: 2067,
  ),
  // discreet / reverently / humbly
  '謹': KanjiReading(
    kanji: '謹',
    onyomi: ['きん'],
    kunyomi: ['つつし(む)'],
    meanings: ['discreet', 'reverently', 'humbly'],
    grade: 8,
    strokes: 17,
    frequencyRank: 2068,
  ),
  // pupil (of eye)
  '瞳': KanjiReading(
    kanji: '瞳',
    onyomi: ['どう', 'とう'],
    kunyomi: ['ひとみ'],
    meanings: ['pupil (of eye)'],
    grade: 8,
    strokes: 17,
    frequencyRank: 2069,
  ),
  // boil / ferment / seethe
  '湧': KanjiReading(
    kanji: '湧',
    onyomi: ['ゆう', 'よう', 'ゆ'],
    kunyomi: ['わ(く)'],
    meanings: ['boil', 'ferment', 'seethe'],
    grade: 8,
    strokes: 12,
    frequencyRank: 2070,
  ),
  // take pleasure in / rejoice
  '欣': KanjiReading(
    kanji: '欣',
    onyomi: ['きん', 'ごん', 'こん'],
    kunyomi: ['よろこ(ぶ)', 'よろこ(び)'],
    meanings: ['take pleasure in', 'rejoice'],
    grade: 9,
    strokes: 8,
    frequencyRank: 2071,
  ),
  // kiln / oven / furnace
  '窯': KanjiReading(
    kanji: '窯',
    onyomi: ['よう'],
    kunyomi: ['かま'],
    meanings: ['kiln', 'oven', 'furnace'],
    grade: 8,
    strokes: 15,
    frequencyRank: 2072,
  ),
  // praise / extol
  '褒': KanjiReading(
    kanji: '褒',
    onyomi: ['ほう'],
    kunyomi: ['ほ(める)'],
    meanings: ['praise', 'extol'],
    grade: 8,
    strokes: 15,
    frequencyRank: 2073,
  ),
  // 丑 / unclean / shame
  '醜': KanjiReading(
    kanji: '醜',
    onyomi: ['しゅう'],
    kunyomi: ['みにく(い)', 'しこ'],
    meanings: ['丑', 'unclean', 'shame'],
    grade: 8,
    strokes: 17,
    frequencyRank: 2074,
  ),
  // volume / chapter / 书
  '篇': KanjiReading(
    kanji: '篇',
    onyomi: ['へん'],
    kunyomi: [],
    meanings: ['volume', 'chapter', '书'],
    grade: 9,
    strokes: 15,
    frequencyRank: 2076,
  ),
  // measuring box / 1.8 liter
  '升': KanjiReading(
    kanji: '升',
    onyomi: ['しょう'],
    kunyomi: ['ます'],
    meanings: ['measuring box', '1.8 liter'],
    grade: 8,
    strokes: 4,
    frequencyRank: 2077,
  ),
  // this / current / next
  '此': KanjiReading(
    kanji: '此',
    onyomi: ['し'],
    kunyomi: ['これ', 'この', 'ここ'],
    meanings: ['this', 'current', 'next'],
    grade: 9,
    strokes: 6,
    frequencyRank: 2078,
  ),
  // peak / summit
  '峯': KanjiReading(
    kanji: '峯',
    onyomi: ['ほう'],
    kunyomi: ['みね', 'ね'],
    meanings: ['peak', 'summit'],
    grade: 10,
    strokes: 10,
    frequencyRank: 2079,
  ),
  // martyrdom / follow by resigning
  '殉': KanjiReading(
    kanji: '殉',
    onyomi: ['じゅん'],
    kunyomi: [],
    meanings: ['martyrdom', 'follow by resigning'],
    grade: 8,
    strokes: 10,
    frequencyRank: 2080,
  ),
  // anxiety / trouble / worry
  '煩': KanjiReading(
    kanji: '煩',
    onyomi: ['はん', 'ぼん'],
    kunyomi: ['わずら(う)', 'わずら(わす)', 'うるさ(がる)', 'うるさ(い)'],
    meanings: ['anxiety', 'trouble', 'worry'],
    grade: 8,
    strokes: 13,
    frequencyRank: 2081,
  ),
  // comma-design
  '巴': KanjiReading(
    kanji: '巴',
    onyomi: ['は'],
    kunyomi: ['ともえ', 'うずまき'],
    meanings: ['comma-design'],
    grade: 9,
    strokes: 4,
    frequencyRank: 2082,
  ),
  // happiness / blessed / good fortune
  '禎': KanjiReading(
    kanji: '禎',
    onyomi: ['てい'],
    kunyomi: ['さいわ(い)'],
    meanings: ['happiness', 'blessed', 'good fortune'],
    grade: 9,
    strokes: 13,
    frequencyRank: 2083,
  ),
  // pillow
  '枕': KanjiReading(
    kanji: '枕',
    onyomi: ['ちん', 'しん'],
    kunyomi: ['まくら'],
    meanings: ['pillow'],
    grade: 8,
    strokes: 8,
    frequencyRank: 2084,
  ),
  // censure / criminal investigation
  '劾': KanjiReading(
    kanji: '劾',
    onyomi: ['がい'],
    kunyomi: [],
    meanings: ['censure', 'criminal investigation'],
    grade: 8,
    strokes: 8,
    frequencyRank: 2085,
  ),
  // kind of grass / sacred tree
  '菩': KanjiReading(
    kanji: '菩',
    onyomi: ['ぼ'],
    kunyomi: [],
    meanings: ['kind of grass', 'sacred tree'],
    grade: 9,
    strokes: 11,
    frequencyRank: 2086,
  ),
  // degenerate / descend to / lapse into
  '堕': KanjiReading(
    kanji: '堕',
    onyomi: ['だ'],
    kunyomi: ['お(ちる)', 'くず(す)', 'くず(れる)'],
    meanings: ['degenerate', 'descend to', 'lapse into'],
    grade: 8,
    strokes: 12,
    frequencyRank: 2087,
  ),
  // bowl / bowl of food
  '丼': KanjiReading(
    kanji: '丼',
    onyomi: ['とん', 'たん', 'しょう', 'せい'],
    kunyomi: ['どんぶり'],
    meanings: ['bowl', 'bowl of food'],
    grade: 8,
    strokes: 5,
    frequencyRank: 2088,
  ),
  // tariff / crop tax / borrowing
  '租': KanjiReading(
    kanji: '租',
    onyomi: ['そ'],
    kunyomi: [],
    meanings: ['tariff', 'crop tax', 'borrowing'],
    grade: 8,
    strokes: 10,
    frequencyRank: 2089,
  ),
  // Japanese cypress
  '檜': KanjiReading(
    kanji: '檜',
    onyomi: ['かい'],
    kunyomi: ['ひのき', 'ひ'],
    meanings: ['Japanese cypress'],
    grade: 9,
    strokes: 17,
    frequencyRank: 2090,
  ),
  // angle / edge / corner
  '稜': KanjiReading(
    kanji: '稜',
    onyomi: ['りょう', 'ろう'],
    kunyomi: ['いつ', 'かど'],
    meanings: ['angle', 'edge', 'corner'],
    grade: 9,
    strokes: 13,
    frequencyRank: 2091,
  ),
  // pupil (eye) / moo (cow sound)
  '牟': KanjiReading(
    kanji: '牟',
    onyomi: ['ぼう', 'む'],
    kunyomi: [],
    meanings: ['pupil (eye)', 'moo (cow sound)'],
    grade: 9,
    strokes: 6,
    frequencyRank: 2092,
  ),
  // scaffold / cleat / frame
  '桟': KanjiReading(
    kanji: '桟',
    onyomi: ['さん', 'せん'],
    kunyomi: ['かけはし'],
    meanings: ['scaffold', 'cleat', 'frame'],
    grade: 8,
    strokes: 10,
    frequencyRank: 2093,
  ),
  // sacred Shinto tree / (kokuji)
  '榊': KanjiReading(
    kanji: '榊',
    onyomi: [],
    kunyomi: ['さかき'],
    meanings: ['sacred Shinto tree', '(kokuji)'],
    grade: 9,
    strokes: 13,
    frequencyRank: 2094,
  ),
  // copper / tin
  '錫': KanjiReading(
    kanji: '錫',
    onyomi: ['せき', 'しゃく'],
    kunyomi: ['すず', 'たま(う)'],
    meanings: ['copper', 'tin'],
    grade: 9,
    strokes: 16,
    frequencyRank: 2095,
  ),
  // fear / be afraid of / dread
  '惧': KanjiReading(
    kanji: '惧',
    onyomi: ['く', 'ぐ'],
    kunyomi: ['おそ(れる)'],
    meanings: ['fear', 'be afraid of', 'dread'],
    grade: 8,
    strokes: 11,
    frequencyRank: 2097,
  ),
  // Yamato / ancient Japan
  '倭': KanjiReading(
    kanji: '倭',
    onyomi: ['わ', 'い'],
    kunyomi: ['やまと', 'したが(う)'],
    meanings: ['Yamato', 'ancient Japan'],
    grade: 9,
    strokes: 10,
    frequencyRank: 2098,
  ),
  // bridegroom / son-in-law
  '婿': KanjiReading(
    kanji: '婿',
    onyomi: ['せい'],
    kunyomi: ['むこ'],
    meanings: ['bridegroom', 'son-in-law'],
    grade: 8,
    strokes: 12,
    frequencyRank: 2099,
  ),
  // pining / yearn for / love dearly
  '慕': KanjiReading(
    kanji: '慕',
    onyomi: ['ぼ'],
    kunyomi: ['した(う)'],
    meanings: ['pining', 'yearn for', 'love dearly'],
    grade: 8,
    strokes: 14,
    frequencyRank: 2100,
  ),
  // mausoleum / shrine / palace
  '廟': KanjiReading(
    kanji: '廟',
    onyomi: ['びょう', 'みょう'],
    kunyomi: ['たまや', 'みたまや', 'やしろ'],
    meanings: ['mausoleum', 'shrine', 'palace'],
    grade: 9,
    strokes: 15,
    frequencyRank: 2101,
  ),
  // 美丽 / patterned
  '斐': KanjiReading(
    kanji: '斐',
    onyomi: ['ひ', 'い'],
    kunyomi: [],
    meanings: ['美丽', 'patterned'],
    grade: 9,
    strokes: 12,
    frequencyRank: 2103,
  ),
  // quit / 停止 / 离开
  '罷': KanjiReading(
    kanji: '罷',
    onyomi: ['ひ'],
    kunyomi: ['まか(り)', 'や(める)'],
    meanings: ['quit', '停止', '离开'],
    grade: 8,
    strokes: 15,
    frequencyRank: 2104,
  ),
  // rectify / straighten / 正确
  '矯': KanjiReading(
    kanji: '矯',
    onyomi: ['きょう'],
    kunyomi: ['た(める)'],
    meanings: ['rectify', 'straighten', '正确'],
    grade: 8,
    strokes: 17,
    frequencyRank: 2105,
  ),
  // so-and-so / 一 / a certain
  '某': KanjiReading(
    kanji: '某',
    onyomi: ['ぼう'],
    kunyomi: ['それがし', 'なにがし'],
    meanings: ['so-and-so', '一', 'a certain'],
    grade: 8,
    strokes: 9,
    frequencyRank: 2106,
  ),
  // captured / criminal / arrest
  '囚': KanjiReading(
    kanji: '囚',
    onyomi: ['しゅう'],
    kunyomi: ['とら(われる)'],
    meanings: ['captured', 'criminal', 'arrest'],
    grade: 8,
    strokes: 5,
    frequencyRank: 2107,
  ),
  // charging ahead of others
  '魁': KanjiReading(
    kanji: '魁',
    onyomi: ['かい'],
    kunyomi: ['さきがけ', 'かしら'],
    meanings: ['charging ahead of others'],
    grade: 9,
    strokes: 14,
    frequencyRank: 2108,
  ),
  // rainbow
  '虹': KanjiReading(
    kanji: '虹',
    onyomi: ['こう'],
    kunyomi: ['にじ'],
    meanings: ['rainbow'],
    grade: 8,
    strokes: 9,
    frequencyRank: 2110,
  ),
  // large bird / wild goose / large
  '鴻': KanjiReading(
    kanji: '鴻',
    onyomi: ['こう', 'ごう'],
    kunyomi: ['おおとり', 'ひしくい', 'おおがり'],
    meanings: ['large bird', 'wild goose', 'large'],
    grade: 9,
    strokes: 17,
    frequencyRank: 2111,
  ),
  // ooze / flow / soak in
  '泌': KanjiReading(
    kanji: '泌',
    onyomi: ['ひつ', 'ひ'],
    kunyomi: [],
    meanings: ['ooze', 'flow', 'soak in'],
    grade: 8,
    strokes: 8,
    frequencyRank: 2112,
  ),
  // at / in / on
  '於': KanjiReading(
    kanji: '於',
    onyomi: ['お', 'よ'],
    kunyomi: ['おい(て)', 'お(ける)', 'ああ', 'より'],
    meanings: ['at', 'in', 'on'],
    grade: 9,
    strokes: 8,
    frequencyRank: 2113,
  ),
  // strong and brave
  '赳': KanjiReading(
    kanji: '赳',
    onyomi: ['きゅう'],
    kunyomi: [],
    meanings: ['strong and brave'],
    grade: 9,
    strokes: 10,
    frequencyRank: 2114,
  ),
  // steadily / gradually advancing / finally
  '漸': KanjiReading(
    kanji: '漸',
    onyomi: ['ぜん'],
    kunyomi: ['ようや(く)', 'やや', 'ようよ(う)', 'すす(む)'],
    meanings: ['steadily', 'gradually advancing', 'finally'],
    grade: 8,
    strokes: 14,
    frequencyRank: 2115,
  ),
  // meeting / tryst / date
  '逢': KanjiReading(
    kanji: '逢',
    onyomi: ['ほう'],
    kunyomi: ['あ(う)', 'むか(える)'],
    meanings: ['meeting', 'tryst', 'date'],
    grade: 9,
    strokes: 10,
    frequencyRank: 2116,
  ),
  // kite / (kokuji)
  '凧': KanjiReading(
    kanji: '凧',
    onyomi: [],
    kunyomi: ['いかのぼり', 'たこ'],
    meanings: ['kite', '(kokuji)'],
    grade: 9,
    strokes: 5,
    frequencyRank: 2117,
  ),
  // cormorant
  '鵜': KanjiReading(
    kanji: '鵜',
    onyomi: ['てい', 'だい'],
    kunyomi: ['う'],
    meanings: ['cormorant'],
    grade: 9,
    strokes: 18,
    frequencyRank: 2118,
  ),
  // hermitage / retreat
  '庵': KanjiReading(
    kanji: '庵',
    onyomi: ['あん'],
    kunyomi: ['いおり', 'いお'],
    meanings: ['hermitage', 'retreat'],
    grade: 9,
    strokes: 11,
    frequencyRank: 2119,
  ),
  // small low table / tray
  '膳': KanjiReading(
    kanji: '膳',
    onyomi: ['ぜん', 'せん'],
    kunyomi: ['かしわ', 'すす(める)', 'そな(える)'],
    meanings: ['small low table', 'tray'],
    grade: 8,
    strokes: 16,
    frequencyRank: 2120,
  ),
  // mosquito
  '蚊': KanjiReading(
    kanji: '蚊',
    onyomi: ['ぶん'],
    kunyomi: ['か'],
    meanings: ['mosquito'],
    grade: 8,
    strokes: 10,
    frequencyRank: 2121,
  ),
  // hollyhock
  '葵': KanjiReading(
    kanji: '葵',
    onyomi: ['き'],
    kunyomi: ['あおい'],
    meanings: ['hollyhock'],
    grade: 9,
    strokes: 12,
    frequencyRank: 2122,
  ),
  // unlucky / misfortune / bad luck
  '厄': KanjiReading(
    kanji: '厄',
    onyomi: ['やく'],
    kunyomi: [],
    meanings: ['unlucky', 'misfortune', 'bad luck'],
    grade: 8,
    strokes: 4,
    frequencyRank: 2123,
  ),
  // seaweed / duckweed
  '藻': KanjiReading(
    kanji: '藻',
    onyomi: ['そう'],
    kunyomi: ['も'],
    meanings: ['seaweed', 'duckweed'],
    grade: 8,
    strokes: 19,
    frequencyRank: 2124,
  ),
  // ten thousand / 10,000
  '萬': KanjiReading(
    kanji: '萬',
    onyomi: ['まん', 'ばん'],
    kunyomi: ['よろず'],
    meanings: ['ten thousand', '10,000'],
    grade: 10,
    strokes: 12,
    frequencyRank: 2125,
  ),
  // fief / allowance / pension
  '禄': KanjiReading(
    kanji: '禄',
    onyomi: ['ろく'],
    kunyomi: ['さいわ(い)', 'ふち'],
    meanings: ['fief', 'allowance', 'pension'],
    grade: 9,
    strokes: 12,
    frequencyRank: 2126,
  ),
  // chief / beginning
  '孟': KanjiReading(
    kanji: '孟',
    onyomi: ['もう', 'ぼう', 'みょう'],
    kunyomi: ['かしら'],
    meanings: ['chief', 'beginning'],
    grade: 9,
    strokes: 8,
    frequencyRank: 2127,
  ),
  // wolf
  '狼': KanjiReading(
    kanji: '狼',
    onyomi: ['ろう'],
    kunyomi: ['おおかみ'],
    meanings: ['wolf'],
    grade: 9,
    strokes: 10,
    frequencyRank: 2129,
  ),
  // legitimate wife / direct descent (non-bastard)
  '嫡': KanjiReading(
    kanji: '嫡',
    onyomi: ['ちゃく', 'てき'],
    kunyomi: [],
    meanings: ['legitimate wife', 'direct descent (non-bastard)'],
    grade: 8,
    strokes: 14,
    frequencyRank: 2130,
  ),
  // spell / curse / charm
  '呪': KanjiReading(
    kanji: '呪',
    onyomi: ['じゅ', 'しゅ', 'しゅう', 'ず'],
    kunyomi: ['まじな(う)', 'のろ(い)', 'まじな(い)', 'のろ(う)'],
    meanings: ['spell', 'curse', 'charm'],
    grade: 8,
    strokes: 8,
    frequencyRank: 2131,
  ),
  // beheading / kill / murder
  '斬': KanjiReading(
    kanji: '斬',
    onyomi: ['ざん', 'さん', 'せん', 'ぜん'],
    kunyomi: ['き(る)'],
    meanings: ['beheading', 'kill', 'murder'],
    grade: 8,
    strokes: 11,
    frequencyRank: 2132,
  ),
  // be pointed / sharp / taper
  '尖': KanjiReading(
    kanji: '尖',
    onyomi: ['せん'],
    kunyomi: ['とが(る)', 'さき', 'するど(い)'],
    meanings: ['be pointed', 'sharp', 'taper'],
    grade: 9,
    strokes: 6,
    frequencyRank: 2133,
  ),
  // 高 / 远
  '尭': KanjiReading(
    kanji: '尭',
    onyomi: ['ぎょう'],
    kunyomi: ['たか(い)'],
    meanings: ['高', '远'],
    grade: 9,
    strokes: 8,
    frequencyRank: 2136,
  ),
  // grudge / show resentment / be jealous
  '怨': KanjiReading(
    kanji: '怨',
    onyomi: ['えん', 'おん', 'うん'],
    kunyomi: ['うら(む)', 'うらみ', 'うら(めしい)'],
    meanings: ['grudge', 'show resentment', 'be jealous'],
    grade: 8,
    strokes: 9,
    frequencyRank: 2137,
  ),
  // you / lord / secretary
  '卿': KanjiReading(
    kanji: '卿',
    onyomi: ['けい', 'きょう'],
    kunyomi: ['きみ'],
    meanings: ['you', 'lord', 'secretary'],
    grade: 9,
    strokes: 12,
    frequencyRank: 2138,
  ),
  // spit / skewer
  '串': KanjiReading(
    kanji: '串',
    onyomi: ['かん', 'けん', 'せん'],
    kunyomi: ['くし', 'つらぬ(く)'],
    meanings: ['spit', 'skewer'],
    grade: 8,
    strokes: 7,
    frequencyRank: 2139,
  ),
  // 停止 / halt / previously
  '已': KanjiReading(
    kanji: '已',
    onyomi: ['い'],
    kunyomi: ['や(む)', 'すで(に)', 'のみ', 'はなはだ'],
    meanings: ['停止', 'halt', 'previously'],
    grade: 9,
    strokes: 3,
    frequencyRank: 2140,
  ),
  // menacing / dignity / majesty
  '嚇': KanjiReading(
    kanji: '嚇',
    onyomi: ['かく'],
    kunyomi: ['おど(す)'],
    meanings: ['menacing', 'dignity', 'majesty'],
    grade: 8,
    strokes: 17,
    frequencyRank: 2141,
  ),
  // sign of the snake or serpent / 9-11AM / sixth sign of Chinese zodiac
  '巳': KanjiReading(
    kanji: '巳',
    onyomi: ['し'],
    kunyomi: ['み'],
    meanings: ['sign of the snake or serpent', '9-11AM', 'sixth sign of Chinese zodiac'],
    grade: 9,
    strokes: 3,
    frequencyRank: 2142,
  ),
  // convex / beetle brow / uneven
  '凸': KanjiReading(
    kanji: '凸',
    onyomi: ['とつ'],
    kunyomi: ['でこ'],
    meanings: ['convex', 'beetle brow', 'uneven'],
    grade: 8,
    strokes: 5,
    frequencyRank: 2143,
  ),
  // stretch
  '暢': KanjiReading(
    kanji: '暢',
    onyomi: ['ちょう'],
    kunyomi: ['のび(る)'],
    meanings: ['stretch'],
    grade: 9,
    strokes: 14,
    frequencyRank: 2144,
  ),
  // tumor / swelling
  '腫': KanjiReading(
    kanji: '腫',
    onyomi: ['しゅ', 'しょう'],
    kunyomi: ['は(れる)', 'は(れ)', 'は(らす)', 'はれもの'],
    meanings: ['tumor', 'swelling'],
    grade: 8,
    strokes: 13,
    frequencyRank: 2145,
  ),
  // millet
  '粟': KanjiReading(
    kanji: '粟',
    onyomi: ['ぞく', 'しょく', 'そく'],
    kunyomi: ['あわ', 'もみ'],
    meanings: ['millet'],
    grade: 9,
    strokes: 12,
    frequencyRank: 2146,
  ),
  // swallow (bird)
  '燕': KanjiReading(
    kanji: '燕',
    onyomi: ['えん'],
    kunyomi: ['つばめ', 'つばくら', 'つばくろ'],
    meanings: ['swallow (bird)'],
    grade: 9,
    strokes: 16,
    frequencyRank: 2147,
  ),
  // rhyme / elegance / tone
  '韻': KanjiReading(
    kanji: '韻',
    onyomi: ['いん'],
    kunyomi: [],
    meanings: ['rhyme', 'elegance', 'tone'],
    grade: 8,
    strokes: 19,
    frequencyRank: 2148,
  ),
  // compose / spell / 写
  '綴': KanjiReading(
    kanji: '綴',
    onyomi: ['てい', 'てつ', 'てち', 'げつ'],
    kunyomi: ['と(じる)', 'つづ(る)', 'つづり', 'すみ(やか)'],
    meanings: ['compose', 'spell', '写'],
    grade: 9,
    strokes: 14,
    frequencyRank: 2149,
  ),
  // clay
  '埴': KanjiReading(
    kanji: '埴',
    onyomi: ['しょく'],
    kunyomi: ['はに', 'へな'],
    meanings: ['clay'],
    grade: 9,
    strokes: 11,
    frequencyRank: 2150,
  ),
  // frost
  '霜': KanjiReading(
    kanji: '霜',
    onyomi: ['そう'],
    kunyomi: ['しも'],
    meanings: ['frost'],
    grade: 8,
    strokes: 17,
    frequencyRank: 2151,
  ),
  // mochi rice cake
  '餅': KanjiReading(
    kanji: '餅',
    onyomi: ['へい', 'ひょう'],
    kunyomi: ['もち', 'もちい'],
    meanings: ['mochi rice cake'],
    grade: 8,
    strokes: 14,
    frequencyRank: 2152,
  ),
  // foolish / Russia
  '魯': KanjiReading(
    kanji: '魯',
    onyomi: ['ろ'],
    kunyomi: ['おろか'],
    meanings: ['foolish', 'Russia'],
    grade: 9,
    strokes: 15,
    frequencyRank: 2153,
  ),
  // nitrate / saltpeter
  '硝': KanjiReading(
    kanji: '硝',
    onyomi: ['しょう'],
    kunyomi: [],
    meanings: ['nitrate', 'saltpeter'],
    grade: 8,
    strokes: 12,
    frequencyRank: 2154,
  ),
  // male
  '牡': KanjiReading(
    kanji: '牡',
    onyomi: ['ぼ', 'ぼう'],
    kunyomi: ['おす', '(お)', '(おん)'],
    meanings: ['male'],
    grade: 9,
    strokes: 7,
    frequencyRank: 2155,
  ),
  // chopsticks
  '箸': KanjiReading(
    kanji: '箸',
    onyomi: ['ちょ', 'ちゃく'],
    kunyomi: ['はし'],
    meanings: ['chopsticks'],
    grade: 8,
    strokes: 15,
    frequencyRank: 2156,
  ),
  // imperial order
  '勅': KanjiReading(
    kanji: '勅',
    onyomi: ['ちょく'],
    kunyomi: ['いまし(める)', 'みことのり'],
    meanings: ['imperial order'],
    grade: 8,
    strokes: 9,
    frequencyRank: 2157,
  ),
  // parsley
  '芹': KanjiReading(
    kanji: '芹',
    onyomi: ['きん'],
    kunyomi: ['せり'],
    meanings: ['parsley'],
    grade: 9,
    strokes: 7,
    frequencyRank: 2158,
  ),
  // apricot
  '杏': KanjiReading(
    kanji: '杏',
    onyomi: ['きょう', 'あん', 'こう'],
    kunyomi: ['あんず'],
    meanings: ['apricot'],
    grade: 9,
    strokes: 7,
    frequencyRank: 2159,
  ),
  // (used phonetically)
  '迦': KanjiReading(
    kanji: '迦',
    onyomi: ['か', 'け'],
    kunyomi: [],
    meanings: ['(used phonetically)'],
    grade: 9,
    strokes: 8,
    frequencyRank: 2160,
  ),
  // coffin / casket
  '棺': KanjiReading(
    kanji: '棺',
    onyomi: ['かん'],
    kunyomi: [],
    meanings: ['coffin', 'casket'],
    grade: 8,
    strokes: 12,
    frequencyRank: 2161,
  ),
  // Confucian
  '儒': KanjiReading(
    kanji: '儒',
    onyomi: ['じゅ'],
    kunyomi: [],
    meanings: ['Confucian'],
    grade: 8,
    strokes: 16,
    frequencyRank: 2162,
  ),
  // male mythical bird
  '鳳': KanjiReading(
    kanji: '鳳',
    onyomi: ['ほう', 'ふう'],
    kunyomi: [],
    meanings: ['male mythical bird'],
    grade: 9,
    strokes: 14,
    frequencyRank: 2163,
  ),
  // fragrant / balmy / favourable
  '馨': KanjiReading(
    kanji: '馨',
    onyomi: ['けい', 'きょう'],
    kunyomi: ['かお(る)', 'かおり'],
    meanings: ['fragrant', 'balmy', 'favourable'],
    grade: 9,
    strokes: 20,
    frequencyRank: 2164,
  ),
  // spot / blemish / speck
  '斑': KanjiReading(
    kanji: '斑',
    onyomi: ['はん'],
    kunyomi: ['ふ', 'まだら'],
    meanings: ['spot', 'blemish', 'speck'],
    grade: 8,
    strokes: 12,
    frequencyRank: 2165,
  ),
  // shade / 影 / backing assistance
  '蔭': KanjiReading(
    kanji: '蔭',
    onyomi: ['いん', 'おん'],
    kunyomi: ['かげ'],
    meanings: ['shade', '影', 'backing assistance'],
    grade: 9,
    strokes: 14,
    frequencyRank: 2166,
  ),
  // wise
  '慧': KanjiReading(
    kanji: '慧',
    onyomi: ['けい', 'え'],
    kunyomi: ['さとい'],
    meanings: ['wise'],
    grade: 9,
    strokes: 15,
    frequencyRank: 2168,
  ),
  // national or local god / peaceful / great
  '祇': KanjiReading(
    kanji: '祇',
    onyomi: ['ぎ', 'き', 'し'],
    kunyomi: ['くにつかみ', 'ただ', 'まさに'],
    meanings: ['national or local god', 'peaceful', 'great'],
    grade: 9,
    strokes: 8,
    frequencyRank: 2169,
  ),
  // gift / seriousness
  '摯': KanjiReading(
    kanji: '摯',
    onyomi: ['し'],
    kunyomi: ['いた(る)', 'つか(む)', 'にえ'],
    meanings: ['gift', 'seriousness'],
    grade: 8,
    strokes: 15,
    frequencyRank: 2170,
  ),
  // distress / grieve / lament
  '愁': KanjiReading(
    kanji: '愁',
    onyomi: ['しゅう'],
    kunyomi: ['うれ(える)', 'うれ(い)'],
    meanings: ['distress', 'grieve', 'lament'],
    grade: 8,
    strokes: 13,
    frequencyRank: 2171,
  ),
  // heron
  '鷺': KanjiReading(
    kanji: '鷺',
    onyomi: ['ろ'],
    kunyomi: ['さぎ'],
    meanings: ['heron'],
    grade: 9,
    strokes: 24,
    frequencyRank: 2172,
  ),
  // watchtower / lookout / high building
  '楼': KanjiReading(
    kanji: '楼',
    onyomi: ['ろう'],
    kunyomi: ['たかどの'],
    meanings: ['watchtower', 'lookout', 'high building'],
    grade: 8,
    strokes: 13,
    frequencyRank: 2173,
  ),
  // refined / gentle
  '彬': KanjiReading(
    kanji: '彬',
    onyomi: ['ひん', 'ふん'],
    kunyomi: ['うるわ(しい)', 'あき(らか)'],
    meanings: ['refined', 'gentle'],
    grade: 9,
    strokes: 11,
    frequencyRank: 2174,
  ),
  // men's formal divided skirt
  '袴': KanjiReading(
    kanji: '袴',
    onyomi: ['こ', 'く'],
    kunyomi: ['はかま', 'ずぼん'],
    meanings: ['men\'s formal divided skirt'],
    grade: 9,
    strokes: 11,
    frequencyRank: 2175,
  ),
  // 正确 / 拯救 / assist
  '匡': KanjiReading(
    kanji: '匡',
    onyomi: ['きょう', 'おう'],
    kunyomi: ['すく(う)', 'ただ(す)'],
    meanings: ['正确', '拯救', 'assist'],
    grade: 9,
    strokes: 6,
    frequencyRank: 2176,
  ),
  // eyebrow
  '眉': KanjiReading(
    kanji: '眉',
    onyomi: ['び', 'み'],
    kunyomi: ['まゆ'],
    meanings: ['eyebrow'],
    grade: 8,
    strokes: 9,
    frequencyRank: 2177,
  ),
  // praise / title on a picture
  '讃': KanjiReading(
    kanji: '讃',
    onyomi: ['さん'],
    kunyomi: ['ほ(める)', 'たた(える)'],
    meanings: ['praise', 'title on a picture'],
    grade: 9,
    strokes: 22,
    frequencyRank: 2179,
  ),
  // respect / revere / long for
  '欽': KanjiReading(
    kanji: '欽',
    onyomi: ['きん', 'こん'],
    kunyomi: ['つつし(む)'],
    meanings: ['respect', 'revere', 'long for'],
    grade: 9,
    strokes: 12,
    frequencyRank: 2181,
  ),
  // fuel / firewood / kindling
  '薪': KanjiReading(
    kanji: '薪',
    onyomi: ['しん'],
    kunyomi: ['たきぎ', 'まき'],
    meanings: ['fuel', 'firewood', 'kindling'],
    grade: 8,
    strokes: 16,
    frequencyRank: 2182,
  ),
  // fill / wear (a smile) / clear
  '湛': KanjiReading(
    kanji: '湛',
    onyomi: ['たん', 'ちん', 'じん', 'せん'],
    kunyomi: ['しず(む)', 'たた(える)'],
    meanings: ['fill', 'wear (a smile)', 'clear'],
    grade: 9,
    strokes: 12,
    frequencyRank: 2183,
  ),
  // piled high
  '堆': KanjiReading(
    kanji: '堆',
    onyomi: ['たい', 'つい'],
    kunyomi: ['うずたか(い)'],
    meanings: ['piled high'],
    grade: 8,
    strokes: 11,
    frequencyRank: 2184,
  ),
  // brown / woollen kimono
  '褐': KanjiReading(
    kanji: '褐',
    onyomi: ['かつ'],
    kunyomi: [],
    meanings: ['brown', 'woollen kimono'],
    grade: 8,
    strokes: 13,
    frequencyRank: 2186,
  ),
  // bravely volunteer / counter for guns, inksticks, palanquins, rickshaws
  '挺': KanjiReading(
    kanji: '挺',
    onyomi: ['ちょう', 'てい'],
    kunyomi: ['ぬ(く)'],
    meanings: ['bravely volunteer', 'counter for guns, inksticks, palanquins, rickshaws'],
    grade: 9,
    strokes: 10,
    frequencyRank: 2189,
  ),
  // grant / gift / boon
  '賜': KanjiReading(
    kanji: '賜',
    onyomi: ['し'],
    kunyomi: ['たまわ(る)', 'たま(う)', 'たも(う)'],
    meanings: ['grant', 'gift', 'boon'],
    grade: 8,
    strokes: 15,
    frequencyRank: 2190,
  ),
  // steep / craggy / rugged
  '嵯': KanjiReading(
    kanji: '嵯',
    onyomi: ['さ', 'し'],
    kunyomi: [],
    meanings: ['steep', 'craggy', 'rugged'],
    grade: 9,
    strokes: 13,
    frequencyRank: 2191,
  ),
  // wild goose
  '雁': KanjiReading(
    kanji: '雁',
    onyomi: ['がん'],
    kunyomi: ['かり', 'かりがね'],
    meanings: ['wild goose'],
    grade: 9,
    strokes: 12,
    frequencyRank: 2192,
  ),
  // cultivated rice field
  '佃': KanjiReading(
    kanji: '佃',
    onyomi: ['てん', 'でん'],
    kunyomi: ['つくだ'],
    meanings: ['cultivated rice field'],
    grade: 9,
    strokes: 7,
    frequencyRank: 2193,
  ),
  // 规则 / synthesize
  '綜': KanjiReading(
    kanji: '綜',
    onyomi: ['そう'],
    kunyomi: ['おさ(める)', 'す(べる)'],
    meanings: ['规则', 'synthesize'],
    grade: 9,
    strokes: 14,
    frequencyRank: 2194,
  ),
  // darning / repair / mend
  '繕': KanjiReading(
    kanji: '繕',
    onyomi: ['ぜん'],
    kunyomi: ['つくろ(う)'],
    meanings: ['darning', 'repair', 'mend'],
    grade: 8,
    strokes: 18,
    frequencyRank: 2195,
  ),
  // plug / bolt / cork
  '栓': KanjiReading(
    kanji: '栓',
    onyomi: ['せん'],
    kunyomi: [],
    meanings: ['plug', 'bolt', 'cork'],
    grade: 8,
    strokes: 10,
    frequencyRank: 2199,
  ),
  // 绿 / kingfisher
  '翠': KanjiReading(
    kanji: '翠',
    onyomi: ['すい'],
    kunyomi: ['かわせみ', 'みどり'],
    meanings: ['绿', 'kingfisher'],
    grade: 9,
    strokes: 14,
    frequencyRank: 2200,
  ),
  // freshwater trout / smelt
  '鮎': KanjiReading(
    kanji: '鮎',
    onyomi: ['でん', 'ねん'],
    kunyomi: ['あゆ', 'なまず'],
    meanings: ['freshwater trout', 'smelt'],
    grade: 9,
    strokes: 16,
    frequencyRank: 2201,
  ),
  // wick
  '芯': KanjiReading(
    kanji: '芯',
    onyomi: ['しん'],
    kunyomi: [],
    meanings: ['wick'],
    grade: 8,
    strokes: 7,
    frequencyRank: 2202,
  ),
  // honey / nectar / molasses
  '蜜': KanjiReading(
    kanji: '蜜',
    onyomi: ['みつ', 'びつ'],
    kunyomi: [],
    meanings: ['honey', 'nectar', 'molasses'],
    grade: 8,
    strokes: 14,
    frequencyRank: 2203,
  ),
  // plant / sow
  '播': KanjiReading(
    kanji: '播',
    onyomi: ['は', 'ばん', 'はん'],
    kunyomi: ['ま(く)'],
    meanings: ['plant', 'sow'],
    grade: 9,
    strokes: 15,
    frequencyRank: 2204,
  ),
  // hazelnut / filbert
  '榛': KanjiReading(
    kanji: '榛',
    onyomi: ['しん', 'はん'],
    kunyomi: ['はしばみ', 'はり'],
    meanings: ['hazelnut', 'filbert'],
    grade: 9,
    strokes: 14,
    frequencyRank: 2205,
  ),
  // concave / hollow / sunken
  '凹': KanjiReading(
    kanji: '凹',
    onyomi: ['おう'],
    kunyomi: ['くぼ(む)', 'へこ(む)', 'ぼこ'],
    meanings: ['concave', 'hollow', 'sunken'],
    grade: 8,
    strokes: 5,
    frequencyRank: 2206,
  ),
  // glossy / luster / glaze
  '艶': KanjiReading(
    kanji: '艶',
    onyomi: ['えん'],
    kunyomi: ['つや', 'なま(めかしい)', 'あで(やか)', 'つや(めく)', 'なま(めく)'],
    meanings: ['glossy', 'luster', 'glaze'],
    grade: 8,
    strokes: 19,
    frequencyRank: 2207,
  ),
  // quire (of paper) / bundle of seaweed / counter for screens
  '帖': KanjiReading(
    kanji: '帖',
    onyomi: ['ちょう', 'じょう'],
    kunyomi: ['かきもの'],
    meanings: ['quire (of paper)', 'bundle of seaweed', 'counter for screens'],
    grade: 9,
    strokes: 8,
    frequencyRank: 2208,
  ),
  // pay respects / visit / ask
  '伺': KanjiReading(
    kanji: '伺',
    onyomi: ['し'],
    kunyomi: ['うかが(う)'],
    meanings: ['pay respects', 'visit', 'ask'],
    grade: 8,
    strokes: 7,
    frequencyRank: 2209,
  ),
  // tub / bucket
  '桶': KanjiReading(
    kanji: '桶',
    onyomi: ['よう', 'とう'],
    kunyomi: ['おけ'],
    meanings: ['tub', 'bucket'],
    grade: 9,
    strokes: 11,
    frequencyRank: 2210,
  ),
  // 全部
  '惣': KanjiReading(
    kanji: '惣',
    onyomi: ['そう'],
    kunyomi: ['すべ(て)'],
    meanings: ['全部'],
    grade: 9,
    strokes: 12,
    frequencyRank: 2211,
  ),
  // thigh / crotch
  '股': KanjiReading(
    kanji: '股',
    onyomi: ['こ'],
    kunyomi: ['また', 'もも'],
    meanings: ['thigh', 'crotch'],
    grade: 8,
    strokes: 8,
    frequencyRank: 2212,
  ),
  // fragrant / stink / glow
  '匂': KanjiReading(
    kanji: '匂',
    onyomi: [],
    kunyomi: ['にお(う)', 'にお(い)', 'にお(わせる)'],
    meanings: ['fragrant', 'stink', 'glow'],
    grade: 8,
    strokes: 4,
    frequencyRank: 2213,
  ),
  // saddle
  '鞍': KanjiReading(
    kanji: '鞍',
    onyomi: ['あん'],
    kunyomi: ['くら'],
    meanings: ['saddle'],
    grade: 9,
    strokes: 15,
    frequencyRank: 2214,
  ),
  // vine / ivy
  '蔦': KanjiReading(
    kanji: '蔦',
    onyomi: ['ちょう'],
    kunyomi: ['つた'],
    meanings: ['vine', 'ivy'],
    grade: 9,
    strokes: 14,
    frequencyRank: 2215,
  ),
  // 玩 / take pleasure in / trifle with
  '玩': KanjiReading(
    kanji: '玩',
    onyomi: ['がん'],
    kunyomi: ['もちあそ(ぶ)', 'もてあそ(ぶ)'],
    meanings: ['玩', 'take pleasure in', 'trifle with'],
    grade: 8,
    strokes: 8,
    frequencyRank: 2216,
  ),
  // miscanthus reed
  '萱': KanjiReading(
    kanji: '萱',
    onyomi: ['けん'],
    kunyomi: ['かや', 'かんぞう'],
    meanings: ['miscanthus reed'],
    grade: 9,
    strokes: 12,
    frequencyRank: 2217,
  ),
  // ladder / stairs / insatiable drinking
  '梯': KanjiReading(
    kanji: '梯',
    onyomi: ['てい', 'たい'],
    kunyomi: ['はしご'],
    meanings: ['ladder', 'stairs', 'insatiable drinking'],
    grade: 9,
    strokes: 11,
    frequencyRank: 2218,
  ),
  // drop / trickle / dripping
  '雫': KanjiReading(
    kanji: '雫',
    onyomi: ['だ'],
    kunyomi: ['しずく'],
    meanings: ['drop', 'trickle', 'dripping'],
    grade: 9,
    strokes: 11,
    frequencyRank: 2219,
  ),
  // bonds / fetters
  '絆': KanjiReading(
    kanji: '絆',
    onyomi: ['はん'],
    kunyomi: ['きずな', 'ほだ(す)', 'つな(ぐ)'],
    meanings: ['bonds', 'fetters'],
    grade: 9,
    strokes: 11,
    frequencyRank: 2220,
  ),
  // tempering / refine / drill
  '錬': KanjiReading(
    kanji: '錬',
    onyomi: ['れん'],
    kunyomi: ['ね(る)'],
    meanings: ['tempering', 'refine', 'drill'],
    grade: 8,
    strokes: 16,
    frequencyRank: 2221,
  ),
  // port / harbor
  '湊': KanjiReading(
    kanji: '湊',
    onyomi: ['そう'],
    kunyomi: ['みなと', 'あつ(まる)'],
    meanings: ['port', 'harbor'],
    grade: 9,
    strokes: 12,
    frequencyRank: 2222,
  ),
  // bee / wasp / hornet
  '蜂': KanjiReading(
    kanji: '蜂',
    onyomi: ['ほう'],
    kunyomi: ['はち'],
    meanings: ['bee', 'wasp', 'hornet'],
    grade: 8,
    strokes: 13,
    frequencyRank: 2223,
  ),
  // falcon
  '隼': KanjiReading(
    kanji: '隼',
    onyomi: ['しゅん', 'じゅん'],
    kunyomi: ['はやぶさ'],
    meanings: ['falcon'],
    grade: 9,
    strokes: 10,
    frequencyRank: 2224,
  ),
  // rudder / helm / wheel
  '舵': KanjiReading(
    kanji: '舵',
    onyomi: ['だ', 'た'],
    kunyomi: ['かじ'],
    meanings: ['rudder', 'helm', 'wheel'],
    grade: 9,
    strokes: 11,
    frequencyRank: 2225,
  ),
  // strand / beach / shore
  '渚': KanjiReading(
    kanji: '渚',
    onyomi: ['しょ'],
    kunyomi: ['なぎさ'],
    meanings: ['strand', 'beach', 'shore'],
    grade: 9,
    strokes: 11,
    frequencyRank: 2226,
  ),
  // jewel
  '珂': KanjiReading(
    kanji: '珂',
    onyomi: ['か'],
    kunyomi: [],
    meanings: ['jewel'],
    grade: 9,
    strokes: 9,
    frequencyRank: 2227,
  ),
  // inmost / 心
  '衷': KanjiReading(
    kanji: '衷',
    onyomi: ['ちゅう'],
    kunyomi: [],
    meanings: ['inmost', '心'],
    grade: 8,
    strokes: 9,
    frequencyRank: 2229,
  ),
  // pursue / drive away / chase
  '逐': KanjiReading(
    kanji: '逐',
    onyomi: ['ちく'],
    kunyomi: [],
    meanings: ['pursue', 'drive away', 'chase'],
    grade: 8,
    strokes: 10,
    frequencyRank: 2230,
  ),
  // reject / retreat / recede
  '斥': KanjiReading(
    kanji: '斥',
    onyomi: ['せき'],
    kunyomi: ['しりぞ(ける)'],
    meanings: ['reject', 'retreat', 'recede'],
    grade: 8,
    strokes: 5,
    frequencyRank: 2231,
  ),
  // rare / phenomenal / dilute (acid)
  '稀': KanjiReading(
    kanji: '稀',
    onyomi: ['き', 'け'],
    kunyomi: ['まれ', 'まばら'],
    meanings: ['rare', 'phenomenal', 'dilute (acid)'],
    grade: 9,
    strokes: 12,
    frequencyRank: 2232,
  ),
  // high mountain
  '峨': KanjiReading(
    kanji: '峨',
    onyomi: ['が'],
    kunyomi: ['けわ(しい)'],
    meanings: ['high mountain'],
    grade: 9,
    strokes: 10,
    frequencyRank: 2234,
  ),
  // lotus / Mt Fuji
  '芙': KanjiReading(
    kanji: '芙',
    onyomi: ['ふ'],
    kunyomi: [],
    meanings: ['lotus', 'Mt Fuji'],
    grade: 9,
    strokes: 7,
    frequencyRank: 2238,
  ),
  // imperial edict
  '詔': KanjiReading(
    kanji: '詔',
    onyomi: ['しょう'],
    kunyomi: ['みことのり'],
    meanings: ['imperial edict'],
    grade: 8,
    strokes: 12,
    frequencyRank: 2239,
  ),
  // swamp / shore / fifth month
  '皐': KanjiReading(
    kanji: '皐',
    onyomi: ['こう'],
    kunyomi: ['さつき'],
    meanings: ['swamp', 'shore', 'fifth month'],
    grade: 9,
    strokes: 11,
    frequencyRank: 2240,
  ),
  // chick / squab / duckling
  '雛': KanjiReading(
    kanji: '雛',
    onyomi: ['すう', 'す', 'じゅ'],
    kunyomi: ['ひな', 'ひよこ'],
    meanings: ['chick', 'squab', 'duckling'],
    grade: 9,
    strokes: 18,
    frequencyRank: 2241,
  ),
  // 椅子
  '椅': KanjiReading(
    kanji: '椅',
    onyomi: ['い'],
    kunyomi: [],
    meanings: ['椅子'],
    grade: 8,
    strokes: 12,
    frequencyRank: 2245,
  ),
  // consider / reflect / 思考
  '惟': KanjiReading(
    kanji: '惟',
    onyomi: ['い', 'ゆい'],
    kunyomi: ['おも(んみる)', 'これ', 'おも(うに)'],
    meanings: ['consider', 'reflect', '思考'],
    grade: 9,
    strokes: 11,
    frequencyRank: 2246,
  ),
  // cave
  '宕': KanjiReading(
    kanji: '宕',
    onyomi: ['とう'],
    kunyomi: ['すぎる'],
    meanings: ['cave'],
    grade: 9,
    strokes: 8,
    frequencyRank: 2248,
  ),
  // noisy / boisterous
  '喧': KanjiReading(
    kanji: '喧',
    onyomi: ['けん'],
    kunyomi: ['やかま(しい)', 'かまびす(しい)'],
    meanings: ['noisy', 'boisterous'],
    grade: 9,
    strokes: 12,
    frequencyRank: 2249,
  ),
  // 帮助 / assist
  '佑': KanjiReading(
    kanji: '佑',
    onyomi: ['ゆう', 'う'],
    kunyomi: ['たす(ける)'],
    meanings: ['帮助', 'assist'],
    grade: 9,
    strokes: 7,
    frequencyRank: 2250,
  ),
  // camphor
  '樟': KanjiReading(
    kanji: '樟',
    onyomi: ['しょう'],
    kunyomi: ['くす'],
    meanings: ['camphor'],
    grade: 9,
    strokes: 15,
    frequencyRank: 2252,
  ),
  // shine / sparkle / gleam
  '耀': KanjiReading(
    kanji: '耀',
    onyomi: ['よう'],
    kunyomi: ['かがや(く)', 'ひかり'],
    meanings: ['shine', 'sparkle', 'gleam'],
    grade: 9,
    strokes: 20,
    frequencyRank: 2253,
  ),
  // blackened eyebrows
  '黛': KanjiReading(
    kanji: '黛',
    onyomi: ['たい'],
    kunyomi: ['まゆずみ'],
    meanings: ['blackened eyebrows'],
    grade: 9,
    strokes: 16,
    frequencyRank: 2254,
  ),
  // comb
  '櫛': KanjiReading(
    kanji: '櫛',
    onyomi: ['しつ'],
    kunyomi: ['くし', 'くしけず(る)'],
    meanings: ['comb'],
    grade: 9,
    strokes: 17,
    frequencyRank: 2256,
  ),
  // kindness / moisten
  '渥': KanjiReading(
    kanji: '渥',
    onyomi: ['あく'],
    kunyomi: ['あつ(い)', 'うるお(う)'],
    meanings: ['kindness', 'moisten'],
    grade: 9,
    strokes: 12,
    frequencyRank: 2257,
  ),
  // approach / draw near / push open
  '挨': KanjiReading(
    kanji: '挨',
    onyomi: ['あい'],
    kunyomi: ['ひら(く)'],
    meanings: ['approach', 'draw near', 'push open'],
    grade: 8,
    strokes: 10,
    frequencyRank: 2258,
  ),
  // yearn after / long for / aspire to
  '憧': KanjiReading(
    kanji: '憧',
    onyomi: ['しょう', 'とう', 'どう'],
    kunyomi: ['あこが(れる)'],
    meanings: ['yearn after', 'long for', 'aspire to'],
    grade: 8,
    strokes: 15,
    frequencyRank: 2259,
  ),
  // get wet / damp / make love
  '濡': KanjiReading(
    kanji: '濡',
    onyomi: ['じゅ', 'にゅ'],
    kunyomi: ['ぬれ(る)', 'ぬら(す)', 'ぬ(れる)', 'ぬ(らす)', 'うるお(い)', 'うるお(う)', 'うるお(す)'],
    meanings: ['get wet', 'damp', 'make love'],
    grade: 9,
    strokes: 17,
    frequencyRank: 2260,
  ),
  // spear / lance / javelin
  '槍': KanjiReading(
    kanji: '槍',
    onyomi: ['そう', 'しょう'],
    kunyomi: ['やり'],
    meanings: ['spear', 'lance', 'javelin'],
    grade: 9,
    strokes: 14,
    frequencyRank: 2261,
  ),
  // wee hours / 傍晚 / early night
  '宵': KanjiReading(
    kanji: '宵',
    onyomi: ['しょう'],
    kunyomi: ['よい'],
    meanings: ['wee hours', '傍晚', 'early night'],
    grade: 8,
    strokes: 10,
    frequencyRank: 2262,
  ),
  // delusion / unnecessarily / without authority
  '妄': KanjiReading(
    kanji: '妄',
    onyomi: ['もう', 'ぼう'],
    kunyomi: ['みだ(りに)'],
    meanings: ['delusion', 'unnecessarily', 'without authority'],
    grade: 8,
    strokes: 6,
    frequencyRank: 2264,
  ),
  // sincere / kind / considerate
  '惇': KanjiReading(
    kanji: '惇',
    onyomi: ['しゅん', 'じゅん', 'とん'],
    kunyomi: ['あつ(い)'],
    meanings: ['sincere', 'kind', 'considerate'],
    grade: 9,
    strokes: 11,
    frequencyRank: 2265,
  ),
  // dried meat
  '脩': KanjiReading(
    kanji: '脩',
    onyomi: ['しゅう'],
    kunyomi: ['おさ(める)', 'なが(い)', 'ほじし'],
    meanings: ['dried meat'],
    grade: 9,
    strokes: 11,
    frequencyRank: 2267,
  ),
  // for the first time / not until
  '甫': KanjiReading(
    kanji: '甫',
    onyomi: ['ほ', 'ふ'],
    kunyomi: ['はじ(めて)'],
    meanings: ['for the first time', 'not until'],
    grade: 9,
    strokes: 7,
    frequencyRank: 2270,
  ),
  // bar-tending / serving sake / the host
  '酌': KanjiReading(
    kanji: '酌',
    onyomi: ['しゃく'],
    kunyomi: ['く(む)'],
    meanings: ['bar-tending', 'serving sake', 'the host'],
    grade: 8,
    strokes: 10,
    frequencyRank: 2271,
  ),
  // silkworm
  '蚕': KanjiReading(
    kanji: '蚕',
    onyomi: ['さん', 'てん'],
    kunyomi: ['かいこ', 'こ'],
    meanings: ['silkworm'],
    grade: 6,
    strokes: 10,
    frequencyRank: 2272,
  ),
  // trench / dugout / air raid shelter
  '壕': KanjiReading(
    kanji: '壕',
    onyomi: ['こう', 'ごう'],
    kunyomi: ['ほり'],
    meanings: ['trench', 'dugout', 'air raid shelter'],
    grade: 9,
    strokes: 17,
    frequencyRank: 2273,
  ),
  // glad / pleased / rejoice
  '嬉': KanjiReading(
    kanji: '嬉',
    onyomi: ['き'],
    kunyomi: ['うれ(しい)', 'たの(しむ)'],
    meanings: ['glad', 'pleased', 'rejoice'],
    grade: 9,
    strokes: 15,
    frequencyRank: 2274,
  ),
  // 蓝 / pale
  '蒼': KanjiReading(
    kanji: '蒼',
    onyomi: ['そう'],
    kunyomi: ['あお(い)'],
    meanings: ['蓝', 'pale'],
    grade: 9,
    strokes: 13,
    frequencyRank: 2276,
  ),
  // 食物 / bait / prey
  '餌': KanjiReading(
    kanji: '餌',
    onyomi: ['じ', 'に'],
    kunyomi: ['え', 'えば', 'えさ', 'もち'],
    meanings: ['食物', 'bait', 'prey'],
    grade: 8,
    strokes: 14,
    frequencyRank: 2277,
  ),
  // rice gruel
  '粥': KanjiReading(
    kanji: '粥',
    onyomi: ['いく', 'しゅく', 'じゅく'],
    kunyomi: ['かゆ', 'かい', 'ひさ(ぐ)'],
    meanings: ['rice gruel'],
    grade: 9,
    strokes: 12,
    frequencyRank: 2280,
  ),
  // shine / 光
  '暉': KanjiReading(
    kanji: '暉',
    onyomi: ['き'],
    kunyomi: ['かが(やく)'],
    meanings: ['shine', '光'],
    grade: 9,
    strokes: 13,
    frequencyRank: 2285,
  ),
  // lift up / 给 / offer
  '捧': KanjiReading(
    kanji: '捧',
    onyomi: ['ほう'],
    kunyomi: ['ささ(げる)'],
    meanings: ['lift up', '给', 'offer'],
    grade: 9,
    strokes: 11,
    frequencyRank: 2286,
  ),
  // distribute / disseminate / partition
  '頒': KanjiReading(
    kanji: '頒',
    onyomi: ['はん'],
    kunyomi: ['わ(かつ)', 'わ(ける)'],
    meanings: ['distribute', 'disseminate', 'partition'],
    grade: 8,
    strokes: 13,
    frequencyRank: 2287,
  ),
  // only / free / in addition
  '只': KanjiReading(
    kanji: '只',
    onyomi: ['し'],
    kunyomi: ['ただ'],
    meanings: ['only', 'free', 'in addition'],
    grade: 9,
    strokes: 5,
    frequencyRank: 2288,
  ),
  // limb / arms &amp; legs
  '肢': KanjiReading(
    kanji: '肢',
    onyomi: ['し'],
    kunyomi: [],
    meanings: ['limb', 'arms &amp; legs'],
    grade: 8,
    strokes: 8,
    frequencyRank: 2289,
  ),
  // cedar / sandalwood / spindle tree
  '檀': KanjiReading(
    kanji: '檀',
    onyomi: ['だん', 'たん'],
    kunyomi: ['まゆみ'],
    meanings: ['cedar', 'sandalwood', 'spindle tree'],
    grade: 9,
    strokes: 17,
    frequencyRank: 2291,
  ),
  // victory song
  '凱': KanjiReading(
    kanji: '凱',
    onyomi: ['がい', 'かい'],
    kunyomi: ['かちどき', 'やわらぐ'],
    meanings: ['victory song'],
    grade: 9,
    strokes: 12,
    frequencyRank: 2293,
  ),
  // comet / broom
  '彗': KanjiReading(
    kanji: '彗',
    onyomi: ['すい', 'え', 'けい', 'せい'],
    kunyomi: ['ほうき'],
    meanings: ['comet', 'broom'],
    grade: 9,
    strokes: 11,
    frequencyRank: 2294,
  ),
  // mimeograph / copy
  '謄': KanjiReading(
    kanji: '謄',
    onyomi: ['とう'],
    kunyomi: [],
    meanings: ['mimeograph', 'copy'],
    grade: 8,
    strokes: 17,
    frequencyRank: 2295,
  ),
  // evergreen oak / (kokuji)
  '樫': KanjiReading(
    kanji: '樫',
    onyomi: [],
    kunyomi: ['かし'],
    meanings: ['evergreen oak', '(kokuji)'],
    grade: 9,
    strokes: 16,
    frequencyRank: 2297,
  ),
  // rumor / gossip / hearsay
  '噂': KanjiReading(
    kanji: '噂',
    onyomi: ['そん'],
    kunyomi: ['うわさ'],
    meanings: ['rumor', 'gossip', 'hearsay'],
    grade: 9,
    strokes: 15,
    frequencyRank: 2298,
  ),
  // stature / height / spine
  '脊': KanjiReading(
    kanji: '脊',
    onyomi: ['せき'],
    kunyomi: ['せ', 'せい'],
    meanings: ['stature', 'height', 'spine'],
    grade: 8,
    strokes: 10,
    frequencyRank: 2299,
  ),
  // catalpa tree / woodblock printing
  '梓': KanjiReading(
    kanji: '梓',
    onyomi: ['し'],
    kunyomi: ['あずさ'],
    meanings: ['catalpa tree', 'woodblock printing'],
    grade: 9,
    strokes: 11,
    frequencyRank: 2301,
  ),
  // Kyoto / the capital
  '洛': KanjiReading(
    kanji: '洛',
    onyomi: ['らく'],
    kunyomi: [],
    meanings: ['Kyoto', 'the capital'],
    grade: 9,
    strokes: 9,
    frequencyRank: 2302,
  ),
  // whey / good Buddhist teaching
  '醍': KanjiReading(
    kanji: '醍',
    onyomi: ['だい', 'たい', 'てい'],
    kunyomi: [],
    meanings: ['whey', 'good Buddhist teaching'],
    grade: 9,
    strokes: 16,
    frequencyRank: 2303,
  ),
  // fort / stronghold / entrenchments
  '砦': KanjiReading(
    kanji: '砦',
    onyomi: ['さい'],
    kunyomi: ['とりで'],
    meanings: ['fort', 'stronghold', 'entrenchments'],
    grade: 9,
    strokes: 11,
    frequencyRank: 2304,
  ),
  // sign of the ox or cow / 1-3AM / second sign of Chinese zodiac
  '丑': KanjiReading(
    kanji: '丑',
    onyomi: ['ちゅう'],
    kunyomi: ['うし'],
    meanings: ['sign of the ox or cow', '1-3AM', 'second sign of Chinese zodiac'],
    grade: 9,
    strokes: 4,
    frequencyRank: 2305,
  ),
  // bracken / fernbrake
  '蕨': KanjiReading(
    kanji: '蕨',
    onyomi: ['けつ'],
    kunyomi: ['わらび'],
    meanings: ['bracken', 'fernbrake'],
    grade: 9,
    strokes: 15,
    frequencyRank: 2307,
  ),
  // heir / succeed
  '嗣': KanjiReading(
    kanji: '嗣',
    onyomi: ['し'],
    kunyomi: [],
    meanings: ['heir', 'succeed'],
    grade: 8,
    strokes: 13,
    frequencyRank: 2310,
  ),
  // corner / nook / recess
  '隈': KanjiReading(
    kanji: '隈',
    onyomi: ['わい', 'え'],
    kunyomi: ['くま', 'すみ'],
    meanings: ['corner', 'nook', 'recess'],
    grade: 9,
    strokes: 12,
    frequencyRank: 2311,
  ),
  // grant / answer
  '叶': KanjiReading(
    kanji: '叶',
    onyomi: ['きょう'],
    kunyomi: ['かな(える)', 'かな(う)'],
    meanings: ['grant', 'answer'],
    grade: 9,
    strokes: 5,
    frequencyRank: 2312,
  ),
  // uncanny / weird / threatening
  '凄': KanjiReading(
    kanji: '凄',
    onyomi: ['せい', 'さい'],
    kunyomi: ['さむ(い)', 'すご(い)', 'すさ(まじい)'],
    meanings: ['uncanny', 'weird', 'threatening'],
    grade: 8,
    strokes: 10,
    frequencyRank: 2313,
  ),
  // eventide / tide / salt water
  '汐': KanjiReading(
    kanji: '汐',
    onyomi: ['せき'],
    kunyomi: ['しお', 'うしお', 'せい'],
    meanings: ['eventide', 'tide', 'salt water'],
    grade: 9,
    strokes: 6,
    frequencyRank: 2314,
  ),
  // brilliant fabric design
  '絢': KanjiReading(
    kanji: '絢',
    onyomi: ['けん'],
    kunyomi: [],
    meanings: ['brilliant fabric design'],
    grade: 9,
    strokes: 12,
    frequencyRank: 2315,
  ),
  // jealous / envy
  '嫉': KanjiReading(
    kanji: '嫉',
    onyomi: ['しつ'],
    kunyomi: ['そね(む)', 'ねた(む)', 'にく(む)'],
    meanings: ['jealous', 'envy'],
    grade: 8,
    strokes: 13,
    frequencyRank: 2317,
  ),
  // conjunction (astronomy) / first day of month / 北
  '朔': KanjiReading(
    kanji: '朔',
    onyomi: ['さく'],
    kunyomi: ['ついたち'],
    meanings: ['conjunction (astronomy)', 'first day of month', '北'],
    grade: 9,
    strokes: 10,
    frequencyRank: 2318,
  ),
  // knee / lap
  '膝': KanjiReading(
    kanji: '膝',
    onyomi: ['しつ'],
    kunyomi: ['ひざ'],
    meanings: ['knee', 'lap'],
    grade: 8,
    strokes: 15,
    frequencyRank: 2320,
  ),
  // nursing / attending / entertainer
  '伽': KanjiReading(
    kanji: '伽',
    onyomi: ['か', 'が', 'きゃ', 'ぎゃ'],
    kunyomi: ['とぎ'],
    meanings: ['nursing', 'attending', 'entertainer'],
    grade: 9,
    strokes: 7,
    frequencyRank: 2323,
  ),
  // barbarian / savage / Ainu
  '夷': KanjiReading(
    kanji: '夷',
    onyomi: ['い'],
    kunyomi: ['えびす', 'えみし', 'ころ(す)', 'たい(らげる)'],
    meanings: ['barbarian', 'savage', 'Ainu'],
    grade: 9,
    strokes: 6,
    frequencyRank: 2324,
  ),
  // selfish / arbitrary
  '恣': KanjiReading(
    kanji: '恣',
    onyomi: ['し'],
    kunyomi: ['ほしいまま'],
    meanings: ['selfish', 'arbitrary'],
    grade: 8,
    strokes: 10,
    frequencyRank: 2325,
  ),
  // furrow / thirty tsubo / ridge
  '畝': KanjiReading(
    kanji: '畝',
    onyomi: ['ぼう', 'ほ', 'も', 'む'],
    kunyomi: ['せ', 'うね'],
    meanings: ['furrow', 'thirty tsubo', 'ridge'],
    grade: 8,
    strokes: 10,
    frequencyRank: 2327,
  ),
  // extract / selection / summary
  '抄': KanjiReading(
    kanji: '抄',
    onyomi: ['しょう'],
    kunyomi: [],
    meanings: ['extract', 'selection', 'summary'],
    grade: 8,
    strokes: 7,
    frequencyRank: 2328,
  ),
  // stake / post / picket
  '杭': KanjiReading(
    kanji: '杭',
    onyomi: ['こう'],
    kunyomi: ['くい'],
    meanings: ['stake', 'post', 'picket'],
    grade: 9,
    strokes: 8,
    frequencyRank: 2329,
  ),
  // temporary abode / imply / suggest
  '寓': KanjiReading(
    kanji: '寓',
    onyomi: ['ぐう', 'ぐ', 'どう'],
    kunyomi: ['ぐう(する)', 'かこつ(ける)', 'よ(せる)', 'よ(る)', 'かりずまい'],
    meanings: ['temporary abode', 'imply', 'suggest'],
    grade: 9,
    strokes: 12,
    frequencyRank: 2330,
  ),
  // noodles / wheat flour
  '麺': KanjiReading(
    kanji: '麺',
    onyomi: ['めん', 'べん'],
    kunyomi: ['むぎこ'],
    meanings: ['noodles', 'wheat flour'],
    grade: 8,
    strokes: 16,
    frequencyRank: 2331,
  ),
  // be crowned with / live under (a ruler) / 接受
  '戴': KanjiReading(
    kanji: '戴',
    onyomi: ['たい'],
    kunyomi: ['いただ(く)'],
    meanings: ['be crowned with', 'live under (a ruler)', '接受'],
    grade: 8,
    strokes: 17,
    frequencyRank: 2332,
  ),
  // refreshing / bracing / resonant
  '爽': KanjiReading(
    kanji: '爽',
    onyomi: ['そう'],
    kunyomi: ['あき(らか)', 'さわ(やか)', 'たがう'],
    meanings: ['refreshing', 'bracing', 'resonant'],
    grade: 8,
    strokes: 11,
    frequencyRank: 2333,
  ),
  // cuff / hem / foot of mountain
  '裾': KanjiReading(
    kanji: '裾',
    onyomi: ['きょ', 'こ'],
    kunyomi: ['すそ'],
    meanings: ['cuff', 'hem', 'foot of mountain'],
    grade: 8,
    strokes: 13,
    frequencyRank: 2334,
  ),
  // dark / 黑 / 多
  '黎': KanjiReading(
    kanji: '黎',
    onyomi: ['れい', 'り'],
    kunyomi: ['くろ(い)'],
    meanings: ['dark', '黑', '多'],
    grade: 9,
    strokes: 15,
    frequencyRank: 2335,
  ),
  // lazy / laziness
  '惰': KanjiReading(
    kanji: '惰',
    onyomi: ['だ'],
    kunyomi: [],
    meanings: ['lazy', 'laziness'],
    grade: 8,
    strokes: 12,
    frequencyRank: 2336,
  ),
  // 坐
  '坐': KanjiReading(
    kanji: '坐',
    onyomi: ['ざ', 'さ'],
    kunyomi: ['すわ(る)', 'おわす', 'そぞろに', 'まします'],
    meanings: ['坐'],
    grade: 9,
    strokes: 7,
    frequencyRank: 2337,
  ),
  // barbarian
  '蛮': KanjiReading(
    kanji: '蛮',
    onyomi: ['ばん'],
    kunyomi: ['えびす'],
    meanings: ['barbarian'],
    grade: 8,
    strokes: 12,
    frequencyRank: 2339,
  ),
  // projecting tableland or mountain
  '塙': KanjiReading(
    kanji: '塙',
    onyomi: ['かく', 'こう'],
    kunyomi: ['はなわ', 'かた(い)'],
    meanings: ['projecting tableland or mountain'],
    grade: 9,
    strokes: 13,
    frequencyRank: 2340,
  ),
  // be clear / serene / 冷
  '冴': KanjiReading(
    kanji: '冴',
    onyomi: ['ご', 'こ'],
    kunyomi: ['さ(える)', 'こお(る)', 'ひ(える)'],
    meanings: ['be clear', 'serene', '冷'],
    grade: 9,
    strokes: 7,
    frequencyRank: 2341,
  ),
  // flourishing / successful / 美丽
  '旺': KanjiReading(
    kanji: '旺',
    onyomi: ['おう'],
    kunyomi: ['さかん'],
    meanings: ['flourishing', 'successful', '美丽'],
    grade: 8,
    strokes: 8,
    frequencyRank: 2342,
  ),
  // reed / bullrush
  '葦': KanjiReading(
    kanji: '葦',
    onyomi: ['い'],
    kunyomi: ['あし', 'よし', 'しお(れる)', 'しな(びる)', 'しぼ(む)', 'な(える)'],
    meanings: ['reed', 'bullrush'],
    grade: 9,
    strokes: 13,
    frequencyRank: 2343,
  ),
  // show symptoms of / sprout / bud
  '萌': KanjiReading(
    kanji: '萌',
    onyomi: ['ほう'],
    kunyomi: ['も(える)', 'きざ(す)', 'めばえ', 'きざ(し)'],
    meanings: ['show symptoms of', 'sprout', 'bud'],
    grade: 9,
    strokes: 11,
    frequencyRank: 2346,
  ),
  // banquet
  '饗': KanjiReading(
    kanji: '饗',
    onyomi: ['きょう'],
    kunyomi: ['う(ける)', 'もてな(す)'],
    meanings: ['banquet'],
    grade: 9,
    strokes: 22,
    frequencyRank: 2347,
  ),
  // dark
  '冥': KanjiReading(
    kanji: '冥',
    onyomi: ['めい', 'みょう'],
    kunyomi: ['くら(い)'],
    meanings: ['dark'],
    grade: 8,
    strokes: 10,
    frequencyRank: 2349,
  ),
  // recollect / remember
  '偲': KanjiReading(
    kanji: '偲',
    onyomi: ['さい', 'し'],
    kunyomi: ['しの(ぶ)'],
    meanings: ['recollect', 'remember'],
    grade: 9,
    strokes: 11,
    frequencyRank: 2350,
  ),
  // one (in documents)
  '壱': KanjiReading(
    kanji: '壱',
    onyomi: ['いち', 'いつ'],
    kunyomi: ['ひとつ'],
    meanings: ['one (in documents)'],
    grade: 8,
    strokes: 7,
    frequencyRank: 2351,
  ),
  // lapis lazuli
  '瑠': KanjiReading(
    kanji: '瑠',
    onyomi: ['る', 'りゅう'],
    kunyomi: [],
    meanings: ['lapis lazuli'],
    grade: 8,
    strokes: 14,
    frequencyRank: 2352,
  ),
  // rowing / scull / paddle
  '漕': KanjiReading(
    kanji: '漕',
    onyomi: ['そう'],
    kunyomi: ['こ(ぐ)', 'はこ(ぶ)'],
    meanings: ['rowing', 'scull', 'paddle'],
    grade: 9,
    strokes: 14,
    frequencyRank: 2354,
  ),
  // wooden pestle
  '杵': KanjiReading(
    kanji: '杵',
    onyomi: ['しょ', 'そ'],
    kunyomi: ['きね'],
    meanings: ['wooden pestle'],
    grade: 9,
    strokes: 8,
    frequencyRank: 2355,
  ),
  // license / sincerity / permit
  '允': KanjiReading(
    kanji: '允',
    onyomi: ['いん'],
    kunyomi: ['じょう', 'まこと(に)', 'ゆるす'],
    meanings: ['license', 'sincerity', 'permit'],
    grade: 9,
    strokes: 4,
    frequencyRank: 2358,
  ),
  // 真理 / reality / Buddhist sect
  '眞': KanjiReading(
    kanji: '眞',
    onyomi: ['しん'],
    kunyomi: ['ま', 'まこと'],
    meanings: ['真理', 'reality', 'Buddhist sect'],
    grade: 10,
    strokes: 10,
    frequencyRank: 2359,
  ),
  // ignorance / darkness / get
  '蒙': KanjiReading(
    kanji: '蒙',
    onyomi: ['もう', 'ぼう'],
    kunyomi: ['こうむ(る)', 'おお(う)', 'くら(い)'],
    meanings: ['ignorance', 'darkness', 'get'],
    grade: 9,
    strokes: 13,
    frequencyRank: 2360,
  ),
  // grow luxuriously
  '蕃': KanjiReading(
    kanji: '蕃',
    onyomi: ['ばん', 'はん'],
    kunyomi: [],
    meanings: ['grow luxuriously'],
    grade: 9,
    strokes: 15,
    frequencyRank: 2361,
  ),
  // marquis / lord / daimyo
  '侯': KanjiReading(
    kanji: '侯',
    onyomi: ['こう'],
    kunyomi: [],
    meanings: ['marquis', 'lord', 'daimyo'],
    grade: 8,
    strokes: 9,
    frequencyRank: 2363,
  ),
  // pestle
  '碓': KanjiReading(
    kanji: '碓',
    onyomi: ['かく', 'たい'],
    kunyomi: ['たし(か)', 'かく(たる)'],
    meanings: ['pestle'],
    grade: 9,
    strokes: 13,
    frequencyRank: 2364,
  ),
  // foot of a mountain
  '麓': KanjiReading(
    kanji: '麓',
    onyomi: ['ろく'],
    kunyomi: ['ふもと'],
    meanings: ['foot of a mountain'],
    grade: 8,
    strokes: 19,
    frequencyRank: 2366,
  ),
  // shore / brink / verge
  '瀕': KanjiReading(
    kanji: '瀕',
    onyomi: ['ひん'],
    kunyomi: ['ほとり'],
    meanings: ['shore', 'brink', 'verge'],
    grade: 9,
    strokes: 20,
    frequencyRank: 2367,
  ),
  // sow (seeds)
  '蒔': KanjiReading(
    kanji: '蒔',
    onyomi: ['し', 'じ'],
    kunyomi: ['う(える)', 'ま(く)'],
    meanings: ['sow (seeds)'],
    grade: 9,
    strokes: 13,
    frequencyRank: 2368,
  ),
  // carp
  '鯉': KanjiReading(
    kanji: '鯉',
    onyomi: ['り'],
    kunyomi: ['こい'],
    meanings: ['carp'],
    grade: 9,
    strokes: 18,
    frequencyRank: 2369,
  ),
  // length / height / warp
  '竪': KanjiReading(
    kanji: '竪',
    onyomi: ['じゅ'],
    kunyomi: ['たて', 'た(てる)', 'こども'],
    meanings: ['length', 'height', 'warp'],
    grade: 9,
    strokes: 14,
    frequencyRank: 2370,
  ),
  // arc / arch / bow
  '弧': KanjiReading(
    kanji: '弧',
    onyomi: ['こ'],
    kunyomi: [],
    meanings: ['arc', 'arch', 'bow'],
    grade: 8,
    strokes: 9,
    frequencyRank: 2371,
  ),
  // 思考 / consider
  '稽': KanjiReading(
    kanji: '稽',
    onyomi: ['けい'],
    kunyomi: ['かんが(える)', 'とど(める)'],
    meanings: ['思考', 'consider'],
    grade: 8,
    strokes: 15,
    frequencyRank: 2372,
  ),
  // far off / distant / long ago
  '遥': KanjiReading(
    kanji: '遥',
    onyomi: ['よう'],
    kunyomi: ['はる(か)'],
    meanings: ['far off', 'distant', 'long ago'],
    grade: 9,
    strokes: 12,
    frequencyRank: 2376,
  ),
  // kick
  '蹴': KanjiReading(
    kanji: '蹴',
    onyomi: ['しゅく', 'しゅう'],
    kunyomi: ['け(る)'],
    meanings: ['kick'],
    grade: 8,
    strokes: 19,
    frequencyRank: 2377,
  ),
  // 一些 / 一 / or
  '或': KanjiReading(
    kanji: '或',
    onyomi: ['わく', 'こく', 'いき'],
    kunyomi: ['あ(る)', 'あるい', 'あるいは'],
    meanings: ['一些', '一', 'or'],
    grade: 9,
    strokes: 8,
    frequencyRank: 2378,
  ),
  // obituary
  '訃': KanjiReading(
    kanji: '訃',
    onyomi: ['ふ'],
    kunyomi: ['しらせ'],
    meanings: ['obituary'],
    grade: 8,
    strokes: 9,
    frequencyRank: 2379,
  ),
  // ruler / carpenter's square
  '矩': KanjiReading(
    kanji: '矩',
    onyomi: ['く'],
    kunyomi: ['かね', 'かねざし', 'さしがね'],
    meanings: ['ruler', 'carpenter\'s square'],
    grade: 9,
    strokes: 10,
    frequencyRank: 2380,
  ),
  // type of morning glory / rose of Sharon / althea
  '舜': KanjiReading(
    kanji: '舜',
    onyomi: ['しゅん'],
    kunyomi: [],
    meanings: ['type of morning glory', 'rose of Sharon', 'althea'],
    grade: 9,
    strokes: 13,
    frequencyRank: 2384,
  ),
  // staff / cane
  '杖': KanjiReading(
    kanji: '杖',
    onyomi: ['じょう'],
    kunyomi: ['つえ'],
    meanings: ['staff', 'cane'],
    grade: 9,
    strokes: 7,
    frequencyRank: 2387,
  ),
  // cover / lid / flap
  '蓋': KanjiReading(
    kanji: '蓋',
    onyomi: ['がい', 'かい', 'こう'],
    kunyomi: ['ふた', 'けだ(し)', 'おお(う)', 'かさ', 'かこう'],
    meanings: ['cover', 'lid', 'flap'],
    grade: 8,
    strokes: 13,
    frequencyRank: 2388,
  ),
  // fear / majestic / graciously
  '畏': KanjiReading(
    kanji: '畏',
    onyomi: ['い'],
    kunyomi: ['おそ(れる)', 'かしこま(る)', 'かしこ', 'かしこ(し)'],
    meanings: ['fear', 'majestic', 'graciously'],
    grade: 8,
    strokes: 9,
    frequencyRank: 2389,
  ),
  // throat / 声音
  '喉': KanjiReading(
    kanji: '喉',
    onyomi: ['こう'],
    kunyomi: ['のど'],
    meanings: ['throat', '声音'],
    grade: 8,
    strokes: 12,
    frequencyRank: 2390,
  ),
  // sparkle of jewelry / crystal
  '瑛': KanjiReading(
    kanji: '瑛',
    onyomi: ['えい'],
    kunyomi: [],
    meanings: ['sparkle of jewelry', 'crystal'],
    grade: 9,
    strokes: 12,
    frequencyRank: 2393,
  ),
  // search / seek / investigate
  '搜': KanjiReading(
    kanji: '搜',
    onyomi: ['そう', 'しゅ', 'しゅう'],
    kunyomi: ['さが(す)'],
    meanings: ['search', 'seek', 'investigate'],
    grade: 10,
    strokes: 13,
    frequencyRank: 2394,
  ),
  // affixed / attach / refer to
  '附': KanjiReading(
    kanji: '附',
    onyomi: ['ふ'],
    kunyomi: ['つ(ける)', 'つ(く)'],
    meanings: ['affixed', 'attach', 'refer to'],
    grade: 8,
    strokes: 8,
    frequencyRank: 2396,
  ),
  // spotted / mottled / patterned
  '彪': KanjiReading(
    kanji: '彪',
    onyomi: ['ひょう', 'ひゅう'],
    kunyomi: ['あや'],
    meanings: ['spotted', 'mottled', 'patterned'],
    grade: 9,
    strokes: 11,
    frequencyRank: 2397,
  ),
  // sign of the hare or rabbit / fourth sign of Chinese zodiac / 5-7AM
  '卯': KanjiReading(
    kanji: '卯',
    onyomi: ['ぼう', 'もう'],
    kunyomi: ['う'],
    meanings: ['sign of the hare or rabbit', 'fourth sign of Chinese zodiac', '5-7AM'],
    grade: 9,
    strokes: 5,
    frequencyRank: 2400,
  ),
  // stroke / pat / smooth down
  '撫': KanjiReading(
    kanji: '撫',
    onyomi: ['ぶ', 'ふ'],
    kunyomi: ['な(でる)'],
    meanings: ['stroke', 'pat', 'smooth down'],
    grade: 9,
    strokes: 15,
    frequencyRank: 2402,
  ),
  // talk / chat / chatter
  '喋': KanjiReading(
    kanji: '喋',
    onyomi: ['ちょう', 'とう'],
    kunyomi: ['しゃべ(る)', 'ついば(む)'],
    meanings: ['talk', 'chat', 'chatter'],
    grade: 9,
    strokes: 12,
    frequencyRank: 2403,
  ),
  // however / but
  '但': KanjiReading(
    kanji: '但',
    onyomi: ['たん'],
    kunyomi: ['ただ(し)'],
    meanings: ['however', 'but'],
    grade: 8,
    strokes: 7,
    frequencyRank: 2404,
  ),
  // overflow / inundate / spill
  '溢': KanjiReading(
    kanji: '溢',
    onyomi: ['いつ'],
    kunyomi: ['こぼ(れる)', 'あふ(れる)', 'み(ちる)'],
    meanings: ['overflow', 'inundate', 'spill'],
    grade: 9,
    strokes: 13,
    frequencyRank: 2405,
  ),
  // hide / own / have
  '藏': KanjiReading(
    kanji: '藏',
    onyomi: ['ぞう', 'そう'],
    kunyomi: ['くら', 'おさ(める)', 'かく(れる)'],
    meanings: ['hide', 'own', 'have'],
    grade: 10,
    strokes: 18,
    frequencyRank: 2407,
  ),
  // be complete / uniform / all present
  '揃': KanjiReading(
    kanji: '揃',
    onyomi: ['せん'],
    kunyomi: ['そろ(える)', 'そろ(う)', 'そろ(い)', 'き(る)'],
    meanings: ['be complete', 'uniform', 'all present'],
    grade: 9,
    strokes: 12,
    frequencyRank: 2412,
  ),
  // figured cloth / 美丽
  '綺': KanjiReading(
    kanji: '綺',
    onyomi: ['き'],
    kunyomi: ['あや'],
    meanings: ['figured cloth', '美丽'],
    grade: 9,
    strokes: 14,
    frequencyRank: 2413,
  ),
  // fork in road / scene / arena
  '巷': KanjiReading(
    kanji: '巷',
    onyomi: ['こう'],
    kunyomi: ['ちまた'],
    meanings: ['fork in road', 'scene', 'arena'],
    grade: 9,
    strokes: 9,
    frequencyRank: 2415,
  ),
  // pole / rod / scale beam
  '竿': KanjiReading(
    kanji: '竿',
    onyomi: ['かん'],
    kunyomi: ['さお'],
    meanings: ['pole', 'rod', 'scale beam'],
    grade: 9,
    strokes: 9,
    frequencyRank: 2416,
  ),
  // crab
  '蟹': KanjiReading(
    kanji: '蟹',
    onyomi: ['かい'],
    kunyomi: ['かに'],
    meanings: ['crab'],
    grade: 9,
    strokes: 19,
    frequencyRank: 2417,
  ),
  // taro / yam / tuber
  '芋': KanjiReading(
    kanji: '芋',
    onyomi: ['う'],
    kunyomi: ['いも'],
    meanings: ['taro', 'yam', 'tuber'],
    grade: 8,
    strokes: 6,
    frequencyRank: 2418,
  ),
  // wipe / mop / swab
  '拭': KanjiReading(
    kanji: '拭',
    onyomi: ['しょく', 'しき'],
    kunyomi: ['ぬぐ(う)', 'ふ(く)'],
    meanings: ['wipe', 'mop', 'swab'],
    grade: 8,
    strokes: 9,
    frequencyRank: 2421,
  ),
  // madder / red dye / Turkey red
  '茜': KanjiReading(
    kanji: '茜',
    onyomi: ['せん'],
    kunyomi: ['あかね'],
    meanings: ['madder', 'red dye', 'Turkey red'],
    grade: 9,
    strokes: 9,
    frequencyRank: 2422,
  ),
  // endure / keep (rain)out / stave off
  '凌': KanjiReading(
    kanji: '凌',
    onyomi: ['りょう'],
    kunyomi: ['しの(ぐ)'],
    meanings: ['endure', 'keep (rain)out', 'stave off'],
    grade: 9,
    strokes: 10,
    frequencyRank: 2423,
  ),
  // kitchen
  '厨': KanjiReading(
    kanji: '厨',
    onyomi: ['しゅう', 'ず', 'ちゅ', 'ちゅう'],
    kunyomi: ['くりや'],
    meanings: ['kitchen'],
    grade: 9,
    strokes: 12,
    frequencyRank: 2425,
  ),
  // rhinoceros
  '犀': KanjiReading(
    kanji: '犀',
    onyomi: ['さい', 'せい'],
    kunyomi: [],
    meanings: ['rhinoceros'],
    grade: 9,
    strokes: 12,
    frequencyRank: 2426,
  ),
  // 白 / clear
  '皓': KanjiReading(
    kanji: '皓',
    onyomi: ['こう'],
    kunyomi: ['しろ(い)', 'ひか(る)'],
    meanings: ['白', 'clear'],
    grade: 9,
    strokes: 12,
    frequencyRank: 2428,
  ),
  // sparkling water
  '洸': KanjiReading(
    kanji: '洸',
    onyomi: ['こう'],
    kunyomi: [],
    meanings: ['sparkling water'],
    grade: 9,
    strokes: 9,
    frequencyRank: 2430,
  ),
  // burr / ball
  '毬': KanjiReading(
    kanji: '毬',
    onyomi: ['きゅう'],
    kunyomi: ['いが', 'まり'],
    meanings: ['burr', 'ball'],
    grade: 9,
    strokes: 11,
    frequencyRank: 2431,
  ),
  // old woman / grandma / wet nurse
  '婆': KanjiReading(
    kanji: '婆',
    onyomi: ['ば'],
    kunyomi: ['ばば', 'ばあ'],
    meanings: ['old woman', 'grandma', 'wet nurse'],
    grade: 8,
    strokes: 11,
    frequencyRank: 2435,
  ),
  // plexus / clump of bushes / thicket
  '叢': KanjiReading(
    kanji: '叢',
    onyomi: ['そう', 'す'],
    kunyomi: ['くさむら', 'むら(がる)', 'むら'],
    meanings: ['plexus', 'clump of bushes', 'thicket'],
    grade: 9,
    strokes: 18,
    frequencyRank: 2436,
  ),
  // roar / thunder / boom resound
  '轟': KanjiReading(
    kanji: '轟',
    onyomi: ['ごう', 'こう'],
    kunyomi: ['とどろ(かす)', 'とどろ(く)'],
    meanings: ['roar', 'thunder', 'boom resound'],
    grade: 9,
    strokes: 21,
    frequencyRank: 2438,
  ),
  // get / have / obtain
  '貰': KanjiReading(
    kanji: '貰',
    onyomi: ['せい', 'しゃ'],
    kunyomi: ['もら(う)'],
    meanings: ['get', 'have', 'obtain'],
    grade: 9,
    strokes: 12,
    frequencyRank: 2441,
  ),
  // be profitable / yield profit
  '儲': KanjiReading(
    kanji: '儲',
    onyomi: ['ちょ'],
    kunyomi: ['もう(ける)', 'もう(かる)', 'もうけ', 'たくわ(える)'],
    meanings: ['be profitable', 'yield profit'],
    grade: 9,
    strokes: 17,
    frequencyRank: 2442,
  ),
  // scarlet / cardinal
  '緋': KanjiReading(
    kanji: '緋',
    onyomi: ['ひ'],
    kunyomi: ['あけ', 'あか'],
    meanings: ['scarlet', 'cardinal'],
    grade: 9,
    strokes: 14,
    frequencyRank: 2443,
  ),
  // stick / paste / apply
  '貼': KanjiReading(
    kanji: '貼',
    onyomi: ['てん', 'ちょう'],
    kunyomi: ['は(る)', 'つ(く)'],
    meanings: ['stick', 'paste', 'apply'],
    grade: 8,
    strokes: 12,
    frequencyRank: 2444,
  ),
  // sea bream / red snapper
  '鯛': KanjiReading(
    kanji: '鯛',
    onyomi: ['ちょう'],
    kunyomi: ['たい'],
    meanings: ['sea bream', 'red snapper'],
    grade: 9,
    strokes: 19,
    frequencyRank: 2446,
  ),
  // wise
  '怜': KanjiReading(
    kanji: '怜',
    onyomi: ['れい', 'れん', 'りょう'],
    kunyomi: ['あわ(れむ)', 'さと(い)'],
    meanings: ['wise'],
    grade: 9,
    strokes: 8,
    frequencyRank: 2450,
  ),
  // collect / gather / be in arrears
  '溜': KanjiReading(
    kanji: '溜',
    onyomi: ['りゅう'],
    kunyomi: ['た(まる)', 'たま(る)', 'た(める)', 'したた(る)', 'たまり', 'ため'],
    meanings: ['collect', 'gather', 'be in arrears'],
    grade: 9,
    strokes: 13,
    frequencyRank: 2451,
  ),
  // 村庄 / rural community / right village radical (no. 163)
  '邑': KanjiReading(
    kanji: '邑',
    onyomi: ['ゆう'],
    kunyomi: ['むら'],
    meanings: ['村庄', 'rural community', 'right village radical (no. 163)'],
    grade: 9,
    strokes: 7,
    frequencyRank: 2452,
  ),
  // emulate / imitate
  '倣': KanjiReading(
    kanji: '倣',
    onyomi: ['ほう'],
    kunyomi: ['なら(う)'],
    meanings: ['emulate', 'imitate'],
    grade: 8,
    strokes: 10,
    frequencyRank: 2454,
  ),
  // 蓝 / 绿
  '碧': KanjiReading(
    kanji: '碧',
    onyomi: ['へき', 'ひゃく'],
    kunyomi: [],
    meanings: ['蓝', '绿'],
    grade: 9,
    strokes: 14,
    frequencyRank: 2455,
  ),
  // lamp / 光 / counter for lights
  '燈': KanjiReading(
    kanji: '燈',
    onyomi: ['とう'],
    kunyomi: ['ひ', '(ほ)', 'ともしび', 'とも(す)', 'あかり'],
    meanings: ['lamp', '光', 'counter for lights'],
    grade: 10,
    strokes: 16,
    frequencyRank: 2456,
  ),
  // 真理 / clarity / abandon
  '諦': KanjiReading(
    kanji: '諦',
    onyomi: ['てい', 'たい'],
    kunyomi: ['あきら(める)', 'つまびらか', 'まこと'],
    meanings: ['真理', 'clarity', 'abandon'],
    grade: 8,
    strokes: 16,
    frequencyRank: 2457,
  ),
  // broil / parch / roast
  '煎': KanjiReading(
    kanji: '煎',
    onyomi: ['せん'],
    kunyomi: ['せん(じる)', 'い(る)', 'に(る)'],
    meanings: ['broil', 'parch', 'roast'],
    grade: 8,
    strokes: 13,
    frequencyRank: 2458,
  ),
  // melon
  '瓜': KanjiReading(
    kanji: '瓜',
    onyomi: ['か', 'け'],
    kunyomi: ['うり'],
    meanings: ['melon'],
    grade: 9,
    strokes: 6,
    frequencyRank: 2459,
  ),
  // fine (i.e. not coarse)
  '緻': KanjiReading(
    kanji: '緻',
    onyomi: ['ち'],
    kunyomi: ['こまか(い)'],
    meanings: ['fine (i.e. not coarse)'],
    grade: 8,
    strokes: 16,
    frequencyRank: 2460,
  ),
  // nurse / suckle
  '哺': KanjiReading(
    kanji: '哺',
    onyomi: ['ほ'],
    kunyomi: ['はぐく(む)', 'ふく(む)'],
    meanings: ['nurse', 'suckle'],
    grade: 8,
    strokes: 10,
    frequencyRank: 2461,
  ),
  // hammer / mallet
  '槌': KanjiReading(
    kanji: '槌',
    onyomi: ['つい'],
    kunyomi: ['つち'],
    meanings: ['hammer', 'mallet'],
    grade: 9,
    strokes: 13,
    frequencyRank: 2462,
  ),
  // peck / pick up
  '啄': KanjiReading(
    kanji: '啄',
    onyomi: ['たく', 'つく', 'とく'],
    kunyomi: ['ついば(む)', 'つつ(く)'],
    meanings: ['peck', 'pick up'],
    grade: 9,
    strokes: 10,
    frequencyRank: 2463,
  ),
  // good crops / prosperity / 10**28
  '穣': KanjiReading(
    kanji: '穣',
    onyomi: ['じょう'],
    kunyomi: ['わら', 'ゆたか'],
    meanings: ['good crops', 'prosperity', '10**28'],
    grade: 9,
    strokes: 18,
    frequencyRank: 2464,
  ),
  // abuse / insult
  '罵': KanjiReading(
    kanji: '罵',
    onyomi: ['ば'],
    kunyomi: ['ののし(る)'],
    meanings: ['abuse', 'insult'],
    grade: 8,
    strokes: 15,
    frequencyRank: 2467,
  ),
  // 西 / 鸟 / sign of the bird
  '酉': KanjiReading(
    kanji: '酉',
    onyomi: ['ゆう'],
    kunyomi: ['とり'],
    meanings: ['西', '鸟', 'sign of the bird'],
    grade: 9,
    strokes: 7,
    frequencyRank: 2468,
  ),
  // hoof
  '蹄': KanjiReading(
    kanji: '蹄',
    onyomi: ['てい'],
    kunyomi: ['ひづめ'],
    meanings: ['hoof'],
    grade: 9,
    strokes: 16,
    frequencyRank: 2469,
  ),
  // serving our elders
  '悌': KanjiReading(
    kanji: '悌',
    onyomi: ['てい', 'だい'],
    kunyomi: [],
    meanings: ['serving our elders'],
    grade: 9,
    strokes: 10,
    frequencyRank: 2474,
  ),
  // ellipse
  '楕': KanjiReading(
    kanji: '楕',
    onyomi: ['だ', 'た'],
    kunyomi: [],
    meanings: ['ellipse'],
    grade: 9,
    strokes: 13,
    frequencyRank: 2476,
  ),
  // beg / invite / ask
  '乞': KanjiReading(
    kanji: '乞',
    onyomi: ['こつ', 'きつ', 'き', 'きけ', 'こち'],
    kunyomi: ['こ(う)'],
    meanings: ['beg', 'invite', 'ask'],
    grade: 8,
    strokes: 3,
    frequencyRank: 2478,
  ),
  // frugal / economy / thrifty
  '倹': KanjiReading(
    kanji: '倹',
    onyomi: ['けん'],
    kunyomi: ['つま(しい)', 'つづまやか'],
    meanings: ['frugal', 'economy', 'thrifty'],
    grade: 8,
    strokes: 10,
    frequencyRank: 2479,
  ),
  // smell / sniff / scent
  '嗅': KanjiReading(
    kanji: '嗅',
    onyomi: ['きゅう'],
    kunyomi: ['か(ぐ)'],
    meanings: ['smell', 'sniff', 'scent'],
    grade: 8,
    strokes: 13,
    frequencyRank: 2480,
  ),
  // apologize
  '詫': KanjiReading(
    kanji: '詫',
    onyomi: ['た'],
    kunyomi: ['わび', 'わび(しい)', 'かこつ', 'わ(びる)', 'わび(る)'],
    meanings: ['apologize'],
    grade: 9,
    strokes: 13,
    frequencyRank: 2481,
  ),
  // salmon trout
  '鱒': KanjiReading(
    kanji: '鱒',
    onyomi: ['そん', 'せん', 'ざん'],
    kunyomi: ['ます'],
    meanings: ['salmon trout'],
    grade: 9,
    strokes: 23,
    frequencyRank: 2482,
  ),
  // ignore / despise / neglect
  '蔑': KanjiReading(
    kanji: '蔑',
    onyomi: ['べつ'],
    kunyomi: ['ないがしろ', 'なみ(する)', 'くらい', 'さげす(む)'],
    meanings: ['ignore', 'despise', 'neglect'],
    grade: 8,
    strokes: 14,
    frequencyRank: 2483,
  ),
  // fall in love with / admire / grow senile
  '惚': KanjiReading(
    kanji: '惚',
    onyomi: ['こつ'],
    kunyomi: ['ほけ(る)', 'ぼ(ける)', 'ほ(れる)'],
    meanings: ['fall in love with', 'admire', 'grow senile'],
    grade: 9,
    strokes: 11,
    frequencyRank: 2486,
  ),
  // broad / 宽 / spacious
  '廣': KanjiReading(
    kanji: '廣',
    onyomi: ['こう'],
    kunyomi: ['ひろ(い)', 'ひろ(まる)', 'ひろ(める)', 'ひろ(がる)', 'ひろ(げる)'],
    meanings: ['broad', '宽', 'spacious'],
    grade: 10,
    strokes: 15,
    frequencyRank: 2487,
  ),
  // straw
  '藁': KanjiReading(
    kanji: '藁',
    onyomi: ['こう'],
    kunyomi: ['わら'],
    meanings: ['straw'],
    grade: 9,
    strokes: 17,
    frequencyRank: 2488,
  ),
  // citron
  '柚': KanjiReading(
    kanji: '柚',
    onyomi: ['ゆ', 'ゆう', 'じく'],
    kunyomi: ['ゆず'],
    meanings: ['citron'],
    grade: 9,
    strokes: 9,
    frequencyRank: 2489,
  ),
  // stripe
  '縞': KanjiReading(
    kanji: '縞',
    onyomi: ['こう'],
    kunyomi: ['しま', 'しろぎぬ'],
    meanings: ['stripe'],
    grade: 9,
    strokes: 16,
    frequencyRank: 2491,
  ),
  // scales (fish)
  '鱗': KanjiReading(
    kanji: '鱗',
    onyomi: ['りん'],
    kunyomi: ['うろこ', 'こけ', 'こけら'],
    meanings: ['scales (fish)'],
    grade: 9,
    strokes: 24,
    frequencyRank: 2494,
  ),
  // cocoon
  '繭': KanjiReading(
    kanji: '繭',
    onyomi: ['けん'],
    kunyomi: ['まゆ', 'きぬ'],
    meanings: ['cocoon'],
    grade: 8,
    strokes: 18,
    frequencyRank: 2495,
  ),
  // nail / tack / peg
  '釘': KanjiReading(
    kanji: '釘',
    onyomi: ['てい', 'ちょう'],
    kunyomi: ['くぎ'],
    meanings: ['nail', 'tack', 'peg'],
    grade: 9,
    strokes: 10,
    frequencyRank: 2496,
  ),
  // slacken / relax
  '弛': KanjiReading(
    kanji: '弛',
    onyomi: ['ち', 'し'],
    kunyomi: ['たる(む)', 'たる(める)', 'たゆ(む)', 'ゆる(む)', 'ゆる(み)'],
    meanings: ['slacken', 'relax'],
    grade: 9,
    strokes: 6,
    frequencyRank: 2497,
  ),
  // 9th calendar sign
  '壬': KanjiReading(
    kanji: '壬',
    onyomi: ['にん', 'じん', 'い'],
    kunyomi: ['みずのえ'],
    meanings: ['9th calendar sign'],
    grade: 9,
    strokes: 4,
    frequencyRank: 2499,
  ),
  // inkstone
  '硯': KanjiReading(
    kanji: '硯',
    onyomi: ['けん', 'げん'],
    kunyomi: ['すずり'],
    meanings: ['inkstone'],
    grade: 9,
    strokes: 12,
    frequencyRank: 2500,
  ),
  // shrimp / prawn / lobster
  '蝦': KanjiReading(
    kanji: '蝦',
    onyomi: ['か', 'げ'],
    kunyomi: ['えび'],
    meanings: ['shrimp', 'prawn', 'lobster'],
    grade: 9,
    strokes: 15,
    frequencyRank: 2501,
  ),
  // 美丽
  '娃': KanjiReading(
    kanji: '娃',
    onyomi: ['あ', 'あい', 'わ'],
    kunyomi: ['うつく(しい)'],
    meanings: ['美丽'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // go around / 规则 / administer
  '斡': KanjiReading(
    kanji: '斡',
    onyomi: ['あつ', 'かん', 'わつ'],
    kunyomi: ['めぐ(る)', 'めぐ(らす)'],
    meanings: ['go around', '规则', 'administer'],
    grade: 9,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // address / just like / fortunately
  '宛': KanjiReading(
    kanji: '宛',
    onyomi: ['えん'],
    kunyomi: ['あ(てる)', '(あて)', '(づつ)', 'あたか(も)'],
    meanings: ['address', 'just like', 'fortunately'],
    grade: 8,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // 持有 / consider / investigate
  '按': KanjiReading(
    kanji: '按',
    onyomi: ['あん'],
    kunyomi: ['おさ(える)', 'しら(べる)'],
    meanings: ['持有', 'consider', 'investigate'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // wither / droop / lame
  '萎': KanjiReading(
    kanji: '萎',
    onyomi: ['い'],
    kunyomi: ['な', 'しお(れる)', 'しな(びる)', 'しぼ(む)', 'な(える)'],
    meanings: ['wither', 'droop', 'lame'],
    grade: 8,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // reason / origin / 历史
  '謂': KanjiReading(
    kanji: '謂',
    onyomi: ['い'],
    kunyomi: ['い(う)', 'いい', 'おも(う)', 'いわゆる'],
    meanings: ['reason', 'origin', '历史'],
    grade: 9,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // sign of the hog / 9-11PM / twelfth sign of the Chinese zodiac
  '亥': KanjiReading(
    kanji: '亥',
    onyomi: ['がい', 'かい'],
    kunyomi: ['い'],
    meanings: ['sign of the hog', '9-11PM', 'twelfth sign of the Chinese zodiac'],
    grade: 9,
    strokes: 6,
    frequencyRank: 99999,
  ),
  // sardine / (kokuji)
  '鰯': KanjiReading(
    kanji: '鰯',
    onyomi: [],
    kunyomi: ['いわし'],
    meanings: ['sardine', '(kokuji)'],
    grade: 9,
    strokes: 21,
    frequencyRank: 99999,
  ),
  // throat / choked / smothered
  '咽': KanjiReading(
    kanji: '咽',
    onyomi: ['いん', 'えん', 'えつ'],
    kunyomi: ['むせ(ぶ)', 'むせ(る)', 'のど', 'の(む)'],
    meanings: ['throat', 'choked', 'smothered'],
    grade: 8,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // lewdness / licentiousness
  '淫': KanjiReading(
    kanji: '淫',
    onyomi: ['いん'],
    kunyomi: ['ひた(す)', 'ほしいまま', 'みだ(ら)', 'みだ(れる)', 'みだり'],
    meanings: ['lewdness', 'licentiousness'],
    grade: 8,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // descendent / issue / offspring
  '胤': KanjiReading(
    kanji: '胤',
    onyomi: ['いん'],
    kunyomi: ['たね'],
    meanings: ['descendent', 'issue', 'offspring'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // roundabout way
  '迂': KanjiReading(
    kanji: '迂',
    onyomi: ['う'],
    kunyomi: [],
    meanings: ['roundabout way'],
    grade: 9,
    strokes: 6,
    frequencyRank: 99999,
  ),
  // lie in wait / spy on / reconnoiter
  '窺': KanjiReading(
    kanji: '窺',
    onyomi: ['き'],
    kunyomi: ['うかが(う)', 'のぞく'],
    meanings: ['lie in wait', 'spy on', 'reconnoiter'],
    grade: 9,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // old woman
  '姥': KanjiReading(
    kanji: '姥',
    onyomi: ['ぼ', 'も'],
    kunyomi: ['うば'],
    meanings: ['old woman'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // barn / stable
  '厩': KanjiReading(
    kanji: '厩',
    onyomi: ['きゅう'],
    kunyomi: ['うまや'],
    meanings: ['barn', 'stable'],
    grade: 9,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // intercalation / illegitimate throne
  '閏': KanjiReading(
    kanji: '閏',
    onyomi: ['じゅん'],
    kunyomi: ['うるう'],
    meanings: ['intercalation', 'illegitimate throne'],
    grade: 9,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // 说
  '云': KanjiReading(
    kanji: '云',
    onyomi: ['うん'],
    kunyomi: ['い(う)', 'ここに'],
    meanings: ['说'],
    grade: 9,
    strokes: 4,
    frequencyRank: 99999,
  ),
  // intelligence / imperial
  '叡': KanjiReading(
    kanji: '叡',
    onyomi: ['えい'],
    kunyomi: ['あき(らか)'],
    meanings: ['intelligence', 'imperial'],
    grade: 9,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // 拉 / tug / jerk
  '曳': KanjiReading(
    kanji: '曳',
    onyomi: ['えい'],
    kunyomi: ['ひ(く)'],
    meanings: ['拉', 'tug', 'jerk'],
    grade: 9,
    strokes: 6,
    frequencyRank: 99999,
  ),
  // audience / audience (with king)
  '謁': KanjiReading(
    kanji: '謁',
    onyomi: ['えつ'],
    kunyomi: [],
    meanings: ['audience', 'audience (with king)'],
    grade: 8,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // garden / yard / farm
  '薗': KanjiReading(
    kanji: '薗',
    onyomi: ['えん', 'おん'],
    kunyomi: ['その'],
    meanings: ['garden', 'yard', 'farm'],
    grade: 10,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // nephew
  '甥': KanjiReading(
    kanji: '甥',
    onyomi: ['せい', 'そう', 'しょう'],
    kunyomi: ['おい', 'むこ'],
    meanings: ['nephew'],
    grade: 9,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // opaque sliding door
  '襖': KanjiReading(
    kanji: '襖',
    onyomi: ['おう'],
    kunyomi: ['ふすま', 'あお'],
    meanings: ['opaque sliding door'],
    grade: 9,
    strokes: 17,
    frequencyRank: 99999,
  ),
  // timidity / 心
  '臆': KanjiReading(
    kanji: '臆',
    onyomi: ['おく', 'よく'],
    kunyomi: ['むね', 'おくする'],
    meanings: ['timidity', '心'],
    grade: 8,
    strokes: 17,
    frequencyRank: 99999,
  ),
  // two-branch tree radical (no. 115)
  '禾': KanjiReading(
    kanji: '禾',
    onyomi: ['か'],
    kunyomi: ['いね'],
    meanings: ['two-branch tree radical (no. 115)'],
    grade: 9,
    strokes: 5,
    frequencyRank: 99999,
  ),
  // counter for articles
  '箇': KanjiReading(
    kanji: '箇',
    onyomi: ['か', 'こ'],
    kunyomi: [],
    meanings: ['counter for articles'],
    grade: 8,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // torment / scold / chastise
  '苛': KanjiReading(
    kanji: '苛',
    onyomi: ['か'],
    kunyomi: ['いじ(める)', 'さいな(む)', 'いらだ(つ)', 'からい', 'こまかい'],
    meanings: ['torment', 'scold', 'chastise'],
    grade: 8,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // eggplant
  '茄': KanjiReading(
    kanji: '茄',
    onyomi: ['か'],
    kunyomi: [],
    meanings: ['eggplant'],
    grade: 9,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // noisy
  '嘩': KanjiReading(
    kanji: '嘩',
    onyomi: ['か', 'け'],
    kunyomi: ['かまびす(しい)'],
    meanings: ['noisy'],
    grade: 9,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // sudden / abrupt / improvised
  '俄': KanjiReading(
    kanji: '俄',
    onyomi: ['が'],
    kunyomi: ['にわか'],
    meanings: ['sudden', 'abrupt', 'improvised'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // bend down / bow / lie prostrate
  '臥': KanjiReading(
    kanji: '臥',
    onyomi: ['が'],
    kunyomi: ['ふせ(る)', 'ふ(せる)', 'ふ(す)'],
    meanings: ['bend down', 'bow', 'lie prostrate'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // 车辆 / palanquin / litter
  '駕': KanjiReading(
    kanji: '駕',
    onyomi: ['か', 'が'],
    kunyomi: ['かご', 'が(する)', 'しのぐ', 'のる'],
    meanings: ['车辆', 'palanquin', 'litter'],
    grade: 9,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // round / game / revolve
  '廻': KanjiReading(
    kanji: '廻',
    onyomi: ['かい', 'え'],
    kunyomi: ['まわ(る)', 'まわ(す)', 'もとお(る)', 'めぐ(る)', 'めぐ(らす)'],
    meanings: ['round', 'game', 'revolve'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // 宽 / large / enlarge
  '恢': KanjiReading(
    kanji: '恢',
    onyomi: ['かい', 'け'],
    kunyomi: ['ひろ(い)'],
    meanings: ['宽', 'large', 'enlarge'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // dark / disappear
  '晦': KanjiReading(
    kanji: '晦',
    onyomi: ['かい'],
    kunyomi: ['つごもり', 'くら(い)', 'みそか', 'くら(む)'],
    meanings: ['dark', 'disappear'],
    grade: 9,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // cliff / bluff / precipice
  '崖': KanjiReading(
    kanji: '崖',
    onyomi: ['がい', 'げ', 'ぎ'],
    kunyomi: ['がけ', 'きし', 'はて'],
    meanings: ['cliff', 'bluff', 'precipice'],
    grade: 8,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // put on armor / arm oneself
  '鎧': KanjiReading(
    kanji: '鎧',
    onyomi: ['かい', 'がい'],
    kunyomi: ['よろ(う)', 'よろい'],
    meanings: ['put on armor', 'arm oneself'],
    grade: 9,
    strokes: 18,
    frequencyRank: 99999,
  ),
  // bone / 身体 / corpse
  '骸': KanjiReading(
    kanji: '骸',
    onyomi: ['がい', 'かい'],
    kunyomi: ['むくろ'],
    meanings: ['bone', '身体', 'corpse'],
    grade: 8,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // knot / nautical mile
  '浬': KanjiReading(
    kanji: '浬',
    onyomi: ['り'],
    kunyomi: ['かいり', 'のっと'],
    meanings: ['knot', 'nautical mile'],
    grade: 9,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // jaw / chin / gill
  '顎': KanjiReading(
    kanji: '顎',
    onyomi: ['がく'],
    kunyomi: ['あご', 'あぎと'],
    meanings: ['jaw', 'chin', 'gill'],
    grade: 8,
    strokes: 18,
    frequencyRank: 99999,
  ),
  // just as / as though / fortunately
  '恰': KanjiReading(
    kanji: '恰',
    onyomi: ['こう', 'かっ', 'ちょう', 'きょう'],
    kunyomi: ['あたか(も)'],
    meanings: ['just as', 'as though', 'fortunately'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // moreover / also / furthermore
  '且': KanjiReading(
    kanji: '且',
    onyomi: ['しょ', 'そ', 'しょう'],
    kunyomi: ['か(つ)'],
    meanings: ['moreover', 'also', 'furthermore'],
    grade: 8,
    strokes: 5,
    frequencyRank: 99999,
  ),
  // autumn foliage / birch / maple
  '椛': KanjiReading(
    kanji: '椛',
    onyomi: [],
    kunyomi: ['かば', 'もみじ'],
    meanings: ['autumn foliage', 'birch', 'maple'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // suitcase / bag / briefcase
  '鞄': KanjiReading(
    kanji: '鞄',
    onyomi: ['はく', 'ほう', 'びょう'],
    kunyomi: ['かばん'],
    meanings: ['suitcase', 'bag', 'briefcase'],
    grade: 9,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // 强 / just / righteous
  '侃': KanjiReading(
    kanji: '侃',
    onyomi: ['かん'],
    kunyomi: ['つよ(い)'],
    meanings: ['强', 'just', 'righteous'],
    grade: 9,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // citrus / orange
  '柑': KanjiReading(
    kanji: '柑',
    onyomi: ['こん', 'かん'],
    kunyomi: [],
    meanings: ['citrus', 'orange'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // smiling / reed used to cover tatami
  '莞': KanjiReading(
    kanji: '莞',
    onyomi: ['かん'],
    kunyomi: ['い'],
    meanings: ['smiling', 'reed used to cover tatami'],
    grade: 9,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // deed / skill
  '伎': KanjiReading(
    kanji: '伎',
    onyomi: ['ぎ', 'き'],
    kunyomi: ['わざ', 'わざおぎ'],
    meanings: ['deed', 'skill'],
    grade: 8,
    strokes: 6,
    frequencyRank: 99999,
  ),
  // 好 / 美丽 / badge
  '徽': KanjiReading(
    kanji: '徽',
    onyomi: ['き'],
    kunyomi: ['しるし'],
    meanings: ['好', '美丽', 'badge'],
    grade: 9,
    strokes: 17,
    frequencyRank: 99999,
  ),
  // friendship / intimacy
  '誼': KanjiReading(
    kanji: '誼',
    onyomi: ['ぎ'],
    kunyomi: ['よしみ', 'よい'],
    meanings: ['friendship', 'intimacy'],
    grade: 9,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // scoop up water with the hand
  '掬': KanjiReading(
    kanji: '掬',
    onyomi: ['きく', 'こく'],
    kunyomi: ['きく(す)', 'むす(ぶ)', 'すく(う)', 'たなごころ'],
    meanings: ['scoop up water with the hand'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // ball
  '鞠': KanjiReading(
    kanji: '鞠',
    onyomi: ['きく', 'きゅう'],
    kunyomi: ['まり'],
    meanings: ['ball'],
    grade: 9,
    strokes: 17,
    frequencyRank: 99999,
  ),
  // used in plant names
  '桔': KanjiReading(
    kanji: '桔',
    onyomi: ['きつ', 'けつ'],
    kunyomi: [],
    meanings: ['used in plant names'],
    grade: 9,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // fulling block
  '砧': KanjiReading(
    kanji: '砧',
    onyomi: ['ちん'],
    kunyomi: ['きぬた'],
    meanings: ['fulling block'],
    grade: 9,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // draw (water) / ladle / scoop
  '汲': KanjiReading(
    kanji: '汲',
    onyomi: ['きゅう'],
    kunyomi: ['く(む)'],
    meanings: ['draw (water)', 'ladle', 'scoop'],
    grade: 9,
    strokes: 7,
    frequencyRank: 99999,
  ),
  // moxa cautery / chastisement
  '灸': KanjiReading(
    kanji: '灸',
    onyomi: ['きゅう', 'く'],
    kunyomi: ['やいと'],
    meanings: ['moxa cautery', 'chastisement'],
    grade: 9,
    strokes: 7,
    frequencyRank: 99999,
  ),
  // backpack bookcase
  '笈': KanjiReading(
    kanji: '笈',
    onyomi: ['きゅう'],
    kunyomi: [],
    meanings: ['backpack bookcase'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // saw (cuts wood)
  '鋸': KanjiReading(
    kanji: '鋸',
    onyomi: ['きょ', 'こ'],
    kunyomi: ['のこ', 'のこぎり'],
    meanings: ['saw (cuts wood)'],
    grade: 9,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // buckwheat
  '蕎': KanjiReading(
    kanji: '蕎',
    onyomi: ['きょう'],
    kunyomi: ['そば'],
    meanings: ['buckwheat'],
    grade: 9,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // a wee bit
  '僅': KanjiReading(
    kanji: '僅',
    onyomi: ['きん', 'ごん'],
    kunyomi: ['わず(か)'],
    meanings: ['a wee bit'],
    grade: 8,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // towel / hanging scroll / width
  '巾': KanjiReading(
    kanji: '巾',
    onyomi: ['きん', 'ふく'],
    kunyomi: ['おお(い)', 'ちきり', 'きれ'],
    meanings: ['towel', 'hanging scroll', 'width'],
    grade: 8,
    strokes: 3,
    frequencyRank: 99999,
  ),
  // axe / 1.32 lb / catty
  '斤': KanjiReading(
    kanji: '斤',
    onyomi: ['きん'],
    kunyomi: [],
    meanings: ['axe', '1.32 lb', 'catty'],
    grade: 8,
    strokes: 4,
    frequencyRank: 99999,
  ),
  // 鸟 / captive / capture
  '禽': KanjiReading(
    kanji: '禽',
    onyomi: ['きん'],
    kunyomi: ['とり', 'とりこ'],
    meanings: ['鸟', 'captive', 'capture'],
    grade: 9,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // neck / collar / lapel
  '衿': KanjiReading(
    kanji: '衿',
    onyomi: ['きん', 'こん'],
    kunyomi: ['えり'],
    meanings: ['neck', 'collar', 'lapel'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // beautiful black jewel / 九
  '玖': KanjiReading(
    kanji: '玖',
    onyomi: ['きゅう', 'く'],
    kunyomi: [],
    meanings: ['beautiful black jewel', '九'],
    grade: 9,
    strokes: 7,
    frequencyRank: 99999,
  ),
  // 跑 / gallop / advance
  '駈': KanjiReading(
    kanji: '駈',
    onyomi: ['く'],
    kunyomi: ['か(ける)', 'か(る)'],
    meanings: ['跑', 'gallop', 'advance'],
    grade: 10,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // fear / uneasiness / anxiety
  '虞': KanjiReading(
    kanji: '虞',
    onyomi: ['ぐ'],
    kunyomi: ['おそれ', 'おもんぱか(る)', 'はか(る)', 'うれ(える)', 'あざむ(く)', 'あやま(る)', 'のぞ(む)', 'たの(しむ)'],
    meanings: ['fear', 'uneasiness', 'anxiety'],
    grade: 8,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // 吃 / 喝 / receive (a blow)
  '喰': KanjiReading(
    kanji: '喰',
    onyomi: [],
    kunyomi: ['く(う)', 'く(らう)'],
    meanings: ['吃', '喝', 'receive (a blow)'],
    grade: 9,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // rubbish / junk / trash
  '屑': KanjiReading(
    kanji: '屑',
    onyomi: ['せつ'],
    kunyomi: ['くず', 'いさぎよ(い)'],
    meanings: ['rubbish', 'junk', 'trash'],
    grade: 9,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // cavern
  '窟': KanjiReading(
    kanji: '窟',
    onyomi: ['くつ', 'こつ'],
    kunyomi: ['いわや', 'いはや', 'あな'],
    meanings: ['cavern'],
    grade: 8,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // shoes / boots
  '沓': KanjiReading(
    kanji: '沓',
    onyomi: ['とう'],
    kunyomi: ['くつ'],
    meanings: ['shoes', 'boots'],
    grade: 9,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // hoe with long blade at acute angle
  '鍬': KanjiReading(
    kanji: '鍬',
    onyomi: ['しょう', 'しゅう'],
    kunyomi: ['くわ', 'すき'],
    meanings: ['hoe with long blade at acute angle'],
    grade: 9,
    strokes: 17,
    frequencyRank: 99999,
  ),
  // a coarse camlet
  '袈': KanjiReading(
    kanji: '袈',
    onyomi: ['け', 'か'],
    kunyomi: [],
    meanings: ['a coarse camlet'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // intense / large
  '祁': KanjiReading(
    kanji: '祁',
    onyomi: ['き', 'け'],
    kunyomi: [],
    meanings: ['intense', 'large'],
    grade: 9,
    strokes: 7,
    frequencyRank: 99999,
  ),
  // visit a temple / arrive / attain
  '詣': KanjiReading(
    kanji: '詣',
    onyomi: ['けい', 'げい'],
    kunyomi: ['けい(する)', 'まい(る)', 'いた(る)', 'もう(でる)'],
    meanings: ['visit a temple', 'arrive', 'attain'],
    grade: 8,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // halbert / arms
  '戟': KanjiReading(
    kanji: '戟',
    onyomi: ['げき'],
    kunyomi: ['ほこ'],
    meanings: ['halbert', 'arms'],
    grade: 9,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // crevice / fissure / discord
  '隙': KanjiReading(
    kanji: '隙',
    onyomi: ['げき', 'きゃく', 'けき'],
    kunyomi: ['すき', 'す(く)', 'す(かす)', 'ひま'],
    meanings: ['crevice', 'fissure', 'discord'],
    grade: 8,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // beam / girder / spar
  '桁': KanjiReading(
    kanji: '桁',
    onyomi: ['こう'],
    kunyomi: ['けた'],
    meanings: ['beam', 'girder', 'spar'],
    grade: 8,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // separation / part / secret
  '訣': KanjiReading(
    kanji: '訣',
    onyomi: ['けつ'],
    kunyomi: ['わかれ', 'わかれ(る)'],
    meanings: ['separation', 'part', 'secret'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // lose interest in / tire of
  '倦': KanjiReading(
    kanji: '倦',
    onyomi: ['けん'],
    kunyomi: ['あき(る)', 'あぐ(む)', 'あぐ(ねる)', 'う(む)', 'つか(れる)'],
    meanings: ['lose interest in', 'tire of'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // roll / 风 / coil
  '捲': KanjiReading(
    kanji: '捲',
    onyomi: ['けん'],
    kunyomi: ['ま(く)', 'ま(くる)', 'まく(る)', 'めく(る)', 'まく(れる)'],
    meanings: ['roll', '风', 'coil'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // 拉 / tug / drag
  '牽': KanjiReading(
    kanji: '牽',
    onyomi: ['けん'],
    kunyomi: ['ひ(く)'],
    meanings: ['拉', 'tug', 'drag'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // string / cord / samisen music
  '絃': KanjiReading(
    kanji: '絃',
    onyomi: ['げん'],
    kunyomi: ['いと'],
    meanings: ['string', 'cord', 'samisen music'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // gunwale
  '舷': KanjiReading(
    kanji: '舷',
    onyomi: ['げん'],
    kunyomi: ['ふなばた', 'ふなべり'],
    meanings: ['gunwale'],
    grade: 8,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // proverb
  '諺': KanjiReading(
    kanji: '諺',
    onyomi: ['げん'],
    kunyomi: ['ことわざ'],
    meanings: ['proverb'],
    grade: 9,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // question mark / ?
  '乎': KanjiReading(
    kanji: '乎',
    onyomi: ['こ', 'お'],
    kunyomi: ['か', 'ああ', 'かな', 'や', 'よ', 'を'],
    meanings: ['question mark', '?'],
    grade: 9,
    strokes: 5,
    frequencyRank: 99999,
  ),
  // paste / glue / sizing
  '糊': KanjiReading(
    kanji: '糊',
    onyomi: ['こ', 'ご', 'こつ'],
    kunyomi: ['のり'],
    meanings: ['paste', 'glue', 'sizing'],
    grade: 9,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // be / sit or stand astride / extend over
  '跨': KanjiReading(
    kanji: '跨',
    onyomi: ['こ', 'か'],
    kunyomi: ['また(がる)', 'またが(る)', 'また(ぐ)'],
    meanings: ['be', 'sit or stand astride', 'extend over'],
    grade: 9,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // Chinese parasol tree / phoenix tree
  '梧': KanjiReading(
    kanji: '梧',
    onyomi: ['ご'],
    kunyomi: ['あおぎり'],
    meanings: ['Chinese parasol tree', 'phoenix tree'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // apple
  '檎': KanjiReading(
    kanji: '檎',
    onyomi: ['きん', 'ごん', 'ご'],
    kunyomi: [],
    meanings: ['apple'],
    grade: 9,
    strokes: 17,
    frequencyRank: 99999,
  ),
  // ancestral offering receptacle / coral
  '瑚': KanjiReading(
    kanji: '瑚',
    onyomi: ['こ', 'ご'],
    kunyomi: [],
    meanings: ['ancestral offering receptacle', 'coral'],
    grade: 9,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // boiled butter
  '醐': KanjiReading(
    kanji: '醐',
    onyomi: ['ご', 'こ'],
    kunyomi: [],
    meanings: ['boiled butter'],
    grade: 9,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // happiness / luck
  '倖': KanjiReading(
    kanji: '倖',
    onyomi: ['こう'],
    kunyomi: ['しあわ(せ)', 'さいわ(い)'],
    meanings: ['happiness', 'luck'],
    grade: 9,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // be bent / slope / capture
  '勾': KanjiReading(
    kanji: '勾',
    onyomi: ['こう', 'く'],
    kunyomi: ['かぎ', 'ま(がる)'],
    meanings: ['be bent', 'slope', 'capture'],
    grade: 8,
    strokes: 4,
    frequencyRank: 99999,
  ),
  // 7th / 7th calendar sign
  '庚': KanjiReading(
    kanji: '庚',
    onyomi: ['こう'],
    kunyomi: ['かのえ'],
    meanings: ['7th', '7th calendar sign'],
    grade: 9,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // rise
  '昂': KanjiReading(
    kanji: '昂',
    onyomi: ['こう', 'ごう'],
    kunyomi: ['あ(がる)', 'たか(い)', 'たか(ぶる)'],
    meanings: ['rise'],
    grade: 9,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // for the most part / close up / flower stem
  '梗': KanjiReading(
    kanji: '梗',
    onyomi: ['こう', 'きょう'],
    kunyomi: ['ふさぐ', 'やまにれ', 'おおむね'],
    meanings: ['for the most part', 'close up', 'flower stem'],
    grade: 8,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // body cavity
  '腔': KanjiReading(
    kanji: '腔',
    onyomi: ['こう'],
    kunyomi: [],
    meanings: ['body cavity'],
    grade: 9,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // fat / grease / lard
  '膏': KanjiReading(
    kanji: '膏',
    onyomi: ['こう'],
    kunyomi: ['あぶら'],
    meanings: ['fat', 'grease', 'lard'],
    grade: 9,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // small side gate
  '閤': KanjiReading(
    kanji: '閤',
    onyomi: ['こう'],
    kunyomi: ['くぐりど'],
    meanings: ['small side gate'],
    grade: 9,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // threat / long ages
  '劫': KanjiReading(
    kanji: '劫',
    onyomi: ['こう', 'ごう', 'きょう'],
    kunyomi: ['おびや(かす)'],
    meanings: ['threat', 'long ages'],
    grade: 9,
    strokes: 7,
    frequencyRank: 99999,
  ),
  // in a moment / instantly / all of a sudden
  '忽': KanjiReading(
    kanji: '忽',
    onyomi: ['こつ'],
    kunyomi: ['たちま(ち)', 'ゆるが(せ)'],
    meanings: ['in a moment', 'instantly', 'all of a sudden'],
    grade: 9,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // ground-breaking / open up farmland
  '墾': KanjiReading(
    kanji: '墾',
    onyomi: ['こん'],
    kunyomi: ['は(る)', 'ひら(く)'],
    meanings: ['ground-breaking', 'open up farmland'],
    grade: 8,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // dark / 傍晚 / dusk
  '昏': KanjiReading(
    kanji: '昏',
    onyomi: ['こん'],
    kunyomi: ['くら(い)', 'くれ'],
    meanings: ['dark', '傍晚', 'dusk'],
    grade: 9,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // a little bit / sometimes
  '些': KanjiReading(
    kanji: '些',
    onyomi: ['さ', 'しゃ'],
    kunyomi: ['ち(と)', 'ち(っと)', 'いささか'],
    meanings: ['a little bit', 'sometimes'],
    grade: 9,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // fork in road / crotch
  '叉': KanjiReading(
    kanji: '叉',
    onyomi: ['さ', 'しゃ', 'さい'],
    kunyomi: ['また'],
    meanings: ['fork in road', 'crotch'],
    grade: 9,
    strokes: 3,
    frequencyRank: 99999,
  ),
  // polish / brilliant white luster of a gem / artful smile
  '瑳': KanjiReading(
    kanji: '瑳',
    onyomi: ['さ'],
    kunyomi: ['みが(く)'],
    meanings: ['polish', 'brilliant white luster of a gem', 'artful smile'],
    grade: 9,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // Buddhist surplice
  '裟': KanjiReading(
    kanji: '裟',
    onyomi: ['さ', 'しゃ'],
    kunyomi: [],
    meanings: ['Buddhist surplice'],
    grade: 9,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // how / what / alas
  '哉': KanjiReading(
    kanji: '哉',
    onyomi: ['さい'],
    kunyomi: ['かな', 'や'],
    meanings: ['how', 'what', 'alas'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // 关 / shut / cover
  '塞': KanjiReading(
    kanji: '塞',
    onyomi: ['そく', 'さい'],
    kunyomi: ['ふさ(ぐ)', 'とりで', 'み(ちる)'],
    meanings: ['关', 'shut', 'cover'],
    grade: 8,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // dice / form / appearance
  '采': KanjiReading(
    kanji: '采',
    onyomi: ['さい'],
    kunyomi: ['と(る)', 'いろどり'],
    meanings: ['dice', 'form', 'appearance'],
    grade: 8,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // accompaniment for drinks
  '肴': KanjiReading(
    kanji: '肴',
    onyomi: ['こう'],
    kunyomi: ['さかな'],
    meanings: ['accompaniment for drinks'],
    grade: 9,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // stockade / fence / weir
  '柵': KanjiReading(
    kanji: '柵',
    onyomi: ['さく', 'さん'],
    kunyomi: ['しがら(む)', 'しがらみ', 'とりで', 'やらい'],
    meanings: ['stockade', 'fence', 'weir'],
    grade: 8,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // 窄 / fold / furl
  '窄': KanjiReading(
    kanji: '窄',
    onyomi: ['さく'],
    kunyomi: ['すぼ(める)', 'つぼ(める)', 'せま(い)'],
    meanings: ['窄', 'fold', 'furl'],
    grade: 9,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // be imminent / draw close
  '拶': KanjiReading(
    kanji: '拶',
    onyomi: ['さつ'],
    kunyomi: ['せま(る)'],
    meanings: ['be imminent', 'draw close'],
    grade: 8,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // rust / tarnish
  '錆': KanjiReading(
    kanji: '錆',
    onyomi: ['しょう', 'せい'],
    kunyomi: ['さび', 'くわ(しい)'],
    meanings: ['rust', 'tarnish'],
    grade: 9,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // bleach / refine / expose
  '晒': KanjiReading(
    kanji: '晒',
    onyomi: ['さい', 'し'],
    kunyomi: ['さら(す)', 'さらし'],
    meanings: ['bleach', 'refine', 'expose'],
    grade: 9,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // scatter / sprinkle / give them the slip
  '撒': KanjiReading(
    kanji: '撒',
    onyomi: ['さん', 'さつ'],
    kunyomi: ['ま(く)'],
    meanings: ['scatter', 'sprinkle', 'give them the slip'],
    grade: 9,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // brilliant
  '燦': KanjiReading(
    kanji: '燦',
    onyomi: ['さん'],
    kunyomi: ['さん(たる)', 'あき(らか)', 'きらめ(く)', 'きら(めく)'],
    meanings: ['brilliant'],
    grade: 9,
    strokes: 17,
    frequencyRank: 99999,
  ),
  // coral / centimeter
  '珊': KanjiReading(
    kanji: '珊',
    onyomi: ['さん'],
    kunyomi: ['センチ', 'さんち'],
    meanings: ['coral', 'centimeter'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // editing / compiling
  '纂': KanjiReading(
    kanji: '纂',
    onyomi: ['さん'],
    kunyomi: ['あつ(める)'],
    meanings: ['editing', 'compiling'],
    grade: 9,
    strokes: 20,
    frequencyRank: 99999,
  ),
  // offspring (animal) / detailed / fine
  '仔': KanjiReading(
    kanji: '仔',
    onyomi: ['し'],
    kunyomi: ['こ', 'た(える)'],
    meanings: ['offspring (animal)', 'detailed', 'fine'],
    grade: 9,
    strokes: 5,
    frequencyRank: 99999,
  ),
  // this / thus / such
  '斯': KanjiReading(
    kanji: '斯',
    onyomi: ['し'],
    kunyomi: ['か', 'こう', 'か(く)', 'この', 'これ', 'ここに'],
    meanings: ['this', 'thus', 'such'],
    grade: 9,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // you / thou / second person
  '爾': KanjiReading(
    kanji: '爾',
    onyomi: ['じ', 'に'],
    kunyomi: ['なんじ', 'しかり', 'その', 'のみ', 'おれ', 'しか'],
    meanings: ['you', 'thou', 'second person'],
    grade: 9,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // emperor's seal
  '璽': KanjiReading(
    kanji: '璽',
    onyomi: ['じ'],
    kunyomi: [],
    meanings: ['emperor\'s seal'],
    grade: 8,
    strokes: 19,
    frequencyRank: 99999,
  ),
  // and yet / and then / but
  '而': KanjiReading(
    kanji: '而',
    onyomi: ['じ', 'に'],
    kunyomi: ['しこ(うして)', 'しか(して)', 'しか(も)', 'しか(れども)', 'すなわち', 'なんじ', 'しかるに'],
    meanings: ['and yet', 'and then', 'but'],
    grade: 9,
    strokes: 6,
    frequencyRank: 99999,
  ),
  // bamboo
  '竺': KanjiReading(
    kanji: '竺',
    onyomi: ['じく', 'ちく', 'とく'],
    kunyomi: [],
    meanings: ['bamboo'],
    grade: 9,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // 全部 / entirely / altogether
  '悉': KanjiReading(
    kanji: '悉',
    onyomi: ['しつ', 'しち'],
    kunyomi: ['つ(きる)', 'ことごと', 'ことごと(く)', 'つ(くす)', 'つぶさ(に)'],
    meanings: ['全部', 'entirely', 'altogether'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // gauze / gossamer
  '紗': KanjiReading(
    kanji: '紗',
    onyomi: ['さ', 'しゃ'],
    kunyomi: ['うすぎぬ'],
    meanings: ['gauze', 'gossamer'],
    grade: 9,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // ladle / one tenth of a go / dip
  '勺': KanjiReading(
    kanji: '勺',
    onyomi: ['しゃく'],
    kunyomi: [],
    meanings: ['ladle', 'one tenth of a go', 'dip'],
    grade: 9,
    strokes: 3,
    frequencyRank: 99999,
  ),
  // miraculous
  '灼': KanjiReading(
    kanji: '灼',
    onyomi: ['しゃく'],
    kunyomi: ['あらた', 'やく'],
    meanings: ['miraculous'],
    grade: 9,
    strokes: 7,
    frequencyRank: 99999,
  ),
  // baron / peerage / court rank
  '爵': KanjiReading(
    kanji: '爵',
    onyomi: ['しゃく'],
    kunyomi: [],
    meanings: ['baron', 'peerage', 'court rank'],
    grade: 8,
    strokes: 17,
    frequencyRank: 99999,
  ),
  // attract / captivate
  '惹': KanjiReading(
    kanji: '惹',
    onyomi: ['じゃく', 'じゃ'],
    kunyomi: ['ひ(く)'],
    meanings: ['attract', 'captivate'],
    grade: 9,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // gather
  '蒐': KanjiReading(
    kanji: '蒐',
    onyomi: ['しゅう'],
    kunyomi: ['あかね', 'あつ(まる)', 'あつ(める)'],
    meanings: ['gather'],
    grade: 9,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // gather / collect / compile
  '輯': KanjiReading(
    kanji: '輯',
    onyomi: ['しゅう'],
    kunyomi: ['あつ(める)', 'やわ(らぐ)'],
    meanings: ['gather', 'collect', 'compile'],
    grade: 9,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // 结束 / 完成
  '竣': KanjiReading(
    kanji: '竣',
    onyomi: ['どう', 'しゅん'],
    kunyomi: ['わらわ', 'わらべ', 'おわ(る)'],
    meanings: ['结束', '完成'],
    grade: 9,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // shield / buckler / pretext
  '楯': KanjiReading(
    kanji: '楯',
    onyomi: ['じゅん'],
    kunyomi: ['たて'],
    meanings: ['shield', 'buckler', 'pretext'],
    grade: 9,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // abide by / follow / obey
  '遵': KanjiReading(
    kanji: '遵',
    onyomi: ['じゅん'],
    kunyomi: [],
    meanings: ['abide by', 'follow', 'obey'],
    grade: 8,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // pure sake / purity / affection
  '醇': KanjiReading(
    kanji: '醇',
    onyomi: ['じゅん', 'しゅん'],
    kunyomi: ['もっぱら', 'こい', 'あつい'],
    meanings: ['pure sake', 'purity', 'affection'],
    grade: 9,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // excuse / tolerate / forgive
  '恕': KanjiReading(
    kanji: '恕',
    onyomi: ['じょ', 'しょ'],
    kunyomi: ['ゆる(す)'],
    meanings: ['excuse', 'tolerate', 'forgive'],
    grade: 9,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // once / 前 / formerly
  '嘗': KanjiReading(
    kanji: '嘗',
    onyomi: ['しょう', 'じょう'],
    kunyomi: ['かつ(て)', 'こころ(みる)', 'な(める)'],
    meanings: ['once', '前', 'formerly'],
    grade: 9,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // victory / 快
  '捷': KanjiReading(
    kanji: '捷',
    onyomi: ['しょう', 'そう'],
    kunyomi: ['はや(い)'],
    meanings: ['victory', '快'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // treetops / twig
  '梢': KanjiReading(
    kanji: '梢',
    onyomi: ['しょう'],
    kunyomi: ['こずえ', 'くすのき'],
    meanings: ['treetops', 'twig'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // iris
  '菖': KanjiReading(
    kanji: '菖',
    onyomi: ['しょう'],
    kunyomi: [],
    meanings: ['iris'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // skirt
  '裳': KanjiReading(
    kanji: '裳',
    onyomi: ['しょう'],
    kunyomi: ['も', 'もすそ'],
    meanings: ['skirt'],
    grade: 9,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // sheath / case / margin
  '鞘': KanjiReading(
    kanji: '鞘',
    onyomi: ['しょう', 'そう'],
    kunyomi: ['さや'],
    meanings: ['sheath', 'case', 'margin'],
    grade: 9,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // 帮助
  '丞': KanjiReading(
    kanji: '丞',
    onyomi: ['じょう', 'しょう'],
    kunyomi: ['すく(う)', 'たす(ける)'],
    meanings: ['帮助'],
    grade: 9,
    strokes: 6,
    frequencyRank: 99999,
  ),
  // 光 / candlepower
  '燭': KanjiReading(
    kanji: '燭',
    onyomi: ['そく', 'しょく'],
    kunyomi: ['ともしび'],
    meanings: ['光', 'candlepower'],
    grade: 9,
    strokes: 17,
    frequencyRank: 99999,
  ),
  // request / question / investigate
  '訊': KanjiReading(
    kanji: '訊',
    onyomi: ['じん', 'しゅん', 'しん'],
    kunyomi: ['き(く)', 'と(う)', 'たず(ねる)'],
    meanings: ['request', 'question', 'investigate'],
    grade: 9,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // auger / drill / awl
  '錐': KanjiReading(
    kanji: '錐',
    onyomi: ['すい'],
    kunyomi: ['きり'],
    meanings: ['auger', 'drill', 'awl'],
    grade: 9,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // weight / plumb bob / sinker
  '錘': KanjiReading(
    kanji: '錘',
    onyomi: ['すい'],
    kunyomi: ['つむ', 'おもり'],
    meanings: ['weight', 'plumb bob', 'sinker'],
    grade: 9,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // be aggravated / grow worse / grow bulky
  '嵩': KanjiReading(
    kanji: '嵩',
    onyomi: ['すう', 'しゅう'],
    kunyomi: ['かさ', 'かさ(む)', 'たか(い)'],
    meanings: ['be aggravated', 'grow worse', 'grow bulky'],
    grade: 9,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // prejudiced / exceedingly
  '頗': KanjiReading(
    kanji: '頗',
    onyomi: ['は'],
    kunyomi: ['すこぶ(る)', 'かたよ(る)'],
    meanings: ['prejudiced', 'exceedingly'],
    grade: 9,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // rub / fold / print (on cloth)
  '摺': KanjiReading(
    kanji: '摺',
    onyomi: ['しょう', 'しゅう', 'ろう'],
    kunyomi: ['す(る)', 'ひだ'],
    meanings: ['rub', 'fold', 'print (on cloth)'],
    grade: 9,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // 活 / dwell
  '棲': KanjiReading(
    kanji: '棲',
    onyomi: ['せい'],
    kunyomi: ['す(む)'],
    meanings: ['活', 'dwell'],
    grade: 9,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // nest / rookery / hive
  '栖': KanjiReading(
    kanji: '栖',
    onyomi: ['せい'],
    kunyomi: ['す(む)'],
    meanings: ['nest', 'rookery', 'hive'],
    grade: 9,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // awake / be disillusioned / sober up
  '醒': KanjiReading(
    kanji: '醒',
    onyomi: ['せい'],
    kunyomi: ['さ(ます)', 'さ(める)'],
    meanings: ['awake', 'be disillusioned', 'sober up'],
    grade: 8,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // grieve / relatives
  '戚': KanjiReading(
    kanji: '戚',
    onyomi: ['そく', 'せき'],
    kunyomi: ['いた(む)', 'うれ(える)', 'みうち'],
    meanings: ['grieve', 'relatives'],
    grade: 8,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // remains / traces / footprint
  '蹟': KanjiReading(
    kanji: '蹟',
    onyomi: ['せき', 'しゃく'],
    kunyomi: ['あと'],
    meanings: ['remains', 'traces', 'footprint'],
    grade: 9,
    strokes: 18,
    frequencyRank: 99999,
  ),
  // large / great / eminent
  '碩': KanjiReading(
    kanji: '碩',
    onyomi: ['せき'],
    kunyomi: ['おお(きい)'],
    meanings: ['large', 'great', 'eminent'],
    grade: 9,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // composing / editing / compiling
  '撰': KanjiReading(
    kanji: '撰',
    onyomi: ['さん', 'せん'],
    kunyomi: ['せん(する)', 'えら(む)', 'えら(ぶ)'],
    meanings: ['composing', 'editing', 'compiling'],
    grade: 9,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // put on (to the feet) / dig / pierce
  '穿': KanjiReading(
    kanji: '穿',
    onyomi: ['せん'],
    kunyomi: ['うが(つ)', 'は(く)'],
    meanings: ['put on (to the feet)', 'dig', 'pierce'],
    grade: 9,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // envious / be jealous / covet
  '羨': KanjiReading(
    kanji: '羨',
    onyomi: ['せん', 'えん'],
    kunyomi: ['うらや(む)', 'あまり'],
    meanings: ['envious', 'be jealous', 'covet'],
    grade: 8,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // gland / (kokuji)
  '腺': KanjiReading(
    kanji: '腺',
    onyomi: ['せん'],
    kunyomi: [],
    meanings: ['gland', '(kokuji)'],
    grade: 8,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // discussion / methods called for / selection
  '詮': KanjiReading(
    kanji: '詮',
    onyomi: ['せん'],
    kunyomi: ['せん(ずる)', 'かい', 'あき(らか)'],
    meanings: ['discussion', 'methods called for', 'selection'],
    grade: 8,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // pig iron
  '銑': KanjiReading(
    kanji: '銑',
    onyomi: ['せん'],
    kunyomi: [],
    meanings: ['pig iron'],
    grade: 9,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // flash / brandish
  '閃': KanjiReading(
    kanji: '閃',
    onyomi: ['せん'],
    kunyomi: ['ひらめ(く)', 'ひらめ(き)', 'うかが(う)'],
    meanings: ['flash', 'brandish'],
    grade: 9,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // boisterous
  '噌': KanjiReading(
    kanji: '噌',
    onyomi: ['そう', 'しょう', 'そ'],
    kunyomi: ['かまびす(しい)'],
    meanings: ['boisterous'],
    grade: 9,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // model / molding
  '塑': KanjiReading(
    kanji: '塑',
    onyomi: ['そ'],
    kunyomi: ['でく'],
    meanings: ['model', 'molding'],
    grade: 8,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // once / 前 / formerly
  '曾': KanjiReading(
    kanji: '曾',
    onyomi: ['そう', 'そ', 'ぞう'],
    kunyomi: ['かつ(て)', 'か(って)', 'すなわち'],
    meanings: ['once', '前', 'formerly'],
    grade: 10,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // whip / cane
  '楚': KanjiReading(
    kanji: '楚',
    onyomi: ['そ', 'しょ'],
    kunyomi: ['いばら', 'しもと', 'すわえ'],
    meanings: ['whip', 'cane'],
    grade: 9,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // pass through / note / commentary
  '疏': KanjiReading(
    kanji: '疏',
    onyomi: ['そ', 'しょ'],
    kunyomi: ['あら(い)', 'うと(い)', 'うと(む)', 'とお(る)', 'とお(す)', 'まばら'],
    meanings: ['pass through', 'note', 'commentary'],
    grade: 9,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // go upstream / retrace the past
  '遡': KanjiReading(
    kanji: '遡',
    onyomi: ['そ', 'さく'],
    kunyomi: ['さかのぼ(る)'],
    meanings: ['go upstream', 'retrace the past'],
    grade: 8,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // get thin
  '痩': KanjiReading(
    kanji: '痩',
    onyomi: ['そう', 'ちゅう', 'しゅう', 'しゅ'],
    kunyomi: ['や(せる)'],
    meanings: ['get thin'],
    grade: 8,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // humble / modest
  '遜': KanjiReading(
    kanji: '遜',
    onyomi: ['そん'],
    kunyomi: ['したが(う)', 'へりくだ(る)', 'ゆず(る)'],
    meanings: ['humble', 'modest'],
    grade: 8,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // washing / sieving / filtering
  '汰': KanjiReading(
    kanji: '汰',
    onyomi: ['た', 'たい'],
    kunyomi: ['おご(る)', 'にご(る)', 'よな(げる)'],
    meanings: ['washing', 'sieving', 'filtering'],
    grade: 8,
    strokes: 7,
    frequencyRank: 99999,
  ),
  // saliva / sputum
  '唾': KanjiReading(
    kanji: '唾',
    onyomi: ['だ', 'た'],
    kunyomi: ['つば', 'つばき'],
    meanings: ['saliva', 'sputum'],
    grade: 8,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // steep
  '陀': KanjiReading(
    kanji: '陀',
    onyomi: ['た', 'だ', 'い', 'ち', 'じ'],
    kunyomi: ['けわ(しい)', 'ななめ'],
    meanings: ['steep'],
    grade: 9,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // moss / lichen
  '苔': KanjiReading(
    kanji: '苔',
    onyomi: ['たい'],
    kunyomi: ['こけ', 'こけら'],
    meanings: ['moss', 'lichen'],
    grade: 9,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // waterfall / rapids / cascade
  '瀧': KanjiReading(
    kanji: '瀧',
    onyomi: ['ろう', 'そう'],
    kunyomi: ['たき'],
    meanings: ['waterfall', 'rapids', 'cascade'],
    grade: 10,
    strokes: 19,
    frequencyRank: 99999,
  ),
  // requesting / entrusting with / pretend
  '托': KanjiReading(
    kanji: '托',
    onyomi: ['たく'],
    kunyomi: ['たく(する)', 'たの(む)'],
    meanings: ['requesting', 'entrusting with', 'pretend'],
    grade: 9,
    strokes: 6,
    frequencyRank: 99999,
  ),
  // mushroom
  '茸': KanjiReading(
    kanji: '茸',
    onyomi: ['じょう', 'にゅ'],
    kunyomi: ['きのこ', 'たけ', 'しげ(る)'],
    meanings: ['mushroom'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // follow (road) / pursue
  '辿': KanjiReading(
    kanji: '辿',
    onyomi: ['てん'],
    kunyomi: ['たど(る)', 'たどり'],
    meanings: ['follow (road)', 'pursue'],
    grade: 9,
    strokes: 6,
    frequencyRank: 99999,
  ),
  // level / 宽
  '坦': KanjiReading(
    kanji: '坦',
    onyomi: ['たん'],
    kunyomi: ['たいら'],
    meanings: ['level', '宽'],
    grade: 9,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // daybreak / dawn / 早晨
  '旦': KanjiReading(
    kanji: '旦',
    onyomi: ['たん', 'だん'],
    kunyomi: ['あき(らか)', 'あきら', 'ただし', 'あさ', 'あした'],
    meanings: ['daybreak', 'dawn', '早晨'],
    grade: 8,
    strokes: 5,
    frequencyRank: 99999,
  ),
  // grief / lamentation
  '歎': KanjiReading(
    kanji: '歎',
    onyomi: ['たん'],
    kunyomi: ['なげ(く)', 'なげ(き)'],
    meanings: ['grief', 'lamentation'],
    grade: 9,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // be rent / ripped / unravel
  '綻': KanjiReading(
    kanji: '綻',
    onyomi: ['たん'],
    kunyomi: ['ほころ(びる)'],
    meanings: ['be rent', 'ripped', 'unravel'],
    grade: 8,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // addicted / absorbed in
  '耽': KanjiReading(
    kanji: '耽',
    onyomi: ['たん'],
    kunyomi: ['ふけ(る)'],
    meanings: ['addicted', 'absorbed in'],
    grade: 9,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // 跑 / gallop / sail
  '馳': KanjiReading(
    kanji: '馳',
    onyomi: ['ち', 'じ'],
    kunyomi: ['は(せる)'],
    meanings: ['跑', 'gallop', 'sail'],
    grade: 9,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // notes / comment / annotate
  '註': KanjiReading(
    kanji: '註',
    onyomi: ['ちゅう'],
    kunyomi: [],
    meanings: ['notes', 'comment', 'annotate'],
    grade: 9,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // sake
  '酎': KanjiReading(
    kanji: '酎',
    onyomi: ['ちゅう', 'ちゅ'],
    kunyomi: ['かも(す)'],
    meanings: ['sake'],
    grade: 8,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // affection / 爱 / patronage
  '寵': KanjiReading(
    kanji: '寵',
    onyomi: ['ちょう'],
    kunyomi: ['めぐ(み)', 'めぐ(む)'],
    meanings: ['affection', '爱', 'patronage'],
    grade: 9,
    strokes: 19,
    frequencyRank: 99999,
  ),
  // label / genealogy / circular
  '牒': KanjiReading(
    kanji: '牒',
    onyomi: ['ちょう', 'じょう'],
    kunyomi: ['ふだ'],
    meanings: ['label', 'genealogy', 'circular'],
    grade: 9,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // dilate / distend / bulge
  '脹': KanjiReading(
    kanji: '脹',
    onyomi: ['ちょう'],
    kunyomi: ['は(れる)', 'ふく(らむ)', 'ふく(れる)'],
    meanings: ['dilate', 'distend', 'bulge'],
    grade: 9,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // make progress
  '捗': KanjiReading(
    kanji: '捗',
    onyomi: ['ちょく', 'ほ'],
    kunyomi: ['はかど(る)'],
    meanings: ['make progress'],
    grade: 8,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // majestic plural / imperial we
  '朕': KanjiReading(
    kanji: '朕',
    onyomi: ['ちん'],
    kunyomi: [],
    meanings: ['majestic plural', 'imperial we'],
    grade: 8,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // wild mulberry
  '柘': KanjiReading(
    kanji: '柘',
    onyomi: ['しゃ', 'じゃく'],
    kunyomi: ['そ', 'つげ', 'やまぐわ'],
    meanings: ['wild mulberry'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // crush / smash / 打破
  '潰': KanjiReading(
    kanji: '潰',
    onyomi: ['かい', 'え'],
    kunyomi: ['つぶ(す)', 'つぶ(れる)', 'つい(える)'],
    meanings: ['crush', 'smash', '打破'],
    grade: 8,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // pongee (a knotted silk cloth)
  '紬': KanjiReading(
    kanji: '紬',
    onyomi: ['ちゅう'],
    kunyomi: ['つむぎ', 'つむ(ぐ)'],
    meanings: ['pongee (a knotted silk cloth)'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // water's edge / shore / bank
  '汀': KanjiReading(
    kanji: '汀',
    onyomi: ['てい'],
    kunyomi: ['みぎわ', 'なぎさ'],
    meanings: ['water\'s edge', 'shore', 'bank'],
    grade: 9,
    strokes: 5,
    frequencyRank: 99999,
  ),
  // three legged kettle
  '鼎': KanjiReading(
    kanji: '鼎',
    onyomi: ['てい'],
    kunyomi: ['かなえ'],
    meanings: ['three legged kettle'],
    grade: 9,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // excel in / surpass / pull out
  '擢': KanjiReading(
    kanji: '擢',
    onyomi: ['てき', 'たく'],
    kunyomi: ['ぬ(く)', 'ぬき(んでる)'],
    meanings: ['excel in', 'surpass', 'pull out'],
    grade: 9,
    strokes: 17,
    frequencyRank: 99999,
  ),
  // drown / indulge
  '溺': KanjiReading(
    kanji: '溺',
    onyomi: ['でき', 'じょう', 'にょう'],
    kunyomi: ['いばり', 'おぼ(れる)'],
    meanings: ['drown', 'indulge'],
    grade: 8,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // wear / wrap / tie
  '纏': KanjiReading(
    kanji: '纏',
    onyomi: ['てん', 'でん'],
    kunyomi: ['まつ(わる)', 'まと(う)', 'まと(める)', 'まと(まる)', 'まと(い)'],
    meanings: ['wear', 'wrap', 'tie'],
    grade: 9,
    strokes: 21,
    frequencyRank: 99999,
  ),
  // rabbit / hare
  '兎': KanjiReading(
    kanji: '兎',
    onyomi: ['と', 'つ'],
    kunyomi: ['うさぎ'],
    meanings: ['rabbit', 'hare'],
    grade: 9,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // fence / railing / enclosure
  '堵': KanjiReading(
    kanji: '堵',
    onyomi: ['と'],
    kunyomi: ['かき'],
    meanings: ['fence', 'railing', 'enclosure'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // jealous / envy
  '妬': KanjiReading(
    kanji: '妬',
    onyomi: ['と', 'つ'],
    kunyomi: ['ねた(む)', 'そね(む)', 'つも(る)', 'ふさ(ぐ)'],
    meanings: ['jealous', 'envy'],
    grade: 8,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // whetstone / grindstone
  '砥': KanjiReading(
    kanji: '砥',
    onyomi: ['し', 'てい', 'きい', 'ち'],
    kunyomi: ['と', 'といし', 'と(ぐ)', 'みが(く)'],
    meanings: ['whetstone', 'grindstone'],
    grade: 9,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // accumulate / big and long / hackneyed
  '套': KanjiReading(
    kanji: '套',
    onyomi: ['とう'],
    kunyomi: ['かさ(ねる)'],
    meanings: ['accumulate', 'big and long', 'hackneyed'],
    grade: 9,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // pox / smallpox
  '痘': KanjiReading(
    kanji: '痘',
    onyomi: ['とう'],
    kunyomi: [],
    meanings: ['pox', 'smallpox'],
    grade: 8,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // pray
  '祷': KanjiReading(
    kanji: '祷',
    onyomi: ['とう'],
    kunyomi: ['いの(る)', 'いの(り)', 'まつ(る)'],
    meanings: ['pray'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // 正确
  '董': KanjiReading(
    kanji: '董',
    onyomi: ['とう'],
    kunyomi: ['ただ(す)'],
    meanings: ['正确'],
    grade: 9,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // thrust / pierce / stab
  '撞': KanjiReading(
    kanji: '撞',
    onyomi: ['どう', 'とう', 'しゅ'],
    kunyomi: ['つ(く)'],
    meanings: ['thrust', 'pierce', 'stab'],
    grade: 9,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // grape vine / wild grape
  '萄': KanjiReading(
    kanji: '萄',
    onyomi: ['どう', 'とう'],
    kunyomi: [],
    meanings: ['grape vine', 'wild grape'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // black kite / fireman / hook
  '鳶': KanjiReading(
    kanji: '鳶',
    onyomi: ['えん'],
    kunyomi: ['とび', 'とんび'],
    meanings: ['black kite', 'fireman', 'hook'],
    grade: 9,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // primeval chaos
  '沌': KanjiReading(
    kanji: '沌',
    onyomi: ['とん'],
    kunyomi: ['くら(い)'],
    meanings: ['primeval chaos'],
    grade: 9,
    strokes: 7,
    frequencyRank: 99999,
  ),
  // flee / escape / shirk
  '遁': KanjiReading(
    kanji: '遁',
    onyomi: ['とん', 'しゅん'],
    kunyomi: ['のが(れる)'],
    meanings: ['flee', 'escape', 'shirk'],
    grade: 9,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // suddenly / immediately / in a hurry
  '頓': KanjiReading(
    kanji: '頓',
    onyomi: ['とん', 'とつ'],
    kunyomi: ['にわか(に)', 'とん(と)', 'つまず(く)', 'とみ(に)', 'ぬかずく'],
    meanings: ['suddenly', 'immediately', 'in a hurry'],
    grade: 8,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // lull / calm / (kokuji)
  '凪': KanjiReading(
    kanji: '凪',
    onyomi: [],
    kunyomi: ['なぎ', 'な(ぐ)'],
    meanings: ['lull', 'calm', '(kokuji)'],
    grade: 9,
    strokes: 6,
    frequencyRank: 99999,
  ),
  // mow down (the enemy)
  '薙': KanjiReading(
    kanji: '薙',
    onyomi: ['てい', 'ち'],
    kunyomi: ['な(ぐ)', 'なぎ', 'か(る)'],
    meanings: ['mow down (the enemy)'],
    grade: 9,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // press / print / affix a seal
  '捺': KanjiReading(
    kanji: '捺',
    onyomi: ['なつ', 'だつ'],
    kunyomi: ['さ(す)', 'お(す)'],
    meanings: ['press', 'print', 'affix a seal'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // get used to / experienced / tamed
  '馴': KanjiReading(
    kanji: '馴',
    onyomi: ['じゅん', 'しゅん', 'くん'],
    kunyomi: ['な(れる)', 'な(らす)', 'したが(う)'],
    meanings: ['get used to', 'experienced', 'tamed'],
    grade: 9,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // you / thou
  '汝': KanjiReading(
    kanji: '汝',
    onyomi: ['じょ'],
    kunyomi: ['なんじ', 'なれ', 'い', 'うぬ', 'いまし', 'し', 'しゃ', 'な', 'なむち', 'まし', 'みまし'],
    meanings: ['you', 'thou'],
    grade: 9,
    strokes: 6,
    frequencyRank: 99999,
  ),
  // II / 二 / 第二
  '弐': KanjiReading(
    kanji: '弐',
    onyomi: ['に', 'じ'],
    kunyomi: ['ふた(つ)', 'そえ'],
    meanings: ['II', '二', '第二'],
    grade: 8,
    strokes: 6,
    frequencyRank: 99999,
  ),
  // flourish / be bustling / prosperity
  '賑': KanjiReading(
    kanji: '賑',
    onyomi: ['しん'],
    kunyomi: ['にぎ(わい)', 'にぎ(やか)', 'にぎ(わす)', 'にぎ(わう)'],
    meanings: ['flourish', 'be bustling', 'prosperity'],
    grade: 9,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // twenty
  '廿': KanjiReading(
    kanji: '廿',
    onyomi: ['じゅう', 'にゅう'],
    kunyomi: ['にじゅう'],
    meanings: ['twenty'],
    grade: 9,
    strokes: 4,
    frequencyRank: 99999,
  ),
  // ancestral shrine
  '禰': KanjiReading(
    kanji: '禰',
    onyomi: ['ね', 'でい', 'ない'],
    kunyomi: [],
    meanings: ['ancestral shrine'],
    grade: 9,
    strokes: 18,
    frequencyRank: 99999,
  ),
  // ancestral shrine
  '祢': KanjiReading(
    kanji: '祢',
    onyomi: ['ね', 'でい', 'ない'],
    kunyomi: [],
    meanings: ['ancestral shrine'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // twirl / twist / play with
  '捻': KanjiReading(
    kanji: '捻',
    onyomi: ['ねん', 'じょう'],
    kunyomi: ['ね(じる)', 'ねじ(る)', 'ひね(くる)', 'ひね(る)'],
    meanings: ['twirl', 'twist', 'play with'],
    grade: 8,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // open country / 田地 / wilderness
  '埜': KanjiReading(
    kanji: '埜',
    onyomi: ['や', 'しょ'],
    kunyomi: ['の'],
    meanings: ['open country', '田地', 'wilderness'],
    grade: 10,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // kind of rake / loquat
  '杷': KanjiReading(
    kanji: '杷',
    onyomi: ['は'],
    kunyomi: ['つか'],
    meanings: ['kind of rake', 'loquat'],
    grade: 9,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // glass / cup
  '盃': KanjiReading(
    kanji: '盃',
    onyomi: ['はい'],
    kunyomi: ['さかずき'],
    meanings: ['glass', 'cup'],
    grade: 10,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // soot / smoke dried
  '煤': KanjiReading(
    kanji: '煤',
    onyomi: ['ばい', 'まい'],
    kunyomi: ['すす'],
    meanings: ['soot', 'smoke dried'],
    grade: 9,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // crawl / creep / grovel
  '這': KanjiReading(
    kanji: '這',
    onyomi: ['しゃ', 'げん'],
    kunyomi: ['は(う)', 'は(い)', 'むか(える)', 'この'],
    meanings: ['crawl', 'creep', 'grovel'],
    grade: 9,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // balances / scales / steelyard
  '秤': KanjiReading(
    kanji: '秤',
    onyomi: ['しょう', 'ひん', 'びん'],
    kunyomi: ['はかり'],
    meanings: ['balances', 'scales', 'steelyard'],
    grade: 9,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // foil / gilt
  '箔': KanjiReading(
    kanji: '箔',
    onyomi: ['はく'],
    kunyomi: ['すだれ'],
    meanings: ['foil', 'gilt'],
    grade: 9,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // bleach / refine / expose
  '曝': KanjiReading(
    kanji: '曝',
    onyomi: ['ばく', 'ほく', 'ぼく'],
    kunyomi: ['さら(す)'],
    meanings: ['bleach', 'refine', 'expose'],
    grade: 9,
    strokes: 19,
    frequencyRank: 99999,
  ),
  // must not / do not / be not
  '莫': KanjiReading(
    kanji: '莫',
    onyomi: ['ばく', 'ぼ', 'まく', 'も', 'ない'],
    kunyomi: ['くれ', 'なか(れ)', 'なし'],
    meanings: ['must not', 'do not', 'be not'],
    grade: 9,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // notch of an arrow / ought / must
  '筈': KanjiReading(
    kanji: '筈',
    onyomi: ['かつ'],
    kunyomi: ['はず', 'やはず'],
    meanings: ['notch of an arrow', 'ought', 'must'],
    grade: 9,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // spread out / 宽
  '氾': KanjiReading(
    kanji: '氾',
    onyomi: ['はん'],
    kunyomi: ['ひろ(がる)'],
    meanings: ['spread out', '宽'],
    grade: 8,
    strokes: 5,
    frequencyRank: 99999,
  ),
  // saw / turn (lathe) / grind
  '挽': KanjiReading(
    kanji: '挽',
    onyomi: ['ばん'],
    kunyomi: ['ひ(く)'],
    meanings: ['saw', 'turn (lathe)', 'grind'],
    grade: 9,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // 保护 / shield / defend
  '庇': KanjiReading(
    kanji: '庇',
    onyomi: ['ひ'],
    kunyomi: ['ひさし', 'おお(う)', 'かば(う)'],
    meanings: ['保护', 'shield', 'defend'],
    grade: 9,
    strokes: 7,
    frequencyRank: 99999,
  ),
  // loquat / spoon
  '枇': KanjiReading(
    kanji: '枇',
    onyomi: ['び', 'ひ'],
    kunyomi: [],
    meanings: ['loquat', 'spoon'],
    grade: 9,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // 帮助 / assist
  '毘': KanjiReading(
    kanji: '毘',
    onyomi: ['ひ', 'び'],
    kunyomi: ['たす(ける)'],
    meanings: ['帮助', 'assist'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // holly
  '柊': KanjiReading(
    kanji: '柊',
    onyomi: ['しゅ', 'しゅう'],
    kunyomi: ['ひいらぎ'],
    meanings: ['holly'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // 头 / counter for animals
  '疋': KanjiReading(
    kanji: '疋',
    onyomi: ['ひき', 'しょ', 'そ', 'ひつ'],
    kunyomi: ['あし'],
    meanings: ['头', 'counter for animals'],
    grade: 9,
    strokes: 5,
    frequencyRank: 99999,
  ),
  // elbow / arm
  '肘': KanjiReading(
    kanji: '肘',
    onyomi: ['ちゅう'],
    kunyomi: ['ひじ'],
    meanings: ['elbow', 'arm'],
    grade: 8,
    strokes: 7,
    frequencyRank: 99999,
  ),
  // the end / 完成
  '畢': KanjiReading(
    kanji: '畢',
    onyomi: ['ひつ'],
    kunyomi: ['おわ(る)', 'あみ', 'おわ(り)', 'ことごとく'],
    meanings: ['the end', '完成'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // string / cord / braid
  '紐': KanjiReading(
    kanji: '紐',
    onyomi: ['ちゅう', 'じゅう'],
    kunyomi: ['ひも'],
    meanings: ['string', 'cord', 'braid'],
    grade: 9,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // gourd
  '瓢': KanjiReading(
    kanji: '瓢',
    onyomi: ['ひょう'],
    kunyomi: ['ひさご', 'ふくべ'],
    meanings: ['gourd'],
    grade: 9,
    strokes: 17,
    frequencyRank: 99999,
  ),
  // leopard / panther
  '豹': KanjiReading(
    kanji: '豹',
    onyomi: ['ひょう', 'ほう'],
    kunyomi: [],
    meanings: ['leopard', 'panther'],
    grade: 9,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // ax / hatchet
  '斧': KanjiReading(
    kanji: '斧',
    onyomi: ['ふ'],
    kunyomi: ['おの'],
    meanings: ['ax', 'hatchet'],
    grade: 9,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // levy / ode / prose
  '賦': KanjiReading(
    kanji: '賦',
    onyomi: ['ふ', 'ぶ'],
    kunyomi: [],
    meanings: ['levy', 'ode', 'prose'],
    grade: 8,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // wild grape / Portugal
  '葡': KanjiReading(
    kanji: '葡',
    onyomi: ['ぶ', 'ほ'],
    kunyomi: [],
    meanings: ['wild grape', 'Portugal'],
    grade: 9,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // turnip
  '蕪': KanjiReading(
    kanji: '蕪',
    onyomi: ['ぶ', 'む'],
    kunyomi: ['かぶ', 'かぶら', 'あれる'],
    meanings: ['turnip'],
    grade: 9,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // maple
  '楓': KanjiReading(
    kanji: '楓',
    onyomi: ['ふう'],
    kunyomi: ['かえで'],
    meanings: ['maple'],
    grade: 9,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // thatch / cover / shingle
  '葺': KanjiReading(
    kanji: '葺',
    onyomi: ['しゅう'],
    kunyomi: ['あし', 'ふ(く)', 'ふき'],
    meanings: ['thatch', 'cover', 'shingle'],
    grade: 9,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // butterbur / bog rhubarb
  '蕗': KanjiReading(
    kanji: '蕗',
    onyomi: ['ろ', 'る'],
    kunyomi: ['ふき'],
    meanings: ['butterbur', 'bog rhubarb'],
    grade: 9,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // proboscis
  '吻': KanjiReading(
    kanji: '吻',
    onyomi: ['ふん', 'ぶん'],
    kunyomi: ['くちわき', 'くちさき'],
    meanings: ['proboscis'],
    grade: 9,
    strokes: 7,
    frequencyRank: 99999,
  ),
  // burn / kindle / build a fire
  '焚': KanjiReading(
    kanji: '焚',
    onyomi: ['ふん', 'ほん', 'はん'],
    kunyomi: ['た(く)', 'や(く)', 'やきがり'],
    meanings: ['burn', 'kindle', 'build a fire'],
    grade: 9,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // third class / 3rd / 3rd calendar sign
  '丙': KanjiReading(
    kanji: '丙',
    onyomi: ['へい'],
    kunyomi: ['ひのえ'],
    meanings: ['third class', '3rd', '3rd calendar sign'],
    grade: 8,
    strokes: 5,
    frequencyRank: 99999,
  ),
  // cover / shade / mantle
  '蔽': KanjiReading(
    kanji: '蔽',
    onyomi: ['へい', 'へつ', 'ふつ'],
    kunyomi: ['おお(う)', 'おお(い)'],
    meanings: ['cover', 'shade', 'mantle'],
    grade: 8,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // page / 叶
  '頁': KanjiReading(
    kanji: '頁',
    onyomi: ['けつ'],
    kunyomi: ['ぺえじ', 'おおがい', 'かしら'],
    meanings: ['page', '叶'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // glance at
  '瞥': KanjiReading(
    kanji: '瞥',
    onyomi: ['べつ', 'へつ'],
    kunyomi: [],
    meanings: ['glance at'],
    grade: 9,
    strokes: 17,
    frequencyRank: 99999,
  ),
  // bear (children)
  '娩': KanjiReading(
    kanji: '娩',
    onyomi: ['べん'],
    kunyomi: [],
    meanings: ['bear (children)'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // whip / rod / counter for whippings
  '鞭': KanjiReading(
    kanji: '鞭',
    onyomi: ['べん', 'へん'],
    kunyomi: ['むち', 'むちうつ'],
    meanings: ['whip', 'rod', 'counter for whippings'],
    grade: 9,
    strokes: 18,
    frequencyRank: 99999,
  ),
  // garden / 田地
  '圃': KanjiReading(
    kanji: '圃',
    onyomi: ['ほ', 'ふ'],
    kunyomi: ['はたけ', 'にわ'],
    meanings: ['garden', '田地'],
    grade: 9,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // 5th calendar sign
  '戊': KanjiReading(
    kanji: '戊',
    onyomi: ['ぼ', 'ぼう'],
    kunyomi: ['つちのえ'],
    meanings: ['5th calendar sign'],
    grade: 9,
    strokes: 5,
    frequencyRank: 99999,
  ),
  // sagebrush / wormwood / mugwort
  '蓬': KanjiReading(
    kanji: '蓬',
    onyomi: ['ほう', 'ぶ'],
    kunyomi: ['よもぎ'],
    meanings: ['sagebrush', 'wormwood', 'mugwort'],
    grade: 9,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // dagger / sword's point / festival car
  '鋒': KanjiReading(
    kanji: '鋒',
    onyomi: ['ほう'],
    kunyomi: ['きっさき', 'とかり', 'ほこさき'],
    meanings: ['dagger', 'sword\'s point', 'festival car'],
    grade: 9,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // form / appearance / countenance
  '貌': KanjiReading(
    kanji: '貌',
    onyomi: ['ぼう', 'ばく'],
    kunyomi: ['かたち', 'かたどる'],
    meanings: ['form', 'appearance', 'countenance'],
    grade: 8,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // divining / fortune-telling / divination or katakana to radical (no. 25)
  '卜': KanjiReading(
    kanji: '卜',
    onyomi: ['ぼく'],
    kunyomi: ['うらな(う)', 'うらない'],
    meanings: ['divining', 'fortune-telling', 'divination or katakana to radical (no. 25)'],
    grade: 9,
    strokes: 2,
    frequencyRank: 99999,
  ),
  // suddenness / rise
  '勃': KanjiReading(
    kanji: '勃',
    onyomi: ['ぼつ', 'ほつ'],
    kunyomi: ['おこ(る)', 'にわかに'],
    meanings: ['suddenness', 'rise'],
    grade: 8,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // almost / quite / really
  '殆': KanjiReading(
    kanji: '殆',
    onyomi: ['たい', 'さい'],
    kunyomi: ['ほとほと', 'ほとん(ど)', 'あやうい'],
    meanings: ['almost', 'quite', 'really'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // dark / foolish
  '昧': KanjiReading(
    kanji: '昧',
    onyomi: ['まい', 'ばい'],
    kunyomi: ['くら(い)', 'むさぼ(る)'],
    meanings: ['dark', 'foolish'],
    grade: 8,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // mile
  '哩': KanjiReading(
    kanji: '哩',
    onyomi: ['り'],
    kunyomi: ['まいる'],
    meanings: ['mile'],
    grade: 9,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // straight grain / spindle tree / (kokuji)
  '柾': KanjiReading(
    kanji: '柾',
    onyomi: [],
    kunyomi: ['まさ', 'まさめ', 'まさき'],
    meanings: ['straight grain', 'spindle tree', '(kokuji)'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // also / again
  '亦': KanjiReading(
    kanji: '亦',
    onyomi: ['えき', 'やく'],
    kunyomi: ['また'],
    meanings: ['also', 'again'],
    grade: 9,
    strokes: 6,
    frequencyRank: 99999,
  ),
  // splash / suds
  '沫': KanjiReading(
    kanji: '沫',
    onyomi: ['まつ', 'ばつ'],
    kunyomi: ['あわ', 'しぶき', 'つばき'],
    meanings: ['splash', 'suds'],
    grade: 9,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // until / up to / as far as
  '迄': KanjiReading(
    kanji: '迄',
    onyomi: ['きつ'],
    kunyomi: ['まで', 'およ(ぶ)'],
    meanings: ['until', 'up to', 'as far as'],
    grade: 9,
    strokes: 6,
    frequencyRank: 99999,
  ),
  // I / you / (kokuji)
  '麿': KanjiReading(
    kanji: '麿',
    onyomi: [],
    kunyomi: ['まろ'],
    meanings: ['I', 'you', '(kokuji)'],
    grade: 9,
    strokes: 18,
    frequencyRank: 99999,
  ),
  // vine / tendril / influence
  '蔓': KanjiReading(
    kanji: '蔓',
    onyomi: ['まん', 'ばん'],
    kunyomi: ['はびこ(る)', 'つる'],
    meanings: ['vine', 'tendril', 'influence'],
    grade: 9,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // straw raincoat
  '蓑': KanjiReading(
    kanji: '蓑',
    onyomi: ['さ', 'さい'],
    kunyomi: ['みの'],
    meanings: ['straw raincoat'],
    grade: 9,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // type of deciduous tree / grey starling
  '椋': KanjiReading(
    kanji: '椋',
    onyomi: ['りょう'],
    kunyomi: ['むく'],
    meanings: ['type of deciduous tree', 'grey starling'],
    grade: 9,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // niece
  '姪': KanjiReading(
    kanji: '姪',
    onyomi: ['てつ', 'ちつ', 'じち', 'いつ', 'いち'],
    kunyomi: ['めい', 'おい'],
    meanings: ['niece'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // decrease
  '耗': KanjiReading(
    kanji: '耗',
    onyomi: ['もう', 'こう'],
    kunyomi: [],
    meanings: ['decrease'],
    grade: 8,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // not / must not / do not
  '勿': KanjiReading(
    kanji: '勿',
    onyomi: ['もち', 'ぶつ', 'ぼつ'],
    kunyomi: ['なか(れ)', 'なし'],
    meanings: ['not', 'must not', 'do not'],
    grade: 9,
    strokes: 4,
    frequencyRank: 99999,
  ),
  // reasonable / just / natural
  '尤': KanjiReading(
    kanji: '尤',
    onyomi: ['ゆう'],
    kunyomi: ['もっと(も)', 'とが(める)'],
    meanings: ['reasonable', 'just', 'natural'],
    grade: 9,
    strokes: 4,
    frequencyRank: 99999,
  ),
  // unhulled rice / (kokuji)
  '籾': KanjiReading(
    kanji: '籾',
    onyomi: [],
    kunyomi: ['もみ'],
    meanings: ['unhulled rice', '(kokuji)'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // monme / 3.75 grams / (kokuji)
  '匁': KanjiReading(
    kanji: '匁',
    onyomi: [],
    kunyomi: ['もんめ', 'め'],
    meanings: ['monme', '3.75 grams', '(kokuji)'],
    grade: 9,
    strokes: 4,
    frequencyRank: 99999,
  ),
  // melting / smelting
  '冶': KanjiReading(
    kanji: '冶',
    onyomi: ['や'],
    kunyomi: ['い(る)'],
    meanings: ['melting', 'smelting'],
    grade: 8,
    strokes: 7,
    frequencyRank: 99999,
  ),
  // question mark
  '耶': KanjiReading(
    kanji: '耶',
    onyomi: ['や', 'じゃ'],
    kunyomi: ['か'],
    meanings: ['question mark'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // soothe / calm / pacify
  '宥': KanjiReading(
    kanji: '宥',
    onyomi: ['ゆう'],
    kunyomi: ['なだ(める)', 'ゆる(す)'],
    meanings: ['soothe', 'calm', 'pacify'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // palanquin / bier / public opinion
  '輿': KanjiReading(
    kanji: '輿',
    onyomi: ['よ'],
    kunyomi: ['かご', 'こし'],
    meanings: ['palanquin', 'bier', 'public opinion'],
    grade: 9,
    strokes: 17,
    frequencyRank: 99999,
  ),
  // employ / hire
  '傭': KanjiReading(
    kanji: '傭',
    onyomi: ['よう', 'ちょう'],
    kunyomi: ['やと(う)', 'あた(い)', 'ひと(しい)'],
    meanings: ['employ', 'hire'],
    grade: 9,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // lotus
  '蓉': KanjiReading(
    kanji: '蓉',
    onyomi: ['よう'],
    kunyomi: [],
    meanings: ['lotus'],
    grade: 9,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // fertility
  '沃': KanjiReading(
    kanji: '沃',
    onyomi: ['よう', 'よく', 'おく'],
    kunyomi: ['そそ(ぐ)'],
    meanings: ['fertility'],
    grade: 8,
    strokes: 7,
    frequencyRank: 99999,
  ),
  // small, edible, helical fresh-water mollusk
  '螺': KanjiReading(
    kanji: '螺',
    onyomi: ['ら'],
    kunyomi: ['にし', 'にな'],
    meanings: ['small, edible, helical fresh-water mollusk'],
    grade: 9,
    strokes: 17,
    frequencyRank: 99999,
  ),
  // excessive / overflow / spread out
  '濫': KanjiReading(
    kanji: '濫',
    onyomi: ['らん'],
    kunyomi: ['みだ(りに)', 'みだ(りがましい)'],
    meanings: ['excessive', 'overflow', 'spread out'],
    grade: 8,
    strokes: 18,
    frequencyRank: 99999,
  ),
  // officer / an official
  '吏': KanjiReading(
    kanji: '吏',
    onyomi: ['り'],
    kunyomi: [],
    meanings: ['officer', 'an official'],
    grade: 8,
    strokes: 6,
    frequencyRank: 99999,
  ),
  // glassy / lapis lazuli
  '璃': KanjiReading(
    kanji: '璃',
    onyomi: ['り'],
    kunyomi: [],
    meanings: ['glassy', 'lapis lazuli'],
    grade: 8,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // reverse / 内 / palm
  '裡': KanjiReading(
    kanji: '裡',
    onyomi: ['り'],
    kunyomi: ['うち', 'うら'],
    meanings: ['reverse', '内', 'palm'],
    grade: 9,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // pillage / rob / graze
  '掠': KanjiReading(
    kanji: '掠',
    onyomi: ['りゃく', 'りょう'],
    kunyomi: ['かす(める)', 'かす(る)', 'かす(れる)'],
    meanings: ['pillage', 'rob', 'graze'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // companion / follower
  '侶': KanjiReading(
    kanji: '侶',
    onyomi: ['りょ', 'ろ'],
    kunyomi: ['とも'],
    meanings: ['companion', 'follower'],
    grade: 8,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // clear
  '瞭': KanjiReading(
    kanji: '瞭',
    onyomi: ['りょう'],
    kunyomi: ['あきらか'],
    meanings: ['clear'],
    grade: 8,
    strokes: 17,
    frequencyRank: 99999,
  ),
  // fact / reality / understand
  '諒': KanjiReading(
    kanji: '諒',
    onyomi: ['りょう'],
    kunyomi: ['あきら(か)', 'まことに'],
    meanings: ['fact', 'reality', 'understand'],
    grade: 9,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // lonely / deserted
  '淋': KanjiReading(
    kanji: '淋',
    onyomi: ['りん'],
    kunyomi: ['さび(しい)', 'さみ(しい)'],
    meanings: ['lonely', 'deserted'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // jewel / tinkling of jewelry
  '琳': KanjiReading(
    kanji: '琳',
    onyomi: ['りん'],
    kunyomi: [],
    meanings: ['jewel', 'tinkling of jewelry'],
    grade: 9,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // Chinese unicorn / genius / giraffe
  '麟': KanjiReading(
    kanji: '麟',
    onyomi: ['りん'],
    kunyomi: [],
    meanings: ['Chinese unicorn', 'genius', 'giraffe'],
    grade: 9,
    strokes: 24,
    frequencyRank: 99999,
  ),
  // actor
  '伶': KanjiReading(
    kanji: '伶',
    onyomi: ['れい', 'りょう'],
    kunyomi: ['わざおぎ'],
    meanings: ['actor'],
    grade: 9,
    strokes: 7,
    frequencyRank: 99999,
  ),
  // pity / have mercy / sympathise
  '憐': KanjiReading(
    kanji: '憐',
    onyomi: ['れん'],
    kunyomi: ['あわ(れむ)', 'あわ(れ)'],
    meanings: ['pity', 'have mercy', 'sympathise'],
    grade: 9,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // ripples
  '漣': KanjiReading(
    kanji: '漣',
    onyomi: ['れん', 'らん'],
    kunyomi: ['さざなみ'],
    meanings: ['ripples'],
    grade: 9,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // refine metals / kneading over fire
  '煉': KanjiReading(
    kanji: '煉',
    onyomi: ['れん'],
    kunyomi: ['ね(る)'],
    meanings: ['refine metals', 'kneading over fire'],
    grade: 9,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // bamboo screen / rattan blind
  '簾': KanjiReading(
    kanji: '簾',
    onyomi: ['れん'],
    kunyomi: ['すだれ', 'す'],
    meanings: ['bamboo screen', 'rattan blind'],
    grade: 9,
    strokes: 19,
    frequencyRank: 99999,
  ),
  // oar / tower
  '櫓': KanjiReading(
    kanji: '櫓',
    onyomi: ['ろ'],
    kunyomi: ['やぐら', 'おおだて'],
    meanings: ['oar', 'tower'],
    grade: 9,
    strokes: 19,
    frequencyRank: 99999,
  ),
  // bribe
  '賂': KanjiReading(
    kanji: '賂',
    onyomi: ['ろ'],
    kunyomi: ['まいな(い)', 'まいな(う)'],
    meanings: ['bribe'],
    grade: 8,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // play with / tamper / trifle with
  '弄': KanjiReading(
    kanji: '弄',
    onyomi: ['ろう', 'る'],
    kunyomi: ['いじく(る)', 'ろう(する)', 'いじ(る)', 'ひねく(る)', 'たわむ(れる)', 'もてあそ(ぶ)'],
    meanings: ['play with', 'tamper', 'trifle with'],
    grade: 8,
    strokes: 7,
    frequencyRank: 99999,
  ),
  // rib
  '肋': KanjiReading(
    kanji: '肋',
    onyomi: ['ろく'],
    kunyomi: ['あばら'],
    meanings: ['rib'],
    grade: 9,
    strokes: 6,
    frequencyRank: 99999,
  ),
  // range / reach / extend
  '亙': KanjiReading(
    kanji: '亙',
    onyomi: ['こう', 'かん'],
    kunyomi: ['わた(る)', 'もと(める)'],
    meanings: ['range', 'reach', 'extend'],
    grade: 9,
    strokes: 6,
    frequencyRank: 99999,
  ),
  // wooden or lacquered bowl
  '椀': KanjiReading(
    kanji: '椀',
    onyomi: ['わん'],
    kunyomi: ['はち'],
    meanings: ['wooden or lacquered bowl'],
    grade: 9,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // porcelain bowl / tea cup
  '碗': KanjiReading(
    kanji: '碗',
    onyomi: ['わん'],
    kunyomi: ['こばち'],
    meanings: ['porcelain bowl', 'tea cup'],
    grade: 9,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // 力量 / multiplication / record
  '乘': KanjiReading(
    kanji: '乘',
    onyomi: ['じょう'],
    kunyomi: ['の(る)', 'の(せる)'],
    meanings: ['力量', 'multiplication', 'record'],
    grade: 10,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // rank / follow
  '亞': KanjiReading(
    kanji: '亞',
    onyomi: ['あ'],
    kunyomi: ['つ(ぐ)'],
    meanings: ['rank', 'follow'],
    grade: 10,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // France
  '佛': KanjiReading(
    kanji: '佛',
    onyomi: ['ぶつ', 'ふつ'],
    kunyomi: ['ほとけ'],
    meanings: ['France'],
    grade: 10,
    strokes: 7,
    frequencyRank: 99999,
  ),
  // urge to eat
  '侑': KanjiReading(
    kanji: '侑',
    onyomi: ['ゆう', 'う'],
    kunyomi: ['すす(める)', 'たす(ける)'],
    meanings: ['urge to eat'],
    grade: 9,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // 来 / due / next
  '來': KanjiReading(
    kanji: '來',
    onyomi: ['らい', 'たい'],
    kunyomi: ['く(る)', 'きた(る)', 'きた(す)', 'き(たす)', 'き(たる)'],
    meanings: ['来', 'due', 'next'],
    grade: 10,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // clever
  '俐': KanjiReading(
    kanji: '俐',
    onyomi: ['り'],
    kunyomi: ['かしこ(い)'],
    meanings: ['clever'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // be proud
  '傲': KanjiReading(
    kanji: '傲',
    onyomi: ['ごう'],
    kunyomi: ['おご(る)', 'あなど(る)'],
    meanings: ['be proud'],
    grade: 8,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // summon / propagate / transmit
  '傳': KanjiReading(
    kanji: '傳',
    onyomi: ['てん', 'でん'],
    kunyomi: ['つた(わる)', 'つた(える)', 'つた(う)', 'つて'],
    meanings: ['summon', 'propagate', 'transmit'],
    grade: 10,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // 谎言 / falsehood / deceive
  '僞': KanjiReading(
    kanji: '僞',
    onyomi: ['ぎ', 'か'],
    kunyomi: ['いつわ(る)', 'いつわ(り)', 'にせ'],
    meanings: ['谎言', 'falsehood', 'deceive'],
    grade: 10,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // price / value
  '價': KanjiReading(
    kanji: '價',
    onyomi: ['か', 'け'],
    kunyomi: ['あたい'],
    meanings: ['price', 'value'],
    grade: 10,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // economy / thrifty
  '儉': KanjiReading(
    kanji: '儉',
    onyomi: ['けん'],
    kunyomi: ['つま(しい)', 'つづまやか'],
    meanings: ['economy', 'thrifty'],
    grade: 10,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // 孩子 / young of animals
  '兒': KanjiReading(
    kanji: '兒',
    onyomi: ['じ', 'に', 'げい'],
    kunyomi: ['こ'],
    meanings: ['孩子', 'young of animals'],
    grade: 10,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // nice and cool
  '凉': KanjiReading(
    kanji: '凉',
    onyomi: ['りょう'],
    kunyomi: ['すず(しい)', 'すず(む)', 'すず(やか)', 'うす(い)', 'ひや(す)', 'まことに'],
    meanings: ['nice and cool'],
    grade: 10,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // 冷 / strict / severe
  '凛': KanjiReading(
    kanji: '凛',
    onyomi: ['りん'],
    kunyomi: ['きびし(い)'],
    meanings: ['冷', 'strict', 'severe'],
    grade: 9,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // female phoenix bird
  '凰': KanjiReading(
    kanji: '凰',
    onyomi: ['こう', 'おう'],
    kunyomi: ['おおとり'],
    meanings: ['female phoenix bird'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // temple
  '刹': KanjiReading(
    kanji: '刹',
    onyomi: ['せち', 'せつ', 'さつ'],
    kunyomi: [],
    meanings: ['temple'],
    grade: 8,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // leftovers / residue / remains
  '剩': KanjiReading(
    kanji: '剩',
    onyomi: ['じょう'],
    kunyomi: ['あまつさえ', 'あま(り)', 'あま(る)'],
    meanings: ['leftovers', 'residue', 'remains'],
    grade: 10,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // sword
  '劍': KanjiReading(
    kanji: '劍',
    onyomi: ['けん'],
    kunyomi: ['つるぎ'],
    meanings: ['sword'],
    grade: 10,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // 强
  '勁': KanjiReading(
    kanji: '勁',
    onyomi: ['けい'],
    kunyomi: ['つよ(い)'],
    meanings: ['强'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // meritorious deed / merits / rank
  '勳': KanjiReading(
    kanji: '勳',
    onyomi: ['くん'],
    kunyomi: ['いさお'],
    meanings: ['meritorious deed', 'merits', 'rank'],
    grade: 10,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // volume / 书 / part
  '卷': KanjiReading(
    kanji: '卷',
    onyomi: ['かん', 'けん'],
    kunyomi: ['ま(く)', 'まき'],
    meanings: ['volume', '书', 'part'],
    grade: 10,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // 一 / single / simple
  '單': KanjiReading(
    kanji: '單',
    onyomi: ['たん'],
    kunyomi: ['ひとえ'],
    meanings: ['一', 'single', 'simple'],
    grade: 10,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // metaphor / 比较
  '喩': KanjiReading(
    kanji: '喩',
    onyomi: ['ゆ'],
    kunyomi: ['たと(える)', 'さと(す)'],
    meanings: ['metaphor', '比较'],
    grade: 8,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // ridicule / insult
  '嘲': KanjiReading(
    kanji: '嘲',
    onyomi: ['ちょう', 'とう'],
    kunyomi: ['あざけ(る)'],
    meanings: ['ridicule', 'insult'],
    grade: 8,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // strictness / severity / rigidity
  '嚴': KanjiReading(
    kanji: '嚴',
    onyomi: ['げん', 'ごん'],
    kunyomi: ['おごそ(か)', 'きび(しい)', 'いか(めしい)', 'いつくし'],
    meanings: ['strictness', 'severity', 'rigidity'],
    grade: 10,
    strokes: 20,
    frequencyRank: 99999,
  ),
  // sphere / circle / radius
  '圈': KanjiReading(
    kanji: '圈',
    onyomi: ['けん'],
    kunyomi: ['かこ(い)'],
    meanings: ['sphere', 'circle', 'radius'],
    grade: 10,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // 国家
  '國': KanjiReading(
    kanji: '國',
    onyomi: ['こく'],
    kunyomi: ['くに'],
    meanings: ['国家'],
    grade: 10,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // yen / circle / round
  '圓': KanjiReading(
    kanji: '圓',
    onyomi: ['えん'],
    kunyomi: ['まる(い)', 'まる', 'まど', 'まど(か)', 'まろ(やか)'],
    meanings: ['yen', 'circle', 'round'],
    grade: 10,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // association
  '團': KanjiReading(
    kanji: '團',
    onyomi: ['だん', 'とん'],
    kunyomi: ['かたまり', 'まる(い)'],
    meanings: ['association'],
    grade: 10,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // 打破 / 破坏 / censure
  '毀': KanjiReading(
    kanji: '毀',
    onyomi: ['き'],
    kunyomi: ['こぼ(つ)', 'こわ(す)', 'こぼ(れる)', 'こわ(れる)', 'そし(る)', 'やぶ(る)'],
    meanings: ['打破', '破坏', 'censure'],
    grade: 8,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // demolition / 打破 / 破坏
  '壞': KanjiReading(
    kanji: '壞',
    onyomi: ['かい', 'え'],
    kunyomi: ['こわ(す)', 'こわ(れる)', 'やぶ(る)'],
    meanings: ['demolition', '打破', '破坏'],
    grade: 10,
    strokes: 19,
    frequencyRank: 99999,
  ),
  // fort / rampart / walls
  '壘': KanjiReading(
    kanji: '壘',
    onyomi: ['るい', 'らい', 'すい'],
    kunyomi: ['とりで'],
    meanings: ['fort', 'rampart', 'walls'],
    grade: 10,
    strokes: 18,
    frequencyRank: 99999,
  ),
  // 大 / large / robust
  '壯': KanjiReading(
    kanji: '壯',
    onyomi: ['そう'],
    kunyomi: ['さかん'],
    meanings: ['大', 'large', 'robust'],
    grade: 10,
    strokes: 7,
    frequencyRank: 99999,
  ),
  // longevity / congratulations
  '壽': KanjiReading(
    kanji: '壽',
    onyomi: ['じゅ', 'す', 'しゅう'],
    kunyomi: ['ことぶき', 'ことぶ(く)', 'ことほ(ぐ)'],
    meanings: ['longevity', 'congratulations'],
    grade: 10,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // star / god of literature
  '奎': KanjiReading(
    kanji: '奎',
    onyomi: ['けい', 'き'],
    kunyomi: [],
    meanings: ['star', 'god of literature'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // 心 / interior
  '奧': KanjiReading(
    kanji: '奧',
    onyomi: ['おう', 'おく'],
    kunyomi: ['おく(まる)', 'くま'],
    meanings: ['心', 'interior'],
    grade: 10,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // prize / reward / give award to
  '奬': KanjiReading(
    kanji: '奬',
    onyomi: ['しょう', 'そう'],
    kunyomi: ['すす(める)'],
    meanings: ['prize', 'reward', 'give award to'],
    grade: 10,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // girl / Miss / daughter
  '孃': KanjiReading(
    kanji: '孃',
    onyomi: ['じょう'],
    kunyomi: ['むすめ'],
    meanings: ['girl', 'Miss', 'daughter'],
    grade: 10,
    strokes: 20,
    frequencyRank: 99999,
  ),
  // 真理 / reality
  '實': KanjiReading(
    kanji: '實',
    onyomi: ['じつ', 'しつ'],
    kunyomi: ['み', 'みの(る)', 'まこと(に)', 'みの(り)', 'みち(る)'],
    meanings: ['真理', 'reality'],
    grade: 10,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // 睡 / 休息 / bed chamber
  '寢': KanjiReading(
    kanji: '寢',
    onyomi: ['しん'],
    kunyomi: ['ね(る)', 'ね(かす)', 'い(ぬ)', 'みたまや', 'や(める)'],
    meanings: ['睡', '休息', 'bed chamber'],
    grade: 10,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // commander / general / admiral
  '將': KanjiReading(
    kanji: '將',
    onyomi: ['しょう', 'そう'],
    kunyomi: ['まさ(に)', 'はた', 'ひきい(る)', 'もって'],
    meanings: ['commander', 'general', 'admiral'],
    grade: 10,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // specialty / exclusive / mainly
  '專': KanjiReading(
    kanji: '專',
    onyomi: ['せん'],
    kunyomi: ['もっぱ(ら)'],
    meanings: ['specialty', 'exclusive', 'mainly'],
    grade: 10,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // gorge / strait / ravine
  '峽': KanjiReading(
    kanji: '峽',
    onyomi: ['きょう', 'こう'],
    kunyomi: ['はざま'],
    meanings: ['gorge', 'strait', 'ravine'],
    grade: 10,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // mountains towering in a row
  '崚': KanjiReading(
    kanji: '崚',
    onyomi: ['りょう'],
    kunyomi: [],
    meanings: ['mountains towering in a row'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // rock / crag / boulder
  '巖': KanjiReading(
    kanji: '巖',
    onyomi: ['がん'],
    kunyomi: ['いわ', 'いわお', 'けわ(しい)'],
    meanings: ['rock', 'crag', 'boulder'],
    grade: 9,
    strokes: 23,
    frequencyRank: 99999,
  ),
  // sorcerer / medium / shrine maiden
  '巫': KanjiReading(
    kanji: '巫',
    onyomi: ['ふ'],
    kunyomi: ['みこ', 'かんなぎ'],
    meanings: ['sorcerer', 'medium', 'shrine maiden'],
    grade: 9,
    strokes: 7,
    frequencyRank: 99999,
  ),
  // belt / girdle / band
  '帶': KanjiReading(
    kanji: '帶',
    onyomi: ['たい'],
    kunyomi: ['お(びる)', 'おび'],
    meanings: ['belt', 'girdle', 'band'],
    grade: 10,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // hall / central room
  '廳': KanjiReading(
    kanji: '廳',
    onyomi: ['ちょう', 'てい'],
    kunyomi: ['やくしょ'],
    meanings: ['hall', 'central room'],
    grade: 10,
    strokes: 25,
    frequencyRank: 99999,
  ),
  // bullet / twang / flip
  '彈': KanjiReading(
    kanji: '彈',
    onyomi: ['だん', 'たん'],
    kunyomi: ['ひ(く)', 'はず(む)', 'たま', 'はじ(く)', 'はじ(ける)', 'ただ(す)'],
    meanings: ['bullet', 'twang', 'flip'],
    grade: 10,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // extensive / full / fill
  '彌': KanjiReading(
    kanji: '彌',
    onyomi: ['み', 'び'],
    kunyomi: ['いや', 'や', 'あまねし', 'いよいよ', 'とおい', 'ひさし', 'ひさ(しい)', 'わた(る)'],
    meanings: ['extensive', 'full', 'fill'],
    grade: 10,
    strokes: 17,
    frequencyRank: 99999,
  ),
  // same kind / collect / classify
  '彙': KanjiReading(
    kanji: '彙',
    onyomi: ['い'],
    kunyomi: ['はりねずみ'],
    meanings: ['same kind', 'collect', 'classify'],
    grade: 8,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // from / by / since
  '從': KanjiReading(
    kanji: '從',
    onyomi: ['じゅう', 'しょう', 'じゅ'],
    kunyomi: ['したが(う)', 'したが(える)', 'より'],
    meanings: ['from', 'by', 'since'],
    grade: 10,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // induce / encourage to come
  '徠': KanjiReading(
    kanji: '徠',
    onyomi: ['らい'],
    kunyomi: ['きた(す)', 'きた(る)', 'く(る)'],
    meanings: ['induce', 'encourage to come'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // constant / regular / persistent
  '恆': KanjiReading(
    kanji: '恆',
    onyomi: ['こう'],
    kunyomi: ['つね(に)'],
    meanings: ['constant', 'regular', 'persistent'],
    grade: 10,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // 坏 / evil
  '惡': KanjiReading(
    kanji: '惡',
    onyomi: ['あく', 'お'],
    kunyomi: ['わる(い)', 'あ(し)', 'にく(い)', 'ああ', 'いずくに', 'いずくんぞ', 'にく(む)'],
    meanings: ['坏', 'evil'],
    grade: 10,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // blessing / grace / favor
  '惠': KanjiReading(
    kanji: '惠',
    onyomi: ['けい', 'え'],
    kunyomi: ['めぐ(む)', 'めぐ(み)'],
    meanings: ['blessing', 'grace', 'favor'],
    grade: 10,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // realize
  '惺': KanjiReading(
    kanji: '惺',
    onyomi: ['せい'],
    kunyomi: ['さと(る)'],
    meanings: ['realize'],
    grade: 9,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // care / chastity
  '愼': KanjiReading(
    kanji: '愼',
    onyomi: ['しん'],
    kunyomi: ['つつし(む)', 'つつし(み)'],
    meanings: ['care', 'chastity'],
    grade: 10,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // fear
  '慄': KanjiReading(
    kanji: '慄',
    onyomi: ['りつ'],
    kunyomi: ['ふる(える)', 'おそ(れる)', 'おのの(く)'],
    meanings: ['fear'],
    grade: 8,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // yearn for / aspire to / admire
  '憬': KanjiReading(
    kanji: '憬',
    onyomi: ['けい'],
    kunyomi: ['あこが(れる)'],
    meanings: ['yearn for', 'aspire to', 'admire'],
    grade: 8,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // answer / yes / OK
  '應': KanjiReading(
    kanji: '應',
    onyomi: ['おう', 'よう'],
    kunyomi: ['あた(る)', 'まさに', 'こた(える)'],
    meanings: ['answer', 'yes', 'OK'],
    grade: 10,
    strokes: 17,
    frequencyRank: 99999,
  ),
  // pocket / feelings / 心
  '懷': KanjiReading(
    kanji: '懷',
    onyomi: ['かい', 'え'],
    kunyomi: ['ふところ', 'なつ(かしい)', 'なつ(かしむ)', 'なつ(く)', 'なつ(ける)', 'いだ(く)', 'おも(う)'],
    meanings: ['pocket', 'feelings', '心'],
    grade: 10,
    strokes: 19,
    frequencyRank: 99999,
  ),
  // 战争 / fighting / battle
  '戰': KanjiReading(
    kanji: '戰',
    onyomi: ['せん'],
    kunyomi: ['いくさ', 'たたか(う)', 'おのの(く)', 'そよぐ'],
    meanings: ['战争', 'fighting', 'battle'],
    grade: 10,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // 玩 / frolic / sport
  '戲': KanjiReading(
    kanji: '戲',
    onyomi: ['ぎ', 'げ'],
    kunyomi: ['たわむ(れる)', 'たわむ(れ)'],
    meanings: ['玩', 'frolic', 'sport'],
    grade: 10,
    strokes: 17,
    frequencyRank: 99999,
  ),
  // extract / pull out / pilfer
  '拔': KanjiReading(
    kanji: '拔',
    onyomi: ['ばつ', 'はい'],
    kunyomi: ['ぬ(く)', 'ぬ(ける)', 'ぬ(かす)', 'ぬ(かる)'],
    meanings: ['extract', 'pull out', 'pilfer'],
    grade: 10,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // worship / adore / pray to
  '拜': KanjiReading(
    kanji: '拜',
    onyomi: ['はい'],
    kunyomi: ['おが(む)', 'おろが(む)'],
    meanings: ['worship', 'adore', 'pray to'],
    grade: 10,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // clear out / sweep away
  '拂': KanjiReading(
    kanji: '拂',
    onyomi: ['ひつ', 'ふつ', 'ほつ'],
    kunyomi: ['はら(う)'],
    meanings: ['clear out', 'sweep away'],
    grade: 10,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // Latin / kidnap / crush
  '拉': KanjiReading(
    kanji: '拉',
    onyomi: ['らつ', 'ら', 'ろう'],
    kunyomi: ['らっ(する)', 'ひし(ぐ)', 'くだ(く)'],
    meanings: ['Latin', 'kidnap', 'crush'],
    grade: 8,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // wag / swing / wave
  '搖': KanjiReading(
    kanji: '搖',
    onyomi: ['よう'],
    kunyomi: ['ゆ(れる)', 'ゆ(らぐ)', 'ゆ(るぐ)', 'ゆ(する)', 'ゆ(さぶる)', 'ゆ(すぶる)', 'うご(く)'],
    meanings: ['wag', 'swing', 'wave'],
    grade: 10,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // surrogate / act in addition to
  '攝': KanjiReading(
    kanji: '攝',
    onyomi: ['せつ', 'しょう'],
    kunyomi: ['おさ(める)', 'かね(る)', 'と(る)'],
    meanings: ['surrogate', 'act in addition to'],
    grade: 10,
    strokes: 21,
    frequencyRank: 99999,
  ),
  // income
  '收': KanjiReading(
    kanji: '收',
    onyomi: ['しゅう'],
    kunyomi: ['おさ(める)', 'おさ(まる)'],
    meanings: ['income'],
    grade: 10,
    strokes: 6,
    frequencyRank: 99999,
  ),
  // express / state / relate
  '敍': KanjiReading(
    kanji: '敍',
    onyomi: ['じょ'],
    kunyomi: ['つい(ず)', 'ついで'],
    meanings: ['express', 'state', 'relate'],
    grade: 10,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // 天 / 大
  '昊': KanjiReading(
    kanji: '昊',
    onyomi: ['こう'],
    kunyomi: ['そら'],
    meanings: ['天', '大'],
    grade: 9,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // the Pleiades
  '昴': KanjiReading(
    kanji: '昴',
    onyomi: ['こう', 'ぼう'],
    kunyomi: ['すばる'],
    meanings: ['the Pleiades'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // 晚 / quiet / sets (sun)
  '晏': KanjiReading(
    kanji: '晏',
    onyomi: ['あん'],
    kunyomi: ['おそ(い)'],
    meanings: ['晚', 'quiet', 'sets (sun)'],
    grade: 9,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // clear
  '晄': KanjiReading(
    kanji: '晄',
    onyomi: ['こう'],
    kunyomi: ['あきらか'],
    meanings: ['clear'],
    grade: 9,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // daytime / daylight
  '晝': KanjiReading(
    kanji: '晝',
    onyomi: ['ちゅう'],
    kunyomi: ['ひる'],
    meanings: ['daytime', 'daylight'],
    grade: 10,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // 早晨 / 早
  '晨': KanjiReading(
    kanji: '晨',
    onyomi: ['しん'],
    kunyomi: ['あした', 'とき', 'あさ'],
    meanings: ['早晨', '早'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // clear
  '晟': KanjiReading(
    kanji: '晟',
    onyomi: ['せい', 'じょう'],
    kunyomi: ['あきらか'],
    meanings: ['clear'],
    grade: 9,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // dawn / daybreak / clear
  '曉': KanjiReading(
    kanji: '曉',
    onyomi: ['きょう', 'ぎょう'],
    kunyomi: ['あかつき', 'さと(る)'],
    meanings: ['dawn', 'daybreak', 'clear'],
    grade: 10,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // dark / not clear
  '曖': KanjiReading(
    kanji: '曖',
    onyomi: ['あい'],
    kunyomi: ['くら(い)'],
    meanings: ['dark', 'not clear'],
    grade: 8,
    strokes: 17,
    frequencyRank: 99999,
  ),
  // bookmark / guidebook
  '栞': KanjiReading(
    kanji: '栞',
    onyomi: ['かん'],
    kunyomi: ['しおり'],
    meanings: ['bookmark', 'guidebook'],
    grade: 9,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // article / counter for articles, clauses, paragraphs, etc. / twig
  '條': KanjiReading(
    kanji: '條',
    onyomi: ['じょう', 'ちょう', 'でき'],
    kunyomi: ['えだ', 'すじ'],
    meanings: ['article', 'counter for articles, clauses, paragraphs, etc.', 'twig'],
    grade: 10,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // type of tall evergreen tree
  '梛': KanjiReading(
    kanji: '梛',
    onyomi: ['だ', 'な'],
    kunyomi: ['なぎ'],
    meanings: ['type of tall evergreen tree'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // square character style / correctness
  '楷': KanjiReading(
    kanji: '楷',
    onyomi: ['かい'],
    kunyomi: [],
    meanings: ['square character style', 'correctness'],
    grade: 8,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // coconut tree
  '椰': KanjiReading(
    kanji: '椰',
    onyomi: ['や'],
    kunyomi: ['やし'],
    meanings: ['coconut tree'],
    grade: 9,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // flourish / prosperity / honour
  '榮': KanjiReading(
    kanji: '榮',
    onyomi: ['えい', 'よう'],
    kunyomi: ['さか(える)', 'は(える)', 'え'],
    meanings: ['flourish', 'prosperity', 'honour'],
    grade: 10,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // 音乐 / comfort
  '樂': KanjiReading(
    kanji: '樂',
    onyomi: ['がく', 'らく', 'ごう'],
    kunyomi: ['たの(しい)', 'たの(しむ)', 'この(む)'],
    meanings: ['音乐', 'comfort'],
    grade: 10,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // Esq. / 道路 / manner
  '樣': KanjiReading(
    kanji: '樣',
    onyomi: ['よう', 'しょう'],
    kunyomi: ['さま'],
    meanings: ['Esq.', '道路', 'manner'],
    grade: 10,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // bitter orange
  '橙': KanjiReading(
    kanji: '橙',
    onyomi: ['とう'],
    kunyomi: ['だいだい'],
    meanings: ['bitter orange'],
    grade: 9,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // check / examine
  '檢': KanjiReading(
    kanji: '檢',
    onyomi: ['けん'],
    kunyomi: ['しら(べる)'],
    meanings: ['check', 'examine'],
    grade: 10,
    strokes: 17,
    frequencyRank: 99999,
  ),
  // oar / scull / paddle
  '櫂': KanjiReading(
    kanji: '櫂',
    onyomi: ['とう', 'たく'],
    kunyomi: ['かい', 'かじ'],
    meanings: ['oar', 'scull', 'paddle'],
    grade: 9,
    strokes: 18,
    frequencyRank: 99999,
  ),
  // cherry
  '櫻': KanjiReading(
    kanji: '櫻',
    onyomi: ['おう', 'よう'],
    kunyomi: ['さくら'],
    meanings: ['cherry'],
    grade: 10,
    strokes: 21,
    frequencyRank: 99999,
  ),
  // gloom / depression / melancholy
  '鬱': KanjiReading(
    kanji: '鬱',
    onyomi: ['うつ'],
    kunyomi: ['うっ(する)', 'ふさ(ぐ)', 'しげ(る)'],
    meanings: ['gloom', 'depression', 'melancholy'],
    grade: 8,
    strokes: 29,
    frequencyRank: 99999,
  ),
  // thief / to steal
  '盜': KanjiReading(
    kanji: '盜',
    onyomi: ['とう'],
    kunyomi: ['ぬす(む)'],
    meanings: ['thief', 'to steal'],
    grade: 10,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // spirit / 心 / air
  '氣': KanjiReading(
    kanji: '氣',
    onyomi: ['き', 'け'],
    kunyomi: ['いき'],
    meanings: ['spirit', '心', 'air'],
    grade: 10,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // alike / 真理
  '洵': KanjiReading(
    kanji: '洵',
    onyomi: ['じゅん', 'しゅん'],
    kunyomi: ['の(ぶ)', 'まこと(に)'],
    meanings: ['alike', '真理'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // pure / 干净 / unspoiled
  '淨': KanjiReading(
    kanji: '淨',
    onyomi: ['じょう', 'せい'],
    kunyomi: ['きよ(める)', 'きよ(い)'],
    meanings: ['pure', '干净', 'unspoiled'],
    grade: 10,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // 全部 / turbidity
  '渾': KanjiReading(
    kanji: '渾',
    onyomi: ['こん'],
    kunyomi: ['すべ(て)', 'にご(る)'],
    meanings: ['全部', 'turbidity'],
    grade: 9,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // deep and broad (water)
  '滉': KanjiReading(
    kanji: '滉',
    onyomi: ['こう'],
    kunyomi: ['ひろ(い)'],
    meanings: ['deep and broad (water)'],
    grade: 9,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // block up / obstruct / stagnant
  '滯': KanjiReading(
    kanji: '滯',
    onyomi: ['たい', 'てい'],
    kunyomi: ['とどこお(る)'],
    meanings: ['block up', 'obstruct', 'stagnant'],
    grade: 10,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // astringent / harsh / uneven
  '澁': KanjiReading(
    kanji: '澁',
    onyomi: ['じゅう', 'しゅう'],
    kunyomi: ['しぶ', 'しぶ(い)', 'しぶ(る)'],
    meanings: ['astringent', 'harsh', 'uneven'],
    grade: 10,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // water route / shipping channel
  '澪': KanjiReading(
    kanji: '澪',
    onyomi: ['れい'],
    kunyomi: ['みお'],
    meanings: ['water route', 'shipping channel'],
    grade: 9,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // wet / moist / humid
  '濕': KanjiReading(
    kanji: '濕',
    onyomi: ['しつ', 'しゅう'],
    kunyomi: ['しめ(る)', 'しめ(す)', 'うるお(う)', 'うるお(す)'],
    meanings: ['wet', 'moist', 'humid'],
    grade: 10,
    strokes: 17,
    frequencyRank: 99999,
  ),
  // glitter / gleam / twinkle
  '煌': KanjiReading(
    kanji: '煌',
    onyomi: ['こう'],
    kunyomi: ['きらめ(く)', 'きら(めく)', 'かがや(く)'],
    meanings: ['glitter', 'gleam', 'twinkle'],
    grade: 9,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // burn / bake / heat
  '燒': KanjiReading(
    kanji: '燒',
    onyomi: ['しょう'],
    kunyomi: ['や(く)', 'や(ける)'],
    meanings: ['burn', 'bake', 'heat'],
    grade: 10,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // burn / bonfire
  '燎': KanjiReading(
    kanji: '燎',
    onyomi: ['りょう'],
    kunyomi: ['かがりび'],
    meanings: ['burn', 'bonfire'],
    grade: 9,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // shine
  '燿': KanjiReading(
    kanji: '燿',
    onyomi: ['よう'],
    kunyomi: ['かがや(く)', 'ひかり'],
    meanings: ['shine'],
    grade: 9,
    strokes: 18,
    frequencyRank: 99999,
  ),
  // to dispute / 战斗 / contend
  '爭': KanjiReading(
    kanji: '爭',
    onyomi: ['そう'],
    kunyomi: ['あらそ(う)', 'いか(でか)'],
    meanings: ['to dispute', '战斗', 'contend'],
    grade: 10,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // 改变 / be of use / reach to
  '爲': KanjiReading(
    kanji: '爲',
    onyomi: ['い'],
    kunyomi: ['ため', 'な(る)', 'な(す)', 'す(る)', 'たり', 'つく(る)', 'なり'],
    meanings: ['改变', 'be of use', 'reach to'],
    grade: 10,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // 窄 / contract / reduce
  '狹': KanjiReading(
    kanji: '狹',
    onyomi: ['きょう', 'こう'],
    kunyomi: ['せま(い)', 'せば(める)', 'せば(まる)', 'さ'],
    meanings: ['窄', 'contract', 'reduce'],
    grade: 10,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // silent / quiet / still
  '默': KanjiReading(
    kanji: '默',
    onyomi: ['ぼく', 'もく'],
    kunyomi: ['だ(まる)', 'もだ(す)'],
    meanings: ['silent', 'quiet', 'still'],
    grade: 10,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // beast / animal / bestial
  '獸': KanjiReading(
    kanji: '獸',
    onyomi: ['じゅう'],
    kunyomi: ['けもの', 'けだもの'],
    meanings: ['beast', 'animal', 'bestial'],
    grade: 10,
    strokes: 19,
    frequencyRank: 99999,
  ),
  // ornamental hairpin
  '珈': KanjiReading(
    kanji: '珈',
    onyomi: ['か'],
    kunyomi: ['かみかざり'],
    meanings: ['ornamental hairpin'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // amber
  '珀': KanjiReading(
    kanji: '珀',
    onyomi: ['はく'],
    kunyomi: [],
    meanings: ['amber'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // jewelled utensil
  '琥': KanjiReading(
    kanji: '琥',
    onyomi: ['こ'],
    kunyomi: [],
    meanings: ['jewelled utensil'],
    grade: 9,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // beautiful as a jewel
  '瑶': KanjiReading(
    kanji: '瑶',
    onyomi: ['よう'],
    kunyomi: ['たま'],
    meanings: ['beautiful as a jewel'],
    grade: 9,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // sphere / ball
  '璧': KanjiReading(
    kanji: '璧',
    onyomi: ['へき'],
    kunyomi: ['たま'],
    meanings: ['sphere', 'ball'],
    grade: 8,
    strokes: 18,
    frequencyRank: 99999,
  ),
  // tatami / counter for tatami mats / fold
  '疊': KanjiReading(
    kanji: '疊',
    onyomi: ['じょう', 'ちょう'],
    kunyomi: ['たた(む)', 'たたみ', 'かさ(なる)', 'かさ(ねる)'],
    meanings: ['tatami', 'counter for tatami mats', 'fold'],
    grade: 10,
    strokes: 22,
    frequencyRank: 99999,
  ),
  // swelling / boil / tumor
  '瘍': KanjiReading(
    kanji: '瘍',
    onyomi: ['よう'],
    kunyomi: ['かさ'],
    meanings: ['swelling', 'boil', 'tumor'],
    grade: 8,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // exhaust / use up / run out of
  '盡': KanjiReading(
    kanji: '盡',
    onyomi: ['じん', 'さん'],
    kunyomi: ['つ(くす)', 'つ(きる)', 'つ(かす)', 'さかづき', 'ことごと(く)'],
    meanings: ['exhaust', 'use up', 'run out of'],
    grade: 10,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // pupil of the eye
  '眸': KanjiReading(
    kanji: '眸',
    onyomi: ['ぼう', 'む'],
    kunyomi: ['ひとみ'],
    meanings: ['pupil of the eye'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // 打破 / smash / broken
  '碎': KanjiReading(
    kanji: '碎',
    onyomi: ['さい'],
    kunyomi: ['くだ(く)', 'くだ(ける)'],
    meanings: ['打破', 'smash', 'broken'],
    grade: 10,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // mysterious / secret / abstruse
  '祕': KanjiReading(
    kanji: '祕',
    onyomi: ['ひ'],
    kunyomi: ['ひ(める)', 'かく(す)'],
    meanings: ['mysterious', 'secret', 'abstruse'],
    grade: 10,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // fief / allowance / pension
  '祿': KanjiReading(
    kanji: '祿',
    onyomi: ['ろく'],
    kunyomi: ['さいわ(い)', 'ふち'],
    meanings: ['fief', 'allowance', 'pension'],
    grade: 9,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // Zen Buddhism / silent meditation
  '禪': KanjiReading(
    kanji: '禪',
    onyomi: ['ぜん', 'せん'],
    kunyomi: ['しずか', 'ゆず(る)'],
    meanings: ['Zen Buddhism', 'silent meditation'],
    grade: 10,
    strokes: 17,
    frequencyRank: 99999,
  ),
  // social custom / manners / courtesy
  '禮': KanjiReading(
    kanji: '禮',
    onyomi: ['れい', 'らい'],
    kunyomi: [],
    meanings: ['social custom', 'manners', 'courtesy'],
    grade: 10,
    strokes: 18,
    frequencyRank: 99999,
  ),
  // salary in rice
  '稟': KanjiReading(
    kanji: '稟',
    onyomi: ['りん', 'ひん'],
    kunyomi: ['こめぐら'],
    meanings: ['salary in rice'],
    grade: 9,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // rice plant
  '稻': KanjiReading(
    kanji: '稻',
    onyomi: ['とう', 'て'],
    kunyomi: ['いね', '(いな)'],
    meanings: ['rice plant'],
    grade: 10,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // ear (of grain) / 头 / crest (of wave)
  '穗': KanjiReading(
    kanji: '穗',
    onyomi: ['すい'],
    kunyomi: ['ほ'],
    meanings: ['ear (of grain)', '头', 'crest (of wave)'],
    grade: 10,
    strokes: 17,
    frequencyRank: 99999,
  ),
  // abundance
  '穰': KanjiReading(
    kanji: '穰',
    onyomi: ['じょう'],
    kunyomi: ['わら', 'ゆたか'],
    meanings: ['abundance'],
    grade: 9,
    strokes: 22,
    frequencyRank: 99999,
  ),
  // 天
  '穹': KanjiReading(
    kanji: '穹',
    onyomi: ['きゅう', 'きょう'],
    kunyomi: ['あめ', 'そら'],
    meanings: ['天'],
    grade: 9,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // a reed instrument
  '笙': KanjiReading(
    kanji: '笙',
    onyomi: ['しょう', 'そう'],
    kunyomi: ['ふえ'],
    meanings: ['a reed instrument'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // 纸 / label / 信
  '箋': KanjiReading(
    kanji: '箋',
    onyomi: ['せん'],
    kunyomi: ['ふだ'],
    meanings: ['纸', 'label', '信'],
    grade: 8,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // basket / devote oneself / seclude oneself
  '籠': KanjiReading(
    kanji: '籠',
    onyomi: ['ろう', 'る'],
    kunyomi: ['かご', 'こ(める)', 'こも(る)', 'こ(む)'],
    meanings: ['basket', 'devote oneself', 'seclude oneself'],
    grade: 8,
    strokes: 22,
    frequencyRank: 99999,
  ),
  // pure / unadulterated / select
  '粹': KanjiReading(
    kanji: '粹',
    onyomi: ['すい'],
    kunyomi: ['いき'],
    meanings: ['pure', 'unadulterated', 'select'],
    grade: 10,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // thread / silk cloth
  '綸': KanjiReading(
    kanji: '綸',
    onyomi: ['りん', 'かん'],
    kunyomi: ['いと'],
    meanings: ['thread', 'silk cloth'],
    grade: 9,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // county / district / subdivision
  '縣': KanjiReading(
    kanji: '縣',
    onyomi: ['けん'],
    kunyomi: ['か(ける)'],
    meanings: ['county', 'district', 'subdivision'],
    grade: 10,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // indulge in / give free reign to
  '縱': KanjiReading(
    kanji: '縱',
    onyomi: ['じゅう'],
    kunyomi: ['たて'],
    meanings: ['indulge in', 'give free reign to'],
    grade: 10,
    strokes: 17,
    frequencyRank: 99999,
  ),
  // fine / slender / thin kimono
  '纖': KanjiReading(
    kanji: '纖',
    onyomi: ['せん'],
    kunyomi: [],
    meanings: ['fine', 'slender', 'thin kimono'],
    grade: 10,
    strokes: 23,
    frequencyRank: 99999,
  ),
  // feel ashamed
  '羞': KanjiReading(
    kanji: '羞',
    onyomi: ['しゅう'],
    kunyomi: ['はじ(る)', 'すすめ(る)', 'は(ずかしい)'],
    meanings: ['feel ashamed'],
    grade: 8,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // antelope
  '羚': KanjiReading(
    kanji: '羚',
    onyomi: ['れい', 'りょう'],
    kunyomi: ['かもしか'],
    meanings: ['antelope'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // flip over / upset / capsize
  '飜': KanjiReading(
    kanji: '飜',
    onyomi: ['はん', 'ほん'],
    kunyomi: ['ひるがえ(す)', 'ひるがえ(る)'],
    meanings: ['flip over', 'upset', 'capsize'],
    grade: 10,
    strokes: 21,
    frequencyRank: 99999,
  ),
  // careful enquiry / headstrong
  '聽': KanjiReading(
    kanji: '聽',
    onyomi: ['ちょう'],
    kunyomi: ['き(く)', 'ゆる(す)'],
    meanings: ['careful enquiry', 'headstrong'],
    grade: 10,
    strokes: 22,
    frequencyRank: 99999,
  ),
  // viscera / bowels
  '臟': KanjiReading(
    kanji: '臟',
    onyomi: ['ぞう'],
    kunyomi: ['はらわた'],
    meanings: ['viscera', 'bowels'],
    grade: 10,
    strokes: 22,
    frequencyRank: 99999,
  ),
  // participate in / 给 / award
  '與': KanjiReading(
    kanji: '與',
    onyomi: ['よ'],
    kunyomi: ['あた(える)', 'あずか(る)', 'くみ(する)', 'ともに'],
    meanings: ['participate in', '给', 'award'],
    grade: 10,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // strawberry
  '苺': KanjiReading(
    kanji: '苺',
    onyomi: ['ばい', 'まい'],
    kunyomi: ['いちご'],
    meanings: ['strawberry'],
    grade: 9,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // jasmine
  '茉': KanjiReading(
    kanji: '茉',
    onyomi: ['まつ', 'ばつ', 'ま'],
    kunyomi: [],
    meanings: ['jasmine'],
    grade: 9,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // broom
  '莊': KanjiReading(
    kanji: '莊',
    onyomi: ['そう', 'しょう', 'ちゃん'],
    kunyomi: ['ほうき', 'おごそ(か)'],
    meanings: ['broom'],
    grade: 10,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // jasmine
  '莉': KanjiReading(
    kanji: '莉',
    onyomi: ['り', 'らい', 'れい'],
    kunyomi: [],
    meanings: ['jasmine'],
    grade: 9,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // the violet
  '菫': KanjiReading(
    kanji: '菫',
    onyomi: ['きん'],
    kunyomi: ['すみれ'],
    meanings: ['the violet'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // show symptoms of / sprout / bud
  '萠': KanjiReading(
    kanji: '萠',
    onyomi: ['ほう'],
    kunyomi: ['も(える)', 'きざ(す)', 'めばえ', 'きざ(し)'],
    meanings: ['show symptoms of', 'sprout', 'bud'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // bud (plants, mushrooms not yet opened)
  '蕾': KanjiReading(
    kanji: '蕾',
    onyomi: ['らい'],
    kunyomi: ['つぼみ'],
    meanings: ['bud (plants, mushrooms not yet opened)'],
    grade: 9,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // 药 / chemical / enamel
  '藥': KanjiReading(
    kanji: '藥',
    onyomi: ['やく'],
    kunyomi: ['くすり'],
    meanings: ['药', 'chemical', 'enamel'],
    grade: 10,
    strokes: 18,
    frequencyRank: 99999,
  ),
  // defense
  '衞': KanjiReading(
    kanji: '衞',
    onyomi: ['えい', 'え'],
    kunyomi: ['まも(る)'],
    meanings: ['defense'],
    grade: 10,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // dress / pretend / disguise
  '裝': KanjiReading(
    kanji: '裝',
    onyomi: ['そう', 'しょう'],
    kunyomi: ['よそお(う)', 'よそお(い)'],
    meanings: ['dress', 'pretend', 'disguise'],
    grade: 10,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // look at / inspect / perceive
  '覽': KanjiReading(
    kanji: '覽',
    onyomi: ['らん'],
    kunyomi: ['み(る)'],
    meanings: ['look at', 'inspect', 'perceive'],
    grade: 10,
    strokes: 22,
    frequencyRank: 99999,
  ),
  // consult with
  '詢': KanjiReading(
    kanji: '詢',
    onyomi: ['じゅん', 'しゅん'],
    kunyomi: ['はか(る)', 'まこと'],
    meanings: ['consult with'],
    grade: 9,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // tedious
  '諄': KanjiReading(
    kanji: '諄',
    onyomi: ['しゅん'],
    kunyomi: ['ひちくど(い)', 'くど(い)', 'くどくど', 'ねんご(ろ)'],
    meanings: ['tedious'],
    grade: 9,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // harmony
  '諧': KanjiReading(
    kanji: '諧',
    onyomi: ['かい'],
    kunyomi: ['かな(う)', 'やわ(らぐ)'],
    meanings: ['harmony'],
    grade: 8,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // chant (esp. Noh) / folksong / ballad
  '謠': KanjiReading(
    kanji: '謠',
    onyomi: ['よう'],
    kunyomi: ['うた(う)', 'うた'],
    meanings: ['chant (esp. Noh)', 'folksong', 'ballad'],
    grade: 10,
    strokes: 17,
    frequencyRank: 99999,
  ),
  // allow / permit / yield
  '讓': KanjiReading(
    kanji: '讓',
    onyomi: ['じょう'],
    kunyomi: ['ゆず(る)'],
    meanings: ['allow', 'permit', 'yield'],
    grade: 10,
    strokes: 24,
    frequencyRank: 99999,
  ),
  // covet / indulge in
  '貪': KanjiReading(
    kanji: '貪',
    onyomi: ['たん', 'どん', 'とん'],
    kunyomi: ['むさぼ(る)'],
    meanings: ['covet', 'indulge in'],
    grade: 8,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // sell / betray / show off
  '賣': KanjiReading(
    kanji: '賣',
    onyomi: ['ばい'],
    kunyomi: ['う(る)', 'う(れる)'],
    meanings: ['sell', 'betray', 'show off'],
    grade: 10,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // remains / clue / footprint
  '踪': KanjiReading(
    kanji: '踪',
    onyomi: ['そう', 'しょう'],
    kunyomi: ['あと'],
    meanings: ['remains', 'clue', 'footprint'],
    grade: 8,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // shift / 移动 / turn
  '轉': KanjiReading(
    kanji: '轉',
    onyomi: ['てん'],
    kunyomi: ['ころ(がる)', 'ころ(げる)', 'ころ(がす)', 'ころ(ぶ)', 'まろ(ぶ)', 'うたた', 'うつ(る)'],
    meanings: ['shift', '移动', 'turn'],
    grade: 10,
    strokes: 18,
    frequencyRank: 99999,
  ),
  // pungent / spicy / harsh
  '辣': KanjiReading(
    kanji: '辣',
    onyomi: ['らつ'],
    kunyomi: ['から(い)'],
    meanings: ['pungent', 'spicy', 'harsh'],
    grade: 8,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // edify / 道路 / path
  '迪': KanjiReading(
    kanji: '迪',
    onyomi: ['てき'],
    kunyomi: ['みち', 'みちび(く)', 'すす(む)', 'いた(る)'],
    meanings: ['edify', '道路', 'path'],
    grade: 9,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // sturdy / brawny / bold
  '逞': KanjiReading(
    kanji: '逞',
    onyomi: ['てい'],
    kunyomi: ['たくま(しい)'],
    meanings: ['sturdy', 'brawny', 'bold'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // get drunk / feel sick / poisoned
  '醉': KanjiReading(
    kanji: '醉',
    onyomi: ['すい'],
    kunyomi: ['よ(う)', 'よ(い)'],
    meanings: ['get drunk', 'feel sick', 'poisoned'],
    grade: 10,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // brew / cause
  '釀': KanjiReading(
    kanji: '釀',
    onyomi: ['じょう'],
    kunyomi: ['かも(す)'],
    meanings: ['brew', 'cause'],
    grade: 10,
    strokes: 24,
    frequencyRank: 99999,
  ),
  // glaze / enamel
  '釉': KanjiReading(
    kanji: '釉',
    onyomi: ['ゆう'],
    kunyomi: ['うわぐすり'],
    meanings: ['glaze', 'enamel'],
    grade: 9,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // confinement / to tie
  '錮': KanjiReading(
    kanji: '錮',
    onyomi: ['こ'],
    kunyomi: ['ふさ(ぐ)'],
    meanings: ['confinement', 'to tie'],
    grade: 8,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // ancient peace-preservation centers
  '鎭': KanjiReading(
    kanji: '鎭',
    onyomi: ['ちん'],
    kunyomi: ['しず(める)', 'しず(まる)', 'おさえ'],
    meanings: ['ancient peace-preservation centers'],
    grade: 10,
    strokes: 18,
    frequencyRank: 99999,
  ),
  // cast / mint
  '鑄': KanjiReading(
    kanji: '鑄',
    onyomi: ['ちゅう', 'しゅ', 'しゅう'],
    kunyomi: ['い(る)'],
    meanings: ['cast', 'mint'],
    grade: 10,
    strokes: 22,
    frequencyRank: 99999,
  ),
  // fall into / cave in / fall (castle)
  '陷': KanjiReading(
    kanji: '陷',
    onyomi: ['かん'],
    kunyomi: ['おちい(る)', 'おとしい(れる)'],
    meanings: ['fall into', 'cave in', 'fall (castle)'],
    grade: 10,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // inaccessible place / impregnable position / steep place
  '險': KanjiReading(
    kanji: '險',
    onyomi: ['けん'],
    kunyomi: ['けわ(しい)'],
    meanings: ['inaccessible place', 'impregnable position', 'steep place'],
    grade: 10,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // mixed / blended / mix
  '雜': KanjiReading(
    kanji: '雜',
    onyomi: ['ざつ', 'ぞう'],
    kunyomi: ['まじ(える)', 'まじ(る)'],
    meanings: ['mixed', 'blended', 'mix'],
    grade: 10,
    strokes: 18,
    frequencyRank: 99999,
  ),
  // quiet
  '靜': KanjiReading(
    kanji: '靜',
    onyomi: ['せい', 'じょう'],
    kunyomi: ['(しず)', 'しず(か)', 'しず(まる)', 'しず(める)'],
    meanings: ['quiet'],
    grade: 10,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // eulogy
  '頌': KanjiReading(
    kanji: '頌',
    onyomi: ['しょう', 'じゅ', 'よう'],
    kunyomi: ['かたち', 'たた(える)', 'ほめ(る)'],
    meanings: ['eulogy'],
    grade: 9,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // manifest / display / evident
  '顯': KanjiReading(
    kanji: '顯',
    onyomi: ['けん'],
    kunyomi: ['あきらか', 'あらわ(れる)'],
    meanings: ['manifest', 'display', 'evident'],
    grade: 10,
    strokes: 23,
    frequencyRank: 99999,
  ),
  // sudden / quick / sound of the wind
  '颯': KanjiReading(
    kanji: '颯',
    onyomi: ['さつ', 'そう'],
    kunyomi: ['さっ(と)'],
    meanings: ['sudden', 'quick', 'sound of the wind'],
    grade: 9,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // harass / bother / annoy
  '騷': KanjiReading(
    kanji: '騷',
    onyomi: ['そう'],
    kunyomi: ['さわ(ぐ)', 'うれい', 'さわが(しい)'],
    meanings: ['harass', 'bother', 'annoy'],
    grade: 10,
    strokes: 20,
    frequencyRank: 99999,
  ),
  // 强 / good horse / gallant
  '驍': KanjiReading(
    kanji: '驍',
    onyomi: ['ぎょう', 'きょう'],
    kunyomi: ['たけし', 'つよ(い)'],
    meanings: ['强', 'good horse', 'gallant'],
    grade: 9,
    strokes: 22,
    frequencyRank: 99999,
  ),
  // verification / effect / testing
  '驗': KanjiReading(
    kanji: '驗',
    onyomi: ['けん', 'げん'],
    kunyomi: ['あかし', 'しるし', 'ため(す)', 'ためし'],
    meanings: ['verification', 'effect', 'testing'],
    grade: 10,
    strokes: 23,
    frequencyRank: 99999,
  ),
  // 头发
  '髮': KanjiReading(
    kanji: '髮',
    onyomi: ['はつ'],
    kunyomi: ['かみ'],
    meanings: ['头发'],
    grade: 10,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // chicken
  '鷄': KanjiReading(
    kanji: '鷄',
    onyomi: ['けい'],
    kunyomi: ['にわとり', 'とり'],
    meanings: ['chicken'],
    grade: 10,
    strokes: 21,
    frequencyRank: 99999,
  ),
  // Chinese unicorn / genius / giraffe
  '麒': KanjiReading(
    kanji: '麒',
    onyomi: ['き'],
    kunyomi: [],
    meanings: ['Chinese unicorn', 'genius', 'giraffe'],
    grade: 9,
    strokes: 19,
    frequencyRank: 99999,
  ),
  // alike / equal / 相似
  '齊': KanjiReading(
    kanji: '齊',
    onyomi: ['せい', 'さい'],
    kunyomi: ['そろ(う)', 'ひと(しい)', 'ひと(しく)', 'あたる', 'はやい'],
    meanings: ['alike', 'equal', '相似'],
    grade: 10,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // 高 / 远
  '堯': KanjiReading(
    kanji: '堯',
    onyomi: ['ぎょう'],
    kunyomi: ['たか(い)'],
    meanings: ['高', '远'],
    grade: 9,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // twig / Chinese black pine
  '槇': KanjiReading(
    kanji: '槇',
    onyomi: ['てん', 'しん'],
    kunyomi: ['まき', 'こずえ'],
    meanings: ['twig', 'Chinese black pine'],
    grade: 9,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // far off / distant / long ago
  '遙': KanjiReading(
    kanji: '遙',
    onyomi: ['よう'],
    kunyomi: ['はる(か)'],
    meanings: ['far off', 'distant', 'long ago'],
    grade: 9,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // 冷 / strict / severe
  '凜': KanjiReading(
    kanji: '凜',
    onyomi: ['りん'],
    kunyomi: ['きびし(い)'],
    meanings: ['冷', 'strict', 'severe'],
    grade: 9,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // bright / sunny / prosperous
  '熙': KanjiReading(
    kanji: '熙',
    onyomi: ['き'],
    kunyomi: ['たのし(む)', 'ひか(る)', 'ひろ(い)', 'よろこ(ぶ)', 'かわ(く)', 'あきらか', 'ひろ(める)', 'ひろ(まる)'],
    meanings: ['bright', 'sunny', 'prosperous'],
    grade: 9,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // chivalrous person / chivalry / knight-errant
  '俠': KanjiReading(
    kanji: '俠',
    onyomi: ['きょう', 'きゃん'],
    kunyomi: ['おとこだて'],
    meanings: ['chivalrous person', 'chivalry', 'knight-errant'],
    grade: 9,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // fill in / fill up / make good
  '塡': KanjiReading(
    kanji: '塡',
    onyomi: ['てん', 'ちん'],
    kunyomi: ['はま(る)', 'うず(める)', 'は(める)', 'ふさ(ぐ)'],
    meanings: ['fill in', 'fill up', 'make good'],
    grade: 8,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // box one's ears / slap
  '摑': KanjiReading(
    kanji: '摑',
    onyomi: ['かく'],
    kunyomi: ['つか(む)', 'つか(まえる)', 'つか(まる)'],
    meanings: ['box one\'s ears', 'slap'],
    grade: 9,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // strike / hit / beat
  '擊': KanjiReading(
    kanji: '擊',
    onyomi: ['げき'],
    kunyomi: ['う(つ)'],
    meanings: ['strike', 'hit', 'beat'],
    grade: 10,
    strokes: 17,
    frequencyRank: 99999,
  ),
  // flame / blaze / glowing
  '焰': KanjiReading(
    kanji: '焰',
    onyomi: ['えん'],
    kunyomi: ['ほのお'],
    meanings: ['flame', 'blaze', 'glowing'],
    grade: 9,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // 薄 / emaciated / lean
  '瘦': KanjiReading(
    kanji: '瘦',
    onyomi: ['そう', 'ちゅう', 'しゅう', 'ちゅ'],
    kunyomi: ['やせ(る)'],
    meanings: ['薄', 'emaciated', 'lean'],
    grade: 10,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // pray / entreat / beg
  '禱': KanjiReading(
    kanji: '禱',
    onyomi: ['とう'],
    kunyomi: ['いの(る)', 'まつ(る)'],
    meanings: ['pray', 'entreat', 'beg'],
    grade: 9,
    strokes: 18,
    frequencyRank: 99999,
  ),
  // embroider / embroidery / ornament
  '繡': KanjiReading(
    kanji: '繡',
    onyomi: ['しゅう'],
    kunyomi: ['ぬいとり'],
    meanings: ['embroider', 'embroidery', 'ornament'],
    grade: 9,
    strokes: 18,
    frequencyRank: 99999,
  ),
  // attach / connect / unite
  '繫': KanjiReading(
    kanji: '繫',
    onyomi: ['けい'],
    kunyomi: ['つな(ぐ)', 'かか(る)', 'か(ける)'],
    meanings: ['attach', 'connect', 'unite'],
    grade: 9,
    strokes: 19,
    frequencyRank: 99999,
  ),
  // goosefoot / weed / fallow field
  '萊': KanjiReading(
    kanji: '萊',
    onyomi: ['らい', 'り'],
    kunyomi: ['あかざ', 'あれわ', 'こうがい'],
    meanings: ['goosefoot', 'weed', 'fallow field'],
    grade: 9,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // surname / hydropyrum latifalium
  '蔣': KanjiReading(
    kanji: '蔣',
    onyomi: ['しょう', 'そう'],
    kunyomi: ['まこも', 'はげ(ます)'],
    meanings: ['surname', 'hydropyrum latifalium'],
    grade: 9,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // wax / candle / waxy
  '蠟': KanjiReading(
    kanji: '蠟',
    onyomi: ['ろう'],
    kunyomi: ['みつろう', 'ろうそく'],
    meanings: ['wax', 'candle', 'waxy'],
    grade: 9,
    strokes: 21,
    frequencyRank: 99999,
  ),
  // any jam-like or paste-like food
  '醬': KanjiReading(
    kanji: '醬',
    onyomi: ['しょう'],
    kunyomi: ['ひしお'],
    meanings: ['any jam-like or paste-like food'],
    grade: 9,
    strokes: 18,
    frequencyRank: 99999,
  ),
  // cheeks / jaw
  '頰': KanjiReading(
    kanji: '頰',
    onyomi: ['きょう'],
    kunyomi: ['ほお', 'ほほ'],
    meanings: ['cheeks', 'jaw'],
    grade: 8,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // 顶部 / peak / summit
  '顚': KanjiReading(
    kanji: '顚',
    onyomi: ['てん'],
    kunyomi: ['いただ(き)', 'たお(れる)'],
    meanings: ['顶部', 'peak', 'summit'],
    grade: 9,
    strokes: 19,
    frequencyRank: 99999,
  ),
  // seagull / tern
  '鷗': KanjiReading(
    kanji: '鷗',
    onyomi: ['おう'],
    kunyomi: ['かもめ'],
    meanings: ['seagull', 'tern'],
    grade: 9,
    strokes: 22,
    frequencyRank: 99999,
  ),
  // scold / reprove
  '𠮟': KanjiReading(
    kanji: '𠮟',
    onyomi: ['しつ', 'しち', 'か'],
    kunyomi: ['しか(る)'],
    meanings: ['scold', 'reprove'],
    grade: 8,
    strokes: 5,
    frequencyRank: 99999,
  ),
  // 全部 / together / accompany
  '俱': KanjiReading(
    kanji: '俱',
    onyomi: ['く'],
    kunyomi: ['ともに'],
    meanings: ['全部', 'together', 'accompany'],
    grade: 9,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // come off / peel / fade
  '剝': KanjiReading(
    kanji: '剝',
    onyomi: ['はく', 'ほく'],
    kunyomi: ['へ(ぐ)', 'へず(る)', 'む(く)', 'む(ける)', 'は(がれる)', 'は(ぐ)', 'は(げる)', 'は(がす)'],
    meanings: ['come off', 'peel', 'fade'],
    grade: 8,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // promptly / namely
  '卽': KanjiReading(
    kanji: '卽',
    onyomi: ['そく', 'しょく'],
    kunyomi: ['つ(く)', 'すなわ(ち)', 'もし'],
    meanings: ['promptly', 'namely'],
    grade: 10,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // swallow / absorb / annex
  '吞': KanjiReading(
    kanji: '吞',
    onyomi: ['どん', 'とん', 'てん'],
    kunyomi: ['のむ'],
    meanings: ['swallow', 'absorb', 'annex'],
    grade: 9,
    strokes: 7,
    frequencyRank: 99999,
  ),
  // increase / add to / augment
  '增': KanjiReading(
    kanji: '增',
    onyomi: ['ぞう', 'そう'],
    kunyomi: ['ます', 'ふえる', 'ふやす'],
    meanings: ['increase', 'add to', 'augment'],
    grade: 10,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // broad / 宽 / spacious
  '寬': KanjiReading(
    kanji: '寬',
    onyomi: ['かん'],
    kunyomi: ['ひろい', 'ゆるやか', 'くつろぐ'],
    meanings: ['broad', '宽', 'spacious'],
    grade: 10,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // nest / living quarter in tree
  '巢': KanjiReading(
    kanji: '巢',
    onyomi: ['そう'],
    kunyomi: ['す', 'す(くう)'],
    meanings: ['nest', 'living quarter in tree'],
    grade: 10,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // summon / recruit / musical note
  '徵': KanjiReading(
    kanji: '徵',
    onyomi: ['ちょう', 'ち'],
    kunyomi: ['しるし', 'めす'],
    meanings: ['summon', 'recruit', 'musical note'],
    grade: 10,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // ethics / morality / virtue
  '德': KanjiReading(
    kanji: '德',
    onyomi: ['とく'],
    kunyomi: ['おしえ'],
    meanings: ['ethics', 'morality', 'virtue'],
    grade: 10,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // raise / lift up / surname
  '揭': KanjiReading(
    kanji: '揭',
    onyomi: ['けい', 'けつ'],
    kunyomi: ['かかげる'],
    meanings: ['raise', 'lift up', 'surname'],
    grade: 10,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // 夜晚 / 傍晚 / 晚
  '晚': KanjiReading(
    kanji: '晚',
    onyomi: ['ばん'],
    kunyomi: ['くれ', 'おそい'],
    meanings: ['夜晚', '傍晚', '晚'],
    grade: 10,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // calendar / era
  '曆': KanjiReading(
    kanji: '曆',
    onyomi: ['れき', 'りゃく'],
    kunyomi: ['こよみ'],
    meanings: ['calendar', 'era'],
    grade: 10,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // across / horizontal / lateral
  '橫': KanjiReading(
    kanji: '橫',
    onyomi: ['おう', 'こう'],
    kunyomi: ['よこ', 'よこたわる', 'よこたえる'],
    meanings: ['across', 'horizontal', 'lateral'],
    grade: 10,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // step / pace / 走
  '步': KanjiReading(
    kanji: '步',
    onyomi: ['ほ', 'ぶ', 'ふ'],
    kunyomi: ['あるく', 'あゆむ', 'あゆみ'],
    meanings: ['step', 'pace', '走'],
    grade: 10,
    strokes: 7,
    frequencyRank: 99999,
  ),
  // take place / past / 历史
  '歷': KanjiReading(
    kanji: '歷',
    onyomi: [],
    kunyomi: [],
    meanings: ['take place', 'past', '历史'],
    grade: 10,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // every / each
  '每': KanjiReading(
    kanji: '每',
    onyomi: ['まい', 'ばい'],
    kunyomi: ['つね'],
    meanings: ['every', 'each'],
    grade: 10,
    strokes: 7,
    frequencyRank: 99999,
  ),
  // ford stream / wade across
  '涉': KanjiReading(
    kanji: '涉',
    onyomi: ['しょう'],
    kunyomi: ['わたる', 'かかわる'],
    meanings: ['ford stream', 'wade across'],
    grade: 10,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // tears / weep / cry
  '淚': KanjiReading(
    kanji: '淚',
    onyomi: ['るい', 'れい'],
    kunyomi: ['なみだ'],
    meanings: ['tears', 'weep', 'cry'],
    grade: 10,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // thirsty / parched / yearn
  '渴': KanjiReading(
    kanji: '渴',
    onyomi: ['かつ'],
    kunyomi: ['かわ(く)', 'かわき'],
    meanings: ['thirsty', 'parched', 'yearn'],
    grade: 10,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // lukewarm / 温暖 / tepid
  '溫': KanjiReading(
    kanji: '溫',
    onyomi: ['おん', 'うん'],
    kunyomi: ['あたたか', 'あたためる'],
    meanings: ['lukewarm', '温暖', 'tepid'],
    grade: 10,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // swift current / rapids
  '瀨': KanjiReading(
    kanji: '瀨',
    onyomi: ['らい'],
    kunyomi: ['せ'],
    meanings: ['swift current', 'rapids'],
    grade: 10,
    strokes: 20,
    frequencyRank: 99999,
  ),
  // form / appearance / shape
  '狀': KanjiReading(
    kanji: '狀',
    onyomi: ['じょう'],
    kunyomi: [],
    meanings: ['form', 'appearance', 'shape'],
    grade: 10,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // small bamboo basket for holding
  '簞': KanjiReading(
    kanji: '簞',
    onyomi: ['たん'],
    kunyomi: ['はこ'],
    meanings: ['small bamboo basket for holding'],
    grade: 9,
    strokes: 18,
    frequencyRank: 99999,
  ),
  // 绿 / chlorine
  '綠': KanjiReading(
    kanji: '綠',
    onyomi: ['りょく', 'ろく'],
    kunyomi: ['みどり'],
    meanings: ['绿', 'chlorine'],
    grade: 10,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // end of thread / thread / clue
  '緖': KanjiReading(
    kanji: '緖',
    onyomi: ['しょ', 'ちょ'],
    kunyomi: ['お', 'いとぐち'],
    meanings: ['end of thread', 'thread', 'clue'],
    grade: 10,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // hem / margin / reason
  '緣': KanjiReading(
    kanji: '緣',
    onyomi: ['えん'],
    kunyomi: ['ふち', 'へり', 'よる'],
    meanings: ['hem', 'margin', 'reason'],
    grade: 10,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // a medicinal herb / to cauterize
  '薰': KanjiReading(
    kanji: '薰',
    onyomi: ['くん'],
    kunyomi: ['かおる', 'かおりぐさ', 'かおり'],
    meanings: ['a medicinal herb', 'to cauterize'],
    grade: 10,
    strokes: 20,
    frequencyRank: 99999,
  ),
  // false / worthless / empty
  '虛': KanjiReading(
    kanji: '虛',
    onyomi: ['きょ', 'こ'],
    kunyomi: ['むなしい'],
    meanings: ['false', 'worthless', 'empty'],
    grade: 10,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // cicada / continuous
  '蟬': KanjiReading(
    kanji: '蟬',
    onyomi: ['せん', 'ぜん'],
    kunyomi: ['せみ'],
    meanings: ['cicada', 'continuous'],
    grade: 9,
    strokes: 18,
    frequencyRank: 99999,
  ),
  // rely / depend on / accuse falsely
  '賴': KanjiReading(
    kanji: '賴',
    onyomi: ['らい'],
    kunyomi: ['たのむ', 'たよる', 'たより'],
    meanings: ['rely', 'depend on', 'accuse falsely'],
    grade: 10,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // gentleman
  '郞': KanjiReading(
    kanji: '郞',
    onyomi: ['ろう'],
    kunyomi: ['おとこ'],
    meanings: ['gentleman'],
    grade: 10,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // copy / write down / record
  '錄': KanjiReading(
    kanji: '錄',
    onyomi: ['ろく', 'りょ'],
    kunyomi: ['しるす'],
    meanings: ['copy', 'write down', 'record'],
    grade: 10,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // smelt metals / forge / refine
  '鍊': KanjiReading(
    kanji: '鍊',
    onyomi: ['れん'],
    kunyomi: ['ねる'],
    meanings: ['smelt metals', 'forge', 'refine'],
    grade: 10,
    strokes: 17,
    frequencyRank: 99999,
  ),
  // 黄 / surname
  '黃': KanjiReading(
    kanji: '黃',
    onyomi: ['こう', 'おう'],
    kunyomi: ['き'],
    meanings: ['黄', 'surname'],
    grade: 10,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // 黑 / dark / evil
  '黑': KanjiReading(
    kanji: '黑',
    onyomi: ['こく'],
    kunyomi: ['くろい', 'くろ'],
    meanings: ['黑', 'dark', 'evil'],
    grade: 10,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // railing / balustrade / animal pan
  '欄': KanjiReading(
    kanji: '欄',
    onyomi: [],
    kunyomi: [],
    meanings: ['railing', 'balustrade', 'animal pan'],
    grade: 10,
    strokes: 21,
    frequencyRank: 99999,
  ),
  // corridor / porch / veranda
  '廊': KanjiReading(
    kanji: '廊',
    onyomi: [],
    kunyomi: [],
    meanings: ['corridor', 'porch', 'veranda'],
    grade: 10,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // clear / bright / distinct
  '朗': KanjiReading(
    kanji: '朗',
    onyomi: ['ろう'],
    kunyomi: ['ほが(らか)'],
    meanings: ['clear', 'bright', 'distinct'],
    grade: 10,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // capture / imprison / seize
  '虜': KanjiReading(
    kanji: '虜',
    onyomi: ['りょ'],
    kunyomi: ['とりこ'],
    meanings: ['capture', 'imprison', 'seize'],
    grade: 10,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // class / group / kind
  '類': KanjiReading(
    kanji: '類',
    onyomi: [],
    kunyomi: [],
    meanings: ['class', 'group', 'kind'],
    grade: 10,
    strokes: 19,
    frequencyRank: 99999,
  ),
  // pig
  '猪': KanjiReading(
    kanji: '猪',
    onyomi: ['ちょ'],
    kunyomi: ['いのしし', 'い'],
    meanings: ['pig'],
    grade: 9,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // spirit
  '神': KanjiReading(
    kanji: '神',
    onyomi: ['しん', 'じん'],
    kunyomi: ['かみ', 'こう', 'たましい'],
    meanings: ['spirit'],
    grade: 10,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // good luck
  '祥': KanjiReading(
    kanji: '祥',
    onyomi: ['しょう'],
    kunyomi: ['さいわい'],
    meanings: ['good luck'],
    grade: 10,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // happiness
  '福': KanjiReading(
    kanji: '福',
    onyomi: ['ふく'],
    kunyomi: ['さいわい', 'ひもろぎ'],
    meanings: ['happiness'],
    grade: 10,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // several / 多 / various
  '諸': KanjiReading(
    kanji: '諸',
    onyomi: ['しょ'],
    kunyomi: ['もろ', 'これ'],
    meanings: ['several', '多', 'various'],
    grade: 10,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // 首都 / metropolis
  '都': KanjiReading(
    kanji: '都',
    onyomi: ['と', 'つ'],
    kunyomi: ['みやこ'],
    meanings: ['首都', 'metropolis'],
    grade: 10,
    strokes: 11,
    frequencyRank: 99999,
  ),
  // despise / contempt
  '侮': KanjiReading(
    kanji: '侮',
    onyomi: ['ぶ'],
    kunyomi: ['あなど(る)'],
    meanings: ['despise', 'contempt'],
    grade: 10,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // 
  '僧': KanjiReading(
    kanji: '僧',
    onyomi: ['そう'],
    kunyomi: [],
    meanings: [],
    grade: 10,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // 
  '勉': KanjiReading(
    kanji: '勉',
    onyomi: ['べん'],
    kunyomi: [],
    meanings: [],
    grade: 10,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // 工作 / serve
  '勤': KanjiReading(
    kanji: '勤',
    onyomi: ['きん', 'ごん'],
    kunyomi: ['つと(まる)', 'つと(める)'],
    meanings: ['工作', 'serve'],
    grade: 10,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // despise / lowly / base
  '卑': KanjiReading(
    kanji: '卑',
    onyomi: ['ひ'],
    kunyomi: ['いや(しむ)', 'いや(しい)', 'いや(しめる)'],
    meanings: ['despise', 'lowly', 'base'],
    grade: 10,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // 
  '嘆': KanjiReading(
    kanji: '嘆',
    onyomi: ['たん'],
    kunyomi: ['なげかわしい', 'なげく'],
    meanings: [],
    grade: 10,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // 
  '器': KanjiReading(
    kanji: '器',
    onyomi: ['き'],
    kunyomi: ['うつわ'],
    meanings: [],
    grade: 10,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // India ink / ink stick / Mexico
  '墨': KanjiReading(
    kanji: '墨',
    onyomi: ['ぼく'],
    kunyomi: ['すみ'],
    meanings: ['India ink', 'ink stick', 'Mexico'],
    grade: 10,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // stratum / social class / layer
  '層': KanjiReading(
    kanji: '層',
    onyomi: ['そう'],
    kunyomi: [],
    meanings: ['stratum', 'social class', 'layer'],
    grade: 10,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // regret / vexing
  '悔': KanjiReading(
    kanji: '悔',
    onyomi: ['かい'],
    kunyomi: ['く(いる)', 'くや(しい)', 'く(やむ)'],
    meanings: ['regret', 'vexing'],
    grade: 10,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // 
  '憎': KanjiReading(
    kanji: '憎',
    onyomi: ['ぞう'],
    kunyomi: ['にくい', 'にくしみ', 'にくむ', 'にくらしい'],
    meanings: [],
    grade: 10,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // 
  '懲': KanjiReading(
    kanji: '懲',
    onyomi: ['ちょう'],
    kunyomi: ['こらしめる', 'こらす', 'こりる'],
    meanings: [],
    grade: 10,
    strokes: 19,
    frequencyRank: 99999,
  ),
  // 
  '敏': KanjiReading(
    kanji: '敏',
    onyomi: ['びん'],
    kunyomi: [],
    meanings: [],
    grade: 10,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // 
  '暑': KanjiReading(
    kanji: '暑',
    onyomi: ['しょ'],
    kunyomi: ['あつい'],
    meanings: [],
    grade: 10,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // plum
  '梅': KanjiReading(
    kanji: '梅',
    onyomi: ['ばい'],
    kunyomi: ['うめ'],
    meanings: ['plum'],
    grade: 10,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // 
  '海': KanjiReading(
    kanji: '海',
    onyomi: ['かい'],
    kunyomi: ['うみ'],
    meanings: [],
    grade: 10,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // 
  '渚': KanjiReading(
    kanji: '渚',
    onyomi: ['しょ'],
    kunyomi: ['なぎさ'],
    meanings: [],
    grade: 9,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // 
  '漢': KanjiReading(
    kanji: '漢',
    onyomi: ['かん'],
    kunyomi: [],
    meanings: [],
    grade: 10,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // boil / cook
  '煮': KanjiReading(
    kanji: '煮',
    onyomi: ['しゃ'],
    kunyomi: ['に(る)', 'に(える)', 'に(やす)'],
    meanings: ['boil', 'cook'],
    grade: 10,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // polish
  '琢': KanjiReading(
    kanji: '琢',
    onyomi: ['たく'],
    kunyomi: ['みがく'],
    meanings: ['polish'],
    grade: 9,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // tombstone / monument
  '碑': KanjiReading(
    kanji: '碑',
    onyomi: ['ひ'],
    kunyomi: ['いしぶみ'],
    meanings: ['tombstone', 'monument'],
    grade: 10,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // 
  '社': KanjiReading(
    kanji: '社',
    onyomi: ['しゃ'],
    kunyomi: ['やしろ'],
    meanings: [],
    grade: 10,
    strokes: 8,
    frequencyRank: 99999,
  ),
  // 
  '祉': KanjiReading(
    kanji: '祉',
    onyomi: ['つ'],
    kunyomi: [],
    meanings: [],
    grade: 10,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // 
  '祈': KanjiReading(
    kanji: '祈',
    onyomi: ['き'],
    kunyomi: ['いのる'],
    meanings: [],
    grade: 10,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // 帮助
  '祐': KanjiReading(
    kanji: '祐',
    onyomi: ['ゆう'],
    kunyomi: ['たすけ', 'たすける'],
    meanings: ['帮助'],
    grade: 9,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // ancestor
  '祖': KanjiReading(
    kanji: '祖',
    onyomi: ['そ'],
    kunyomi: [],
    meanings: ['ancestor'],
    grade: 10,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // 
  '祝': KanjiReading(
    kanji: '祝',
    onyomi: ['しゅう', 'しゅく'],
    kunyomi: ['いわう'],
    meanings: [],
    grade: 10,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // calamity misfortune
  '禍': KanjiReading(
    kanji: '禍',
    onyomi: ['か'],
    kunyomi: ['まが', 'わざわい'],
    meanings: ['calamity misfortune'],
    grade: 10,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // 
  '禎': KanjiReading(
    kanji: '禎',
    onyomi: ['てい'],
    kunyomi: ['さいわい'],
    meanings: [],
    grade: 9,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // cereals / grain
  '穀': KanjiReading(
    kanji: '穀',
    onyomi: ['こく'],
    kunyomi: [],
    meanings: ['cereals', 'grain'],
    grade: 10,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // 
  '突': KanjiReading(
    kanji: '突',
    onyomi: ['とつ'],
    kunyomi: ['つく'],
    meanings: [],
    grade: 10,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // 
  '節': KanjiReading(
    kanji: '節',
    onyomi: ['せち', 'せつ'],
    kunyomi: ['ふし'],
    meanings: [],
    grade: 10,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // knead / 火车 / polish
  '練': KanjiReading(
    kanji: '練',
    onyomi: ['こう', 'れん'],
    kunyomi: ['ね(る)'],
    meanings: ['knead', '火车', 'polish'],
    grade: 10,
    strokes: 15,
    frequencyRank: 99999,
  ),
  // 
  '繁': KanjiReading(
    kanji: '繁',
    onyomi: ['はん'],
    kunyomi: [],
    meanings: [],
    grade: 10,
    strokes: 17,
    frequencyRank: 99999,
  ),
  // signature / govt office / police station
  '署': KanjiReading(
    kanji: '署',
    onyomi: ['しょ'],
    kunyomi: [],
    meanings: ['signature', 'govt office', 'police station'],
    grade: 10,
    strokes: 14,
    frequencyRank: 99999,
  ),
  // 人
  '者': KanjiReading(
    kanji: '者',
    onyomi: ['しゃ'],
    kunyomi: ['もの'],
    meanings: ['人'],
    grade: 10,
    strokes: 9,
    frequencyRank: 99999,
  ),
  // odor / ill-smelling
  '臭': KanjiReading(
    kanji: '臭',
    onyomi: ['しゅう'],
    kunyomi: ['くさ(い)', 'にお(い)'],
    meanings: ['odor', 'ill-smelling'],
    grade: 10,
    strokes: 10,
    frequencyRank: 99999,
  ),
  // 
  '著': KanjiReading(
    kanji: '著',
    onyomi: ['ちょ'],
    kunyomi: ['あらわす', 'いちじるしい'],
    meanings: [],
    grade: 10,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // 
  '視': KanjiReading(
    kanji: '視',
    onyomi: ['し'],
    kunyomi: [],
    meanings: [],
    grade: 10,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // 
  '謁': KanjiReading(
    kanji: '謁',
    onyomi: ['えつ'],
    kunyomi: [],
    meanings: [],
    grade: 10,
    strokes: 16,
    frequencyRank: 99999,
  ),
  // 
  '謹': KanjiReading(
    kanji: '謹',
    onyomi: ['きん'],
    kunyomi: ['つつしむ'],
    meanings: [],
    grade: 10,
    strokes: 18,
    frequencyRank: 99999,
  ),
  // guest
  '賓': KanjiReading(
    kanji: '賓',
    onyomi: ['ひん'],
    kunyomi: [],
    meanings: ['guest'],
    grade: 10,
    strokes: 13,
    frequencyRank: 99999,
  ),
  // presents / give to
  '贈': KanjiReading(
    kanji: '贈',
    onyomi: ['そう', 'ぞう'],
    kunyomi: ['おく(る)'],
    meanings: ['presents', 'give to'],
    grade: 10,
    strokes: 19,
    frequencyRank: 99999,
  ),
  // 
  '逸': KanjiReading(
    kanji: '逸',
    onyomi: [],
    kunyomi: ['しんにょう'],
    meanings: [],
    grade: 10,
    strokes: 12,
    frequencyRank: 99999,
  ),
  // 
  '難': KanjiReading(
    kanji: '難',
    onyomi: ['なん'],
    kunyomi: ['かたい', 'むずかしい'],
    meanings: [],
    grade: 10,
    strokes: 19,
    frequencyRank: 99999,
  ),
  // echo / 声音 / resound
  '響': KanjiReading(
    kanji: '響',
    onyomi: ['きょう'],
    kunyomi: ['ひび(く)'],
    meanings: ['echo', '声音', 'resound'],
    grade: 10,
    strokes: 22,
    frequencyRank: 99999,
  ),
};
