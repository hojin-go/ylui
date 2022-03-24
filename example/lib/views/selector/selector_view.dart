import 'package:example/views/checkbox_view.dart';
import 'package:example/views/componnets/demo_button_group.dart';
import 'package:example/views/componnets/demo_page.dart';
import 'package:example/views/radiobox_view.dart';
import 'package:flutter/material.dart';

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
