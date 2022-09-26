import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class YlButtonGroupItem {
  final Widget child;
  final VoidCallback? onPressed;
  final ButtonClickCallback? onAsyncPressed;
  final YlButtonType type;
  final double width;

  YlButtonGroupItem(
      {required this.child,
      this.width = 44,
      this.onAsyncPressed,
      this.onPressed,
      required this.type});

  YlButton asButton(YlButtonSize size) {
    return YlButton.fromType(
      size: size,
      type: type,
      child: child,
      width: width,
      onPressed: onPressed,
      onAsyncPressed: onAsyncPressed,
    );
  }
}

enum YlButtonGroupWeight { equaly, primaryBigger }

class YlButtonGroup extends StatelessWidget {
  final List<YlButtonGroupItem> children;
  final YlButtonGroupWeight weight;
  final Color backgroundColor;
  final EdgeInsets padding;

  const YlButtonGroup(
      {Key? key,
      required this.children,
      this.weight = YlButtonGroupWeight.equaly,
      this.backgroundColor = YlColors.white,
      this.padding = const EdgeInsets.symmetric(horizontal: 20, vertical: 10)})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // 最多两个按钮
    var count = min(2, children.length);
    var size = YlButtonSize.max;
    if (count > 1) {
      size = YlButtonSize.large;
    }
    List<Widget> widgets = [];

    if (count == 1) {
      var e = children.first;
      widgets.add(Expanded(child: e.asButton(size)));
    } else {
      // 两个按钮的情况
      for (var i = 0; i < count; i++) {
        var e = children[i];
        Widget widget = e.asButton(size);
        if (weight == YlButtonGroupWeight.equaly) {
          widget = Expanded(
            child: widget,
          );
        } else if (weight == YlButtonGroupWeight.primaryBigger) {
          var leftWidth = MediaQuery.of(context).size.width -
              padding.left -
              padding.right -
              8;
          var smallWidth = leftWidth / 3.0;
          if (e.type == YlButtonType.primary ||
              e.type == YlButtonType.subPrimary) {
            widget = Expanded(child: widget);
          } else {
            widget = Container(
              width: smallWidth,
              constraints: BoxConstraints(minWidth: 109),
              child: widget,
            );
          }
        }

        if (i > 0) {
          widgets.add(SizedBox(
            width: 8,
          ));
        }
        widgets.add(widget);
      }
    }

    return Container(
      color: backgroundColor,
      padding: padding,
      child: Row(
        children: widgets,
      ),
    );
  }
}
