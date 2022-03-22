import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ylui/src/widgets/popover/yl_dialog_action.dart';
import 'package:flutter_ylui/src/widgets/popover/yl_dialog_constants.dart';
import 'package:flutter_ylui/src/widgets/popover/yl_dialog_divider.dart';

import '../../../flutter_ylui.dart';

/// 自定义弹窗
class YlDialog extends StatelessWidget {
  /// 弹窗标题
  final String? title;

  /// 弹窗描述信息，小字
  final String? content;

  /// 弹窗按钮事件，从左到右，从上到下，按钮过多的情况，可能会超出屏幕高度，暂不支持滚动
  final List<YlDialogAction> actions;

  const YlDialog({required this.title, this.content, required this.actions});

  @override
  Widget build(BuildContext context) {
    List<Widget> actionWidgets = [];

    var actionLength = actions.length;
    for (int i = 0; i < actionLength; i++) {
      var action = actions[i];
      Widget actionWidget = YlTapEffect(
        onTap: action.action,
        child: Container(
          height: 55,
          child: Center(
            child: Text(
              action.title,
              style: YlTextStyles.header5.copyWith(
                  decoration: TextDecoration.none,
                  // 通常按钮文字为单行，重写他的高度，使其垂直居中
                  height: 1.3,
                  color: action.highlight
                      ? YlColors.branding2
                      : (action.alert ? YlColors.alertRed : YlColors.black90)),
            ),
          ),
        ),
      );

      if (actionLength <= 2) {
        actionWidget = Expanded(child: actionWidget);
      }
      actionWidgets.add(actionWidget);
    }

    Widget actionContainer;
    if (actionLength <= 2) {
      List<Widget> children = [];
      for (var i = 0; i < actionWidgets.length; i++) {
        if (i > 0) {
          children.add(YlDialogDivider(
            horizontal: false,
          ));
        }
        children.add(actionWidgets[i]);
      }
      actionContainer = Row(
        children: children,
      );
    } else {
      List<Widget> children = [];
      for (var i = 0; i < actionWidgets.length; i++) {
        if (i > 0) {
          children.add(YlDialogDivider(
            horizontal: true,
          ));
        }
        children.add(actionWidgets[i]);
      }
      actionContainer = Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      );
    }

    var hasTitle = title != null && title!.isNotEmpty;
    var hasContent = content != null && content!.isNotEmpty;

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Center(
        child: CupertinoPopupSurface(
          child: Container(
            width: DefaultDialogWidth,
            color: CupertinoColors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  constraints: BoxConstraints(minHeight: 104),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Visibility(
                          child: Text(
                            '$title',
                            textAlign: TextAlign.center,
                            style: YlTextStyles.header5.copyWith(
                              decoration: TextDecoration.none,
                            ),
                          ),
                          visible: hasTitle),
                      Visibility(
                        child: SizedBox(
                          height: 16,
                        ),
                        visible: hasContent,
                      ),
                      Visibility(
                        child: Text(
                          '$content',
                          textAlign: TextAlign.center,
                          style: YlTextStyles.body1.copyWith(
                            color: YlColors.black50,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        visible: hasContent,
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 0.5,
                  thickness: 0.5,
                  color: YlColors.grey2,
                ),
                actionContainer
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 快捷展示自定义弹窗的方法
Future<T?> showYlDialog<T>(BuildContext context,
    {String? title,
    String? content,
    required List<YlDialogAction> actions,
    RouteSettings? routeSettings}) {
  return showCupertinoDialog<T>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return YlDialog(title: title, content: content, actions: actions);
      },
      routeSettings: routeSettings);
}
