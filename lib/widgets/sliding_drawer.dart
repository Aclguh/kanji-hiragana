import 'package:flutter/material.dart';

import '../core/strings.dart';
import '../theme.dart';

/// 抽屉停靠方向。
enum DrawerSide {
  /// 从屏幕左侧滑出。
  left,

  /// 从屏幕右侧滑出。
  right,
}

/// 同一时刻可展开的抽屉。
enum OpenDrawer {
  none,

  /// 筛选 (左下角按钮, 从左滑出)。
  filter,

  /// 设置 (右下角按钮, 从右滑出)。
  settings,
}

/// 侧边抽屉: 面板本身带压暗遮罩, 主界面内容保持不动。
///
/// 与 [Scaffold.drawer] 的区别在于:
/// - 面板宽度为屏幕的 [widthFactor] (默认 2/3), 而非固定宽度;
/// - 遮罩 (scrim) 覆盖整个屏幕, 点击任意处即可收起, 主内容不做位移。
class SlidingDrawer extends StatefulWidget {
  /// 抽屉停靠方向。
  final DrawerSide side;

  /// 是否展开。
  final bool open;

  /// 抽屉宽度占屏幕宽度的比例。
  final double widthFactor;

  /// 主内容 (保持不动, 仅被遮罩压暗)。
  final Widget child;

  /// 抽屉内容。
  final Widget panel;

  /// 展开/收起的动画时长。
  static const Duration duration = Duration(milliseconds: 320);

  const SlidingDrawer({
    super.key,
    required this.side,
    required this.open,
    required this.child,
    required this.panel,
    this.widthFactor = 2 / 3,
  });

  @override
  State<SlidingDrawer> createState() => _SlidingDrawerState();

  /// 请求关闭当前抽屉 (交由宿主处理)。
  static void close(BuildContext context) {
    final handler = DrawerCloseNotification.maybeOf(context);
    handler?.call();
  }
}

