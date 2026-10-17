import 'package:flutter/material.dart';

import '../core/japanese_analyzer.dart';
import '../core/kanji_reading_dict.dart';
import '../core/kanji_services.dart';
import '../core/morpheme.dart';
import '../core/strings.dart';
import '../theme.dart';
import 'feedback.dart';

/// 收藏夹生词本导出为 Anki / TSV 格式的弹窗。
class AnkiExportSheet extends StatefulWidget {
  final List<String> favorites;

  const AnkiExportSheet({
    super.key,
    required this.favorites,
  });

  static void show(BuildContext context, {required List<String> favorites}) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => AnkiExportSheet(favorites: favorites),
    );
  }

  @override
  State<AnkiExportSheet> createState() => _AnkiExportSheetState();
}

class _AnkiExportSheetState extends State<AnkiExportSheet> {
  bool _isExporting = false;

  Future<String> _generateAnkiTsv(
    AppStrings s,
    JapaneseAnalyzer analyzer,
  ) async {
    final buffer = StringBuffer();
    // 写入表头 (供 Anki 自动映射字段)
    buffer.writeln('#separator:tab');
    buffer.writeln('#html:true');
    buffer.writeln('#tags:kanji_hiragana');

    final trimmedFavorites = <String>[];
    for (final text in widget.favorites) {
      final trimmed = text.trim();
      if (trimmed.isNotEmpty) {
        trimmedFavorites.add(trimmed);
      }
    }

    // 区分单汉字与多字短语: 多字短语集中进行批量形态素分析
    final multiWordIndices = <int>[];
    final multiWordTexts = <String>[];
    for (var i = 0; i < trimmedFavorites.length; i++) {
      final text = trimmedFavorites[i];
      if (kanjiReadingDict[text] == null) {
        multiWordIndices.add(i);
        multiWordTexts.add(text);
      }
    }

    final multiWordAnalysis = <int, AnalysisResult>{};
    if (multiWordTexts.isNotEmpty) {
      try {
        final batchResults = await analyzer.analyzeBatch(multiWordTexts);
        for (var j = 0; j < multiWordTexts.length; j++) {
          if (j < batchResults.length) {
            multiWordAnalysis[multiWordIndices[j]] = batchResults[j];
          }
        }
      } catch (_) {
        // 分词失败时容错降级
      }
    }

    for (var i = 0; i < trimmedFavorites.length; i++) {
      final trimmed = trimmedFavorites[i];
      // 若为单汉字, 注入丰富的音训读与释义
      final reading = kanjiReadingDict[trimmed];
      if (reading != null) {
        final readings = [
          if (reading.onyomi.isNotEmpty)
            s.ankiOnyomiPrefix(reading.onyomi.join('、')),
          if (reading.kunyomi.isNotEmpty)
            s.ankiKunyomiPrefix(reading.kunyomi.join('、')),
        ].join(' / ');
        final meanings = AnalysisResult.escapeTsvField(
          s.language == AppLanguage.en && reading.meaningsEn.isNotEmpty
              ? reading.meaningsEn.join('; ')
              : reading.meanings.join('；'),
        );
        final note = s.ankiNote(reading.strokes, reading.frequencyRank);
        buffer.writeln(
          '${AnalysisResult.escapeTsvField(trimmed)}\t${AnalysisResult.escapeTsvField(readings)}\t\t$meanings\t$note',
        );
      } else {
        // 多字词条: 从批量分析结果中提取假名、罗马音与词性
        final res = multiWordAnalysis[i];
        if (res != null) {
          final hira = AnalysisResult.escapeTsvField(res.fullHiragana);
          final romaji = AnalysisResult.escapeTsvField(res.fullRomaji);
          final posList = res.morphemes
              .map((m) => m.partOfSpeech)
              .where((p) => p.isNotEmpty)
              .toSet();
          final pos = posList.isNotEmpty
              ? AnalysisResult.escapeTsvField(
                  posList.map(s.posLabel).join('/'),
                )
              : s.ankiTagFavorite;
          buffer.writeln(
            '${AnalysisResult.escapeTsvField(trimmed)}\t$hira\t$romaji\t$pos\t${s.ankiTagFavorite}',
          );
        } else {
          buffer.writeln(
            '${AnalysisResult.escapeTsvField(trimmed)}\t\t\t${s.ankiTagFavorite}\t',
          );
        }
      }
    }
    return buffer.toString().trimRight();
  }

  String _generatePlainText() {
    return widget.favorites.join('\n');
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final s = AppStrings.of(context);

    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        border: Border.all(color: colors.border),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${s.favoritesExportTitle} (${widget.favorites.length})',
                      style: TextStyle(
                        color: colors.textPrimary,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close_rounded),
                    color: colors.textSecondary,
                    tooltip: s.close,
                    onPressed: _isExporting ? null : () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                s.favoritesExportHint(widget.favorites.length),
                style: TextStyle(
                  color: colors.textSecondary,
                  fontSize: 13,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 18),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: AppTheme.accent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _isExporting
                    ? null
                    : () async {
                        setState(() => _isExporting = true);
                        final analyzer = KanjiServices.of(context).analyzer;
                        final tsv = await _generateAnkiTsv(s, analyzer);
                        if (!context.mounted) return;
                        Navigator.of(context).pop();
                        copyWithToast(context, tsv, s.copiedAnki);
                      },
                child: _isExporting
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(s.exporting),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.copy_rounded, size: 18),
                          const SizedBox(width: 8),
                          Text(s.exportAnki),
                        ],
                      ),
              ),
              const SizedBox(height: 10),
              OutlinedButton.icon(
                icon: const Icon(Icons.list_alt_rounded, size: 18),
                label: Text('${s.copy} ${s.exportPlainText}'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: colors.textPrimary,
                  side: BorderSide(color: colors.border),
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _isExporting
                    ? null
                    : () {
                        Navigator.of(context).pop();
                        copyWithToast(context, _generatePlainText(), s.copy);
                      },
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
