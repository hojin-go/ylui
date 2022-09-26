import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ylui/flutter_ylui.dart';
import 'package:flutter_ylui/src/helper.dart';

const _kAppBarHeight = 44.0;
const _kAppBarLargeTitleHeightExtension = 62.0;
const _kAppBarTitleFadeDuration = Duration(milliseconds: 150);

class YlAppBar extends StatelessWidget implements PreferredSizeWidget {
  final SystemUiOverlayStyle? systemUiOverlayStyle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Widget? leading;
  final double? leadingWidth;
  final Widget? title;
  final List<Widget>? actions;

  /// 是否自动推断添加 leading
  final bool automaticallyImplyLeading;

  @override
  Size get preferredSize => Size.fromHeight(44);

  YlAppBar({
    Key? key,
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.black,
    this.leading,
    this.title,
    this.actions,
    this.automaticallyImplyLeading = true,
    this.systemUiOverlayStyle,
    this.leadingWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var canPop = ModalRoute.of(context)?.canPop ?? false;

    var leadingWidget = leading;

    if (leadingWidget != null &&
        leadingWidget is YlAppBarBackButton &&
        leadingWidget.color == null) {
      // 如果 leading 是 YlAppBarBackButton 且未设置颜色，则自动推断颜色
      leadingWidget = leadingWidget.copyWith(
        color: foregroundColor,
      );
    } else if (leadingWidget == null && automaticallyImplyLeading && canPop) {
      // 如果 leading 为 null，且自动推断为 true，且可以返回，则添加 leading
      leadingWidget = YlAppBarBackButton(
        color: foregroundColor,
      );
    }

    return AppBar(
      backgroundColor: backgroundColor,
      systemOverlayStyle: systemUiOverlayStyle,
      toolbarHeight: _kAppBarHeight,
      leadingWidth: this.leadingWidth ?? 64.0,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: leadingWidget,
      title: title,
      actions: [
        if (actions != null) ...actions!,
        SizedBox(
          width: 10,
        ),
      ],
      titleTextStyle: TextStyle(
        color: foregroundColor,
        fontSize: 17,
        fontWeight: YlFontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: foregroundColor,
        size: 24,
      ),
    );
  }
}

class YlSliverAppBar extends StatelessWidget {
  final SystemUiOverlayStyle? systemUiOverlayStyle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Widget? leading;
  final String title;
  final List<Widget>? actions;

  /// 是否自动推断添加 leading
  final bool automaticallyImplyLeading;

  const YlSliverAppBar({
    Key? key,
    this.systemUiOverlayStyle,
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.black,
    this.leading,
    required this.title,
    this.actions,
    this.automaticallyImplyLeading = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _YlLargeTitleAppBarSliverDelegate(
        persistentHeight: _kAppBarHeight + MediaQuery.of(context).padding.top,
        title: title,
        leading: leading,
        actions: actions,
        automaticallyImplyLeading: automaticallyImplyLeading,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        systemUiOverlayStyle: systemUiOverlayStyle,
      ),
      pinned: true,
    );
  }
}

class _YlLargeTitleAppBarSliverDelegate extends SliverPersistentHeaderDelegate {
  final double persistentHeight;

  final SystemUiOverlayStyle? systemUiOverlayStyle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Widget? leading;
  final String title;
  final List<Widget>? actions;

  /// 是否自动推断添加 leading
  final bool automaticallyImplyLeading;