class _SlidingDrawerState extends State<SlidingDrawer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final CurvedAnimation _curve;

  /// 面板内容是否仍挂在树上。
  ///
  /// 「面板是否构建内容」与「面板是否参与动画」是两件事: 关闭时若立即
  /// 卸载内容, 滑出的只是一个空透明框, 动画形同虚设。因此关闭动画期间
  /// 保留内容 (位置由动画值驱动), 动画结束 (dismissed) 后才真正卸载。
  bool _panelMounted = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: SlidingDrawer.duration,
      value: widget.open ? 1.0 : 0.0,
    );
    _curve = CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
    _panelMounted = widget.open;
    _controller.addStatusListener(_onStatusChanged);
  }

  void _onStatusChanged(AnimationStatus status) {
    if (status == AnimationStatus.dismissed && !widget.open && _panelMounted) {
      setState(() => _panelMounted = false);
    }
  }

  @override
  void didUpdateWidget(covariant SlidingDrawer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.open == oldWidget.open) return;
    if (widget.open) {
      setState(() => _panelMounted = true);
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final colors = AppTheme.of(context);
        final panelWidth = constraints.maxWidth * widget.widthFactor;

        return AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            final panelOffset = panelWidth * (1 - _curve.value);

            return Stack(
              children: [
                // 主内容: 不做位移, 只被遮罩压暗。
                widget.child,

                // 压暗遮罩: 覆盖整个屏幕, 点击收起。未展开时不拦截手势。
                //
                // 必须显式 Positioned.fill, 否则 ColoredBox 在该 Stack 中
                // 没有约束, 命中区域会退化为零。
                //
                // 「点击空白处关闭」对读屏用户不可感知, 因此遮罩在展开时
                // 以「关闭」按钮的语义暴露; 收起后整体移出语义树。
                Positioned.fill(
                  child: ExcludeSemantics(
                    excluding: !widget.open,
                    child: IgnorePointer(
                      ignoring: !widget.open,
                      child: AnimatedOpacity(
                        opacity: widget.open ? 1 : 0,
                        duration: SlidingDrawer.duration,
                        child: GestureDetector(
                          onTap: () => SlidingDrawer.close(context),
                          behavior: HitTestBehavior.opaque,
                          child: Semantics(
                            button: true,
                            label: AppStrings.of(context).close,
                            onTap: () => SlidingDrawer.close(context),
                            child: ColoredBox(color: colors.scrim),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // 抽屉面板: 从屏幕外侧滑入, 滑出过程由动画值驱动,
                // 关闭动画期间内容仍构建 (见 [_panelMounted])。
                //
                // 语义与命中只在完全展开时参与: 关闭一发出, 面板在语义树
                // 里就已消失, 读屏不会摸到正在滑出的内容。
                Positioned(
                  top: 0,
                  bottom: 0,
                  width: panelWidth,
                  left: widget.side == DrawerSide.left ? -panelOffset : null,
                  right: widget.side == DrawerSide.right ? -panelOffset : null,
                  child: IgnorePointer(
                    ignoring: !widget.open,
                    child: ExcludeSemantics(
                      excluding: !widget.open,
                      child: _panelMounted
                          ? widget.panel
                          : const SizedBox.expand(),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

/// 让抽屉面板内部可以请求关闭, 而不必层层传递回调。
class DrawerCloseNotification extends InheritedWidget {
  final VoidCallback onClose;

  const DrawerCloseNotification({
    super.key,
    required this.onClose,
    required super.child,
  });

  static VoidCallback? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<DrawerCloseNotification>()
        ?.onClose;
  }

  @override
  bool updateShouldNotify(DrawerCloseNotification oldWidget) => false;
}

/// 抽屉面板外框 (底色 + 描边), 供设置/筛选共用。
///
/// 四角均为直角, 使面板与屏幕边缘贴合。
class DrawerPanel extends StatefulWidget {
  final DrawerSide side;
  final String title;
  final String? subtitle;
  final List<Widget> children;

  /// 底部操作区, 固定不随内容滚动 (可为空)。
  final Widget? footer;

  const DrawerPanel({
    super.key,
    required this.side,
    required this.title,
    required this.children,
    this.subtitle,
    this.footer,
  });

  @override
  State<DrawerPanel> createState() => _DrawerPanelState();
}

class _DrawerPanelState extends State<DrawerPanel> {
  /// 自建控制器: 若交给 PrimaryScrollController, 多面板共存时会因
  /// 争用同一个 ScrollPosition 而报错。
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppTheme.of(context);
    return Material(
      color: colors.surface,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: widget.side == DrawerSide.right
                ? BorderSide(color: colors.border)
                : BorderSide.none,
            right: widget.side == DrawerSide.left
                ? BorderSide(color: colors.border)
                : BorderSide.none,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(context),
              const Divider(height: 1),
              Expanded(
                child: Scrollbar(
                  controller: _scrollController,
                  thumbVisibility: true,
                  thickness: 5,
                  // SingleChildScrollView 全量构建: 抽屉是短表单,
                  // 懒加载会让折叠线以下的输入框时有时无 (随屏幕高度变化)。
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: widget.children,
                    ),
                  ),
                ),
              ),
              if (widget.footer != null) ...[
                const Divider(height: 1),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                  child: widget.footer,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final colors = AppTheme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 16, 8, 14),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    color: colors.textPrimary,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
                if (widget.subtitle != null) ...[
                  const SizedBox(height: 3),
                  Text(
                    widget.subtitle!,
                    style: TextStyle(color: colors.textSecondary, fontSize: 11),
                  ),
                ],
              ],
            ),
          ),
          IconButton(
            tooltip: AppStrings.of(context).close,
            onPressed: () => SlidingDrawer.close(context),
            icon: Icon(
              Icons.close_rounded,
              size: 20,
              color: colors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

/// 分组标题。
class DrawerSectionLabel extends StatelessWidget {
  final String text;

  const DrawerSectionLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 4),
      child: Text(
        text,
        style: TextStyle(
          color: AppTheme.of(context).textSecondary,
          fontSize: 11,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
