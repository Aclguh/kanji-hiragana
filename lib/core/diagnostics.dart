import 'dart:collection';

/// 一条本地诊断记录。
///
/// 不记录用户输入正文、收藏内容或剪贴板数据, 只保留模块、错误类型与堆栈,
/// 用于用户主动导出后定位问题。
class DiagnosticEntry {
  final DateTime time;
  final String module;
  final String errorType;
  final String message;
  final String? stackTrace;

  const DiagnosticEntry({
    required this.time,
    required this.module,
    required this.errorType,
    required this.message,
    this.stackTrace,
  });

  String toText() {
    final buffer = StringBuffer()
      ..writeln('${time.toIso8601String()} [$module] $errorType')
      ..writeln(message);
    if (stackTrace != null && stackTrace!.isNotEmpty) {
      buffer.writeln(stackTrace);
    }
    return buffer.toString();
  }
}

/// 固定容量的本地环形诊断日志。
///
/// 应用常驻单例, 只保存在内存中; 不自动上传, 不写磁盘。
class DiagnosticsLog {
  DiagnosticsLog._();

  static final DiagnosticsLog instance = DiagnosticsLog._();

  static const int maxEntries = 100;

  final Queue<DiagnosticEntry> _entries = Queue<DiagnosticEntry>();

  List<DiagnosticEntry> get entries => List.unmodifiable(_entries);

  bool get isEmpty => _entries.isEmpty;

  /// 匹配连续中日文字符串 (长度>=3), 自动脱敏为 [REDACTED_TEXT]。
  static final RegExp _cjkRegex = RegExp(
    r'[぀-ヿ㐀-䶿一-鿿豈-﫿]{3,}',
  );

  /// 匹配引号内的文本片段并脱敏, 避免异常信息中携带具体输入。
  static final RegExp _quotedRegex = RegExp(r"""['"][^'"]{2,}['"]""");

  /// 针对异常信息进行敏感内容自动脱敏。
  static String sanitizeMessage(String raw) {
    if (raw.isEmpty) return raw;
    var sanitized = raw.replaceAllMapped(
      _quotedRegex,
      (_) => '"[REDACTED]"',
    );
    sanitized = sanitized.replaceAllMapped(
      _cjkRegex,
      (_) => '[REDACTED_TEXT]',
    );
    return sanitized;
  }

  void record(
    String module,
    Object error, {
    StackTrace? stackTrace,
    String? message,
  }) {
    final rawMsg = message ?? error.toString();
    final cleanMsg = sanitizeMessage(rawMsg);
    _entries.add(
      DiagnosticEntry(
        time: DateTime.now(),
        module: module,
        errorType: error.runtimeType.toString(),
        message: cleanMsg,
        stackTrace: stackTrace?.toString(),
      ),
    );
    while (_entries.length > maxEntries) {
      _entries.removeFirst();
    }
  }

  void clear() => _entries.clear();

  /// 导出为纯文本。导出时附带防泄密头部且内容已自动脱敏。
  String export() {
    if (_entries.isEmpty) return '';
    final buffer = StringBuffer()
      ..writeln('=== Kanji-Hiragana Diagnostics Log ===')
      ..writeln('Notice: User text and sensitive tokens are automatically redacted.')
      ..writeln('--------------------------------------')
      ..writeln(_entries.map((e) => e.toText()).join('\n'));
    return buffer.toString();
  }
}
