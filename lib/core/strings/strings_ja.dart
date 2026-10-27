part of '../strings.dart';

/// 日本语文案。
class JaStrings extends AppStrings {
  const JaStrings();

  @override
  AppLanguage get language => AppLanguage.ja;

  @override
  String get appTitle => '漢字仮名';

  @override
  String get close => '閉じる';

  @override
  String get copy => 'コピー';

  // --------------------------------------------------------------- 主界面

  @override
  String get tagline => '漢字を入力して、ひらがなとローマ字を確認';

  @override
  String get inputHint => '日本語の漢字を入力';

  @override
  String inputExceededLimit(int limit) => '入力が長すぎるため、先頭 $limit 文字を分析します';

  @override
  String get loadingDictionary => '辞書を読み込み中…';

  @override
  String get clear => 'クリア';

  @override
  String get search => '検索';

  @override
  String get filterKanji => '漢字絞り込み';

  @override
  String get settings => '設定';

  @override
  String get viewAlignment => '対照表';

  @override
  String get viewFurigana => 'ルビ';

  @override
  String get viewVertical => '縦書き';

  @override
  String get romajiToggle => 'ローマ字';

  @override
  String get speak => '読み上げ';

  @override
  String get speaking => '発音中…';

  @override
  String get paste => '貼り付け';

  @override
  String get export => '書き出し';

  @override
  String get exportRuby => 'HTML ルビ形式 (<ruby>漢字<rt>かな</rt></ruby>)';

  @override
  String get exportBrackets => '括弧注記形式 (漢字(かな))';

  @override
  String get exportAnki => 'Anki デッキ形式 (TSV)';

  @override
  String get exportFavorites => 'お気に入りを書き出し (Anki / TSV)';

  @override
  String get favoritesExportTitle => 'お気に入り書き出し';

  @override
  String favoritesExportHint(int count) =>
      '$count 件のお気に入り漢字・フレーズが含まれています。コピーして Anki にインポートするかバックアップできます。';

  @override
  String get exportPlainText => 'テキスト一覧';

  @override
  String get exporting => '書き出し中...';

  @override
  String get copiedRuby => 'HTML ルビテキストをコピーしました';

  @override
  String get copiedBrackets => '括弧注記テキストをコピーしました';

  @override
  String get copiedAnki => 'Anki デッキ形式テキストをコピーしました';

  @override
  String copiedAnkiWithFailures(int count) =>
      'Anki デッキ形式テキストをコピーしました ($count 件解析失敗)';

  @override
  String get ankiAnalysisFailed => '解析失敗';

  @override
  String get ttsUnavailable =>
      '日本語音声エンジンが検出されませんでした。システム設定で音声データをインストールしてください。';

  @override
  String get ankiTagSentence => '文';

  @override
  String get ankiTagFavorite => 'お気に入り';

  @override
  String ankiBaseFormPrefix(String form) => '基本形: $form';

  @override
  String ankiOnyomiPrefix(String readings) => '音: $readings';

  @override
  String ankiKunyomiPrefix(String readings) => '訓: $readings';

  @override
  String ankiNote(int strokes, int rank) => '画数: $strokes | 頻度: $rank';

  @override
  String get labelHiragana => 'ひらがな';

  @override
  String get labelPronunciation => '発音';

  @override
  String get copiedFullHiragana => '全文ひらがなをコピーしました';

  @override
  String get copiedFullRomaji => '全文ローマ字をコピーしました';

  @override
  String get copiedPronunciation => '発音をコピーしました';

  @override
  String dictionaryInitFailed(Object error) => '辞書の初期化に失敗しました: $error';

  @override
  String analysisFailed(Object error) => '解析に失敗しました: $error';

  @override
  String settingsSaveFailed(Object error) =>
      '設定の保存に失敗しました。次回書き込み時に再試行します: $error';

  @override
  String get showAllResults => 'すべて表示';

  @override
  String get showLessResults => '折りたたむ';

  @override
  String longResultNotice(int shown, int total) =>
      'テキストが長いため、先頭 $shown 件を表示しています (全 $total 件)。';

  @override
  String allResultsShown(int total) => '全 $total 件を表示中。';

  @override
  String get favoritesLabel => 'お気に入り';

  @override
  String get historyLabel => '最近の検索';

  @override
  String get clearHistory => '消去';

  @override
  String favoriteAdded(String query) => '「$query」をお気に入りに追加しました';

