import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/kanji_filter.dart';
import '../core/kanji_reading_dict.dart';
import '../core/strings.dart';
import '../theme.dart';
import 'radical_picker_sheet.dart';
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
  late final _readingQuery = TextEditingController(
    text: _filter.readingQuery,
  );
  late final _meaningQuery = TextEditingController(
    text: _filter.meaningQuery,
  );

  /// 笔画数的实际取值范围 (由 core 从字典统计, 字典更新后自动跟随)。
  static final _strokeDomain = '${kStrokeRange.$1} ~ ${kStrokeRange.$2}';

  /// 使用频率的实际取值范围 (无排名的汉字已由 core 排除)。
  static final _freqDomain = '${kFrequencyRange.$1} ~ ${kFrequencyRange.$2}';

  /// 学年选项: 对应的 grade 区间, 标签由当前语言决定。
  ///
  /// 人名用汉字在字典里分 grade 9 与 10 两档, 合并成一个「人名」选项,
  /// 否则会出现两个同名胶囊。
  static const _gradeRanges = <(int, int)>[
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (8, 8),
    (9, 10),
  ];

  /// 常用部首列表 (覆盖率最高的主流部首序号)。
  static const _commonRadicals = <int>[
    85, // 水
    75, // 木
    9,  // 人
    64, // 手
    140, // 艸
    61, // 心
    30, // 口
    120, // 糸
    149, // 言
    72, // 日
    167, // 金
    32, // 土
  ];

  @override
  void dispose() {
    _strokeMin.dispose();
    _strokeMax.dispose();
    _freqMin.dispose();
    _freqMax.dispose();
    _readingQuery.dispose();
    _meaningQuery.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final s = AppStrings.of(context);
    return DrawerPanel(
      side: DrawerSide.left,
      title: s.filterTitle,
      subtitle: s.filterCount(_total()),
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
              child: Text(s.reset),
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
              child: Text(s.viewResults),
            ),
          ),
        ],
      ),
      children: [
        // 排序
        DrawerSectionLabel(s.sectionSort),
        _buildSortChips(s),
        const SizedBox(height: 22),

        // 笔画范围
        _sectionHeader(s.sectionStrokes, _strokeDomain),
        _buildStrokeRange(),
        const SizedBox(height: 22),

        // 使用频率范围
        _sectionHeader(s.sectionFrequency, _freqDomain),
        _buildFrequencyRange(),
        const SizedBox(height: 22),

        // 读音构成
        DrawerSectionLabel(s.sectionReadings),
        _buildReadingChips(s),
        const SizedBox(height: 22),

        // 按读音查
        DrawerSectionLabel(s.sectionReadingSearch),
        _buildReadingSearchField(s),
        const SizedBox(height: 22),

        // 按含义查
        DrawerSectionLabel(s.sectionMeaningSearch),
        _buildMeaningSearchField(s),
        const SizedBox(height: 22),

        // 部首
        DrawerSectionLabel(s.sectionRadical),
        _buildRadicalChips(s),
        const SizedBox(height: 22),

        // 其他 (学年等次要维度)
        DrawerSectionLabel(s.sectionOther),
        _buildGradeChips(s),
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
      _readingQuery.clear();
      _meaningQuery.clear();
    });
  }

  Widget _buildSortChips(AppStrings s) {
    return _chipWrap(
      KanjiSort.values.map((sort) {
        return _Chip(
          label: s.sortLabel(sort),
          selected: _filter.sort == sort,
          onTap: () => setState(() => _filter = _filter.copyWith(sort: sort)),
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
  /// 两步 copyWith 代替手工逐字段重建: 先 `clearStrokes: true` 整维
  /// 清空, 再把两端写为输入框现值 (空字符串即 null, 正确表达
  /// 「该端不限」)。手工重建在 KanjiFilter 新增字段时会静默丢值,
  /// copyWith 则始终保留未提及的字段。
  void _applyStrokes() {
    setState(() {
      _filter = _filter
          .copyWith(clearStrokes: true)
          .copyWith(
            strokesMin: int.tryParse(_strokeMin.text),
            strokesMax: int.tryParse(_strokeMax.text),
          );
    });
  }

  /// 把频率输入框的内容写回筛选条件 (理由同 [_applyStrokes])。
  void _applyFrequency() {
    setState(() {
      _filter = _filter
          .copyWith(clearFrequency: true)
          .copyWith(
            frequencyMin: int.tryParse(_freqMin.text),
            frequencyMax: int.tryParse(_freqMax.text),
          );
    });
  }

  // ------------------------------------------------------------------ 胶囊

  Widget _buildGradeChips(AppStrings s) {
    return _chipWrap([
      ..._gradeRanges.map((range) {
        final (min, max) = range;
        final selected = _filter.gradeMin == min && _filter.gradeMax == max;
        return _Chip(
          label: s.gradeChipLabel(min, max),
          selected: selected,
          onTap: () => setState(() {
            _filter = selected
                ? _filter.copyWith(clearGrade: true)
                : _filter.copyWith(gradeMin: min, gradeMax: max);
          }),
        );
      }),
      _Chip(
        label: s.any,
        selected: _filter.gradeMin == null && _filter.gradeMax == null,
        onTap: () =>
            setState(() => _filter = _filter.copyWith(clearGrade: true)),
      ),
    ]);
  }

  Widget _buildReadingChips(AppStrings s) {
    return _chipWrap(
      ReadingRequirement.values.map((r) {
        return _Chip(
          label: s.readingLabel(r),
          selected: _filter.reading == r,
          onTap: () => setState(() => _filter = _filter.copyWith(reading: r)),
        );
      }).toList(),
    );
  }

  Widget _buildRadicalChips(AppStrings s) {
    final curRadical = _filter.radical;
    final isCustom =
        curRadical != null && !_commonRadicals.contains(curRadical);

    return _chipWrap([
      ..._commonRadicals.map((r) {
        final char = kKangxiRadicals[r - 1];
        final selected = _filter.radical == r;
        return _Chip(
          label: char,
          selected: selected,
          onTap: () => setState(() {
            _filter = selected
                ? _filter.copyWith(clearRadical: true)
                : _filter.copyWith(radical: r);
          }),
        );
      }),
      if (isCustom)
        _Chip(
          label: kKangxiRadicals[curRadical - 1],
          selected: true,
          onTap: () => setState(() {
            _filter = _filter.copyWith(clearRadical: true);
          }),
        ),
      _Chip(
        label: s.allRadicals,
        selected: false,
        onTap: () async {
          final picked = await RadicalPickerSheet.show(
            context,
            selectedRadical: _filter.radical,
          );
          if (picked != null && mounted) {
            setState(() {
              _filter = _filter.copyWith(radical: picked);
            });
          }
        },
      ),
      _Chip(
        label: s.any,
        selected: _filter.radical == null,
        onTap: () =>
            setState(() => _filter = _filter.copyWith(clearRadical: true)),
      ),
    ]);
  }

  Widget _buildReadingSearchField(AppStrings s) {
    final colors = AppTheme.of(context);
    OutlineInputBorder border(Color c, [double w = 1]) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: c, width: w),
    );

    return TextField(
      controller: _readingQuery,
      inputFormatters: [
        LengthLimitingTextInputFormatter(20),
      ],
      onChanged: (text) {
        setState(() {
          _filter = _filter.copyWith(readingQuery: text.trim());
        });
      },
      style: TextStyle(color: colors.textPrimary, fontSize: 14),
      decoration: InputDecoration(
        hintText: s.readingSearchHint,
        hintStyle: TextStyle(
          color: colors.textSecondary.withValues(alpha: 0.55),
          fontSize: 12,
        ),
        isDense: true,
        filled: true,
        fillColor: colors.surfaceVariant,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 11,
        ),
        suffixIcon: _readingQuery.text.isNotEmpty
            ? IconButton(
                icon: Icon(Icons.clear, size: 16, color: colors.textSecondary),
                onPressed: () {
                  _readingQuery.clear();
                  setState(() {
                    _filter = _filter.copyWith(clearReadingQuery: true);
                  });
                },
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
              )
            : null,
        border: border(colors.border),
        enabledBorder: border(colors.border),
        focusedBorder: border(AppTheme.accent, 1.4),
      ),
    );
  }

  Widget _buildMeaningSearchField(AppStrings s) {
    final colors = AppTheme.of(context);
    OutlineInputBorder border(Color c, [double w = 1]) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: c, width: w),
    );

    return TextField(
      controller: _meaningQuery,
      inputFormatters: [
        LengthLimitingTextInputFormatter(30),
      ],
      onChanged: (text) {
        setState(() {
          _filter = _filter.copyWith(meaningQuery: text.trim());
        });
      },
      style: TextStyle(color: colors.textPrimary, fontSize: 14),
      decoration: InputDecoration(
        hintText: s.meaningSearchHint,
        hintStyle: TextStyle(
          color: colors.textSecondary.withValues(alpha: 0.55),
          fontSize: 12,
        ),
        isDense: true,
        filled: true,
        fillColor: colors.surfaceVariant,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 11,
        ),
        suffixIcon: _meaningQuery.text.isNotEmpty
            ? IconButton(
                icon: Icon(Icons.clear, size: 16, color: colors.textSecondary),
                onPressed: () {
                  _meaningQuery.clear();
                  setState(() {
                    _filter = _filter.copyWith(clearMeaningQuery: true);
                  });
                },
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
              )
            : null,
        border: border(colors.border),
        enabledBorder: border(colors.border),
        focusedBorder: border(AppTheme.accent, 1.4),
      ),
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
    final s = AppStrings.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _field(context, minController, s.min),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '~',
                style: TextStyle(color: colors.textSecondary, fontSize: 14),
              ),
            ),
            _field(context, maxController, s.max),
            const SizedBox(width: 10),
            // 提示文字不参与定宽: 面板较窄的设备上会挤出 2px 溢出,
            // 因此让它弹性收缩, 放不下时省略。
            Flexible(
              child: Text(
                s.blankMeansAny,
                style: TextStyle(
                  color: colors.textSecondary.withValues(alpha: 0.7),
                  fontSize: 10,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        if (invalid) ...[
          const SizedBox(height: 6),
          Text(
            s.rangeInverted,
            style: const TextStyle(color: AppTheme.accent, fontSize: 11),
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
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 11,
          ),
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
    // MergeSemantics + Semantics: 读屏把胶囊播报为单个按钮节点,
    // 并带选中状态; onTap 注册语义激活动作 (TalkBack 双击可用)。
    // 不换 InkWell: 涟漪会被胶囊自绘背景遮住, 视觉零收益;
    // 相邻胶囊仅隔 8px, 物理热区扩到 48dp 会互相重叠反而误触。
    return MergeSemantics(
      child: Semantics(
        button: true,
        selected: selected,
        onTap: onTap,
        child: GestureDetector(
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
        ),
      ),
    );
  }
}
