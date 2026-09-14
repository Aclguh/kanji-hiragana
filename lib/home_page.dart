import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/japanese_analyzer.dart';
import '../core/morpheme.dart';
import '../theme.dart';
import '../widgets/alignment_table.dart';
import '../widgets/furigana_view.dart';
import '../widgets/single_kanji_view.dart';

/// 视图模式。
enum ViewMode {
  /// 逐词三列对照表。
  alignment,

  /// 振假名注音排版。
  furigana,
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  final _analyzer = JapaneseAnalyzer.instance;
  final _debounce = _Debouncer(const Duration(milliseconds: 220));

  /// 驱动「聚焦态 ↔ 展开态」过渡的动画。
  late final AnimationController _anim;

  AnalysisResult? _result;
  ViewMode _viewMode = ViewMode.alignment;
  bool _showRomaji = true;
  bool _loading = true;
  String? _error;

  /// 是否有输入内容(决定处于展开态还是聚焦态)。
  bool get _hasInput => _controller.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    _anim = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 420),
    );
    // 输入框内容变化时同步动画状态(含粘贴、清空等非键盘输入)。
    _controller.addListener(_syncAnim);
    _init();
  }

  Future<void> _init() async {
    try {
      await _analyzer.warmUp();
      if (!mounted) return;
      setState(() => _loading = false);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _error = '词典初始化失败: $e';
      });
    }
  }

  void _syncAnim() {
    final target = _hasInput ? 1.0 : 0.0;
    if (_anim.value != target) {
      if (target == 1.0) {
        _anim.forward();
      } else {
        _anim.reverse();
      }
    }
    setState(() {});
  }

  void _onChanged(String value) {
    _debounce.run(() => _run(value));
  }

  Future<void> _run(String text) async {
    if (text.trim().isEmpty) {
      setState(() => _result = null);
      return;
    }
    try {
      final r = await _analyzer.analyze(text);
      if (!mounted) return;
      setState(() {
        _result = r;
        _error = null;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _error = '解析失败: $e');
    }
  }

  void _clear() {
    _controller.clear();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _debounce.dispose();
    _controller.removeListener(_syncAnim);
    _controller.dispose();
    _focusNode.dispose();
    _anim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _hasInput ? _buildAppBar() : null,
      body: SafeArea(
        child: _loading ? _buildLoading() : _buildAnimatedBody(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: const Row(
        children: [
          Text('漢字'),
          SizedBox(width: 6),
          Icon(Icons.arrow_forward_rounded, size: 16, color: AppTheme.accent),
          SizedBox(width: 6),
          Text('かな'),
          SizedBox(width: 10),
          Text('·', style: TextStyle(color: AppTheme.textSecondary)),
          SizedBox(width: 10),
          Text('ローマ字',
              style: TextStyle(
                  color: AppTheme.indigo,
                  fontSize: 15,
                  fontWeight: FontWeight.w500)),
        ],
      ),
      actions: [
        IconButton(
          tooltip: '清空',
          onPressed: _clear,
          icon: const Icon(Icons.delete_outline_rounded),
        ),
      ],
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(color: AppTheme.accent),
          SizedBox(height: 16),
          Text('正在加载日语词典…',
              style: TextStyle(color: AppTheme.textSecondary)),
        ],
      ),
    );
  }

  /// 聚焦态与展开态共用一个布局, 通过动画在两者间过渡。
  ///
  /// - 聚焦态: 输入框垂直居中, 其余控件透明度为 0 且不可交互。
  /// - 展开态: 输入框移到顶部, 工具栏与结果区淡入、上滑展开。
  Widget _buildAnimatedBody() {
    return AnimatedBuilder(
      animation: _anim,
      builder: (context, _) {
        final t = Curves.easeOutCubic.transform(_anim.value);
        return LayoutBuilder(
          builder: (context, constraints) {
            // 聚焦态: 让「标题 + 输入框」整体在视觉上居中。
            // 估算该组内容高度(标题约 92 + 输入框约 58 + 间距 24)。
            const focusBlockHeight = 174.0;
            final centeredTop =
                (constraints.maxHeight - focusBlockHeight) / 2;
            final topSpace = _lerp(
              12.0,
              centeredTop.clamp(24.0, constraints.maxHeight * 0.42),
              1 - t,
            );

            return SingleChildScrollView(
              padding: EdgeInsets.only(
                top: topSpace,
                bottom: MediaQuery.of(context).viewInsets.bottom + 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 聚焦态在输入框上方显示标题。
                  _buildHeroTitle(t),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildInput(t),
                  ),
                  // 其余控件随动画淡入。
                  _buildReveal(t),
                ],
              ),
            );
          },
        );
      },
    );
  }

  /// 聚焦态显示的品牌标题, 展开后淡出。
  Widget _buildHeroTitle(double t) {
    final opacity = (1 - t).clamp(0.0, 1.0);
    if (opacity <= 0.001) return const SizedBox(height: 4);

    return Opacity(
      opacity: opacity,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          children: [
            const Text(
              '漢字仮名',
              style: TextStyle(
                color: AppTheme.textPrimary,
                fontSize: 30,
                fontWeight: FontWeight.w600,
                letterSpacing: 4,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '输入日语汉字，查看平假名与罗马音',
              style: TextStyle(
                color: AppTheme.textSecondary.withValues(alpha: 0.9),
                fontSize: 13,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInput(double t) {
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      onChanged: _onChanged,
      autofocus: false,
      maxLines: 3,
      minLines: 1,
      textAlign: _hasInput ? TextAlign.start : TextAlign.center,
      style: TextStyle(
        color: AppTheme.textPrimary,
        fontSize: _lerp(17.0, 20.0, 1 - t),
        height: 1.5,
      ),
      decoration: InputDecoration(
        hintText: '输入日语汉字',
        suffixIcon: _hasInput
            ? IconButton(
                icon: const Icon(Icons.close_rounded,
                    size: 18, color: AppTheme.textSecondary),
                onPressed: _clear,
              )
            : null,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: _lerp(14.0, 18.0, 1 - t),
        ),
      ),
    );
  }

  /// 展开态才可见的工具栏与结果区。
  Widget _buildReveal(double t) {
    // 完全收起时不构建内容, 避免无谓计算。
    if (t <= 0.001) return const SizedBox.shrink();

    return IgnorePointer(
      ignoring: t < 0.5,
      child: Opacity(
        opacity: t.clamp(0.0, 1.0),
        child: Transform.translate(
          offset: Offset(0, 18 * (1 - t)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 12),
              _buildToolbar(),
              _buildContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToolbar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      child: Row(
        children: [
          _buildModeSwitcher(),
          const Spacer(),
          _buildRomajiToggle(),
        ],
      ),
    );
  }

  Widget _buildModeSwitcher() {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.border),
      ),
      child: Row(
        children: [
          _segment('对照表', ViewMode.alignment, Icons.table_rows_rounded),
          _segment('注音', ViewMode.furigana, Icons.text_fields_rounded),
        ],
      ),
    );
  }

  Widget _segment(String label, ViewMode mode, IconData icon) {
    final selected = _viewMode == mode;
    return GestureDetector(
      onTap: () => setState(() => _viewMode = mode),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: selected ? AppTheme.accent : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon,
                size: 14,
                color: selected ? Colors.white : AppTheme.textSecondary),
            const SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(
                color: selected ? Colors.white : AppTheme.textSecondary,
                fontSize: 13,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRomajiToggle() {
    return Row(
      children: [
        Text('罗马音',
            style: TextStyle(
                color: _showRomaji
                    ? AppTheme.textPrimary
                    : AppTheme.textSecondary,
                fontSize: 13)),
        const SizedBox(width: 4),
        Switch(
          value: _showRomaji,
          onChanged: (v) => setState(() => _showRomaji = v),
          activeThumbColor: AppTheme.accent,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ],
    );
  }

  Widget _buildContent() {
    if (_error != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: _buildMessage(
          Icons.error_outline_rounded,
          _error!,
          color: AppTheme.accent,
        ),
      );
    }

    final result = _result;
    if (result == null || result.isEmpty) {
      // 输入了内容但解析尚未完成: 显示轻量占位, 避免闪烁。
      return const SizedBox(height: 40);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 单汉字: 优先展示音读/训读详解。
          if (result.isSingleKanji) ...[
            SingleKanjiView(reading: result.singleKanji!),
            const SizedBox(height: 18),
            _sectionTitle('该字在词中的读音'),
            const SizedBox(height: 10),
            AlignmentTable(result: result, showRomaji: _showRomaji),
          ] else ...[
            if (_viewMode == ViewMode.alignment)
              AlignmentTable(result: result, showRomaji: _showRomaji)
            else ...[
              FuriganaView(result: result, showRomaji: _showRomaji),
              const SizedBox(height: 16),
              _buildFuriganaFooter(result),
            ],
          ],
        ],
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Row(
      children: [
        Container(
          width: 3,
          height: 14,
          decoration: BoxDecoration(
            color: AppTheme.textSecondary,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 8),
        Text(text,
            style: const TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w500)),
      ],
    );
  }

  Widget _buildFuriganaFooter(AnalysisResult result) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.border),
      ),
      child: Column(
        children: [
          _footerLine(
            icon: Icons.volume_up_rounded,
            label: '平假名',
            value: result.fullHiragana,
            color: AppTheme.accent,
            copyTip: '已复制全文平假名',
          ),
          // 存在发音差异时补充一行实际发音。
          if (result.hasAnyPronunciationShift) ...[
            const SizedBox(height: 10),
            _footerLine(
              icon: Icons.record_voice_over_rounded,
              label: '实际发音',
              value: result.fullPronunciation,
              color: AppTheme.textSecondary,
              copyTip: '已复制发音',
            ),
          ],
        ],
      ),
    );
  }

  Widget _footerLine({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
    required String copyTip,
  }) {
    return Row(
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 8),
        SizedBox(
          width: 58,
          child: Text(
            label,
            style: const TextStyle(
                color: AppTheme.textSecondary, fontSize: 11),
          ),
        ),
        Expanded(
          child: SelectableText(
            value,
            style: const TextStyle(
                color: AppTheme.textPrimary, fontSize: 15, height: 1.5),
          ),
        ),
        IconButton(
          tooltip: '复制',
          iconSize: 18,
          onPressed: () {
            Clipboard.setData(ClipboardData(text: value));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(copyTip),
                duration: const Duration(milliseconds: 900),
              ),
            );
          },
          icon:
              const Icon(Icons.copy_rounded, color: AppTheme.textSecondary),
        ),
      ],
    );
  }

  Widget _buildMessage(IconData icon, String msg, {Color? color}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 36, color: color ?? AppTheme.textSecondary),
            const SizedBox(height: 12),
            Text(msg,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: AppTheme.textSecondary, fontSize: 13)),
          ],
        ),
      ),
    );
  }
}

double _lerp(double a, double b, double t) => a + (b - a) * t;

/// 简易防抖, 避免每次按键都触发形态素分析。
class _Debouncer {
  final Duration delay;
  Timer? _timer;

  _Debouncer(this.delay);

  void run(void Function() action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }

  void dispose() => _timer?.cancel();
}
