import 'package:flutter/material.dart';

import '../checkbox_view.dart';
import '../componnets/demo_button_group.dart';
import '../componnets/demo_page.dart';
import '../radiobox_view.dart';

class SelectorView extends StatelessWidget {
  const SelectorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: '选择器',
      child: Center(
        child: DemoButtonVerticalGroup(
          items: [
            DemoButtonGroupItem(
              '单选',
              () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => RadioboxView(),
                ),
              ),
            ),
            DemoButtonGroupItem(
              '多选',
              () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CheckboxView(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