  @override
  String favoriteRemoved(String query) => '「$query」をお気に入りから削除しました';

  @override
  String historyRemoved(String query) => '「$query」を履歴から削除しました';

  @override
  String get historyCleared => '履歴を消去しました';

  // ----------------------------------------------------------- 对照表 / 注音

  @override
  String get columnKanji => '漢字 / 表層形';

  @override
  String get columnHiragana => 'ひらがな';

  @override
  String get columnRomaji => 'ローマ字';

  @override
  String get fullHiragana => '全文ひらがな';

  @override
  String get fullRomaji => '全文ローマ字';

  @override
  String get pronunciationShiftLabel => '発音';

  @override
  String copiedSurface(String surface) => '「$surface」をコピーしました';

  @override
  String posLabel(String pos) => pos;

  @override
  String posDetailLabel(String detail) => detail;

  @override
  String baseForm(String form) => '→ $form';

  @override
  String get loanwordLabel => '外来語';

  @override
  String loanwordOrigin(String source) => '外来語: $source';

  // ------------------------------------------------------------- 单汉字

  @override
  String get onyomiHeading => '音読';

  @override
  String get kunyomiHeading => '訓読';

  @override
  String get onyomiHint => '音読み';

  @override
  String get kunyomiHint => '訓読み';

  @override
  String get onyomiBadge => '漢音系';

  @override
  String get kunyomiBadge => '和語系';

  @override
  String get labelStrokes => '画数';

  @override
  String get labelGrade => '学年';

  @override
  String get labelFrequency => '頻度';

  @override
  String get labelRadical => '部首';

  @override
  String get frequencyUnranked => 'ランク外';

  @override
  String get gradeCommon => '常用';

  @override
  String get gradeNameUse => '人名用';

  @override
  String get gradeOther => 'その他';

  @override
  String gradeNumbered(int grade) => '$grade 年';

  @override
  String get collapse => '閉じる';

  @override
  String collapseHidden(int hidden) => '他 $hidden 件';

  @override
  String get readingsNotFound => '辞書に音読み・訓読みの収録がありません';

  @override
  String get commonWordsHeading => 'よく使われる単語';

  @override
  String commonWordsBadge(int count) => '$count 語';

  @override
  String get homophoneHeading => '同音の漢字';

  @override
  String get homophoneHint => '同じ音読みまたは訓読みを持つ常用漢字';

  @override
  String homophoneBadge(int count) => '$count 字';

  @override
  String get yojijukugoHeading => '四字熟語';

  @override
  String get yojijukugoHint => 'この漢字を含む四字熟語';

  @override
  String yojijukugoBadge(int count) => '$count 語';

  // --------------------------------------------------------------- 筛选

  @override
  String get filterTitle => '絞り込み';

  @override
  String get reset => 'リセット';

  @override
  String get viewResults => '結果を表示';

  @override
  String get sectionSort => '並び替え';

  @override
  String get sectionStrokes => '画数';

  @override
  String get sectionFrequency => '使用頻度';

  @override
  String get sectionRadical => '部首';

  @override
  String get allRadicals => '部首一覧…';

  @override
  String get radicalPickerTitle => '康熙 214 部首一覧';

  @override
  String get radicalPickerSubtitle => '部首の画数から漢字を検索';

  @override
  String radicalStrokesGroup(int strokes) => '$strokes 画';

  @override
  String get sectionReadings => '読み構成';

  @override
  String get sectionReadingSearch => '読みで検索';

  @override
  String get readingSearchHint => 'ひらがなを入力';

  @override
  String get sectionMeaningSearch => '意味で検索';

  @override
  String get meaningSearchHint => '意味・キーワードを入力';

  @override
  String get sectionOther => 'その他';

  @override
  String get any => '指定なし';

  @override
  String get min => '最小';

  @override
  String get max => '最大';

  @override
  String get blankMeansAny => '空欄は指定なし';

