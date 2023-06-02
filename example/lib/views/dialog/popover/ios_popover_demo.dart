import 'package:flutter/material.dart';

import '../../componnets/demo_page.dart';

class IosPopoverDemo extends StatelessWidget {
  const IosPopoverDemo({Key? key}) : super(key: key);

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
            // DemoButtonVerticalGroup(
            //   items: [
            //     DemoButtonGroupItem('没按钮', () {
            //       CupertinoScaffold.showCupertinoModalBottomSheet(
            //         useRootNavigator: true,
            //         context: context,
            //         builder: (context) => Scaffold(
            //           appBar: YlAppBar(
            //             title: Text('这是个弹窗'),
            //             leading: YlAppBarBackButton(
            //               child: Text(
            //                 '取消',
            //               ),
            //             ),
            //           ),
            //           body: Container(
            //             padding: EdgeInsets.all(20),
            //             child: Container(
            //               color: Colors.red,
            //             ),
            //           ),
            //         ),
            //       );
            //     }),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
