part of '../strings.dart';

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
  String inputExceededLimit(int limit) => '输入过长，已截取前 $limit 字进行分析';

  @override
  String get loadingDictionary => '正在加载日语词典…';

  @override
  String get clear => '清空';

  @override
  String get search => '查询';

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
  String get exporting => '正在导出...';

  @override
  String get copiedRuby => '已复制 HTML Ruby 注音文本';

  @override
  String get copiedBrackets => '已复制括号注音文本';

  @override
  String get copiedAnki => '已复制 Anki 牌组格式文本';

  @override
  String copiedAnkiWithFailures(int count) => '已复制 Anki 牌组格式文本，其中 $count 条解析失败';

  @override
  String get ankiAnalysisFailed => '解析失败';

  @override
  String get ttsUnavailable => '未检测到系统日语语音引擎，请在系统设置中安装 TTS 语音数据';

  @override
  String get ankiTagSentence => '完整句';

  @override
  String get ankiTagFavorite => '收藏词条';

  @override
  String ankiBaseFormPrefix(String form) => '原形: $form';

  @override
  String ankiOnyomiPrefix(String readings) => '音: $readings';

  @override
  String ankiKunyomiPrefix(String readings) => '训: $readings';

  @override
  String ankiNote(int strokes, int rank) => '笔画: $strokes | 频率: $rank';

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
  String settingsSaveFailed(Object error) => '本地保存失败，将在下次写入时重试: $error';

  @override
  String get showAllResults => '显示全部';

  @override
  String get showLessResults => '只看前段';

  @override
  String longResultNotice(int shown, int total) =>
      '文本较长，当前仅显示前 $shown 项，共 $total 项。';

  @override
  String allResultsShown(int total) => '已显示全部 $total 项。';

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
  String get homophoneHint => '共享相同音读或训读的常用汉字';

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
    if (max != null) return '≤$max 画';
    return '';
  }

  @override
  String filterChipFrequency(int? min, int? max) {
    if (min != null && max != null) return '频率 $min~$max';
    if (min != null) return '频率 ≥$min';
    if (max != null) return '频率 ≤$max';
    return '';
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
  String get diagnosticsSection => '诊断';

  @override
  String get exportDiagnostics => '复制诊断信息';

  @override
  String get diagnosticsHint => '仅包含错误类型与堆栈，不包含查询内容';

  @override
  String get diagnosticsCopied => '诊断信息已复制';

  @override
  String get diagnosticsEmpty => '暂无诊断记录';

  @override
  String get analysisFailedGeneric => '解析失败，请重试';

  @override
  String get licenseAppCode => '应用代码';

  @override
  String get licenseKanjiData => '音读 / 训读 / 释义 / 笔画 / 学年数据';

  @override
  String get licenseAnalyzer => '分词、读音分析与常见词表';

  @override
  String get licenseOpenCc => '简中转换日文新字体映射表';

  @override
  String get creditsSection => '致谢';

  @override
  String get creditAnalyzer => '形态素分析引擎 (纯 Dart 实现)';

  @override
  String get creditKanjiData => '汉字音读、训读与释义数据';

  @override
  String get creditTokenizerDict => '日语分词词典与常见词数据';

  @override
  String get creditOpenCc => '汉字字形转换对照表规范支持';

  @override
  String get creditFramework => '跨平台应用框架';

  @override
  String get offlineNotice =>
      '本应用自身不发起网络请求、不收集数据、不申请网络权限。发音由系统 TTS 引擎处理，是否联网取决于所选的系统引擎。';
}
