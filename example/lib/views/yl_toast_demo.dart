import 'package:flutter/cupertino.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

import 'componnets/demo_button_group.dart';
import 'componnets/demo_page.dart';

class YlToastDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: 'YlToast',
      sourceCodePath: 'lib/views/yl_toast_demo.dart',
      child: Center(
        child: DemoButtonVerticalGroup(
          items: [
            DemoButtonGroupItem('短文本', () => YlToast.text('Hello')),
            DemoButtonGroupItem(
                '长文本提示', () => YlToast.text('我是一个长文本 Toast，你好啊啊啊啊啊啊啊')),
            DemoButtonGroupItem(
                '换行文本', () => YlToast.text('换行1\n换行2', maxLines: 2)),
            DemoButtonGroupItem('加载中..', () {
              YlToast.loading(content: '加载中');
              Future.delayed(Duration(seconds: 2)).then((value) {
                YlToast.cancel();
              });
            }),
            DemoButtonGroupItem('成功提示', () => YlToast.success('成功了')),
            DemoButtonGroupItem('失败提示', () => YlToast.error('操作失败'))
          ],
        ),
      ),
    );
  }
}
