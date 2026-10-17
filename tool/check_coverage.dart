// 测试覆盖率质量门禁检查脚本
// 解析 coverage/lcov.info，验证核心代码行覆盖率是否达到质量红线 (>= 75%)。
// 用法: dart run tool/check_coverage.dart [minCoveragePercent]

import 'dart:io';

void main(List<String> args) {
  final lcovFile = File('coverage/lcov.info');
  if (!lcovFile.existsSync()) {
    print('错误: 未找到 coverage/lcov.info 文件。请先执行 flutter test --coverage');
    exit(1);
  }

  final minCoverage = args.isNotEmpty ? (double.tryParse(args[0]) ?? 75.0) : 75.0;

  final lines = lcovFile.readAsLinesSync();
  int totalFound = 0;
  int totalHit = 0;

  String? currentFile;
  int currentFound = 0;
  int currentHit = 0;

  final fileStats = <String, double>{};

  for (final line in lines) {
    if (line.startsWith('SF:')) {
      currentFile = line.substring(3).replaceAll(r'\', '/');
      currentFound = 0;
      currentHit = 0;
    } else if (line.startsWith('LF:')) {
      currentFound = int.tryParse(line.substring(3)) ?? 0;
    } else if (line.startsWith('LH:')) {
      currentHit = int.tryParse(line.substring(3)) ?? 0;
    } else if (line == 'end_of_record') {
      if (currentFile != null) {
        // 排除自动生成的大型字典数据文件 (与 AGENTS.md 约定一致，禁止手改的文件不计入业务代码覆盖率)
        final isGenerated = currentFile.contains('kanji_reading_dict.dart') ||
            currentFile.contains('kanji_words_dict.dart');
        if (!isGenerated && currentFound > 0) {
          totalFound += currentFound;
          totalHit += currentHit;
          final pct = (currentHit / currentFound) * 100;
          fileStats[currentFile] = pct;
        }
      }
      currentFile = null;
    }
  }

  if (totalFound == 0) {
    print('错误: 未找到任何有效覆盖率统计行。');
    exit(1);
  }

  final coveragePct = (totalHit / totalFound) * 100;
  print('========================================');
  print('代码覆盖率门禁检查 (门槛: ${minCoverage.toStringAsFixed(1)}%):');
  print('有效代码总行数 (LF): $totalFound');
  print('覆盖命中行数   (LH): $totalHit');
  print('业务代码覆盖率     : ${coveragePct.toStringAsFixed(2)}%');
  print('========================================');

  if (coveragePct < minCoverage) {
    print('FAIL: 覆盖率 ${coveragePct.toStringAsFixed(2)}% 低于目标门槛 ${minCoverage.toStringAsFixed(1)}%！');
    exit(1);
  } else {
    print('PASS: 覆盖率检查通过！');
    exit(0);
  }
}
