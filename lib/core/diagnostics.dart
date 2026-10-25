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

  void record(
    String module,
    Object error, {
    StackTrace? stackTrace,
    String? message,
  }) {
    _entries.add(
      DiagnosticEntry(
        time: DateTime.now(),
        module: module,
        errorType: error.runtimeType.toString(),
        message: message ?? error.toString(),
        stackTrace: stackTrace?.toString(),
      ),
    );
    while (_entries.length > maxEntries) {
      _entries.removeFirst();
    }
  }

  void clear() => _entries.clear();

  /// 导出为纯文本。导出时不包含任何用户输入。
  String export() {
    if (_entries.isEmpty) return '';
    return _entries.map((e) => e.toText()).join('\n');
  }
}
