/// 形态素分析链路的类型化失败。
///
/// 调用方按类型判断是否可重试, 不再匹配异常字符串; 原始异常保留在
/// [cause] 中, 仅用于诊断, 不作为控制流依据。
sealed class AnalyzerFailure implements Exception {
  const AnalyzerFailure({required this.message, this.cause});

  final String message;
  final Object? cause;

  bool get retryable;

  @override
  String toString() => '$runtimeType: $message';
}

/// 分词 isolate 尚未完成握手或词典构建。
final class AnalyzerNotReady extends AnalyzerFailure {
  const AnalyzerNotReady([Object? cause])
      : super(message: 'analyzer is not ready', cause: cause);

  @override
  bool get retryable => true;
}

/// 常驻分词 isolate 已退出。
final class AnalyzerIsolateExited extends AnalyzerFailure {
  const AnalyzerIsolateExited([Object? cause])
      : super(message: 'tokenizer isolate exited', cause: cause);

  @override
  bool get retryable => true;
}

/// 单次请求在约定时间内没有回信。
final class AnalyzerTimeout extends AnalyzerFailure {
  AnalyzerTimeout(this.timeout, [Object? cause])
      : super(
          message:
              'analysis request timed out after ${timeout.inMilliseconds}ms',
          cause: cause,
        );

  final Duration timeout;

  @override
  bool get retryable => true;
}

/// 分词 isolate 内部抛出的业务错误。
final class AnalyzerTokenizeError extends AnalyzerFailure {
  const AnalyzerTokenizeError({required super.message, super.cause});

  @override
  bool get retryable => false;
}
