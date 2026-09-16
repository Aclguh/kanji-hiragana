import 'package:flutter/material.dart';

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
    return context
            .dependOnInheritedWidgetOfExactType<AppStringsScope>()
            ?.strings ??
        const ZhStrings();
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
  String get romajiToggle;

  /// 结果区底部。
  String get labelHiragana;
  String get labelPronunciation;
  String get copiedFullHiragana;
  String get copiedPronunciation;

  String dictionaryInitFailed(Object error);
  String analysisFailed(Object error);

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
  String get gradeCommon;
  String get gradeNameUse;
  String get gradeOther;
  String gradeNumbered(int grade);
  String get collapse;
  String collapseHidden(int hidden);
  String get readingsNotFound;

  // --------------------------------------------------------------- 筛选

  String get filterTitle;
  String get reset;
  String get viewResults;
  String get sectionSort;
  String get sectionStrokes;
  String get sectionFrequency;
  String get sectionReadings;
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

  /// 筛选项标签。
  String sortLabel(String sortName);
  String readingLabel(String readingName);
  String filterCount(int total);

  // --------------------------------------------------------------- 筛选结果

  String get resultsTitle;
  String resultCount(int count);
  String get noResultsTitle;
  String get noResultsHint;
  String strokesShort(int strokes);

  // --------------------------------------------------------------- 设置

  String get settingsSubtitle;
  String get sectionAppearance;
  String get sectionScreen;
  String get sectionLanguage;
  String get sectionOtherSettings;
  String get theme;
  String themeModeLabel(String modeName);
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
  String get romajiToggle => '罗马音';

  @override
  String get labelHiragana => '平假名';

  @override
  String get labelPronunciation => '实际发音';

  @override
  String get copiedFullHiragana => '已复制全文平假名';

  @override
  String get copiedPronunciation => '已复制发音';

  @override
  String dictionaryInitFailed(Object error) => '词典初始化失败: $error';

  @override
  String analysisFailed(Object error) => '解析失败: $error';

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
  String get sectionReadings => '读音构成';

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
  String sortLabel(String sortName) => switch (sortName) {
        'frequency' => '使用频率',
        'strokes' => '笔画数',
        'grade' => '学年',
        _ => '读音数量',
      };

  @override
  String readingLabel(String readingName) => switch (readingName) {
        'onyomiOnly' => '仅音读',
        'kunyomiOnly' => '仅训读',
        'both' => '音训兼备',
        _ => '不限',
      };

  @override
  String filterCount(int total) => '从 $total 个汉字中查找';

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

  // --------------------------------------------------------------- 设置

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
  String themeModeLabel(String modeName) => switch (modeName) {
        'light' => '浅色',
        'dark' => '深色',
        _ => '跟随系统',
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
  String get licenseAnalyzer => '分词与读音分析';

  @override
  String get creditsSection => '致谢';

  @override
  String get creditAnalyzer => '形态素分析引擎 (纯 Dart 实现)';

  @override
  String get creditKanjiData => '汉字音读、训读与释义数据';

  @override
  String get creditTokenizerDict => '日语分词词典';

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
  String get romajiToggle => 'Romaji';

  @override
  String get labelHiragana => 'Hiragana';

  @override
  String get labelPronunciation => 'Actual pronunciation';

  @override
  String get copiedFullHiragana => 'Full hiragana copied';

  @override
  String get copiedPronunciation => 'Pronunciation copied';

  @override
  String dictionaryInitFailed(Object error) =>
      'Failed to load dictionary: $error';

  @override
  String analysisFailed(Object error) => 'Analysis failed: $error';

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
  String get sectionReadings => 'Readings';

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
  String sortLabel(String sortName) => switch (sortName) {
        'frequency' => 'Frequency',
        'strokes' => 'Strokes',
        'grade' => 'Grade',
        _ => 'Readings',
      };

  @override
  String readingLabel(String readingName) => switch (readingName) {
        'onyomiOnly' => "On'yomi only",
        'kunyomiOnly' => "Kun'yomi only",
        'both' => 'Both',
        _ => 'Any',
      };

  @override
  String filterCount(int total) => 'Search $total kanji';

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

  // --------------------------------------------------------------- 设置

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
  String themeModeLabel(String modeName) => switch (modeName) {
        'light' => 'Light',
        'dark' => 'Dark',
        _ => 'System',
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
  String get licenseAnalyzer => 'Tokenization and reading analysis';

  @override
  String get creditsSection => 'Credits';

  @override
  String get creditAnalyzer => 'Morphological analyzer (pure Dart)';

  @override
  String get creditKanjiData => "Kanji on'yomi, kun'yomi and meaning data";

  @override
  String get creditTokenizerDict => 'Japanese tokenization dictionary';

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
