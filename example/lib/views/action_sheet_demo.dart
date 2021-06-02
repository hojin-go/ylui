import 'package:example/views/componnets/demo_button_group.dart';
import 'package:example/views/componnets/demo_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class ActionSheetDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: 'YlActionSheetDemo',
      sourceCodePath: 'lib/views/action_sheet_demo.dart',
      bottomSafe: false,
      child: Center(
        child: DemoButtonVerticalGroup(
          items: [
            DemoButtonGroupItem(
                '只有删除按钮', () => _showActionSheetWithAlertButtonOnly(context)),
            DemoButtonGroupItem(
                '有文字/按钮', () => _showActionSheetWithFullFeatures(context)),
            DemoButtonGroupItem(
                '我文字超长', () => _showActionSheetWithLongContent(context)),
            DemoButtonGroupItem(
                '没有取消按钮', () => _showActionSheetWithNoCancelButton(context)),
          ],
        ),
      ),
    );
  }

  _showActionSheetWithNoCancelButton(BuildContext context) {
    showYlActionSheet(context, content: '我没有取消按钮', actions: [
      YlDialogAction(
        title: '删除',
        alert: true,
        action: () {
          Navigator.pop(context);
        },
      )
    ]);
  }

  _showActionSheetWithAlertButtonOnly(BuildContext context) {
    showYlActionSheet(context, content: '我只有删除按钮和取消按钮', actions: [
      YlDialogAction(
        title: '删除',
        alert: true,
        action: () {
          Navigator.pop(context);
        },
      ),
      YlDialogAction(
        title: '取消',
        isCancel: true,
        action: () {
          Navigator.pop(context);
        },
      )
    ]);
  }

  _showActionSheetWithFullFeatures(BuildContext context) {
    showYlActionSheet(context, content: '是否删除评论？', actions: [
      YlDialogAction(
        title: '回复',
        action: () {
          Navigator.pop(context);
        },
      ),
      YlDialogAction(
        title: '删除',
        alert: true,
        action: () {
          Navigator.pop(context);
        },
      ),
      YlDialogAction(
        title: '取消',
        isCancel: true,
        action: () {
          Navigator.pop(context);
        },
      )
    ]);
  }

  _showActionSheetWithLongContent(BuildContext context) {
    showYlActionSheet(context,
        content:
            '该节会讲述如何在空安全模式下，使用 dart pub outdated 检查并更新您的依赖。如果您的代码应用了 版本管理，您可以随时回滚所有的改动。该节会讲述如何在空安全模式下，使用 dart pub outdated 检查并更新您的依赖。如果您的代码应用了 版本管理，您可以随时回滚所有的改动。',
        actions: [
          YlDialogAction(
            title: '取消',
            isCancel: true,
            action: () {
              Navigator.pop(context);
            },
          )
        ]);
  }
}
