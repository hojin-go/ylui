import 'package:example/views/componnets/demo_button_group.dart';
import 'package:example/views/componnets/demo_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class RichDialogDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: 'YlRichDialogDemo',
      sourceCodePath: 'lib/views/rich_dialog_demo.dart',
      child: Center(
        child: DemoButtonVerticalGroup(
          items: [
            DemoButtonGroupItem(
                '空白', () => showYlRichDialog(context, dialog: YlRichDialog())),
            DemoButtonGroupItem(
                '无关闭按钮', () => _showTitleAndFooterWithoutCloseButton(context)),
            DemoButtonGroupItem(
                'body/footer', () => _showBodyAndFooter(context))
          ],
        ),
      ),
    );
  }

  _showTitleAndFooterWithoutCloseButton(BuildContext context) {
    showYlRichDialog(context,
        dialog: YlRichDialog(
            title: '标题',
            closeale: false,
            body: Container(
              height: 400,
              color: YlColors.grey2,
            ),
            footer: Container(
              color: YlColors.orangeLight,
              padding: EdgeInsets.all(20),
              child: YlButton.fromType(
                size: YlButtonSize.large,
                type: YlButtonType.primary,
                child: Text('关闭'),
                onPressed: () => Navigator.pop(context),
              ),
            )));
  }

  _showBodyAndFooter(BuildContext context) {
    showYlRichDialog(context,
        dialog: YlRichDialog(
          closeale: true,
          body: Container(
            height: 400,
            color: YlColors.grey2,
          ),
          footer: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            alignment: Alignment.center,
            child: YlButton.fromType(
              size: YlButtonSize.large,
              type: YlButtonType.primary,
              child: Text('确认'),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ));
  }
}
