import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';
import 'package:flutter_ylui/src/widgets/popover/yl_dialog_action.dart';
import 'package:flutter_ylui/src/yl_color.dart';

/// 自定义弹窗
class YlActionSheet extends StatelessWidget {
  /// 弹窗描述信息，小字
  final String? content;

  /// 弹窗按钮事件，从左到右，从上到下，按钮过多的情况，可能会超出屏幕高度，暂不支持滚动
  final List<YlDialogAction> actions;

  const YlActionSheet({this.content, required this.actions});

  @override
  Widget build(BuildContext context) {
    var cancelActions = actions.where((element) => element.isCancel);
    Widget? cancelButton;
    if (cancelActions.isNotEmpty) {
      var firstAction = cancelActions.first;
      cancelButton = YlTapEffect(
        onTap: firstAction.action,
        child: Container(
          height: 56,
          alignment: Alignment.center,
          child: Text(
            firstAction.title,
            style: YlTextStyles.header4.copyWith(color: YlColors.black70),
          ),
        ),
      );
    }

    var normalActions = actions.where((element) => !element.isCancel);
    var normalButtons = normalActions.map((e) {
      return YlTapEffect(
        onTap: e.action,
        child: Container(
          height: 56,
          alignment: Alignment.center,
          child: Text(
            e.title,
            style: YlTextStyles.header4.copyWith(
                color: e.highlight
                    ? YlColors.branding2
                    : e.alert
                        ? YlColors.alertRed
                        : YlColors.black90),
          ),
        ),
      );
    }).toList();

    return Container(
      decoration: BoxDecoration(
          color: YlColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (content != null)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                child: DefaultTextStyle(
                  style: YlTextStyles.caption.copyWith(color: YlColors.black50),
                  child: Text(
                    content!,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ...normalButtons,
            if (cancelButton != null)
              Container(
                height: 8,
                color: YlColors.grey3,
              ),
            if (cancelButton != null) cancelButton,
          ],
        ),
      ),
    );
  }
}

/// 快捷展示自定义弹窗的方法
Future<T?> showYlActionSheet<T>(BuildContext context,
    {String? content,
    required List<YlDialogAction> actions,
    RouteSettings? routeSettings}) {
  var canCancel = actions.where((element) => element.isCancel).isNotEmpty;
  return showCupertinoModalPopup<T>(
      context: context,
      builder: (context) {
        Widget widget = YlActionSheet(content: content, actions: actions);
        if (!canCancel) {
          widget = WillPopScope(
            onWillPop: () async => false,
            child: widget,
          );
        }
        return widget;
      },
      routeSettings: routeSettings);
}
