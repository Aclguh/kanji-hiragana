import 'package:flutter/material.dart';

import 'kanji_filter.dart';
import 'settings.dart';

/// 界面语言。
enum AppLanguage {
  /// 简体中文。
  zh,

  /// English。
  en;

  /// 在语言选择器中显示的名称 (各语言用自身写法, 不随界面语言变化)。
  String get label => switch (this) {
        AppLanguage.zh => '中文',
        AppLanguage.en => 'English',
      };

  static AppLanguage fromName(String? name) {
    return AppLanguage.values.firstWhere(
      (l) => l.name == name,
      orElse: () => AppLanguage.zh,
    );
  }
}

/// 界面文案。
///
/// 用密封类 + 两个子类而非 Map: 漏译某个字段会直接编译报错,
/// 也便于按语言通读整份文案。
sealed class AppStrings {
  const AppStrings();

  /// 当前语言的全部文案。
  static AppStrings of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<AppStringsScope>();
    assert(
      scope != null,
      'AppStrings.of: 未找到 AppStringsScope, 已静默回退中文。\n'
      '测试宿主请用 AppStringsScope(strings: ...) 包裹 MaterialApp, '
      '与 main.dart 的做法一致。',
    );
    return scope?.strings ?? const ZhStrings();
  }

  static AppStrings forLanguage(AppLanguage language) => switch (language) {
        AppLanguage.zh => const ZhStrings(),
        AppLanguage.en => const EnStrings(),
      };

  /// 该文案集对应的语言。
  AppLanguage get language;

  // ------------------------------------------------------------- 应用与通用

  /// 任务切换器里显示的应用名。
  String get appTitle;

  /// 抽屉右上角的关闭按钮提示。
  String get close;

  /// 复制按钮的提示。
  String get copy;

  // --------------------------------------------------------------- 主界面

  String get tagline;
  String get inputHint;
  String get loadingDictionary;
  String get clear;
  String get filterKanji;
  String get settings;

  /// 视图切换。
  String get viewAlignment;
  String get viewFurigana;
  String get viewVertical;
  String get romajiToggle;

  /// 朗读与发音。
  String get speak;
  String get speaking;

  /// 剪贴板快速粘贴。
  String get paste;

  /// 导出注音。
  String get export;
  String get exportRuby;
  String get exportBrackets;
  String get exportAnki;
  String get exportFavorites;
  String get favoritesExportTitle;
  String favoritesExportHint(int count);
  String get exportPlainText;
  String get copiedRuby;
  String get copiedBrackets;
  String get copiedAnki;

  /// 结果区底部。
  String get labelHiragana;
  String get labelPronunciation;
  String get copiedFullHiragana;
  String get copiedFullRomaji;
  String get copiedPronunciation;

  String dictionaryInitFailed(Object error);
  String analysisFailed(Object error);

  /// 空态下方的「收藏」词条区标题。
  String get favoritesLabel;

  /// 空态下方的「最近查询」词条区标题。
  String get historyLabel;

  /// 清空历史按钮。
  String get clearHistory;

  /// 收藏成功提示。
  String favoriteAdded(String query);

  /// 取消收藏提示。
  String favoriteRemoved(String query);

  /// 移除历史成功提示。
  String historyRemoved(String query);

  /// 清空历史成功提示。
  String get historyCleared;

  // ----------------------------------------------------------- 对照表 / 注音

  String get columnKanji;
  String get columnHiragana;
  String get columnRomaji;
  String get fullHiragana;
  String get fullRomaji;

  /// 词条上标出的读音差异, 如「读作 わ」。
  String get pronunciationShiftLabel;
  String copiedSurface(String surface);

  /// 词性标签。
  ///
  /// 原文来自 IPADIC 的日文分类 (名詞 / 動詞 / 助動詞 …);
  /// 英文界面下转换为英文, 未收录的分类原样保留。
  String posLabel(String pos);

  /// 词性细分标签。
  String posDetailLabel(String detail);

  /// 动词活用形原形提示。
  String baseForm(String form);

  /// 外来语词源。
  String get loanwordLabel;
  String loanwordOrigin(String source);

  // ------------------------------------------------------------- 单汉字

  String get onyomiHeading;
  String get kunyomiHeading;
  String get onyomiHint;
  String get kunyomiHint;
  String get onyomiBadge;
  String get kunyomiBadge;
  String get labelStrokes;
  String get labelGrade;
  String get labelFrequency;
  String get labelRadical;
  String get frequencyUnranked;
  String get gradeCommon;
  String get gradeNameUse;
  String get gradeOther;
  String gradeNumbered(int grade);
  String get collapse;
  String collapseHidden(int hidden);
  String get readingsNotFound;

  /// 常见词汇区标题。
  String get commonWordsHeading;

  /// 常见词汇区徽标 (词数)。
  String commonWordsBadge(int count);

  /// 同音汉字推荐标题。
  String get homophoneHeading;

  /// 同音汉字推荐提示。
  String get homophoneHint;

  /// 同音汉字推荐徽标 (字数)。
  String homophoneBadge(int count);

  /// 四字熟语区标题。
  String get yojijukugoHeading;

  /// 四字熟语区提示。
  String get yojijukugoHint;

  /// 四字熟语区徽标。
  String yojijukugoBadge(int count);

  // --------------------------------------------------------------- 筛选

  String get filterTitle;
  String get reset;
  String get viewResults;
  String get sectionSort;
  String get sectionStrokes;
  String get sectionFrequency;
  String get sectionRadical;
  String get allRadicals;
  String get radicalPickerTitle;
  String get radicalPickerSubtitle;
  String radicalStrokesGroup(int strokes);
  String get sectionReadings;
  String get sectionReadingSearch;
  String get readingSearchHint;
  String get sectionMeaningSearch;
  String get meaningSearchHint;
  String get sectionOther;
  String get any;
  String get min;
  String get max;
  String get blankMeansAny;
  String get rangeInverted;
  String get grade1;
  String get grade2;
  String get grade3;
  String get grade4;
  String get grade5;
  String get grade6;
  String get gradeCommonChip;
  String get gradeNameChip;

  /// 学年范围 (含端点) 的胶囊标签, 筛选抽屉与筛选结果页共用。
  ///
  /// 人名用汉字在字典里分 grade 9 与 10 两档, 合并为一个「人名」;
  /// (8, 8) 为「常用」档; 其余按端点拼接 (如「3年~4年」)。
  /// 单个学年的文案见 [grade1] 等字段。
  String gradeChipLabel(int min, int max) {
    if (min == 9) return gradeNameChip;
    if (min == 8) return gradeCommonChip;
    if (min == max) {
      return switch (min) {
        1 => grade1,
        2 => grade2,
        3 => grade3,
        4 => grade4,
        5 => grade5,
        6 => grade6,
        _ => gradeNameChip,
      };
    }
    return '${_gradeSingle(min)}~${_gradeSingle(max)}';
  }

  String _gradeSingle(int grade) => switch (grade) {
        1 => grade1,
        2 => grade2,
        3 => grade3,
        4 => grade4,
        5 => grade5,
        6 => grade6,
        8 => gradeCommonChip,
        _ => gradeNameChip,
      };

  /// 筛选项标签。
  ///
  /// 直接接收枚举并 switch 穷举 (不写 `_` 兜底): 枚举新增值后漏译
  /// 会编译报错, 与密封类其余部分的漏译检查对齐。
  String sortLabel(KanjiSort sort);
  String readingLabel(ReadingRequirement reading);
  String filterCount(int total);

  /// 筛选结果页的条件摘要 chip 标签。
  ///
  /// [min] / [max] 至少有一个非 null（两端都空时不调用）。
  String filterChipStrokes(int? min, int? max);
  String filterChipFrequency(int? min, int? max);
  String filterChipReading(String query);
  String filterChipMeaning(String query);
  String filterChipRadical(String radicalChar);

  // --------------------------------------------------------------- 筛选结果

  String get resultsTitle;
  String resultCount(int count);
  String get noResultsTitle;
  String get noResultsHint;
  String strokesShort(int strokes);

  /// 设置了频率区间时, 提示还有多少无频率排名的汉字被排除在外。
  String noRankExcluded(int count);

  // --------------------------------------------------------------- 设置

  /// 设置加载失败提示。
  String settingsLoadFailed(Object error);

  String get settingsSubtitle;
  String get sectionAppearance;
  String get sectionScreen;
  String get sectionLanguage;
  String get sectionOtherSettings;
  String get theme;
  String themeModeLabel(AppThemeMode mode);
  String get autoRotate;
  String get autoRotateOn;
  String get autoRotateOff;
  String get about;
  String get aboutSubtitle;

  // --------------------------------------------------------------- 关于页

  String aboutTitle(String version);
  String get versionLabel;
  String get buildLabel;
  String get packageLabel;
  String get repositoryLabel;
  String get repositoryCopied;
  String get licensesSection;
  String get licenseAppCode;
  String get licenseKanjiData;
  String get licenseAnalyzer;
  String get creditsSection;
  String get creditAnalyzer;
  String get creditKanjiData;
  String get creditTokenizerDict;
  String get creditFramework;
  String get offlineNotice;
}

