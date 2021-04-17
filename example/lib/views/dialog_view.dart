import 'package:example/views/componnets/demo_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class DialogView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: 'YlDialog',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          YlButton.fromType(
            size: YlButtonSize.medium,
            type: YlButtonType.primary,
            child: Text('一个按钮'),
            onPressed: () => _showDialogs(context, [
              YlDialogAction(
                  title: '选项 1', action: () => Navigator.of(context).pop())
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          YlButton.fromType(
            size: YlButtonSize.medium,
            type: YlButtonType.primary,
            child: Text('两个按钮'),
            onPressed: () => _showDialogs(context, [
              YlDialogAction(
                  title: '选项 1', action: () => Navigator.of(context).pop()),
              YlDialogAction(
                  title: '选项 2',
                  alert: true,
                  action: () => Navigator.of(context).pop()),
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          YlButton.fromType(
            size: YlButtonSize.medium,
            type: YlButtonType.primary,
            child: Text('更多按钮'),
            onPressed: () => _showDialogs(context, [
              YlDialogAction(
                  title: '选项 1', action: () => Navigator.of(context).pop()),
              YlDialogAction(
                  title: '选项 2',
                  alert: true,
                  action: () => Navigator.of(context).pop()),
              YlDialogAction(
                  title: '选项 3',
                  highlight: true,
                  action: () => Navigator.of(context).pop()),
            ]),
          ),
        ],
      ),
    );
  }

  _showDialogs(BuildContext context, List<YlDialogAction> actions) {
    showYlDialog(context,
        title: '这是一个弹窗', content: '这是一个弹窗描述文本', actions: actions);
  }
}
