import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'core/kanji_converter.dart';
import 'core/kanji_filter.dart';
import 'core/morpheme.dart';
import 'widgets/about_page.dart';
import 'widgets/feedback.dart';
import 'widgets/filter_drawer.dart';
import 'widgets/filter_result_page.dart';
import 'widgets/settings_drawer.dart';
import 'widgets/home/export_sheet.dart';
import 'widgets/home/hero_title.dart';
import 'widgets/home/home_chrome.dart';
import 'widgets/home/home_result_sliver.dart';
import 'widgets/home/home_search_input.dart';
import 'widgets/home/home_coordinator.dart';
import 'widgets/home/home_toolbar.dart';
import 'widgets/home/query_chips.dart';
import 'widgets/sliding_drawer.dart';
import 'package:kanji_hiragana/widgets/app_scopes.dart';

export 'widgets/home/home_coordinator.dart' show HomeErrorKind;
export 'widgets/home/home_toolbar.dart' show ViewMode;

class HomePage extends StatefulWidget {
  final HomeCoordinator? coordinator;

  const HomePage({super.key, this.coordinator});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  HomeCoordinator? _coordinator;
  StreamSubscription<String>? _externalQuerySub;

  /// 驱动「聚焦态 ↔ 展开态」过渡的动画。
  late final AnimationController _anim;

  OpenDrawer _openDrawer = OpenDrawer.none;

  /// 当前生效的筛选条件。
  KanjiFilter _filter = KanjiFilter.initial;

  /// 是否处于查询结果界面态。
  ///
  /// 用户在主界面输入文字后暂时停留在主界面，点击右箭头按钮才进入查询态；
  /// 在查询态下编辑文字也不会立即刷新，点击右箭头按钮后才刷新。
  bool _isSearching = false;

  bool _showAllResults = false;

  AnalysisResult? _trackedResult;

  /// 是否有输入内容。
  bool get _hasInput => _controller.text.trim().isNotEmpty;

  /// 抽屉是否处于展开状态。
  bool get _drawerOpen => _openDrawer != OpenDrawer.none;

  /// 当前视图, 持久化在设置里, 重启后保持。
  ViewMode get _viewMode => ViewMode.fromName(
        _coordinator?.services.settings.viewModeName,
      );

  set _viewMode(ViewMode mode) =>
      _coordinator?.services.settings.setViewModeName(mode.name);

  /// 罗马音开关, 同样持久化。
  bool get _showRomaji =>
      _coordinator?.services.settings.showRomaji ?? true;

  set _showRomaji(bool value) =>
      _coordinator?.services.settings.setShowRomaji(value);

