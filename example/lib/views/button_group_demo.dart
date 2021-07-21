import 'package:example/views/componnets/demo_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class ButtonGroupDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: 'YlButtonGroupDemo',
      sourceCodePath: 'lib/views/button_group_demo.dart',
      contentPadding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Text(
              '按钮平分',
              style: YlTextStyles.caption1,
            ),
          ),
          YlButtonGroup(
            weight: YlButtonGroupWeight.equaly,
            children: [
              YlButtonGroupItem(
                child: Text('拒绝'),
                type: YlButtonType.subSecondary,
                onPressed: () {},
              ),
              YlButtonGroupItem(
                child: Text('接受'),
                type: YlButtonType.primary,
                onPressed: () {},
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Text(
              '单个按钮',
              style: YlTextStyles.caption1,
            ),
          ),
          YlButtonGroup(
            children: [
              YlButtonGroupItem(
                child: Text('确认'),
                type: YlButtonType.primary,
                onPressed: () {},
              )
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Text(
              '特殊比例，主副按钮比例 2:1，副按钮最小宽度 109',
              style: YlTextStyles.caption1,
            ),
          ),
          YlButtonGroup(
            weight: YlButtonGroupWeight.primaryBigger,
            children: [
              YlButtonGroupItem(
                child: Text('50%'),
                type: YlButtonType.subSecondary,
                onPressed: () {},
              ),
              YlButtonGroupItem(
                child: Text('100%'),
                type: YlButtonType.primary,
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
    );
  }
}
