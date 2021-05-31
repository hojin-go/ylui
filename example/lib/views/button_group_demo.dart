import 'package:example/views/componnets/demo_page.dart';
import 'package:flutter/cupertino.dart';
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
              style: YlTextStyles.caption,
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
              style: YlTextStyles.caption,
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
              '主按钮撑满剩余空间',
              style: YlTextStyles.caption,
            ),
          ),
          YlButtonGroup(
            weight: YlButtonGroupWeight.primaryExpanded,
            children: [
              YlButtonGroupItem(
                child: Text('自身大小'),
                type: YlButtonType.subSecondary,
                onPressed: () {},
              ),
              YlButtonGroupItem(
                child: Text('撑满剩余空间'),
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
              '主按钮撑满剩余空间，另外按钮固定宽度',
              style: YlTextStyles.caption,
            ),
          ),
          YlButtonGroup(
            weight: YlButtonGroupWeight.primaryExpanded,
            children: [
              YlButtonGroupItem(
                child: Text('宽度200'),
                width: 200,
                type: YlButtonType.subSecondary,
                onPressed: () {},
              ),
              YlButtonGroupItem(
                child: Text('撑满剩余空间'),
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
              '特殊比例，主按钮宽度稍大一些',
              style: YlTextStyles.caption,
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