  @override
  void initState() {
    super.initState();
    _anim = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 420),
    );
    _controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    if (_controller.text.isEmpty && _isSearching) {
      _isSearching = false;
      _anim.reverse();
    }
    if (mounted) setState(() {});
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_coordinator == null) {
      final coordinator = widget.coordinator ??
          HomeCoordinator(services: KanjiServicesScope.of(context));
      _coordinator = coordinator;
      coordinator.addListener(_onCoordinatorChanged);
      _externalQuerySub = coordinator.onExternalQuery.listen((text) {
        if (mounted) _useQuery(text);
      });
      coordinator.init();
    }
  }

  void _onCoordinatorChanged() {
    final result = _coordinator?.result;
    if (!identical(result, _trackedResult)) {
      _trackedResult = result;
      _showAllResults = false;
    }
    if (mounted) setState(() {});
  }

  void _onChanged(String value) {
    // 文本变更时仅触发重绘以更新输入框右侧按钮可用性，
    // 不再自动防抖刷新，实现「点击右箭头按钮后才刷新」的需求。
    setState(() {});
  }

  /// 提交并执行查询。
  ///
  /// 自动将中文简体汉字转换为日本新字体 (如「练习」->「練習」)，
  /// 更新输入框显示、展开结果界面并执行形态素分析与单字检索。
  void _submitQuery([String? explicitText]) {
    final raw = (explicitText ?? _controller.text).trim();
    if (raw.isEmpty) {
      if (_isSearching) {
        setState(() => _isSearching = false);
        _anim.reverse();
      }
      return;
    }

    final converted = KanjiConverter.toJapaneseKanji(raw);
    if (_controller.text != converted) {
      _controller.text = converted;
      _controller.selection =
          TextSelection.collapsed(offset: converted.length);
    }

    _focusNode.unfocus();
    if (!_isSearching) {
      setState(() => _isSearching = true);
      _anim.forward();
    }

    _coordinator?.runAnalysis(
      converted,
      onTruncated: (limit) {
        if (mounted) {
          showToast(
            context,
            AppStringsScope.of(context).inputExceededLimit(limit),
          );
        }
      },
    );
  }

  /// 清空输入并保持焦点 (供界面上的 ✕ / 垃圾桶按钮使用)。
  void _clear() {
    _coordinator?.clear();
    _controller.clear();
    if (_isSearching) {
      setState(() => _isSearching = false);
      _anim.reverse();
    }
    _focusNode.requestFocus();
  }

  /// 清空输入并收起键盘 (供系统返回键使用)。
  void _clearAndDismissKeyboard() {
    _coordinator?.clear();
    _controller.clear();
    if (_isSearching) {
      setState(() => _isSearching = false);
      _anim.reverse();
    }
    _focusNode.unfocus();
  }

  /// 点按历史 / 收藏词条: 回填并直接进入查询界面。
  void _useQuery(String text) {
    _submitQuery(text);
  }

  /// 切换当前查询的收藏状态。
  void _toggleFavorite() {
    final text = _controller.text.trim();
    if (text.isEmpty || _coordinator == null) return;
    final added = _coordinator!.toggleFavorite(text);
    final s = AppStringsScope.of(context);
    showToast(context, added ? s.favoriteAdded(text) : s.favoriteRemoved(text));
  }

  void _toggleDrawer(OpenDrawer which) {
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
        .push(MaterialPageRoute<void>(builder: (_) => const AboutPage()));
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
    _externalQuerySub?.cancel();
    _coordinator?.removeListener(_onCoordinatorChanged);
    if (widget.coordinator == null) {
      _coordinator?.dispose();
    }
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    _focusNode.dispose();
    _anim.dispose();
    super.dispose();
  }

  /// 处理系统返回键。
  ///
  /// 优先级: 收起已展开的抽屉 > 退出查询结果界面 > 清空输入内容 > 退出应用。
  /// 返回 true 表示本次返回已被消费, 不应退出应用。
  bool _onBackPressed() {
    if (_drawerOpen) {
      _closeDrawer();
      return true;
    }
    if (_isSearching || _hasInput) {
      _clearAndDismissKeyboard();
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = _coordinator?.loading ?? true;
    final mainBody = Scaffold(
      backgroundColor: Colors.transparent,
      appBar: _isSearching ? _buildAppBar() : null,
      body: SafeArea(
        child: isLoading ? const HomeLoadingView() : _buildAnimatedBody(),
      ),
    );

    // 抽屉外壳: 面板自带压暗遮罩, 主界面内容保持不动。
    return PopScope(
      // 仍有抽屉展开或正处于查询界面时拦截返回键, 避免误退出应用。
      canPop: !_drawerOpen && !_isSearching,
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
  /// 仅在主界面(未进入查询结果界面)且没有抽屉展开时出现;
  /// 一旦进入查询界面, 按钮即让位于结果内容区。
  bool get _buttonsVisible => !_isSearching && !_drawerOpen;

  /// 右下角设置按钮 + 左下角筛选按钮。
  Widget _buildFloatingButtons() {
    return HomeFloatingButtons(
      visible: _buttonsVisible,
      onFilter: () => _toggleDrawer(OpenDrawer.filter),
      onSettings: () => _toggleDrawer(OpenDrawer.settings),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return HomeTopBar(
      controller: _controller,
      queryStore: _coordinator!.services.queryStore,
      onToggleFavorite: _toggleFavorite,
      onClear: _clear,
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
            final maxLimit = constraints.maxHeight * 0.42;
            final clampedTop = maxLimit < 24.0
                ? math.max(0.0, centeredTop)
                : centeredTop.clamp(24.0, maxLimit);
            final topSpace = _lerp(
              12.0,
              clampedTop,
              1 - t,
            );
            final bottomSpace =
                MediaQuery.of(context).viewInsets.bottom +
                (_buttonsVisible ? 88 : 24);

            return CustomScrollView(
              keyboardDismissBehavior:
                  ScrollViewKeyboardDismissBehavior.onDrag,
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.only(top: topSpace),
                  sliver: SliverList.list(
                    children: [
                      // 聚焦态在输入框上方显示标题。
                      HeroTitle(t: t),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: HomeSearchInput(
                          controller: _controller,
                          focusNode: _focusNode,
                          isSearching: _isSearching,
                          hasInput: _hasInput,
                          progress: t,
                          onChanged: _onChanged,
                          onSubmit: _submitQuery,
                          onPasted: () => setState(() {}),
                        ),
                      ),
                      // 聚焦态展示收藏与最近查询, 展开后淡出。
                      QueryChips(t: t, onUseQuery: _useQuery),
                    ],
                  ),
                ),
                if (t > 0.001)
                  SliverPadding(
                    padding: EdgeInsets.fromLTRB(
                      16,
                      18 * (1 - t),
                      16,
                      0,
                    ),
                    sliver: SliverIgnorePointer(
                      ignoring: t < 0.5,
                      sliver: SliverOpacity(
                        opacity: t.clamp(0.0, 1.0),
                        sliver: _buildRevealSliver(t),
                      ),
                    ),
                  ),
                SliverToBoxAdapter(child: SizedBox(height: bottomSpace)),
              ],
            );
          },
        );
      },
    );
  }

  /// 展开态才可见的工具栏与结果区。
  Widget _buildRevealSliver(double t) {
    final result = _coordinator?.result;
    // 单汉字只显示音读/训读详解, 视图切换与罗马音开关都不适用。
    final isSingleKanji = result?.isSingleKanji ?? false;

    return SliverMainAxisGroup(
      slivers: [
        if (!isSingleKanji && result != null)
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HomeToolbar(
                  viewMode: _viewMode,
                  showRomaji: _showRomaji,
                  onSelectMode: (mode) => setState(() => _viewMode = mode),
                  onRomajiChanged: (value) =>
                      setState(() => _showRomaji = value),
                  onExport: () => showAnalysisExportSheet(context, result),
                ),
                if (_coordinator?.analysisInProgress ?? false)
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: LinearProgressIndicator(minHeight: 2),
                  ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        _buildContentSliver(),
      ],
    );
  }

  Widget _buildContentSliver() {
    return HomeResultSliver(
      result: _coordinator?.result,
      errorKind: _coordinator?.errorKind,
      errorDetail: _coordinator?.errorDetail,
      viewMode: _viewMode,
      showRomaji: _showRomaji,
      showAllResults: _showAllResults,
      onToggleShowAll: () =>
          setState(() => _showAllResults = !_showAllResults),
      onWordTap: _useQuery,
    );
  }
}

double _lerp(double a, double b, double t) => a + (b - a) * t;
