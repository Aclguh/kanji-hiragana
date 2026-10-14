import 'japanese_analyzer.dart' show kMaxInputLength;

/// 输入文本清洗与规范化工具。
///
/// 针对外部不可信输入 (系统划词 PROCESS_TEXT、剪贴板粘贴与用户输入)
/// 进行统一清洗，防止超长字符、控制字符与恶意格式字符对分析引擎与
/// 持久化存储产生干扰。
class InputSanitizer {
  InputSanitizer._();

  /// 双向控制字符与异常格式字符正则 (Bidi overrides, zero-width joiners 等)。
  ///
  /// 包括:
  /// - U+200B~U+200F (零宽空格、零宽连字、双向标识)
  /// - U+202A~U+202E (双向文本嵌入与覆盖)
  /// - U+2060~U+2064 (隐形分隔符)
  /// - U+2066~U+2069 (隔离控制符)
  /// - U+FEFF (BOM / 零宽不换行空格)
  static final RegExp _formatControlRegex = RegExp(
    r'[\u200B-\u200F\u202A-\u202E\u2060-\u2064\u2066-\u2069\uFEFF]',
  );

  /// C0/C1 控制字符正则 (保留 \r, \n, \t)。
  static final RegExp _c0ControlRegex = RegExp(r'[\x00-\x08\x0B\x0C\x0E-\x1F\x7F-\x9F]');

  /// 清洗输入文本:
  /// 1. 过滤双向格式与不可见控制字符;
  /// 2. 过滤 C0/C1 控制字符 (保留制表符与换行符);
  /// 3. 若超过 [maxLength]，截断至指定长度并清理两端空白。
  static String clean(
    String raw, {
    int maxLength = kMaxInputLength,
  }) {
    if (raw.isEmpty) return '';

    var sanitized = raw
        .replaceAll(_formatControlRegex, '')
        .replaceAll(_c0ControlRegex, '');

    sanitized = sanitized.trim();
    if (sanitized.length > maxLength) {
      sanitized = sanitized.substring(0, maxLength).trim();
    }
    return sanitized;
  }
}
