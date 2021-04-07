import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

import 'componnets/demo_page.dart';

class ConfirmView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: 'YlConfirm',
      child: Center(
        child: CupertinoButton(
          child: Text('弹窗确认'),
          onPressed: () {
            showCupertinoModalPopup(
              context: context,
              builder: (context) => YlConfirm(
                title: '这是标题',
                message: '这是信息内容',
                actions: [
                  CupertinoActionSheetAction(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('默认选项'),
                    isDefaultAction: true,
                  ),
                  CupertinoActionSheetAction(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('普通选项'),
                  ),
                  CupertinoActionSheetAction(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('警告选项'),
                    isDestructiveAction: true,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
