import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/japanese_analyzer.dart';
import 'core/kanji_filter.dart';
import 'core/morpheme.dart';
import 'theme.dart';
import 'widgets/about_page.dart';
import 'widgets/alignment_table.dart';
import 'widgets/filter_drawer.dart';
import 'widgets/filter_result_page.dart';
import 'widgets/furigana_view.dart';
import 'widgets/settings_drawer.dart';
import 'widgets/single_kanji_view.dart';
import 'widgets/sliding_drawer.dart';
import 'widgets/vector_icon.dart';

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
  OpenDrawer _openDrawer = OpenDrawer.none;

  /// 当前生效的筛选条件。
  KanjiFilter _filter = KanjiFilter.initial;

  /// 是否有输入内容(决定处于展开态还是聚焦态)。
  bool get _hasInput => _controller.text.trim().isNotEmpty;

  /// 抽屉是否处于展开状态。
  bool get _drawerOpen => _openDrawer != OpenDrawer.none;

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

  /// 清空输入并保持焦点 (供界面上的 ✕ / 垃圾桶按钮使用)。
  void _clear() {
    _controller.clear();
    _focusNode.requestFocus();
  }

  /// 清空输入并收起键盘 (供系统返回键使用)。
  ///
  /// 返回键的语义是「退出当前状态」, 因此这里不再主动唤起键盘。
  void _clearAndDismissKeyboard() {
    _controller.clear();
    _focusNode.unfocus();
  }

  void _toggleDrawer(OpenDrawer which) {
    // 收起键盘, 避免抽屉展开时键盘遮挡。
    _focusNode.unfocus();
    setState(() {
      _openDrawer = _openDrawer == which ? OpenDrawer.none : which;
    });
  }

  void _closeDrawer() {
    if (_drawerOpen) setState(() => _openDrawer = OpenDrawer.none);
  }

  void _openAbout() {
    setState(() => _openDrawer = OpenDrawer.none);
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const AboutPage()),
    );
  }

  Future<void> _openFilterResult(KanjiFilter filter) async {
    setState(() {
      _filter = filter;
      _openDrawer = OpenDrawer.none;
    });
    await Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => FilterResultPage(filter: filter)),
    );
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

  /// 处理系统返回键。
  ///
  /// 优先级: 收起已展开的抽屉 > 清空输入内容 > 交给系统退出应用。
  /// 返回 true 表示本次返回已被消费, 不应退出应用。
  bool _onBackPressed() {
    if (_drawerOpen) {
      _closeDrawer();
      return true;
    }
    if (_hasInput) {
      _clearAndDismissKeyboard();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final mainBody = Scaffold(
      backgroundColor: Colors.transparent,
      appBar: _hasInput ? _buildAppBar() : null,
      body: SafeArea(
        child: _loading ? _buildLoading() : _buildAnimatedBody(),
      ),
    );

    // 抽屉外壳: 面板自带压暗遮罩, 主界面内容保持不动。
    return PopScope(
      // 仍有抽屉展开或尚有输入时拦截返回键, 避免误退出应用。
      canPop: !_drawerOpen && !_hasInput,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        _onBackPressed();
      },
      child: Scaffold(
        body: DrawerCloseNotification(
          onClose: _closeDrawer,
          child: SlidingDrawer(
            // 设置按钮在右下角, 抽屉自右侧滑出。
            side: DrawerSide.right,
            open: _openDrawer == OpenDrawer.settings,
            panel: SettingsDrawerContent(onOpenAbout: _openAbout),
            child: SlidingDrawer(
              // 筛选按钮在左下角, 抽屉自左侧滑出。
              side: DrawerSide.left,
              open: _openDrawer == OpenDrawer.filter,
              panel: FilterDrawerContent(
                initial: _filter,
                onSubmit: _openFilterResult,
              ),
              child: Stack(
                children: [
                  mainBody,
                  _buildFloatingButtons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 悬浮按钮是否可见。
  ///
  /// 仅在空态(未输入任何内容)且没有抽屉展开时出现;
  /// 一旦开始输入, 按钮即让位于内容区。
  bool get _buttonsVisible => !_hasInput && !_drawerOpen;

  /// 右下角设置按钮 + 左下角筛选按钮。
  Widget _buildFloatingButtons() {
    return Positioned.fill(
      child: IgnorePointer(
        ignoring: !_buttonsVisible,
        child: AnimatedOpacity(
          opacity: _buttonsVisible ? 1 : 0,
          duration: SlidingDrawer.duration,
          child: SafeArea(
            child: Stack(
              children: [
                // 左下角: 放大镜, 展开筛选抽屉 (从左侧滑出)。
                Positioned(
                  left: 16,
                  bottom: 16,
                  child: _FloatingButton(
                    type: DrawerIconType.search,
                    tooltip: '筛选汉字',
                    onTap: () => _toggleDrawer(OpenDrawer.filter),
                  ),
                ),
                // 右下角: 齿轮, 展开设置抽屉 (从右侧滑出)。
                Positioned(
                  right: 16,
                  bottom: 16,
                  child: _FloatingButton(
                    type: DrawerIconType.settings,
                    tooltip: '设置',
                    onTap: () => _toggleDrawer(OpenDrawer.settings),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    final colors = AppTheme.of(context);
    return AppBar(
      title: Row(
        children: [
          const Text('漢字'),
          const SizedBox(width: 6),
          const Icon(Icons.arrow_forward_rounded,
              size: 16, color: AppTheme.accent),
          const SizedBox(width: 6),
          const Text('かな'),
          const SizedBox(width: 10),
          Text('·', style: TextStyle(color: colors.textSecondary)),
          const SizedBox(width: 10),
          const Text('ローマ字',
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
    final colors = AppTheme.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(color: AppTheme.accent),
          const SizedBox(height: 16),
          Text('正在加载日语词典…',
              style: TextStyle(color: colors.textSecondary)),
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
                // 存在悬浮按钮时留出空间, 避免内容被遮挡;
                // 输入后按钮隐藏, 底部留白随之收窄。
                bottom: MediaQuery.of(context).viewInsets.bottom +
                    (_buttonsVisible ? 88 : 24),
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
    final colors = AppTheme.of(context);
    final opacity = (1 - t).clamp(0.0, 1.0);
    if (opacity <= 0.001) return const SizedBox(height: 4);

    return Opacity(
      opacity: opacity,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          children: [
            Text(
              '漢字仮名',
              style: TextStyle(
                color: colors.textPrimary,
                fontSize: 30,
                fontWeight: FontWeight.w600,
                letterSpacing: 4,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '输入日语汉字，查看平假名与罗马音',
              style: TextStyle(
                color: colors.textSecondary.withValues(alpha: 0.9),
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
    final colors = AppTheme.of(context);
    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      onChanged: _onChanged,
      autofocus: false,
      maxLines: 3,
      minLines: 1,
      textAlign: _hasInput ? TextAlign.start : TextAlign.center,
      style: TextStyle(
        color: colors.textPrimary,
        fontSize: _lerp(17.0, 20.0, 1 - t),
        height: 1.5,
      ),
      decoration: InputDecoration(
        hintText: '输入日语汉字',
        suffixIcon: _hasInput
            ? IconButton(
                icon: Icon(Icons.close_rounded,
                    size: 18, color: colors.textSecondary),
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

    // 单汉字只显示音读/训读详解, 视图切换与罗马音开关都不适用。
    final isSingleKanji = _result?.isSingleKanji ?? false;

    return IgnorePointer(
      ignoring: t < 0.5,
      child: Opacity(
        opacity: t.clamp(0.0, 1.0),
        child: Transform.translate(
          offset: Offset(0, 18 * (1 - t)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: isSingleKanji ? 4 : 12),
              if (!isSingleKanji) _buildToolbar(),
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
    final colors = AppTheme.of(context);
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colors.border),
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
    final colors = AppTheme.of(context);
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
                color: selected ? Colors.white : colors.textSecondary),
            const SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(
                color: selected ? Colors.white : colors.textSecondary,
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
    final colors = AppTheme.of(context);
    return Row(
      children: [
        Text('罗马音',
            style: TextStyle(
                color: _showRomaji ? colors.textPrimary : colors.textSecondary,
                fontSize: 13)),
        const SizedBox(width: 4),
        Switch(
          value: _showRomaji,
          onChanged: (v) => setState(() => _showRomaji = v),
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
          // 单汉字: 只展示音读/训读详解, 不显示对照表与注音
          // (单个汉字没有上下文, 逐词对照与振假名在这里没有意义)。
          if (result.isSingleKanji)
            SingleKanjiView(reading: result.singleKanji!)
          else if (_viewMode == ViewMode.alignment)
            AlignmentTable(result: result, showRomaji: _showRomaji)
          else ...[
            FuriganaView(result: result, showRomaji: _showRomaji),
            const SizedBox(height: 16),
            _buildFuriganaFooter(result),
          ],
        ],
      ),
    );
  }

  Widget _buildFuriganaFooter(AnalysisResult result) {
    final colors = AppTheme.of(context);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.border),
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
              color: colors.textSecondary,
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
    final colors = AppTheme.of(context);
    return Row(
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 8),
        SizedBox(
          width: 58,
          child: Text(
            label,
            style: TextStyle(color: colors.textSecondary, fontSize: 11),
          ),
        ),
        Expanded(
          child: SelectableText(
            value,
            style: TextStyle(
                color: colors.textPrimary, fontSize: 15, height: 1.5),
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
          icon: Icon(Icons.copy_rounded, color: colors.textSecondary),
        ),
      ],
    );
  }

  Widget _buildMessage(IconData icon, String msg, {Color? color}) {
    final colors = AppTheme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 36, color: color ?? colors.textSecondary),
            const SizedBox(height: 12),
            Text(msg,
                textAlign: TextAlign.center,
                style: TextStyle(color: colors.textSecondary, fontSize: 13)),
          ],
        ),
      ),
    );
  }
}

/// 圆形悬浮按钮, 内含矢量图标。
class _FloatingButton extends StatelessWidget {
  final DrawerIconType type;
  final String tooltip;
  final VoidCallback onTap;

  const _FloatingButton({
    required this.type,
    required this.tooltip,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    return Tooltip(
      message: tooltip,
      child: Material(
        color: colors.surface,
        shape: CircleBorder(side: BorderSide(color: colors.border)),
        elevation: 3,
        shadowColor: Colors.black.withValues(alpha: 0.25),
        child: InkWell(
          onTap: onTap,
          customBorder: const CircleBorder(),
          child: SizedBox(
            width: 48,
            height: 48,
            child: Center(
              child: VectorIcon(
                type: type,
                size: 21,
                color: colors.textPrimary,
              ),
            ),
          ),
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
