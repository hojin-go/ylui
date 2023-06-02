import 'package:flutter/material.dart';

import '../componnets/demo_button_group.dart';
import '../componnets/demo_page.dart';
import 'button_group_demo.dart';
import 'button_view.dart';

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
