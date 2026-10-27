part of '../strings.dart';

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
  String inputExceededLimit(int limit) =>
      'Input exceeds limit, truncated to first $limit characters';

  @override
  String get loadingDictionary => 'Loading Japanese dictionary…';

  @override
  String get clear => 'Clear';

  @override
  String get search => 'Search';

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
  String get exporting => 'Exporting...';

  @override
  String get copiedRuby => 'HTML Ruby text copied';

  @override
  String get copiedBrackets => 'Bracketed text copied';

  @override
  String get copiedAnki => 'Anki deck text copied';

  @override
  String copiedAnkiWithFailures(int count) =>
      'Anki deck text copied; $count entries could not be analyzed';

  @override
  String get ankiAnalysisFailed => 'Analysis failed';

  @override
  String get ttsUnavailable =>
      'Japanese TTS engine not available. Please install speech data in system settings.';

  @override
  String get ankiTagSentence => 'Full sentence';

  @override
  String get ankiTagFavorite => 'Saved item';

  @override
  String ankiBaseFormPrefix(String form) => 'Base: $form';

  @override
  String ankiOnyomiPrefix(String readings) => 'On: $readings';

  @override
  String ankiKunyomiPrefix(String readings) => 'Kun: $readings';

  @override
  String ankiNote(int strokes, int rank) => 'Strokes: $strokes | Frequency: $rank';

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
  String settingsSaveFailed(Object error) =>
      'Local save failed; it will be retried on the next write: $error';

  @override
  String get showAllResults => 'Show all';

  @override
  String get showLessResults => 'Show less';

  @override
  String longResultNotice(int shown, int total) =>
      'Long input: showing the first $shown of $total items.';

  @override
  String allResultsShown(int total) => 'All $total items are shown.';

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
  String get homophoneHint => 'Kanji sharing on\'yomi or kun\'yomi';

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
    if (max != null) return '≤$max str.';
    return '';
  }

  @override
  String filterChipFrequency(int? min, int? max) {
    if (min != null && max != null) return 'Freq. $min~$max';
    if (min != null) return 'Freq. ≥$min';
    if (max != null) return 'Freq. ≤$max';
    return '';
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
  String get diagnosticsSection => 'Diagnostics';

  @override
  String get exportDiagnostics => 'Copy diagnostics';

  @override
  String get diagnosticsHint =>
      'Error types and stack traces only; query text is excluded';

  @override
  String get diagnosticsCopied => 'Diagnostics copied';

  @override
  String get diagnosticsEmpty => 'No diagnostic entries';

  @override
  String get analysisFailedGeneric => 'Analysis failed. Please try again.';

  @override
  String get licenseAppCode => 'Application code';

  @override
  String get licenseKanjiData =>
      "On'yomi / kun'yomi / meanings / strokes / grade data";

  @override
  String get licenseAnalyzer =>
      'Tokenization, reading analysis and common-word data';

  @override
  String get licenseOpenCc =>
      'Simplified Chinese to Japanese Shinjitai conversion mapping';

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
  String get creditOpenCc =>
      'Chinese-to-Japanese Kanji conversion dataset support';

  @override
  String get creditFramework => 'Cross-platform app framework';

  @override
  String get offlineNotice =>
      'This app makes no network requests, collects no data and requests no network permission. Speech is handled by the system TTS engine; whether it uses the network depends on that engine.';
}