/// 简体中文文案。
class ZhStrings extends AppStrings {
  const ZhStrings();

  @override
  AppLanguage get language => AppLanguage.zh;

  @override
  String get appTitle => '汉字假名对照';

  @override
  String get close => '关闭';

  @override
  String get copy => '复制';

  // --------------------------------------------------------------- 主界面

  @override
  String get tagline => '输入日语汉字，查看平假名与罗马音';

  @override
  String get inputHint => '输入日语汉字';

  @override
  String get loadingDictionary => '正在加载日语词典…';

  @override
  String get clear => '清空';

  @override
  String get filterKanji => '筛选汉字';

  @override
  String get settings => '设置';

  @override
  String get viewAlignment => '对照表';

  @override
  String get viewFurigana => '注音';

  @override
  String get viewVertical => '纵书';

  @override
  String get romajiToggle => '罗马音';

  @override
  String get speak => '朗读发音';

  @override
  String get speaking => '正在发音…';

  @override
  String get paste => '粘贴';

  @override
  String get export => '导出注音';

  @override
  String get exportRuby => 'HTML Ruby 格式 (<ruby>漢字<rt>かな</rt></ruby>)';

  @override
  String get exportBrackets => '括号注音格式 (漢字(かな))';

  @override
  String get exportAnki => 'Anki 牌组格式 (TSV 制表符分隔)';