  @override
  String get rangeInverted => '下限が上限を超えているため、結果はありません';

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
        KanjiSort.frequency => '使用頻度',
        KanjiSort.strokes => '画数',
        KanjiSort.grade => '学年',
        KanjiSort.readingCount => '読みの数',
      };

  @override
  String readingLabel(ReadingRequirement reading) => switch (reading) {
        ReadingRequirement.any => '指定なし',
        ReadingRequirement.onyomiOnly => '音読みのみ',
        ReadingRequirement.kunyomiOnly => '訓読みのみ',
        ReadingRequirement.both => '音訓両方',
      };

  @override
  String filterCount(int total) => '$total 字から検索';

  @override
  String filterChipStrokes(int? min, int? max) {
    if (min != null && max != null) return '$min~$max 画';
    if (min != null) return '≥$min 画';
    if (max != null) return '≤$max 画';
    return '';
  }

  @override
  String filterChipFrequency(int? min, int? max) {
    if (min != null && max != null) return '頻度 $min~$max';
    if (min != null) return '頻度 ≥$min';
    if (max != null) return '頻度 ≤$max';
    return '';
  }

  @override
  String filterChipReading(String query) => '読み $query';

  @override
  String filterChipMeaning(String query) => '意味 $query';

  @override
  String filterChipRadical(String radicalChar) => '部首 $radicalChar';

  // --------------------------------------------------------------- 筛选结果

  @override
  String get resultsTitle => '検索結果';

  @override
  String resultCount(int count) => '$count 字';

  @override
  String get noResultsTitle => '条件に一致する漢字がありません';

  @override
  String get noResultsHint => '画数や頻度の条件を広げてみてください';

  @override
  String strokesShort(int strokes) => '$strokes画';

  @override
  String noRankExcluded(int count) => '他に頻度ランクのない漢字 $count 字は除外されています';

  // --------------------------------------------------------------- 设置

  @override
  String settingsLoadFailed(Object error) =>
      '設定の読み込みに失敗しました。今回の変更は保存されません ($error)';

  @override
  String get settingsSubtitle => '表示と動作';

  @override
  String get sectionAppearance => 'テーマ';

  @override
  String get sectionScreen => '画面';

  @override
  String get sectionLanguage => '言語';

  @override
  String get sectionOtherSettings => 'その他';

  @override
  String get theme => 'テーマ';

  @override
  String themeModeLabel(AppThemeMode mode) => switch (mode) {
        AppThemeMode.light => 'ライト',
        AppThemeMode.dark => 'ダーク',
        AppThemeMode.system => 'システムに従う',
      };

  @override
  String get autoRotate => '画面の自動回転';

  @override
  String get autoRotateOn => '端末の向きに合わせて自動回転';

  @override
  String get autoRotateOff => '現在の向きに固定';

  @override
  String get about => 'このアプリについて';

  @override
  String get aboutSubtitle => 'バージョン、リポジトリ、ライセンス、謝辞';

  // --------------------------------------------------------------- 关于页

  @override
  String aboutTitle(String version) => '漢字仮名 $version';

  @override
  String get versionLabel => 'バージョン';

  @override
  String get buildLabel => 'ビルド番号';

  @override
  String get packageLabel => 'パッケージ名';

  @override
  String get repositoryLabel => 'リポジトリ';

  @override
  String get repositoryCopied => 'リポジトリ URL をコピーしました';

  @override
  String get licensesSection => 'ライセンス';

  @override
  String get diagnosticsSection => '診断情報';

  @override
  String get exportDiagnostics => '診断情報をコピー';

  @override
  String get diagnosticsHint => 'エラー種別とスタックトレースのみを含み、検索内容は含みません';

  @override
  String get diagnosticsCopied => '診断情報をコピーしました';

  @override
  String get diagnosticsEmpty => '診断ログはありません';

  @override
  String get analysisFailedGeneric => '解析に失敗しました。もう一度お試しください。';

  @override
  String get licenseAppCode => 'アプリケーションコード';

  @override
  String get licenseKanjiData => '音読み / 訓読み / 意味 / 画数 / 学年データ';

  @override
  String get licenseAnalyzer => '形態素解析、読み分析および頻出語彙データ';

  @override
  String get licenseOpenCc => '簡体字・新字体変換マッピング表';

  @override
  String get creditsSection => '謝辞';

  @override
  String get creditAnalyzer => '形態素解析エンジン (純 Dart 実装)';

  @override
  String get creditKanjiData => '漢字の音読み・訓読み・意味データ';

  @override
  String get creditTokenizerDict => '日本語分かち書き辞書および頻出語彙データ';

  @override
  String get creditOpenCc => '漢字字体変換辞書データ';

  @override
  String get creditFramework => 'クロスプラットフォームアプリフレームワーク';

  @override
  String get offlineNotice =>
      '本アプリ自体はネットワーク通信を行わず、データを収集せず、ネットワーク権限も要求しません。音声合成は端末の TTS エンジンによって処理されます。';
}
