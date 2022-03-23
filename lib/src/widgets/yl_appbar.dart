import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ylui/flutter_ylui.dart';
import 'package:flutter_ylui/src/helper.dart';

class YlAppBar extends StatelessWidget implements PreferredSizeWidget {
  final SystemUiOverlayStyle? systemUiOverlayStyle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Widget? leading;
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
      toolbarHeight: 44,
      leadingWidth: 64,
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

class YlAppBarButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final Color? backgroundColor;
  final EdgeInsets? padding;

  const YlAppBarButton({
    Key? key,
    this.onPressed,
    required this.child,
    this.backgroundColor,
    this.padding,
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
      child: child,
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
    return YlAppBarButton(
      padding: EdgeInsets.zero,
      backgroundColor: backgroundColor,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(
          horizontal: 14,
        ),
        child: child ??
            getImageFromAssets(
              'back_arrow',
              color: color,
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