  @override
  String get exportFavorites => '导出收藏 (Anki / TSV)';

  @override
  String get favoritesExportTitle => '收藏词条导出';

  @override
  String favoritesExportHint(int count) =>
      '包含 $count 条已收藏的汉字与词句，可一键复制并导入 Anki 或作为词表备份。';

  @override
  String get exportPlainText => '纯文本列表';

  @override
  String get copiedRuby => '已复制 HTML Ruby 注音文本';

  @override
  String get copiedBrackets => '已复制括号注音文本';

  @override
  String get copiedAnki => '已复制 Anki 牌组格式文本';

  @override
  String get labelHiragana => '平假名';

  @override
  String get labelPronunciation => '实际发音';

  @override
  String get copiedFullHiragana => '已复制全文平假名';

  @override
  String get copiedFullRomaji => '已复制全文罗马音';

  @override
  String get copiedPronunciation => '已复制发音';

  @override
  String dictionaryInitFailed(Object error) => '词典初始化失败: $error';

  @override
  String analysisFailed(Object error) => '解析失败: $error';

  @override
  String get favoritesLabel => '收藏';

  @override
  String get historyLabel => '最近查询';

  @override
  String get clearHistory => '清空';

  @override
  String favoriteAdded(String query) => '已收藏「$query」';

  @override
  String favoriteRemoved(String query) => '已取消收藏「$query」';

  @override
  String historyRemoved(String query) => '已移除历史「$query」';

  @override
  String get historyCleared => '已清空历史';

  // ----------------------------------------------------------- 对照表 / 注音

  @override
  String get columnKanji => '汉字 / 原词';

  @override
  String get columnHiragana => '平假名';

  @override
  String get columnRomaji => '罗马音';

  @override
  String get fullHiragana => '全文平假名';

  @override
  String get fullRomaji => '全文罗马音';

