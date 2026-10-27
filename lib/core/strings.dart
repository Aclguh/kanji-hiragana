import 'kanji_filter.dart';
import 'settings.dart';

part 'strings/strings_zh.dart';
part 'strings/strings_en.dart';

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
  String inputExceededLimit(int limit);
  String get loadingDictionary;
  String get clear;
  String get search;
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
  String get exporting;
  String get copiedRuby;
  String get copiedBrackets;
  String get copiedAnki;
  String copiedAnkiWithFailures(int count);
  String get ankiAnalysisFailed;
  String get ttsUnavailable;
  String get ankiTagSentence;
  String get ankiTagFavorite;
  String ankiBaseFormPrefix(String form);
  String ankiOnyomiPrefix(String readings);
  String ankiKunyomiPrefix(String readings);
  String ankiNote(int strokes, int rank);

  /// 结果区底部。
  String get labelHiragana;
  String get labelPronunciation;
  String get copiedFullHiragana;
  String get copiedFullRomaji;
  String get copiedPronunciation;

  String dictionaryInitFailed(Object error);
  String analysisFailed(Object error);
  String settingsSaveFailed(Object error);
  String get showAllResults;
  String get showLessResults;
  String longResultNotice(int shown, int total);
  String allResultsShown(int total);

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
  String get diagnosticsSection;
  String get exportDiagnostics;
  String get diagnosticsHint;
  String get diagnosticsCopied;
  String get diagnosticsEmpty;
  String get analysisFailedGeneric;
  String get licenseAppCode;
  String get licenseKanjiData;
  String get licenseAnalyzer;
  String get licenseOpenCc;
  String get creditsSection;
  String get creditAnalyzer;
  String get creditKanjiData;
  String get creditTokenizerDict;
  String get creditOpenCc;
  String get creditFramework;
  String get offlineNotice;
}
