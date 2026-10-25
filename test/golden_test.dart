// golden 基线与宿主平台的栅格化相关, 因此按平台分目录存放:
//   test/goldens/windows/...
//   test/goldens/linux/...
// 本地默认跳过, CI 以 GOLDEN=1 在 Linux 上强制运行。
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kanji_hiragana/theme.dart';
import 'package:kanji_hiragana/widgets/vector_icon.dart';

void main() {
  final goldenEnabled = Platform.environment['GOLDEN'] == '1';

  String goldenPath(String name) =>
      'goldens/${Platform.operatingSystem}/$name';

  Future<void> pumpIcon(
    WidgetTester tester,
    DrawerIconType type,
    Key key,
  ) async {
    await tester.pumpWidget(
      RepaintBoundary(
        key: key,
        child: Container(
          color: AppTheme.darkSurface,
          padding: const EdgeInsets.all(8),
          child: VectorIcon(
            type: type,
            size: 48,
            color: AppTheme.darkTextPrimary,
          ),
        ),
      ),
    );
  }

  testWidgets('齿轮图标几何回归', (tester) async {
    const key = ValueKey('gear');
    await pumpIcon(tester, DrawerIconType.settings, key);
    await expectLater(
      find.byKey(key),
      matchesGoldenFile(goldenPath('vector_icon_settings.png')),
    );
  }, skip: !goldenEnabled);

  testWidgets('放大镜图标几何回归', (tester) async {
    const key = ValueKey('search');
    await pumpIcon(tester, DrawerIconType.search, key);
    await expectLater(
      find.byKey(key),
      matchesGoldenFile(goldenPath('vector_icon_search.png')),
    );
  }, skip: !goldenEnabled);
}