  @override
  String get pronunciationShiftLabel => '读作';

  @override
  String copiedSurface(String surface) => '已复制「$surface」';

  @override
  String posLabel(String pos) => pos;

  @override
  String posDetailLabel(String detail) => detail;

  @override
  String baseForm(String form) => '→ $form';

  @override
  String get loanwordLabel => '外来语';

  @override
  String loanwordOrigin(String source) => '外来语: $source';

  // ------------------------------------------------------------- 单汉字

  @override
  String get onyomiHeading => '音読';

  @override
  String get kunyomiHeading => '訓読';

  @override
  String get onyomiHint => '音读 · 音読み';

  @override
  String get kunyomiHint => '训读 · 訓読み';

  @override
  String get onyomiBadge => '汉音系';

  @override
  String get kunyomiBadge => '和语系';

  @override
  String get labelStrokes => '笔画';

  @override
  String get labelGrade => '学年';

  @override
  String get labelFrequency => '频率';

  @override
  String get labelRadical => '部首';

  @override
  String get frequencyUnranked => '无排名';

  @override
  String get gradeCommon => '常用';

  @override
  String get gradeNameUse => '人名用';

  @override
  String get gradeOther => '其它';

  @override
  String gradeNumbered(int grade) => '$grade 年级';

  @override
  String get collapse => '收起';

  @override
  String collapseHidden(int hidden) => '等 $hidden 项';

  @override
  String get readingsNotFound => '字典中未收录该字的音读 / 训读';

  @override
  String get commonWordsHeading => '常见词汇';

  @override
  String commonWordsBadge(int count) => '$count 词';

  @override
  String get homophoneHeading => '同音汉字';

  @override
  String get homophoneHint => '共享相同音读的常用汉字';

  @override
  String homophoneBadge(int count) => '$count 字';

  @override
  String get yojijukugoHeading => '四字熟語';

  @override
  String get yojijukugoHint => '四字熟语 · 常见成语搭配';

  @override
  String yojijukugoBadge(int count) => '$count 语';

  // --------------------------------------------------------------- 筛选

  @override
  String get filterTitle => '筛选';

  @override
  String get reset => '重置';

  @override
  String get viewResults => '查看结果';

  @override
  String get sectionSort => '排序';

  @override
  String get sectionStrokes => '笔画数';

  @override
  String get sectionFrequency => '使用频率';

  @override
  String get sectionRadical => '部首';

  @override
  String get allRadicals => '部首检字表…';

  @override
  String get radicalPickerTitle => '康熙 214 部首检字';

  @override
  String get radicalPickerSubtitle => '按部首笔画分类查字';

  @override
  String radicalStrokesGroup(int strokes) => '$strokes 画';

  @override
  String get sectionReadings => '读音构成';

  @override
  String get sectionReadingSearch => '按读音查';

  @override
  String get readingSearchHint => '输入平假名';

  @override
  String get sectionMeaningSearch => '按含义查';

  @override
  String get meaningSearchHint => '输入中文或英文释义';

  @override
  String get sectionOther => '其他';

  @override
  String get any => '不限';

  @override
  String get min => '最小';

  @override
  String get max => '最大';

  @override
  String get blankMeansAny => '留空不限';

  @override
  String get rangeInverted => '下限大于上限, 将没有结果';

  @override
  String get grade1 => '1年';

  @override
  String get grade2 => '2年';

  @override
  String get grade3 => '3年';

  @override
  String get grade4 => '4年';

  @override
  String get grade5 => '5年';

  @override
  String get grade6 => '6年';

  @override
  String get gradeCommonChip => '常用';

  @override
  String get gradeNameChip => '人名';

  @override
  String sortLabel(KanjiSort sort) => switch (sort) {
        KanjiSort.frequency => '使用频率',
        KanjiSort.strokes => '笔画数',
        KanjiSort.grade => '学年',
        KanjiSort.readingCount => '读音数量',
      };

  @override
  String readingLabel(ReadingRequirement reading) => switch (reading) {
        ReadingRequirement.any => '不限',
        ReadingRequirement.onyomiOnly => '仅音读',
        ReadingRequirement.kunyomiOnly => '仅训读',
        ReadingRequirement.both => '音训兼备',
      };

