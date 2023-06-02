import 'package:flutter/material.dart';

import '../componnets/demo_button_group.dart';
import '../componnets/demo_page.dart';
import 'action_sheet_demo.dart';
import 'dialog_demo.dart';
import 'popover/popover_demo.dart';
import 'rich_dialog_demo.dart';
import 'sliding_up_panel_demo.dart';

class DialogView extends StatelessWidget {
  const DialogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoPage(
        title: '弹窗',
        child: Center(
          child: DemoButtonVerticalGroup(
            items: [
              DemoButtonGroupItem(
                'Dialog',
                () {
                  _to(context, DialogDemoPage());
                },
              ),
              DemoButtonGroupItem(
                'RichDialog',
                () {
                  _to(context, RichDialogDemo());
                },
              ),
              DemoButtonGroupItem(
                'ActionSheet',
                () => _to(context, ActionSheetDemoPage()),
              ),
              DemoButtonGroupItem(
                'Popover',
                () => _to(context, PopoverDemoPage()),
              ),
              DemoButtonGroupItem(
                'ModalBottomSheet',
                () {
                  // Navigator.of(context).push(
                  //   CupertinoPageRoute(
                  //     builder: (context) => CupertinoScaffold(
                  //       body: IosPopoverDemo(),
                  //     ),
                  //   ),
                  // );
                },
              ),
              DemoButtonGroupItem(
                'SlidingUpPanel',
                () => _to(context, SlidingUpPanelDemo()),
              ),
            ],
          ),
        ));
  }

  _to(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }
}
