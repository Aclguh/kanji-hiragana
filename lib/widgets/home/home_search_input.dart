import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/input_sanitizer.dart';
import '../../core/japanese_analyzer.dart' show kMaxInputLength;
import '../../theme.dart';
import '../feedback.dart';
import '../app_scopes.dart';

/// 首页搜索输入框组件，支持聚焦居中与展开顶部的平滑插值。
class HomeSearchInput extends StatelessWidget {
  const HomeSearchInput({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.isSearching,
    required this.hasInput,
    required this.progress,
    required this.onChanged,
    required this.onSubmit,
    this.onPasted,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isSearching;
  final bool hasInput;
  final double progress;
  final ValueChanged<String> onChanged;
  final VoidCallback onSubmit;
  final VoidCallback? onPasted;

  static double _lerp(double a, double b, double t) => a + (b - a) * t;

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final s = AppStringsScope.of(context);
    return TextField(
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      textInputAction: TextInputAction.search,
      onSubmitted: (_) => onSubmit(),
      autofocus: false,
      maxLines: 3,
      minLines: 1,
      textAlign: (isSearching || hasInput) ? TextAlign.start : TextAlign.center,
      style: TextStyle(
        color: colors.textPrimary,
        fontSize: _lerp(17.0, 20.0, 1 - progress),
        height: 1.5,
      ),
      decoration: InputDecoration(
        hintText: s.inputHint,
        suffixIcon: (!isSearching && !hasInput)
            ? IconButton(
                tooltip: s.paste,
                icon: Icon(
                  Icons.content_paste_rounded,
                  size: 18,
                  color: colors.textSecondary.withValues(alpha: 0.6),
                ),
                onPressed: () async {
                  final data = await Clipboard.getData(Clipboard.kTextPlain);
                  final text = data?.text?.trim();
                  if (text != null && text.isNotEmpty) {
                    final cleanText = InputSanitizer.clean(text);
                    if (cleanText.isNotEmpty) {
                      controller.text = cleanText;
                      controller.selection =
                          TextSelection.collapsed(offset: cleanText.length);
                      onPasted?.call();
                      if (text.characters.length > kMaxInputLength &&
                          context.mounted) {
                        showToast(
                          context,
                          AppStringsScope.of(context).inputExceededLimit(kMaxInputLength),
                        );
                      }
                    }
                  }
                },
              )
            : IconButton(
                tooltip: s.search,
                icon: Icon(
                  Icons.arrow_forward_rounded,
                  size: 20,
                  color: hasInput
                      ? colors.textPrimary
                      : colors.textSecondary.withValues(alpha: 0.4),
                ),
                onPressed: hasInput ? onSubmit : null,
              ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: _lerp(14.0, 18.0, 1 - progress),
        ),
      ),
    );
  }
}