  @override
  String filterCount(int total) => '从 $total 个汉字中查找';

  @override
  String filterChipStrokes(int? min, int? max) {
    if (min != null && max != null) return '$min~$max 画';
    if (min != null) return '≥$min 画';
    return '≤${max!} 画';
  }

  @override
  String filterChipFrequency(int? min, int? max) {
    if (min != null && max != null) return '频率 $min~$max';
    if (min != null) return '频率 ≥$min';
    return '频率 ≤${max!}';
  }

  @override
  String filterChipReading(String query) => '读音 $query';

  @override
  String filterChipMeaning(String query) => '含义 $query';

  @override
  String filterChipRadical(String radicalChar) => '部首 $radicalChar';

  // --------------------------------------------------------------- 筛选结果

  @override
  String get resultsTitle => '筛选结果';

  @override
  String resultCount(int count) => '$count 字';

  @override
  String get noResultsTitle => '没有符合条件的汉字';

  @override
  String get noResultsHint => '试试放宽笔画或频率范围';

  @override
  String strokesShort(int strokes) => '$strokes画';

  @override
  String noRankExcluded(int count) => '另有 $count 个无频率排名的汉字未计入';

  // --------------------------------------------------------------- 设置

  @override
  String settingsLoadFailed(Object error) => '设置加载失败，本次修改将不会保存 ($error)';

  @override
  String get settingsSubtitle => '外观与行为';

  @override
  String get sectionAppearance => '主题';

  @override
  String get sectionScreen => '屏幕';

  @override
  String get sectionLanguage => '语言';

  @override
  String get sectionOtherSettings => '其他';

  @override
  String get theme => '主题';

  @override
  String themeModeLabel(AppThemeMode mode) => switch (mode) {
        AppThemeMode.light => '浅色',
        AppThemeMode.dark => '深色',
        AppThemeMode.system => '跟随系统',
      };

  @override
  String get autoRotate => '旋转屏幕';

  @override
  String get autoRotateOn => '跟随设备重力方向自动旋转';

  @override
  String get autoRotateOff => '固定为当前方向';

  @override
  String get about => '关于';

  @override
  String get aboutSubtitle => '版本、仓库、许可与致谢';

  // --------------------------------------------------------------- 关于页

  @override
  String aboutTitle(String version) => '漢字仮名 $version';

  @override
  String get versionLabel => '版本号';

  @override
  String get buildLabel => '构建号';

  @override
  String get packageLabel => '包名';

  @override
  String get repositoryLabel => '仓库';

  @override
  String get repositoryCopied => '已复制仓库地址';

  @override
  String get licensesSection => '许可';

  @override
  String get licenseAppCode => '应用代码';

  @override
  String get licenseKanjiData => '音读 / 训读 / 释义 / 笔画 / 学年数据';

  @override
  String get licenseAnalyzer => '分词、读音分析与常见词表';

  @override
  String get creditsSection => '致谢';

  @override
  String get creditAnalyzer => '形态素分析引擎 (纯 Dart 实现)';

  @override
  String get creditKanjiData => '汉字音读、训读与释义数据';

  @override
  String get creditTokenizerDict => '日语分词词典与常见词数据';

  @override
  String get creditFramework => '跨平台应用框架';

  @override
  String get offlineNotice => '本应用完全离线运行，不收集任何数据，不请求任何权限。';
}

/// English strings.
class EnStrings extends AppStrings {
  const EnStrings();

  @override
  AppLanguage get language => AppLanguage.en;

  @override
  String get appTitle => 'Kanji · Kana';

  @override
  String get close => 'Close';

  @override
  String get copy => 'Copy';

  // --------------------------------------------------------------- 主界面

  @override
  String get tagline => 'Type Japanese kanji to see hiragana and romaji';

  @override
  String get inputHint => 'Enter Japanese kanji';

  @override
  String get loadingDictionary => 'Loading Japanese dictionary…';

  @override
  String get clear => 'Clear';

  @override
  String get filterKanji => 'Filter kanji';

  @override
  String get settings => 'Settings';

  @override
  String get viewAlignment => 'Table';

