import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../flutter_ylui.dart';

class YlDialogAction {
  final String title;
  final VoidCallback action;
  final bool highlight;

  YlDialogAction({this.title, this.action, this.highlight = false});
}

class _YlDialogDivider extends StatelessWidget {
  final bool horizontal;

  const _YlDialogDivider({Key key, this.horizontal}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: YlColors.grey2,
      width: horizontal ? double.infinity : 0.5,
      height: horizontal ? 0.5 : 56,
    );
  }
}

class YlDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<YlDialogAction> actions;

  const YlDialog({@required this.title, this.content, @required this.actions});

  @override
  Widget build(BuildContext context) {
    List<Widget> actionWidgets = [];

    var actionLength = actions.length;
    for (int i = 0; i < actionLength; i++) {
      var action = actions[i];
      Widget actionWidget = YlTapEffect(
        onTap: action.action,
        child: Container(
          height: 56,
          child: Center(
            child: Text(
              action.title,
              style: YlTextStyles.body1.copyWith(
                  color:
                      action.highlight ? YlColors.branding1 : YlColors.black70),
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
          width: MediaQuery.of(context).size.width * 0.72,
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
                      bottom: (content == null || content.isEmpty) ? 24 : 0),
                  child: Text('$title',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 17,
                          color: YlColors.black90,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none)),
                ),
                visible: (title == null || title.isEmpty) ? false : true,
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
                visible: (content == null || title.isEmpty) ? false : true,
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

showYlDialog(BuildContext context,
    {String title, String content, List<YlDialogAction> actions}) async {
  await showCupertinoDialog(
    barrierDismissible: true,
    context: context,
    builder: (context) {
      return YlDialog(title: title, content: content, actions: actions);
    },
  );
}
