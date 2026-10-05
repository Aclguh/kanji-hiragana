import 'package:flutter/material.dart';

import '../core/kanji_reading_dict.dart';
import '../core/strings.dart';
import '../theme.dart';
import 'feedback.dart';

/// 收藏夹生词本导出为 Anki / TSV 格式的弹窗。
class AnkiExportSheet extends StatelessWidget {
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

  String _generateAnkiTsv() {
    final buffer = StringBuffer();
    // 写入表头 (供 Anki 自动映射字段)
    buffer.writeln('#separator:tab');
    buffer.writeln('#html:true');
    buffer.writeln('#tags:kanji_hiragana');

    for (final text in favorites) {
      final trimmed = text.trim();
      if (trimmed.isEmpty) continue;

      // 若为单汉字, 注入丰富的音训读与释义
      final reading = kanjiReadingDict[trimmed];
      if (reading != null) {
        final readings = [
          if (reading.onyomi.isNotEmpty) '音: ${reading.onyomi.join("、")}',
          if (reading.kunyomi.isNotEmpty) '训: ${reading.kunyomi.join("、")}',
        ].join(' / ');
        final meanings = reading.meanings.join('；');
        final note = '笔画: ${reading.strokes} | 频率: ${reading.frequencyRank}';
        buffer.writeln('$trimmed\t$readings\t\t$meanings\t$note');
      } else {
        // 多字词条
        buffer.writeln('$trimmed\t\t\t收藏词条\t');
      }
    }
    return buffer.toString().trimRight();
  }

  String _generatePlainText() {
    return favorites.join('\n');
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
                      '${s.favoritesExportTitle} (${favorites.length})',
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
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                s.favoritesExportHint(favorites.length),
                style: TextStyle(
                  color: colors.textSecondary,
                  fontSize: 13,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 18),
              FilledButton.icon(
                icon: const Icon(Icons.copy_rounded, size: 18),
                label: Text(s.exportAnki),
                style: FilledButton.styleFrom(
                  backgroundColor: AppTheme.accent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  copyWithToast(context, _generateAnkiTsv(), s.copiedAnki);
                },
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
                onPressed: () {
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
