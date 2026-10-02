/// 应用版本元数据。
///
/// 手工维护的显示常量, 与 pubspec.yaml 的 `version: X.Y.Z+N` 保持一致;
/// `tool/verify.dart` 会断言两者同步, 改版本时漏改其中一处会直接失败。
/// 关于页据此展示版本与构建号。
class AppMeta {
  AppMeta._();

  /// 语义化版本 (pubspec 的 `version` 中 `+` 之前的部分)。
  static const String version = '1.1.1';

  /// 构建号 (pubspec 的 `version` 中 `+` 之后的 versionCode 基数)。
  static const String buildNumber = '6';
}
