import 'package:flutter/material.dart';

/// 应用配色与主题。
///
/// 采用深色和风配色: 墨黑底 + 朱红主色 + 米白文字。
class AppTheme {
  AppTheme._();

  /// 主色: 朱红(日本传统「朱色」)。
  static const Color accent = Color(0xFFE5534B);

  /// 次色: 靛蓝(日本传统「藍色」)。
  static const Color indigo = Color(0xFF5B7FB5);

  /// 强调色: 若草(用于汉字高亮)。
  static const Color kanjiHighlight = Color(0xFFFFC857);

  static const Color bg = Color(0xFF14151A);
  static const Color surface = Color(0xFF1D1F26);
  static const Color surfaceVariant = Color(0xFF262832);
  static const Color border = Color(0xFF33363F);
  static const Color textPrimary = Color(0xFFF2F3F5);
  static const Color textSecondary = Color(0xFF9BA0AC);

  static ThemeData dark() {
    final base = ThemeData.dark(useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: bg,
      colorScheme: base.colorScheme.copyWith(
        primary: accent,
        secondary: indigo,
        surface: surface,
        onSurface: textPrimary,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: bg,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surface,
        hintStyle: const TextStyle(color: textSecondary, fontSize: 15),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: accent, width: 1.5),
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: accent,
        selectionColor: Color(0x55E5534B),
        selectionHandleColor: accent,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: surfaceVariant,
        contentTextStyle: const TextStyle(color: textPrimary),
        behavior: SnackBarBehavior.floating,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      dividerColor: border,
    );
  }

  /// 日文内容统一使用等宽感更强的字体栈, 保证假名与汉字清晰。
  static const List<String> japaneseFontFallback = [
    'Noto Sans JP',
    'Noto Sans CJK JP',
    'Yu Gothic',
    'Meiryo',
    'MS Gothic',
  ];
}
