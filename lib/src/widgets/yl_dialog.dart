import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../flutter_ylui.dart';

/// 弹窗按钮的设置
class YlDialogAction {
  /// 按钮文字
  final String? title;

  /// 按钮点击事件
  final VoidCallback? action;

  /// 是否高亮按钮，绿颜色
  final bool highlight;

  /// 是否警告按钮，红颜色
  final bool alert;

  YlDialogAction(
      {this.title, this.action, this.highlight = false, this.alert = false});
}

/// 按钮的分割线
class _YlDialogDivider extends StatelessWidget {
  final bool? horizontal;

  const _YlDialogDivider({Key? key, this.horizontal}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: YlColors.grey2,
      width: horizontal! ? double.infinity : 0.5,
      height: horizontal! ? 0.5 : 56,
    );
  }
}

const _defaultDialogWidth = 268.0;

/// 自定义弹窗
class YlDialog extends StatelessWidget {
  /// 弹窗标题
  final String? title;

  /// 弹窗描述信息，小字
  final String? content;

  /// 弹窗按钮事件，从左到右，从上到下，按钮过多的情况，可能会超出屏幕高度，暂不支持滚动
  final List<YlDialogAction>? actions;

  const YlDialog({required this.title, this.content, required this.actions});

  @override
  Widget build(BuildContext context) {
    List<Widget> actionWidgets = [];

    var actionLength = actions!.length;
    for (int i = 0; i < actionLength; i++) {
      var action = actions![i];
      Widget actionWidget = YlTapEffect(
        onTap: action.action,
        child: Container(
          height: 56,
          child: Center(
            child: Text(
              action.title!,
              style: YlTextStyles.body1.copyWith(
                  color: action.highlight
                      ? YlColors.branding1
                      : (action.alert ? YlColors.alertRed : YlColors.black70)),
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
          children.add(_YlDialogDivider(
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
          children.add(_YlDialogDivider(
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

    return Center(
      child: CupertinoPopupSurface(
        child: Container(
          width: _defaultDialogWidth,
          color: CupertinoColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(
                child: Container(
                  margin: EdgeInsets.only(
                      top: 24,
                      left: 20,
                      right: 20,
                      bottom: (content == null || content!.isEmpty) ? 24 : 0),
                  child: Text('$title',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17,
                          color: YlColors.black90,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none)),
                ),
                visible: (title == null || title!.isEmpty) ? false : true,
              ),
              Visibility(
                child: Container(
                  margin:
                      EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 24),
                  child: Text('$content',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 15,
                          color: YlColors.black50,
                          fontWeight: FontWeight.w400)),
                ),
                visible: (content == null || title!.isEmpty) ? false : true,
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
    );
  }
}

/// 快捷展示自定义弹窗的方法
showYlDialog(BuildContext context,
    {String? title, String? content, List<YlDialogAction>? actions}) async {
  await showCupertinoDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) {
      return YlDialog(title: title, content: content, actions: actions);
    },
  );
}
