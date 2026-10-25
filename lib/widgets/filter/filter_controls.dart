import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/input_sanitizer.dart';
import '../../theme.dart';
import '../app_scopes.dart';

/// 筛选抽屉的分区标题, 右侧可附带取值范围。
class FilterSectionHeader extends StatelessWidget {
  final String title;
  final String? domain;

  const FilterSectionHeader({super.key, required this.title, this.domain});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 8, top: 4),
            child: Text(
              title,
              style: TextStyle(
                color: colors.textSecondary,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
          ),
        ),
        if (domain != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              domain!,
              style: TextStyle(
                color: colors.textSecondary.withValues(alpha: 0.7),
                fontSize: 10,
              ),
            ),
          ),
      ],
    );
  }
}

/// 「下限 ~ 上限」两个数字输入框。
class RangeFields extends StatelessWidget {
  final TextEditingController minController;
  final TextEditingController maxController;
  final bool invalid;
  final VoidCallback onChanged;

  const RangeFields({
    super.key,
    required this.minController,
    required this.maxController,
    required this.invalid,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final s = AppStringsScope.of(context);
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
class FilterChipButton extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const FilterChipButton({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
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

/// 读音反查 / 含义搜索共用的单行输入框。
class FilterSearchField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLength;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  const FilterSearchField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.maxLength,
    required this.onChanged,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final s = AppStringsScope.of(context);
    OutlineInputBorder border(Color c, [double w = 1]) => OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: c, width: w),
    );

    return TextField(
      controller: controller,
      inputFormatters: [
        LengthLimitingTextInputFormatter(maxLength),
      ],
      onChanged: (text) =>
          onChanged(InputSanitizer.clean(text, maxLength: maxLength)),
      style: TextStyle(color: colors.textPrimary, fontSize: 14),
      decoration: InputDecoration(
        hintText: hintText,
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
        suffixIcon: controller.text.isNotEmpty
            ? IconButton(
                tooltip: s.clear,
                icon: Icon(Icons.clear, size: 16, color: colors.textSecondary),
                onPressed: onClear,
                padding: EdgeInsets.zero,
                constraints:
                    const BoxConstraints(minWidth: 32, minHeight: 32),
              )
            : null,
        border: border(colors.border),
        enabledBorder: border(colors.border),
        focusedBorder: border(AppTheme.accent, 1.4),
      ),
    );
  }
}
