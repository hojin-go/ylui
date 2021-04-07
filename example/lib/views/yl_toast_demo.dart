import 'package:example/views/componnets/demo_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class YlToastDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: 'YlToast',
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              YlButton.fromType(
                size: YlButtonSize.medium,
                type: YlButtonType.primary,
                child: Text('短文本提示'),
                onPressed: () => YlToast.text('Hello'),
              ),
              SizedBox(height: 20,),
              YlButton.fromType(
                size: YlButtonSize.medium,
                type: YlButtonType.primary,
                child: Text('长文本提示'),
                onPressed: () => YlToast.text('我是一个长文本 Toast，你好啊啊啊啊啊啊啊'),
              ),
              SizedBox(height: 20,),
              YlButton.fromType(
                size: YlButtonSize.medium,
                type: YlButtonType.primary,
                child: Text('加载中..'),
                onPressed: () {
                  YlToast.loading(content: '加载中');
                  Future.delayed(Duration(seconds: 2)).then((value) {
                    YlToast.cancel();
                  });
                },
              ),
              SizedBox(height: 20,),
              YlButton.fromType(
                size: YlButtonSize.medium,
                type: YlButtonType.primary,
                child: Text('成功提示'),
                onPressed: () => YlToast.success('操作成功'),
              ),
              SizedBox(height: 20,),
              YlButton.fromType(
                size: YlButtonSize.medium,
                type: YlButtonType.primary,
                child: Text('错误提示'),
                onPressed: () => YlToast.error('操作失败'),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
    );
  }
}
