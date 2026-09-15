import 'package:flutter/material.dart';

/// 应用配色与主题。
///
/// 提供浅色与深色两套和风配色, 通过 [themeMode] 决定实际使用哪一套。
///
/// 配色取自日本传统色: 朱红(朱色)作主色, 靛蓝(藍色)作次色,
/// 若草(若草色)作汉字高亮。
class AppTheme {
  AppTheme._();

  // ---------------------------------------------------------------------------
  // 品牌色 (浅深两套共用, 仅在深色下略作提亮以保证对比度)
  // ---------------------------------------------------------------------------

  /// 主色: 朱红。
  static const Color accent = Color(0xFFE5534B);

  /// 次色: 靛蓝。
  static const Color indigo = Color(0xFF5B7FB5);

  /// 强调色: 若草 (用于汉字高亮)。
  static const Color kanjiHighlight = Color(0xFFFFC857);

  // ---------------------------------------------------------------------------
  // 深色配色
  // ---------------------------------------------------------------------------

  static const Color darkBg = Color(0xFF14151A);
  static const Color darkSurface = Color(0xFF1D1F26);
  static const Color darkSurfaceVariant = Color(0xFF262832);
  static const Color darkBorder = Color(0xFF33363F);
  static const Color darkTextPrimary = Color(0xFFF2F3F5);
  static const Color darkTextSecondary = Color(0xFF9BA0AC);

  // ---------------------------------------------------------------------------
  // 浅色配色 (米白纸感底 + 墨色文字)
  // ---------------------------------------------------------------------------

  static const Color lightBg = Color(0xFFF7F5F0);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceVariant = Color(0xFFEFEDE7);
  static const Color lightBorder = Color(0xFFDDD9D0);
  static const Color lightTextPrimary = Color(0xFF1F2228);
  static const Color lightTextSecondary = Color(0xFF6B7280);

  /// 浅色下汉字高亮改用更深的琥珀色, 保证在米白底上可读。
  static const Color lightKanjiHighlight = Color(0xFFB8860B);

  // ---------------------------------------------------------------------------
  // 主题构建
  // ---------------------------------------------------------------------------

  /// 当前生效的配色。
  ///
  /// 由 [MaterialApp] 在切换到对应主题时写入; 组件侧请优先使用
  /// `AppTheme.of(context)`, 它在主题变化时会自动重建。
  static AppColors _current = const AppColors._dark();

  static AppColors get colors => _current;

  /// 读取当前主题配色。
  ///
  /// 从 [Theme.of] 取 [AppColors](一个 [ThemeExtension]), 因此主题切换时
  /// 依赖它的组件会自动重建。
  static AppColors of(BuildContext context) {
    return Theme.of(context).extension<AppColors>() ?? _current;
  }

  static ThemeData dark() {
    const colors = AppColors._dark();
    return _build(
      brightness: Brightness.dark,
      colors: colors,
      base: ThemeData.dark(useMaterial3: true),
    );
  }

  static ThemeData light() {
    const colors = AppColors._light();
    return _build(
      brightness: Brightness.light,
      colors: colors,
      base: ThemeData.light(useMaterial3: true),
    );
  }

  static ThemeData _build({
    required Brightness brightness,
    required AppColors colors,
    required ThemeData base,
  }) {
    // 切换主题时同步全局配色, 供暂无 context 的场合读取。
    _current = colors;
    return base.copyWith(
      scaffoldBackgroundColor: colors.bg,
      colorScheme: base.colorScheme.copyWith(
        brightness: brightness,
        primary: accent,
        secondary: indigo,
        surface: colors.surface,
        onSurface: colors.textPrimary,
      ),
      extensions: [colors],
      appBarTheme: AppBarTheme(
        backgroundColor: colors.bg,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: colors.textPrimary),
        titleTextStyle: TextStyle(
          color: colors.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.surface,
        hintStyle: TextStyle(color: colors.textSecondary, fontSize: 15),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colors.border),
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
        backgroundColor: colors.surfaceVariant,
        contentTextStyle: TextStyle(color: colors.textPrimary),
        behavior: SnackBarBehavior.floating,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      dividerColor: colors.border,
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return Colors.white;
          return colors.textSecondary;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return accent;
          return colors.surfaceVariant;
        }),
        trackOutlineColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return accent;
          return colors.border;
        }),
      ),
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

/// 一套完整的语义化配色。
///
/// 组件不应直接引用 [AppTheme.darkBg] 之类的常量, 而应通过
/// `AppTheme.of(context)` 读取, 这样切换主题时界面会自动跟随。
class AppColors extends ThemeExtension<AppColors> {
  final Color bg;
  final Color surface;
  final Color surfaceVariant;
  final Color border;
  final Color textPrimary;
  final Color textSecondary;
  final Color kanjiHighlight;
  final Color scrim;

  /// 由 [copyWith] / [lerp] 使用的全字段构造。
  const AppColors._raw({
    required this.bg,
    required this.surface,
    required this.surfaceVariant,
    required this.border,
    required this.textPrimary,
    required this.textSecondary,
    required this.kanjiHighlight,
    required this.scrim,
  });

  const AppColors._dark()
      : bg = AppTheme.darkBg,
        surface = AppTheme.darkSurface,
        surfaceVariant = AppTheme.darkSurfaceVariant,
        border = AppTheme.darkBorder,
        textPrimary = AppTheme.darkTextPrimary,
        textSecondary = AppTheme.darkTextSecondary,
        kanjiHighlight = AppTheme.kanjiHighlight,
        scrim = const Color(0xCC000000);

  const AppColors._light()
      : bg = AppTheme.lightBg,
        surface = AppTheme.lightSurface,
        surfaceVariant = AppTheme.lightSurfaceVariant,
        border = AppTheme.lightBorder,
        textPrimary = AppTheme.lightTextPrimary,
        textSecondary = AppTheme.lightTextSecondary,
        kanjiHighlight = AppTheme.lightKanjiHighlight,
        scrim = const Color(0x99000000);

  /// 是否处于深色模式 (用于需要按亮度微调的场合)。
  bool get isDark => bg == AppTheme.darkBg;

  /// 主题切换时的插值, 让配色随 [AnimatedTheme] 平滑过渡。
  @override
  AppColors copyWith({
    Color? bg,
    Color? surface,
    Color? surfaceVariant,
    Color? border,
    Color? textPrimary,
    Color? textSecondary,
    Color? kanjiHighlight,
    Color? scrim,
  }) {
    return AppColors._raw(
      bg: bg ?? this.bg,
      surface: surface ?? this.surface,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      border: border ?? this.border,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      kanjiHighlight: kanjiHighlight ?? this.kanjiHighlight,
      scrim: scrim ?? this.scrim,
    );
  }

  @override
  AppColors lerp(covariant AppColors? other, double t) {
    if (other == null) return this;
    return AppColors._raw(
      bg: Color.lerp(bg, other.bg, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceVariant:
          Color.lerp(surfaceVariant, other.surfaceVariant, t)!,
      border: Color.lerp(border, other.border, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary:
          Color.lerp(textSecondary, other.textSecondary, t)!,
      kanjiHighlight:
          Color.lerp(kanjiHighlight, other.kanjiHighlight, t)!,
      scrim: Color.lerp(scrim, other.scrim, t)!,
    );
  }
}
