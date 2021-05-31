import 'package:example/views/componnets/demo_button_group.dart';
import 'package:example/views/componnets/demo_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_ylui/flutter_ylui.dart';

class PopoverDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: 'YlPopover',
      sourceCodePath: 'lib/views/popover_demo.dart',
      child: Center(
        child: DemoButtonVerticalGroup(
          items: [
            DemoButtonGroupItem('没按钮', () => _showPlainPopover(context)),
            DemoButtonGroupItem(
                '一个按钮/没标题', () => _showPopoverWithFooterAction(context)),
            DemoButtonGroupItem(
                '两个按钮/有标题', () => _showPopoverWithTwoFooterAction(context))
          ],
        ),
      ),
    );
  }

  _showPlainPopover(BuildContext context) {
    showYlPopover(
        context,
        YlPopover.close(
          body: Container(
            height: 300,
            color: YlColors.grey4,
          ),
        ));
  }

  /// 底部有一个按钮，并且没有标题的弹窗
  _showPopoverWithFooterAction(BuildContext context) {
    showYlPopover(
        context,
        YlPopover.close(
          body: Container(
            height: 372,
            color: YlColors.grey4,
          ),
          footer: YlButtonGroup(
            weight: YlButtonGroupWeight.equaly,
            children: [
              YlButtonGroupItem(
                child: Text('确定'),
                type: YlButtonType.primary,
                onPressed: () {},
              ),
            ],
          ),
        ));
  }

  /// 底部有两个按钮，并且有标题的弹窗
  _showPopoverWithTwoFooterAction(BuildContext context) {
    showYlPopover(
        context,
        YlPopover.close(
          title: Text('标题'),
          body: Container(
            height: 372,
            color: YlColors.grey4,
          ),
          footer: YlButtonGroup(
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
              ),
            ],
          ),
        ));
  }
}
