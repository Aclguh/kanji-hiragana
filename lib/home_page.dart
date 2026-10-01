import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/japanese_analyzer.dart';
import 'core/kanji_filter.dart';
import 'core/morpheme.dart';
import 'core/query_store.dart';
import 'core/settings.dart';
import 'core/strings.dart';
import 'theme.dart';
import 'widgets/about_page.dart';
import 'widgets/alignment_table.dart';
import 'widgets/feedback.dart';
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

/// 出错环节, 决定界面上显示哪一条提示。
enum _ErrorKind { dictionary, analysis }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  static final _settings = SettingsController.instance;

  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  final _analyzer = JapaneseAnalyzer.instance;
  final _queryStore = QueryStore.instance;
  final _debounce = _Debouncer(const Duration(milliseconds: 220));

  /// 驱动「聚焦态 ↔ 展开态」过渡的动画。
  late final AnimationController _anim;

  AnalysisResult? _result;

  /// 上一次成功分析的文本, 供历史记录判断「本次是否为上次输入的延续」。
  String _lastAnalyzedText = '';

  /// 分析请求序号: await 期间输入又变化时, 过期的结果直接丢弃,
  /// 避免旧结果覆盖新结果。
  int _requestSeq = 0;

  bool _loading = true;

  /// 只记录出错环节与原始异常, 文案在 build 时按当前语言生成 ——
  /// 否则切换语言后这条提示会停留在旧语言。
  _ErrorKind? _errorKind;
  Object? _errorDetail;

  OpenDrawer _openDrawer = OpenDrawer.none;

  /// 当前生效的筛选条件。
  KanjiFilter _filter = KanjiFilter.initial;

  /// 是否有输入内容(决定处于展开态还是聚焦态)。
  bool get _hasInput => _controller.text.trim().isNotEmpty;

  /// 上一次同步时的 [_hasInput] 值。
  ///
  /// AppBar 有无 / 悬浮按钮显隐 / 返回键拦截都依赖这个状态;
  /// 只在「空 ↔ 非空」跃迁时整页重建, 输入过程中的动画帧不再全页 setState。
  bool _lastHasInput = false;

  /// 抽屉是否处于展开状态。
  bool get _drawerOpen => _openDrawer != OpenDrawer.none;

  /// 当前视图, 持久化在设置里, 重启后保持。
  ViewMode get _viewMode => _settings.viewModeName == ViewMode.furigana.name
      ? ViewMode.furigana
      : ViewMode.alignment;

  set _viewMode(ViewMode mode) => _settings.setViewModeName(mode.name);

  /// 罗马音开关, 同样持久化。
  bool get _showRomaji => _settings.showRomaji;

  set _showRomaji(bool value) => _settings.setShowRomaji(value);

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
        _errorKind = _ErrorKind.dictionary;
        _errorDetail = e;
      });
    }
  }

  void _syncAnim() {
    final hasInput = _hasInput;
    final target = hasInput ? 1.0 : 0.0;
    if (_anim.value != target) {
      if (target == 1.0) {
        _anim.forward();
      } else {
        _anim.reverse();
      }
    }
    // 状态跃迁 (开始输入 / 完全清空) 影响 AppBar 与悬浮按钮, 需要整页
    // 重建; 逐字输入只有动画值变化, 由 _buildAnimatedBody 的
    // AnimatedBuilder 局部消化, 不再重建整页。
    if (hasInput != _lastHasInput) {
      _lastHasInput = hasInput;
      if (mounted) setState(() {});
    }
  }

  void _onChanged(String value) {
    _debounce.run((isCancelled) => _run(value, isCancelled));
  }

  Future<void> _run(String text, [bool Function()? isCancelled]) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty) {
      setState(() => _result = null);
      return;
    }
    final seq = ++_requestSeq;
    try {
      final r = await _analyzer.analyze(
        text,
        isCancelled: () {
          return (isCancelled?.call() ?? false) || seq != _requestSeq;
        },
      );
      // await 期间输入又变了或被取消: 本次结果已过期, 丢弃。
      if (!mounted || seq != _requestSeq || (isCancelled?.call() ?? false)) {
        return;
      }
      setState(() {
        _result = r;
        _errorKind = null;
        _errorDetail = null;
      });
      final previous = _lastAnalyzedText;
      _lastAnalyzedText = trimmed;
      _queryStore.recordQuery(trimmed, previous: previous);
    } catch (e) {
      if (!mounted || seq != _requestSeq || (isCancelled?.call() ?? false)) {
        return;
      }
      setState(() {
        _errorKind = _ErrorKind.analysis;
        _errorDetail = e;
      });
    }
  }

  /// 清空输入并保持焦点 (供界面上的 ✕ / 垃圾桶按钮使用)。
  void _clear() {
    _debounce.cancel();
    _controller.clear();
    // 置空延续标记: 清空后的下一次输入是新查询, 不并入上一条历史。
    _lastAnalyzedText = '';
    _focusNode.requestFocus();
  }

  /// 清空输入并收起键盘 (供系统返回键使用)。
  ///
  /// 返回键的语义是「退出当前状态」, 因此这里不再主动唤起键盘。
  void _clearAndDismissKeyboard() {
    _debounce.cancel();
    _controller.clear();
    _lastAnalyzedText = '';
    _focusNode.unfocus();
  }

  /// 点按历史 / 收藏词条: 回填并重新查询。
  ///
  /// 不主动聚焦, 让用户直接看到结果; 键盘若开着则收起。
  void _useQuery(String text) {
    _debounce.cancel();
    _focusNode.unfocus();
    _controller.text = text;
    // controller 监听器会推进展开动画; 这里直接分析, 不再走防抖。
    _run(text);
  }

  /// 切换当前查询的收藏状态。
  void _toggleFavorite() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    final added = _queryStore.toggleFavorite(text);
    final s = AppStrings.of(context);
    showToast(context, added ? s.favoriteAdded(text) : s.favoriteRemoved(text));
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
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const AboutPage()));
  }

  Future<void> _openFilterResult(KanjiFilter filter) async {
    setState(() {
      _filter = filter;
      _openDrawer = OpenDrawer.none;
    });
    final selectedWord = await Navigator.of(context).push<String>(
      MaterialPageRoute(builder: (_) => FilterResultPage(filter: filter)),
    );
    if (selectedWord != null && selectedWord.isNotEmpty && mounted) {
      _useQuery(selectedWord);
    }
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
        child: _loading ? const _LoadingView() : _buildAnimatedBody(),
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
        body: DrawerCloseScope(
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
              child: Stack(children: [mainBody, _buildFloatingButtons()]),
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
    final s = AppStrings.of(context);
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
                    tooltip: s.filterKanji,
                    onTap: () => _toggleDrawer(OpenDrawer.filter),
                  ),
                ),
                // 右下角: 齿轮, 展开设置抽屉 (从右侧滑出)。
                Positioned(
                  right: 16,
                  bottom: 16,
                  child: _FloatingButton(
                    type: DrawerIconType.settings,
                    tooltip: s.settings,
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
    final s = AppStrings.of(context);
    return AppBar(
      // 漢字 → かな · ローマ字 是日文书写体系本身的标识, 两种语言下都保留。
      title: Row(
        children: [
          const Text('漢字'),
          const SizedBox(width: 6),
          const Icon(
            Icons.arrow_forward_rounded,
            size: 16,
            color: AppTheme.accent,
          ),
          const SizedBox(width: 6),
          const Text('かな'),
          const SizedBox(width: 10),
          Text('·', style: TextStyle(color: colors.textSecondary)),
          const SizedBox(width: 10),
          const Text(
            'ローマ字',
            style: TextStyle(
              color: AppTheme.indigo,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      actions: [
        AnimatedBuilder(
          animation: _queryStore,
          builder: (context, _) {
            final favorite = _queryStore.isFavorite(_controller.text);
            return IconButton(
              tooltip: s.favoritesLabel,
              onPressed: _toggleFavorite,
              icon: Icon(
                favorite ? Icons.star_rounded : Icons.star_border_rounded,
                color: favorite ? AppTheme.kanjiHighlight : null,
              ),
            );
          },
        ),
        IconButton(
          tooltip: s.clear,
          onPressed: _clear,
          icon: const Icon(Icons.delete_outline_rounded),
        ),
      ],
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
            final centeredTop = (constraints.maxHeight - focusBlockHeight) / 2;
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
                bottom:
                    MediaQuery.of(context).viewInsets.bottom +
                    (_buttonsVisible ? 88 : 24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 聚焦态在输入框上方显示标题。
                  _HeroTitle(t: t),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildInput(t),
                  ),
                  // 聚焦态展示收藏与最近查询, 展开后淡出。
                  _QueryChips(t: t, onUseQuery: _useQuery),
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

  Widget _buildInput(double t) {
    final colors = AppTheme.of(context);
    final s = AppStrings.of(context);
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
        hintText: s.inputHint,
        suffixIcon: _hasInput
            ? IconButton(
                icon: Icon(
                  Icons.close_rounded,
                  size: 18,
                  color: colors.textSecondary,
                ),
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
              if (!isSingleKanji)
                _Toolbar(
                  viewMode: _viewMode,
                  showRomaji: _showRomaji,
                  onSelectMode: (mode) => setState(() => _viewMode = mode),
                  onRomajiChanged: (value) =>
                      setState(() => _showRomaji = value),
                ),
              _buildContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    final s = AppStrings.of(context);
    if (_errorKind != null) {
      final msg = switch (_errorKind!) {
        _ErrorKind.dictionary => s.dictionaryInitFailed(_errorDetail!),
        _ErrorKind.analysis => s.analysisFailed(_errorDetail!),
      };
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: _buildMessage(
          Icons.error_outline_rounded,
          msg,
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
            SingleKanjiView(reading: result.singleKanji!, onWordTap: _useQuery)
          else if (_viewMode == ViewMode.alignment)
            AlignmentTable(result: result, showRomaji: _showRomaji)
          else ...[
            FuriganaView(result: result, showRomaji: _showRomaji),
            const SizedBox(height: 16),
            _FuriganaFooter(result: result),
          ],
        ],
      ),
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
            Text(
              msg,
              textAlign: TextAlign.center,
              style: TextStyle(color: colors.textSecondary, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}

/// 词典预热中的加载态。
class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final s = AppStrings.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircularProgressIndicator(color: AppTheme.accent),
          const SizedBox(height: 16),
          Text(
            s.loadingDictionary,
            style: TextStyle(color: colors.textSecondary),
          ),
        ],
      ),
    );
  }
}

/// 聚焦态显示的品牌标题, 展开后淡出。
///
/// 「漢字仮名」四字任何语言下都保持繁体原样, 作为应用标识。
class _HeroTitle extends StatelessWidget {
  final double t;

  const _HeroTitle({required this.t});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final s = AppStrings.of(context);
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
              s.tagline,
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
}

/// 聚焦态显示的收藏与最近查询词条, 展开后随动画淡出。
class _QueryChips extends StatelessWidget {
  /// 展开动画值, 决定透明度与可交互性。
  final double t;

  final ValueChanged<String> onUseQuery;

  const _QueryChips({required this.t, required this.onUseQuery});

  @override
  Widget build(BuildContext context) {
    final opacity = (1 - t).clamp(0.0, 1.0);
    if (opacity <= 0.001) return const SizedBox.shrink();

    final store = QueryStore.instance;
    return AnimatedBuilder(
      animation: store,
      builder: (context, _) {
        final favorites = store.favorites;
        final history = store.history;
        if (favorites.isEmpty && history.isEmpty) {
          return const SizedBox.shrink();
        }

        return Opacity(
          opacity: opacity,
          child: IgnorePointer(
            ignoring: opacity < 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 14),
                if (favorites.isNotEmpty)
                  _buildChipSection(
                    context,
                    icon: Icons.star_rounded,
                    label: AppStrings.of(context).favoritesLabel,
                    items: favorites,
                    favorite: true,
                  ),
                if (favorites.isNotEmpty && history.isNotEmpty)
                  const SizedBox(height: 12),
                if (history.isNotEmpty)
                  _buildChipSection(
                    context,
                    icon: Icons.history_rounded,
                    label: AppStrings.of(context).historyLabel,
                    items: history,
                    favorite: false,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// 一组查询词条: 小标签行 + 横向滑动的 chip。
  Widget _buildChipSection(
    BuildContext context, {
    required IconData icon,
    required String label,
    required List<String> items,
    required bool favorite,
  }) {
    final colors = AppTheme.of(context);
    final s = AppStrings.of(context);
    final store = QueryStore.instance;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 13, color: colors.textSecondary),
              const SizedBox(width: 5),
              Text(
                label,
                style: TextStyle(
                  color: colors.textSecondary,
                  fontSize: 11,
                  letterSpacing: 0.5,
                ),
              ),
              const Spacer(),
              // 只有历史提供清空; 收藏需逐条长按移除, 避免误操作。
              if (!favorite)
                Semantics(
                  button: true,
                  onTap: () {
                    HapticFeedback.lightImpact();
                    store.clearHistory();
                    showToast(context, s.historyCleared);
                  },
                  child: GestureDetector(
                    onTap: () {
                      HapticFeedback.lightImpact();
                      store.clearHistory();
                      showToast(context, s.historyCleared);
                    },
                    child: Text(
                      s.clearHistory,
                      style: TextStyle(
                        color: colors.textSecondary,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            child: Row(
              children: [
                for (var i = 0; i < items.length; i++) ...[
                  if (i > 0) const SizedBox(width: 8),
                  _QueryChip(
                    text: items[i],
                    favorite: favorite,
                    onTap: () => onUseQuery(items[i]),
                    onLongPress: () {
                      HapticFeedback.lightImpact();
                      final item = items[i];
                      if (favorite) {
                        store.toggleFavorite(item);
                        showToast(context, s.favoriteRemoved(item));
                      } else {
                        store.removeHistory(item);
                        showToast(context, s.historyRemoved(item));
                      }
                    },
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 展开态工具栏: 对照 / 振假名视图切换 + 罗马音开关。
///
/// 无状态: 状态持久化在 SettingsController, 由宿主 [HomePage] setState
/// 驱动重建 (切换必须同时刷新下方结果区, 不能只重绘工具栏自身)。
class _Toolbar extends StatelessWidget {
  final ViewMode viewMode;
  final bool showRomaji;
  final ValueChanged<ViewMode> onSelectMode;
  final ValueChanged<bool> onRomajiChanged;

  const _Toolbar({
    required this.viewMode,
    required this.showRomaji,
    required this.onSelectMode,
    required this.onRomajiChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final s = AppStrings.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: colors.surface,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: colors.border),
            ),
            child: Row(
              children: [
                _segment(
                  context,
                  s.viewAlignment,
                  ViewMode.alignment,
                  Icons.table_rows_rounded,
                ),
                _segment(
                  context,
                  s.viewFurigana,
                  ViewMode.furigana,
                  Icons.text_fields_rounded,
                ),
              ],
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                s.romajiToggle,
                style: TextStyle(
                  color: showRomaji ? colors.textPrimary : colors.textSecondary,
                  fontSize: 13,
                ),
              ),
              const SizedBox(width: 4),
              Switch(
                value: showRomaji,
                onChanged: onRomajiChanged,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _segment(
    BuildContext context,
    String label,
    ViewMode mode,
    IconData icon,
  ) {
    final colors = AppTheme.of(context);
    final selected = viewMode == mode;
    return MergeSemantics(
      child: Semantics(
        button: true,
        selected: selected,
        onTap: () => onSelectMode(mode),
        child: GestureDetector(
          onTap: () => onSelectMode(mode),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            decoration: BoxDecoration(
              color: selected ? AppTheme.accent : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 14,
                  color: selected ? Colors.white : colors.textSecondary,
                ),
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
        ),
      ),
    );
  }
}

/// 振假名视图页脚: 全文平假名与实际发音, 支持复制。
class _FuriganaFooter extends StatelessWidget {
  final AnalysisResult result;

  const _FuriganaFooter({required this.result});

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final s = AppStrings.of(context);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.border),
      ),
      child: Column(
        children: [
          _FooterLine(
            icon: Icons.volume_up_rounded,
            label: s.labelHiragana,
            value: result.fullHiragana,
            color: AppTheme.accent,
            copyTip: s.copiedFullHiragana,
          ),
          // 存在发音差异时补充一行实际发音。
          if (result.hasAnyPronunciationShift) ...[
            const SizedBox(height: 10),
            _FooterLine(
              icon: Icons.record_voice_over_rounded,
              label: s.labelPronunciation,
              value: result.fullPronunciation,
              color: colors.textSecondary,
              copyTip: s.copiedPronunciation,
            ),
          ],
        ],
      ),
    );
  }
}

/// 页脚中的一行: 图标 + 标签 + 可选中内容 + 复制按钮。
class _FooterLine extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  final String copyTip;

  const _FooterLine({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    required this.copyTip,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final s = AppStrings.of(context);
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
              color: colors.textPrimary,
              fontSize: 15,
              height: 1.5,
            ),
          ),
        ),
        IconButton(
          tooltip: s.copy,
          iconSize: 18,
          onPressed: () => copyWithToast(context, value, copyTip),
          icon: Icon(Icons.copy_rounded, color: colors.textSecondary),
        ),
      ],
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

/// 空态下的一条查询记录 / 收藏词条。
class _QueryChip extends StatelessWidget {
  final String text;
  final bool favorite;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const _QueryChip({
    required this.text,
    required this.favorite,
    required this.onTap,
    required this.onLongPress,
  });

  /// chip 上最多显示的字符数 (按 rune 计), 超出省略。
  static const _maxDisplay = 12;

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    final runes = text.runes.toList();
    final display = runes.length > _maxDisplay
        ? '${String.fromCharCodes(runes.take(_maxDisplay))}…'
        : text;

    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: favorite
                ? AppTheme.kanjiHighlight.withValues(alpha: 0.4)
                : colors.border,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (favorite) ...[
              Icon(
                Icons.star_rounded,
                size: 13,
                color: AppTheme.kanjiHighlight,
              ),
              const SizedBox(width: 4),
            ],
            Text(
              display,
              style: TextStyle(color: colors.textPrimary, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}

double _lerp(double a, double b, double t) => a + (b - a) * t;

/// 简易防抖器, 避免每次按键都触发形态素分析, 同时支持取消已飞行的异步任务。
class _Debouncer {
  final Duration delay;
  Timer? _timer;
  int _activeId = 0;

  _Debouncer(this.delay);

  /// 安排执行 [action]。如果在等待期或异步执行期间安排了新任务，旧任务的
  /// [isCancelled] 会返回 true，从而提早中止分词与状态更新。
  void run(Future<void> Function(bool Function() isCancelled) action) {
    _timer?.cancel();
    final id = ++_activeId;
    _timer = Timer(delay, () {
      if (id != _activeId) return;
      action(() => id != _activeId);
    });
  }

  /// 取消当前等待中与飞行中的任务。
  void cancel() {
    _timer?.cancel();
    _activeId++;
  }

  void dispose() => cancel();
}