  @override
  String get viewFurigana => 'Furigana';

  @override
  String get viewVertical => 'Vertical';

  @override
  String get romajiToggle => 'Romaji';

  @override
  String get speak => 'Listen';

  @override
  String get speaking => 'Speaking…';

  @override
  String get paste => 'Paste';

  @override
  String get export => 'Export';

  @override
  String get exportRuby => 'HTML Ruby format (<ruby>kanji<rt>kana</rt></ruby>)';

  @override
  String get exportBrackets => 'Bracket format (kanji(kana))';

  @override
  String get exportAnki => 'Anki Deck Format (TSV)';

  @override
  String get exportFavorites => 'Export Favorites (Anki / TSV)';

  @override
  String get favoritesExportTitle => 'Export Favorites';

  @override
  String favoritesExportHint(int count) =>
      'Contains $count saved kanji and phrases. Copy to import directly into Anki or backup as a list.';

  @override
  String get exportPlainText => 'Plain text list';

  @override
  String get copiedRuby => 'HTML Ruby text copied';

  @override
  String get copiedBrackets => 'Bracketed text copied';

  @override
  String get copiedAnki => 'Anki deck text copied';

  @override
  String get labelHiragana => 'Hiragana';

  @override
  String get labelPronunciation => 'Actual pronunciation';

  @override
  String get copiedFullHiragana => 'Full hiragana copied';

  @override
  String get copiedFullRomaji => 'Full romaji copied';

  @override
  String get copiedPronunciation => 'Pronunciation copied';

  @override
  String dictionaryInitFailed(Object error) =>
      'Failed to load dictionary: $error';

  @override
  String analysisFailed(Object error) => 'Analysis failed: $error';

  @override
  String get favoritesLabel => 'Favorites';

  @override
  String get historyLabel => 'Recent';

  @override
  String get clearHistory => 'Clear';

  @override
  String favoriteAdded(String query) => 'Added "$query" to favorites';

  @override
  String favoriteRemoved(String query) => 'Removed "$query" from favorites';

  @override
  String historyRemoved(String query) => 'Removed "$query" from history';

  @override
  String get historyCleared => 'History cleared';

  // ----------------------------------------------------------- 对照表 / 注音

  @override
  String get columnKanji => 'Kanji / Word';

  @override
  String get columnHiragana => 'Hiragana';

  @override
  String get columnRomaji => 'Romaji';

  @override
  String get fullHiragana => 'Full hiragana';

  @override
  String get fullRomaji => 'Full romaji';

  @override
  String get pronunciationShiftLabel => 'read as';

  @override
  String copiedSurface(String surface) => 'Copied "$surface"';

  @override
  String posLabel(String pos) => switch (pos) {
        '名詞' => 'noun',
        '動詞' => 'verb',
        '形容詞' => 'i-adj.',
        '形容動詞' => 'na-adj.',
        '副詞' => 'adverb',
        '助詞' => 'particle',
        '助動詞' => 'aux.',
        '連体詞' => 'adnominal',
        '接続詞' => 'conj.',
        '感動詞' => 'interj.',
        '接頭辞' => 'prefix',
        '接尾辞' => 'suffix',
        '記号' => 'symbol',
        'フィラー' => 'filler',
        'その他' => 'other',
        // 未收录的分类保留原文, 避免显示成空白。
        _ => pos,
      };

  @override
  String posDetailLabel(String detail) => switch (detail) {
        '一般' => 'general',
        '固有名詞' => 'proper',
        '副詞可能' => 'adverbial',
        'サ変接続' => 'suru-noun',
        '形容動詞語幹' => 'na-stem',
        '数' => 'num.',
        '自立' => 'main',
        '非自立' => 'aux.',
        '接続助詞' => 'conj.',
        '格助詞' => 'case',
        '係助詞' => 'binding',
        '副助詞' => 'adverbial',
        '終助詞' => 'final',
        '接尾' => 'suffix',
        '代名詞' => 'pronoun',
        '地域' => 'place',
        '人名' => 'person',
        '組織' => 'org.',
        _ => detail,
      };

  @override
  String baseForm(String form) => '→ $form';

