import 'package:example/views/componnets/button_group.dart';
import 'package:example/views/componnets/demo_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class YlToastDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: 'YlToast',
      sourceCodePath: 'lib/views/yl_toast_demo.dart',
      child: Center(
        child: ButtonGroup(
          items: [
            ButtonGroupItem('短文本', () => YlToast.text('Hello')),
            ButtonGroupItem(
                '长文本提示', () => YlToast.text('我是一个长文本 Toast，你好啊啊啊啊啊啊啊')),
            ButtonGroupItem('加载中..', () {
              YlToast.loading(content: '加载中');
              Future.delayed(Duration(seconds: 2)).then((value) {
                YlToast.cancel();
              });
            }),
            ButtonGroupItem('成功提示', () => YlToast.success('操作成功')),
            ButtonGroupItem('失败提示', () => YlToast.error('操作失败'))
          ],
        ),
      ),
    );
  }
}
