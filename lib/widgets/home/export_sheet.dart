import 'package:flutter/material.dart';

import '../../core/morpheme.dart';
import '../../core/strings.dart';
import '../../theme.dart';
import '../feedback.dart';
import '../app_scopes.dart';

/// 弹出分析结果导出底部抽屉 (支持 HTML Ruby、括号注音、Anki 牌组导出)。
void showAnalysisExportSheet(BuildContext context, AnalysisResult result) {
  final s = AppStringsScope.of(context);
  final colors = AppTheme.of(context);

  showModalBottomSheet<void>(
    context: context,
    backgroundColor: colors.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (ctx) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.code_rounded, color: AppTheme.accent),
              title: Text(s.exportRuby),
              onTap: () {
                Navigator.pop(ctx);
                copyWithToast(context, result.toHtmlRuby, s.copiedRuby);
              },
            ),
            ListTile(
              leading: const Icon(Icons.notes_rounded, color: AppTheme.indigo),
              title: Text(s.exportBrackets),
              onTap: () {
                Navigator.pop(ctx);
                copyWithToast(
                  context,
                  result.toBracketAnnotation,
                  s.copiedBrackets,
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.style_outlined,
                color: AppTheme.kanjiHighlight,
              ),
              title: Text(s.exportAnki),
              onTap: () {
                Navigator.pop(ctx);
                final anki = result.toAnkiTsvFormatted(
                  sentenceTag: s.ankiTagSentence,
                  onyomiPrefix: s.ankiOnyomiPrefix,
                  kunyomiPrefix: s.ankiKunyomiPrefix,
                  noteFormatter: s.ankiNote,
                  baseFormPrefix: s.ankiBaseFormPrefix,
                  englishMeaning: s.language == AppLanguage.en,
                );
                copyWithToast(context, anki, s.copiedAnki);
              },
            ),
          ],
        ),
      ),
    ),
  );
}
