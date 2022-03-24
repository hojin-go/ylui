import 'package:example/views/button/button_group_demo.dart';
import 'package:example/views/button/button_view.dart';
import 'package:example/views/componnets/demo_button_group.dart';
import 'package:example/views/componnets/demo_page.dart';
import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: '按钮',
      child: Center(
        child: DemoButtonVerticalGroup(items: [
          DemoButtonGroupItem('按钮', () => toPage(context, ButtonView())),
          DemoButtonGroupItem(
              '按钮组', () => toPage(context, ButtonGroupDemoPage())),
        ]),
      ),
    );
  }
}
