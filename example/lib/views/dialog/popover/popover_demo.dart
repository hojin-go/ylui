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
      bottomSafe: false,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DemoButtonVerticalGroup(
              items: [
                DemoButtonGroupItem('没按钮', () => _showPlainPopover(context)),
                DemoButtonGroupItem(
                    '确认类型', () => _showPlainConfirmPopover(context)),
                DemoButtonGroupItem(
                    '一个按钮/没标题', () => _showPopoverWithFooterAction(context)),
                DemoButtonGroupItem(
                    '两个按钮/有标题', () => _showPopoverWithTwoFooterAction(context)),
                DemoButtonGroupItem(
                  '分享',
                  () => _showSharePopover(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _showPlainPopover(BuildContext context) {
    showYlPopover(
        context,
        YlPopover.close(
          onClosed: () => Navigator.pop(context),
          body: Container(
            height: 300,
            color: YlColors.grey1,
          ),
        ));
  }

  _showPlainConfirmPopover(BuildContext context) {
    showYlPopover(
        context,
        YlPopover.confirm(
          onCanceled: () => Navigator.pop(context),
          onDone: () => Navigator.pop(context),
          title: Text('Confirm'),
          subTitle: Text('Subtitle'),
          body: Container(
            height: 300,
            color: YlColors.grey1,
          ),
        ));
  }

  /// 底部有一个按钮，并且没有标题的弹窗
  _showPopoverWithFooterAction(BuildContext context) {
    showYlPopover(
        context,
        YlPopover.close(
          onClosed: () => Navigator.pop(context),
          body: Container(
            height: 372,
            color: YlColors.grey1,
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
          subTitle: Text(
              '副标题你先操作~如果在过程中有啥疑问的话~都可以问我的哈感谢您的惠顾，欢迎下次光临！都可以问我的哈感谢您的惠顾，欢迎下次光临！'),
          onClosed: () => Navigator.pop(context),
          body: Container(
            height: 372,
            color: YlColors.grey1,
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

  _showSharePopover(BuildContext context) {
    List<YlPopoverShareItem> items = [
      YlPopoverShareItem(
        icon: Image.asset('images/chrome.png'),
        title: Text('Chrome'),
        action: () {},
      ),
      YlPopoverShareItem(
        icon: Image.asset('images/flutter.jpg'),
        title: Text('Flutter'),
        action: () {},
      ),
      YlPopoverShareItem(
        icon: Image.asset('images/js.png'),
        title: Text('JS'),
        action: () {},
      ),
      YlPopoverShareItem(
        icon: Image.asset('images/macos.png'),
        title: Text('MacOS'),
        action: () {},
      ),
      YlPopoverShareItem(
        icon: Image.asset('images/notion.png'),
        title: Text('Notion'),
        action: () {},
      ),
      YlPopoverShareItem(
        icon: Image.asset('images/swift.png'),
        title: Text('Swift'),
        action: () {},
      ),
      YlPopoverShareItem(
        icon: Image.asset('images/youtube.png'),
        title: Text('Youtube'),
        action: () {},
      )
    ];

    showYlSharePopover(context, items: items);
  }
}