  _YlLargeTitleAppBarSliverDelegate({
    required this.persistentHeight,
    this.systemUiOverlayStyle,
    this.backgroundColor,
    this.foregroundColor,
    this.leading,
    this.actions,
    required this.title,
    this.automaticallyImplyLeading = true,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final bool showLargeTitle = shrinkOffset < maxExtent - minExtent - 10;

    final YlAppBar persistentNavigationBar = YlAppBar(
      title: showLargeTitle ? null : Text(title),
      systemUiOverlayStyle: systemUiOverlayStyle,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      leading: leading,
      actions: actions,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );

    final largeTitle = Text(title);

    final Widget navBar = Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Positioned(
          top: persistentHeight,
          left: 0.0,
          right: 0.0,
          bottom: 0.0,
          child: Container(
            color: backgroundColor,
            child: ClipRect(
              // The large title starts at the persistent bar.
              // It's aligned with the bottom of the sliver and expands clipped
              // and behind the persistent bar.
              child: OverflowBox(
                minHeight: 0.0,
                maxHeight: double.infinity,
                alignment: AlignmentDirectional.bottomStart,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                  child: SafeArea(
                    top: false,
                    bottom: false,
                    child: AnimatedOpacity(
                      opacity: showLargeTitle ? 1.0 : 0.0,
                      duration: _kAppBarTitleFadeDuration,
                      child: DefaultTextStyle(
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: YlFontWeight.bold,
                            color: foregroundColor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        child: largeTitle,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 0.0,
          right: 0.0,
          top: 0.0,
          child: persistentNavigationBar,
        ),
      ],
    );

    return navBar;
  }

  @override
  double get maxExtent => persistentHeight + _kAppBarLargeTitleHeightExtension;

  @override
  double get minExtent => persistentHeight;

  @override
  bool shouldRebuild(covariant _YlLargeTitleAppBarSliverDelegate oldDelegate) {
    return oldDelegate != this ||
        oldDelegate.persistentHeight != persistentHeight ||
        oldDelegate.actions != actions ||
        oldDelegate.title != title ||
        oldDelegate.leading != leading ||
        oldDelegate.automaticallyImplyLeading != automaticallyImplyLeading ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.foregroundColor != foregroundColor ||
        oldDelegate.systemUiOverlayStyle != systemUiOverlayStyle;
  }
}

class YlAppBarButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsets? padding;

  const YlAppBarButton({
    Key? key,
    this.onPressed,
    required this.child,
    this.backgroundColor,
    this.padding,
    this.foregroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget widget = Container(
      constraints: BoxConstraints(
        minWidth: 44,
        minHeight: 44,
      ),
      alignment: Alignment.center,
      padding: padding ?? const EdgeInsets.all(8),
      color: backgroundColor,
      child: DefaultTextStyle(
        style: TextStyle(
          color: foregroundColor,
          fontSize: 17,
        ),
        child: child,
      ),
    );

    if (onPressed != null) {
      widget = YlTapDetector(
        child: widget,
        onTap: onPressed,
      );
    }

    return widget;
  }
}

/// 导航栏返回按钮，一般放置在左侧，将在内部将图片或图标偏移处理
class YlAppBarBackButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? backgroundColor;

  /// 图片颜色，将只影响默认图标
  final Color? color;

  /// 可传入图标或图片，尺寸不宜超过24x24
  final Widget? child;

  const YlAppBarBackButton({
    Key? key,
    this.onPressed,
    this.backgroundColor,
    this.color,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var padding = EdgeInsets.symmetric(
      horizontal: 14,
    );

    if (child is Text) {
      padding = EdgeInsets.only(
        left: 20,
      );
    }

    return YlAppBarButton(
      padding: EdgeInsets.zero,
      backgroundColor: backgroundColor,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: padding,
        child: DefaultTextStyle(
          style: TextStyle(
            color: color,
            fontSize: 17,
          ),
          child: child ??
              getImageFromAssets(
                'back_arrow',
                color: color,
              ),
        ),
      ),
      onPressed: onPressed ??
          () {
            Navigator.pop(context);
          },
    );
  }

  YlAppBarBackButton copyWith({
    VoidCallback? onPressed,
    Color? backgroundColor,
    Color? color,
    Widget? child,
  }) {
    return YlAppBarBackButton(
      onPressed: onPressed ?? this.onPressed,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      color: color ?? this.color,
      child: child ?? this.child,
    );
  }
}
