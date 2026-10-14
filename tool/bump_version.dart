// 一键同步更新版本号工具:
// 自动同步 pubspec.yaml、lib/core/app_meta.dart 以及 integration_test/ui_test.dart
// 用法: dart run tool/bump_version.dart 1.1.2+7

import 'dart:io';

void main(List<String> args) {
  if (args.isEmpty || !RegExp(r'^\d+\.\d+\.\d+\+\d+$').hasMatch(args[0])) {
    print('用法: dart run tool/bump_version.dart <version>+<buildNumber>');
    print('示例: dart run tool/bump_version.dart 1.1.2+7');
    exit(1);
  }

  final fullVersion = args[0];
  final parts = fullVersion.split('+');
  final semver = parts[0];
  final buildNumber = parts[1];

  final pubspecFile = File('pubspec.yaml');
  final metaFile = File('lib/core/app_meta.dart');
  final uiTestFile = File('integration_test/ui_test.dart');

  if (!pubspecFile.existsSync() || !metaFile.existsSync()) {
    print('错误: 请在项目根目录下运行此脚本。');
    exit(1);
  }

  // 1. 更新 pubspec.yaml
  final pubspecContent = pubspecFile.readAsStringSync();
  final oldPubspecMatch = RegExp(r'version:\s*(\d+\.\d+\.\d+)\+(\d+)').firstMatch(pubspecContent);
  if (oldPubspecMatch == null) {
    print('错误: 未在 pubspec.yaml 中找到有效版本定义。');
    exit(1);
  }
  final oldSemver = oldPubspecMatch.group(1)!;

  final newPubspec = pubspecContent.replaceFirst(
    RegExp(r'version:\s*\d+\.\d+\.\d+\+\d+'),
    'version: $fullVersion',
  );
  pubspecFile.writeAsStringSync(newPubspec);
  print('OK  已更新 pubspec.yaml -> version: $fullVersion');

  // 2. 更新 lib/core/app_meta.dart
  final metaContent = metaFile.readAsStringSync();
  var newMeta = metaContent.replaceFirst(
    RegExp(r"static const String version = '[^']+';"),
    "static const String version = '$semver';",
  );
  newMeta = newMeta.replaceFirst(
    RegExp(r"static const String buildNumber = '[^']+';"),
    "static const String buildNumber = '$buildNumber';",
  );
  metaFile.writeAsStringSync(newMeta);
  print('OK  已更新 lib/core/app_meta.dart -> version: $semver, build: $buildNumber');

  // 3. 更新 integration_test/ui_test.dart (若存在)
  if (uiTestFile.existsSync()) {
    final uiTestContent = uiTestFile.readAsStringSync();
    final newUiTest = uiTestContent.replaceAll(
      "find.text('$oldSemver')",
      "find.text('$semver')",
    );
    uiTestFile.writeAsStringSync(newUiTest);
    print('OK  已更新 integration_test/ui_test.dart -> 断言 $semver');
  }

  print('\n开始执行数据与断言同步验证: dart run tool/verify.dart ...');
  final result = Process.runSync(
    Platform.resolvedExecutable,
    ['run', 'tool/verify.dart'],
  );
  stdout.write(result.stdout);
  stderr.write(result.stderr);

  if (result.exitCode == 0) {
    print('\n版本号已成功全量同步且验证通过: $fullVersion');
  } else {
    print('\n验证失败，请核对断言结果。');
    exit(result.exitCode);
  }
}
