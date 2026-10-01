// VectorIcon 的像素回归 (golden) 测试: 手绘矢量路径的几何魔法数字
// 一旦被误改, 这里以像素级差异显式失败。
//
// golden 基线与宿主平台的栅格化相关, 跨平台不保证逐字节一致 ——
// CI (Linux) 默认跳过, 需要时本地显式运行:
//   运行:     GOLDEN=1 flutter test test/golden_test.dart
//   更新基线: GOLDEN=1 flutter test --update-goldens test/golden_test.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kanji_hiragana/theme.dart';
import 'package:kanji_hiragana/widgets/vector_icon.dart';

void main() {
  final goldenEnabled = Platform.environment['GOLDEN'] == '1';

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
      matchesGoldenFile('goldens/vector_icon_settings.png'),
    );
  }, skip: !goldenEnabled);

  testWidgets('放大镜图标几何回归', (tester) async {
    const key = ValueKey('search');
    await pumpIcon(tester, DrawerIconType.search, key);
    await expectLater(
      find.byKey(key),
      matchesGoldenFile('goldens/vector_icon_search.png'),
    );
  }, skip: !goldenEnabled);
}
