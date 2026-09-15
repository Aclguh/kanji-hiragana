import 'package:flutter/material.dart';

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
class SlidingDrawer extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final colors = AppTheme.of(context);
        final panelWidth = constraints.maxWidth * widthFactor;

        return Stack(
          children: [
            // 主内容: 不做位移, 只被遮罩压暗。
            child,

            // 压暗遮罩: 覆盖整个屏幕, 点击收起。未展开时不拦截手势。
            //
            // 必须显式 Positioned.fill, 否则 ColoredBox 在该 Stack 中
            // 没有约束, 命中区域会退化为零。
            Positioned.fill(
              child: IgnorePointer(
                ignoring: !open,
                child: AnimatedOpacity(
                  opacity: open ? 1 : 0,
                  duration: duration,
                  child: GestureDetector(
                    onTap: () => close(context),
                    behavior: HitTestBehavior.opaque,
                    child: ColoredBox(color: colors.scrim),
                  ),
                ),
              ),
            ),

            // 抽屉面板: 从屏幕外侧滑入 (关闭时完全移出可视区域)。
            //
            // 完全收起时不构建面板内容, 避免未展开的抽屉仍然参与
            // 语义树与命中测试 (例如两处「关闭」按钮同时可被找到)。
            AnimatedPositioned(
              duration: duration,
              curve: Curves.easeOutCubic,
              top: 0,
              bottom: 0,
              width: panelWidth,
              left: side == DrawerSide.left
                  ? (open ? 0 : -panelWidth)
                  : null,
              right: side == DrawerSide.right
                  ? (open ? 0 : -panelWidth)
                  : null,
              child: IgnorePointer(
                ignoring: !open,
                child: ExcludeSemantics(
                  excluding: !open,
                  child: open ? panel : const SizedBox.expand(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  /// 请求关闭当前抽屉 (交由宿主处理)。
  static void close(BuildContext context) {
    final handler = DrawerCloseNotification.maybeOf(context);
    handler?.call();
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
                  child: ListView(
                    controller: _scrollController,
                    primary: false,
                    // 底部留白, 避免内容贴住操作区。
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                    children: widget.children,
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
                    style: TextStyle(
                      color: colors.textSecondary,
                      fontSize: 11,
                    ),
                  ),
                ],
              ],
            ),
          ),
          IconButton(
            tooltip: '关闭',
            onPressed: () => SlidingDrawer.close(context),
            icon: Icon(Icons.close_rounded,
                size: 20, color: colors.textSecondary),
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