  @override
  String get loanwordLabel => 'Loanword';

  @override
  String loanwordOrigin(String source) => 'Origin: $source';

  // ------------------------------------------------------------- 单汉字

  @override
  String get onyomiHeading => '音読';

  @override
  String get kunyomiHeading => '訓読';

  @override
  String get onyomiHint => "On'yomi · 音読み";

  @override
  String get kunyomiHint => "Kun'yomi · 訓読み";

  @override
  String get onyomiBadge => 'Sino-Japanese';

  @override
  String get kunyomiBadge => 'Native Japanese';

  @override
  String get labelStrokes => 'Strokes';

  @override
  String get labelGrade => 'Grade';

  @override
  String get labelFrequency => 'Frequency';

  @override
  String get labelRadical => 'Radical';

  @override
  String get frequencyUnranked => 'Unranked';

  @override
  String get gradeCommon => 'Common use';

  @override
  String get gradeNameUse => 'Name use';

  @override
  String get gradeOther => 'Other';

  /// 学年数值。
  ///
  /// 它总是跟 [labelGrade] 配对显示, 英文下 label 已含 "Grade",
  /// 这里只给数字, 否则会渲染成 "Grade Grade 1"。
  @override
  String gradeNumbered(int grade) => '$grade';

  @override
  String get collapse => 'Show less';

  @override
  String collapseHidden(int hidden) => 'and $hidden more';

  @override
  String get readingsNotFound =>
      'This character has no on\'yomi or kun\'yomi in the dictionary';

  @override
  String get commonWordsHeading => 'Common words';

  @override
  String commonWordsBadge(int count) => '$count words';

  @override
  String get homophoneHeading => 'Homophones';

  @override
  String get homophoneHint => 'Kanji sharing on\'yomi';

  @override
  String homophoneBadge(int count) => '$count kanji';

  @override
  String get yojijukugoHeading => 'Four-character Idioms';

  @override
  String get yojijukugoHint => 'Yojijukugo · Idioms with this kanji';

  @override
  String yojijukugoBadge(int count) => '$count idioms';

  // --------------------------------------------------------------- 筛选

  @override
  String get filterTitle => 'Filter';

  @override
  String get reset => 'Reset';

  @override
  String get viewResults => 'View results';

  @override
  String get sectionSort => 'Sort';

  @override
  String get sectionStrokes => 'Stroke count';

  @override
  String get sectionFrequency => 'Frequency';

  @override
  String get sectionRadical => 'Radical';

  @override
  String get allRadicals => '214 Radicals Table…';

  @override
  String get radicalPickerTitle => '214 Kangxi Radicals';

  @override
  String get radicalPickerSubtitle => 'Browse kanji by radical strokes';

  @override
  String radicalStrokesGroup(int strokes) => '$strokes strokes';

  @override
  String get sectionReadings => 'Readings';

  @override
  String get sectionReadingSearch => 'By reading';

  @override
  String get readingSearchHint => 'Enter hiragana';

  @override
  String get sectionMeaningSearch => 'By meaning';

  @override
  String get meaningSearchHint => 'Enter meaning';

  @override
  String get sectionOther => 'Other';

  @override
  String get any => 'Any';

  @override
  String get min => 'Min';

  @override
  String get max => 'Max';

  @override
  String get blankMeansAny => 'blank = any';

  @override
  String get rangeInverted => 'Min is above max — no results';

  @override
  String get grade1 => 'Gr.1';

  @override
  String get grade2 => 'Gr.2';

  @override
  String get grade3 => 'Gr.3';

  @override
  String get grade4 => 'Gr.4';

  @override
  String get grade5 => 'Gr.5';

  @override
  String get grade6 => 'Gr.6';

  @override
  String get gradeCommonChip => 'Common';

  @override
  String get gradeNameChip => 'Names';

  @override
  String sortLabel(KanjiSort sort) => switch (sort) {
        KanjiSort.frequency => 'Frequency',
        KanjiSort.strokes => 'Strokes',
        KanjiSort.grade => 'Grade',
        KanjiSort.readingCount => 'Readings',
      };

