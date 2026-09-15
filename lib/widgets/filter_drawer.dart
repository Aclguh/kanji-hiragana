import 'package:flutter/material.dart';

import '../core/kanji_filter.dart';
import '../core/kanji_reading_dict.dart';
import '../theme.dart';
import 'sliding_drawer.dart';

/// 筛选抽屉内容: 按笔画 / 频率 / 学年 / 读音构成筛选。
///
/// 选择条件后点「查看结果」进入全屏筛选界面。
class FilterDrawerContent extends StatefulWidget {
  /// 当前生效的条件 (用于初始化界面)。
  final KanjiFilter initial;

  /// 点「查看结果」时回调。
  final ValueChanged<KanjiFilter> onSubmit;

  const FilterDrawerContent({
    super.key,
    required this.initial,
    required this.onSubmit,
  });

  @override
  State<FilterDrawerContent> createState() => _FilterDrawerContentState();
}

class _FilterDrawerContentState extends State<FilterDrawerContent> {
  late KanjiFilter _filter = widget.initial;

  static const _strokePresets = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 15, 20];
  static const _gradeOptions = <int>[1, 2, 3, 4, 5, 6, 8, 9, 10];
  static const _freqOptions = <int?>[100, 500, 1000, 2500, null];

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    return DrawerPanel(
      side: DrawerSide.left,
      title: '筛选',
      subtitle: '从 ${_total()} 个汉字中查找',
      // 操作区固定在底部, 不随筛选条件滚动。
      footer: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: _filter.isUnfiltered
                  ? null
                  : () => setState(() => _filter = KanjiFilter.initial),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 13),
                foregroundColor: colors.textSecondary,
                side: BorderSide(color: colors.border),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('重置'),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: FilledButton(
              onPressed: () => widget.onSubmit(_filter),
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 13),
                backgroundColor: AppTheme.accent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('查看结果'),
            ),
          ),
        ],
      ),
      children: [
        // 排序
        const DrawerSectionLabel('排序'),
        _buildSortChips(),
        const SizedBox(height: 22),

        // 笔画
        const DrawerSectionLabel('笔画数'),
        _buildStrokeChips(),
        const SizedBox(height: 22),

        // 使用频率
        const DrawerSectionLabel('使用频率'),
        _buildFreqChips(),
        const SizedBox(height: 22),

        // 学年
        const DrawerSectionLabel('学年'),
        _buildGradeChips(),
        const SizedBox(height: 22),

        // 读音构成
        const DrawerSectionLabel('读音构成'),
        _buildReadingChips(),
      ],
    );
  }

  int _total() => kanjiReadingDict.length;

  Widget _buildSortChips() {
    return _chipWrap(
      KanjiSort.values.map((s) {
        return _Chip(
          label: s.label,
          selected: _filter.sort == s,
          onTap: () => setState(() => _filter = _filter.copyWith(sort: s)),
        );
      }).toList(),
    );
  }

  Widget _buildStrokeChips() {
    return _chipWrap([
      ..._strokePresets.map((n) {
        final selected =
            _filter.strokesMin == n && _filter.strokesMax == n;
        return _Chip(
          label: '$n',
          selected: selected,
          onTap: () => setState(() {
            _filter = selected
                ? _filter.copyWith(clearStrokes: true)
                : _filter.copyWith(strokesMin: n, strokesMax: n);
          }),
        );
      }),
      _Chip(
        label: '不限',
        selected: _filter.strokesMin == null && _filter.strokesMax == null,
        onTap: () => setState(
            () => _filter = _filter.copyWith(clearStrokes: true)),
      ),
    ]);
  }

  Widget _buildFreqChips() {
    return _chipWrap(
      _freqOptions.map((n) {
        final selected = _filter.frequencyMax == n;
        return _Chip(
          label: n == null ? '不限' : '前 $n',
          selected: selected,
          onTap: () => setState(() {
            _filter = n == null
                ? _filter.copyWith(clearFrequency: true)
                : _filter.copyWith(frequencyMax: n);
          }),
        );
      }).toList(),
    );
  }

  Widget _buildGradeChips() {
    return _chipWrap([
      ..._gradeOptions.map((g) {
        final selected = _filter.gradeMin == g && _filter.gradeMax == g;
        return _Chip(
          label: _gradeLabel(g),
          selected: selected,
          onTap: () => setState(() {
            _filter = selected
                ? _filter.copyWith(clearGrade: true)
                : _filter.copyWith(gradeMin: g, gradeMax: g);
          }),
        );
      }),
      _Chip(
        label: '不限',
        selected: _filter.gradeMin == null && _filter.gradeMax == null,
        onTap: () =>
            setState(() => _filter = _filter.copyWith(clearGrade: true)),
      ),
    ]);
  }

  static String _gradeLabel(int g) => switch (g) {
        1 || 2 || 3 || 4 || 5 || 6 => '$g年',
        8 => '常用',
        9 || 10 => '人名',
        _ => '$g',
      };

  Widget _buildReadingChips() {
    return _chipWrap(
      ReadingRequirement.values.map((r) {
        return _Chip(
          label: r.label,
          selected: _filter.reading == r,
          onTap: () =>
              setState(() => _filter = _filter.copyWith(reading: r)),
        );
      }).toList(),
    );
  }

  Widget _chipWrap(List<Widget> chips) {
    return Wrap(spacing: 8, runSpacing: 8, children: chips);
  }
}

/// 可选中的胶囊按钮。
class _Chip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _Chip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: selected
              ? AppTheme.accent.withValues(alpha: 0.15)
              : colors.surfaceVariant,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: selected ? AppTheme.accent : colors.border,
            width: selected ? 1.4 : 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? AppTheme.accent : colors.textSecondary,
            fontSize: 13,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
