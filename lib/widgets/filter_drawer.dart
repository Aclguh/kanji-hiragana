import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/kanji_filter.dart';
import '../core/kanji_reading_dict.dart';
import '../theme.dart';
import 'sliding_drawer.dart';

/// 筛选抽屉内容: 按笔画 / 频率 / 读音构成 / 其他筛选。
///
/// 笔画与使用频率都以「下限 ~ 上限」两个可输入框表达, 留空表示该端不限。
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

  // 两个范围各有一对输入框, 控制器放在 State 里, 便于「重置」时一并清空。
  late final _strokeMin = TextEditingController(
    text: _filter.strokesMin?.toString() ?? '',
  );
  late final _strokeMax = TextEditingController(
    text: _filter.strokesMax?.toString() ?? '',
  );
  late final _freqMin = TextEditingController(
    text: _filter.frequencyMin?.toString() ?? '',
  );
  late final _freqMax = TextEditingController(
    text: _filter.frequencyMax?.toString() ?? '',
  );

  /// 笔画数的实际取值范围 (由字典统计得出)。
  static const _strokeDomain = '1 ~ 29';

  /// 使用频率的实际取值范围 (无排名的汉字靠 99999 标记, 已单独排除)。
  static const _freqDomain = '1 ~ 10000';

  /// 学年选项: 标签 + 对应的 grade 区间。
  ///
  /// 人名用汉字在字典里分 grade 9 与 10 两档, 合并成一个「人名」选项,
  /// 否则会出现两个同名胶囊。
  static const _gradeOptions = <(String, int, int)>[
    ('1年', 1, 1),
    ('2年', 2, 2),
    ('3年', 3, 3),
    ('4年', 4, 4),
    ('5年', 5, 5),
    ('6年', 6, 6),
    ('常用', 8, 8),
    ('人名', 9, 10),
  ];

  @override
  void dispose() {
    _strokeMin.dispose();
    _strokeMax.dispose();
    _freqMin.dispose();
    _freqMax.dispose();
    super.dispose();
  }

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
              onPressed: _filter.isUnfiltered ? null : _reset,
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

        // 笔画范围
        _sectionHeader('笔画数', _strokeDomain),
        _buildStrokeRange(),
        const SizedBox(height: 22),

        // 使用频率范围
        _sectionHeader('使用频率', _freqDomain),
        _buildFrequencyRange(),
        const SizedBox(height: 22),

        // 读音构成
        const DrawerSectionLabel('读音构成'),
        _buildReadingChips(),
        const SizedBox(height: 22),

        // 其他 (学年等次要维度)
        const DrawerSectionLabel('其他'),
        _buildGradeChips(),
      ],
    );
  }

  int _total() => kanjiReadingDict.length;

  /// 分组标题 + 右侧的取值范围提示。
  Widget _sectionHeader(String title, String domain) {
    final colors = AppTheme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: DrawerSectionLabel(title)),
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            domain,
            style: TextStyle(
              color: colors.textSecondary.withValues(alpha: 0.7),
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }

  /// 重置所有条件与输入框。
  void _reset() {
    setState(() {
      _filter = KanjiFilter.initial;
      _strokeMin.clear();
      _strokeMax.clear();
      _freqMin.clear();
      _freqMax.clear();
    });
  }

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

  // ---------------------------------------------------------------- 范围输入

  Widget _buildStrokeRange() {
    return _RangeFields(
      minController: _strokeMin,
      maxController: _strokeMax,
      invalid: _isInverted(_strokeMin, _strokeMax),
      onChanged: _applyStrokes,
    );
  }

  Widget _buildFrequencyRange() {
    return _RangeFields(
      minController: _freqMin,
      maxController: _freqMax,
      invalid: _isInverted(_freqMin, _freqMax),
      onChanged: _applyFrequency,
    );
  }

  /// 两端都填了但下限大于上限。
  static bool _isInverted(
    TextEditingController min,
    TextEditingController max,
  ) {
    final a = int.tryParse(min.text);
    final b = int.tryParse(max.text);
    return a != null && b != null && a > b;
  }

  /// 把笔画输入框的内容写回筛选条件。
  ///
  /// 直接构造 [KanjiFilter] 而非走 `copyWith` —— copyWith 用
  /// `新值 ?? 旧值` 兜底, 无法区分「把这一端清空」和「保持原值」,
  /// 于是删掉输入框里的数字也无法解除限制。这里两个端点都从输入框
  /// 现取, 空字符串即 null, 才能正确表达「该端不限」。
  void _applyStrokes() {
    setState(() {
      _filter = KanjiFilter(
        gradeMin: _filter.gradeMin,
        gradeMax: _filter.gradeMax,
        strokesMin: int.tryParse(_strokeMin.text),
        strokesMax: int.tryParse(_strokeMax.text),
        frequencyMin: _filter.frequencyMin,
        frequencyMax: _filter.frequencyMax,
        reading: _filter.reading,
        sort: _filter.sort,
      );
    });
  }

  /// 把频率输入框的内容写回筛选条件 (理由同 [_applyStrokes])。
  void _applyFrequency() {
    setState(() {
      _filter = KanjiFilter(
        gradeMin: _filter.gradeMin,
        gradeMax: _filter.gradeMax,
        strokesMin: _filter.strokesMin,
        strokesMax: _filter.strokesMax,
        frequencyMin: int.tryParse(_freqMin.text),
        frequencyMax: int.tryParse(_freqMax.text),
        reading: _filter.reading,
        sort: _filter.sort,
      );
    });
  }

  // ------------------------------------------------------------------ 胶囊

  Widget _buildGradeChips() {
    return _chipWrap([
      ..._gradeOptions.map((option) {
        final (label, min, max) = option;
        final selected = _filter.gradeMin == min && _filter.gradeMax == max;
        return _Chip(
          label: label,
          selected: selected,
          onTap: () => setState(() {
            _filter = selected
                ? _filter.copyWith(clearGrade: true)
                : _filter.copyWith(gradeMin: min, gradeMax: max);
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

/// 「下限 ~ 上限」两个数字输入框。
///
/// 两端都留空即表示不加限制; 取值范围由调用方在分组标题右侧说明,
/// 这里只负责输入本身。
class _RangeFields extends StatelessWidget {
  final TextEditingController minController;
  final TextEditingController maxController;

  /// 下限大于上限时给出提示。
  final bool invalid;
  final VoidCallback onChanged;

  const _RangeFields({
    required this.minController,
    required this.maxController,
    required this.invalid,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _field(context, minController, '最小'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text('~',
                  style: TextStyle(color: colors.textSecondary, fontSize: 14)),
            ),
            _field(context, maxController, '最大'),
            const SizedBox(width: 10),
            Text(
              '留空不限',
              style: TextStyle(
                color: colors.textSecondary.withValues(alpha: 0.7),
                fontSize: 10,
              ),
            ),
          ],
        ),
        if (invalid) ...[
          const SizedBox(height: 6),
          Text(
            '下限大于上限, 将没有结果',
            style: TextStyle(color: AppTheme.accent, fontSize: 11),
          ),
        ],
      ],
    );
  }

  Widget _field(
    BuildContext context,
    TextEditingController controller,
    String hint,
  ) {
    final colors = AppTheme.of(context);
    OutlineInputBorder border(Color c, [double w = 1]) => OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: c, width: w),
        );

    return SizedBox(
      width: 76,
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(5),
        ],
        onChanged: (_) => onChanged(),
        style: TextStyle(color: colors.textPrimary, fontSize: 14),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: colors.textSecondary.withValues(alpha: 0.55),
            fontSize: 12,
          ),
          isDense: true,
          filled: true,
          fillColor: colors.surfaceVariant,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 11),
          border: border(colors.border),
          enabledBorder: border(colors.border),
          focusedBorder: border(AppTheme.accent, 1.4),
        ),
      ),
    );
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