  @override
  String readingLabel(ReadingRequirement reading) => switch (reading) {
        ReadingRequirement.any => 'Any',
        ReadingRequirement.onyomiOnly => "On'yomi only",
        ReadingRequirement.kunyomiOnly => "Kun'yomi only",
        ReadingRequirement.both => 'Both',
      };

  @override
  String filterCount(int total) => 'Search $total kanji';

  @override
  String filterChipStrokes(int? min, int? max) {
    if (min != null && max != null) return '$min~$max str.';
    if (min != null) return '≥$min str.';
    return '≤${max!} str.';
  }

  @override
  String filterChipFrequency(int? min, int? max) {
    if (min != null && max != null) return 'Freq. $min~$max';
    if (min != null) return 'Freq. ≥$min';
    return 'Freq. ≤${max!}';
  }

  @override
  String filterChipReading(String query) => 'Reading $query';

  @override
  String filterChipMeaning(String query) => 'Meaning $query';

  @override
  String filterChipRadical(String radicalChar) => 'Radical $radicalChar';

  // --------------------------------------------------------------- 筛选结果

  @override
  String get resultsTitle => 'Results';

  @override
  String resultCount(int count) => '$count kanji';

  @override
  String get noResultsTitle => 'No kanji match these filters';

  @override
  String get noResultsHint => 'Try widening the stroke or frequency range';

  @override
  String strokesShort(int strokes) =>
      strokes == 1 ? '1 stroke' : '$strokes strokes';

  @override
  String noRankExcluded(int count) =>
      '$count more kanji without a frequency rank excluded';

  // --------------------------------------------------------------- 设置

  @override
  String settingsLoadFailed(Object error) =>
      'Failed to load settings; changes will not be saved ($error)';

  @override
  String get settingsSubtitle => 'Appearance & behavior';

  @override
  String get sectionAppearance => 'Theme';

  @override
  String get sectionScreen => 'Screen';

  @override
  String get sectionLanguage => 'Language';

  @override
  String get sectionOtherSettings => 'Other';

  @override
  String get theme => 'Theme';

  @override
  String themeModeLabel(AppThemeMode mode) => switch (mode) {
        AppThemeMode.light => 'Light',
        AppThemeMode.dark => 'Dark',
        AppThemeMode.system => 'System',
      };

  @override
  String get autoRotate => 'Auto-rotate';

  @override
  String get autoRotateOn => 'Follow device orientation';

  @override
  String get autoRotateOff => 'Locked to current orientation';

  @override
  String get about => 'About';

  @override
  String get aboutSubtitle => 'Version, repository, licenses & credits';

  // --------------------------------------------------------------- 关于页

  @override
  String aboutTitle(String version) => '漢字仮名 $version';

  @override
  String get versionLabel => 'Version';

  @override
  String get buildLabel => 'Build';

  @override
  String get packageLabel => 'Package';

  @override
  String get repositoryLabel => 'Repository';

  @override
  String get repositoryCopied => 'Repository URL copied';

  @override
  String get licensesSection => 'Licenses';

  @override
  String get licenseAppCode => 'Application code';

  @override
  String get licenseKanjiData =>
      "On'yomi / kun'yomi / meanings / strokes / grade data";

  @override
  String get licenseAnalyzer =>
      'Tokenization, reading analysis and common-word data';

  @override
  String get creditsSection => 'Credits';

  @override
  String get creditAnalyzer => 'Morphological analyzer (pure Dart)';

  @override
  String get creditKanjiData => "Kanji on'yomi, kun'yomi and meaning data";

  @override
  String get creditTokenizerDict =>
      'Japanese tokenization dictionary and common-word data';

  @override
  String get creditFramework => 'Cross-platform app framework';

  @override
  String get offlineNotice =>
      'This app runs entirely offline. It collects no data and requests no permissions.';
}

/// 把当前语言注入组件树。
///
/// 放在 [MaterialApp] 之上, 语言变化时整棵树重建。
class AppStringsScope extends InheritedWidget {
  final AppStrings strings;

  const AppStringsScope({
    super.key,
    required this.strings,
    required super.child,
  });

  @override
  bool updateShouldNotify(AppStringsScope oldWidget) =>
      oldWidget.strings.language != strings.language;
}
