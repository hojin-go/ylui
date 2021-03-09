import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_ylui/flutter_ylui.dart';

class PopoverView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('YlPopover'),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoButton.filled(
              child: Text('默认样式'),
              onPressed: () => showCupertinoModalPopup(
                context: context,
                semanticsDismissible: false,
                builder: (context) => Container(
                    child: YlPopover(
                      body: Container(
                        height: 320,
                        color: YlColors.grey3,
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CupertinoButton.filled(
              child: Text('有关闭按钮样式'),
              onPressed: () => showCupertinoModalPopup(
                context: context,
                semanticsDismissible: false,
                builder: (context) => Container(
                    child: YlPopover.close(
                  body: Container(
                    height: 320,
                    color: YlColors.grey3,
                  ),
                  onClosed: () {
                    print('点击了关闭按钮');
                    Navigator.of(context).pop();
                  },
                )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CupertinoButton.filled(
              child: Text('有完成按钮样式'),
              onPressed: () => showCupertinoModalPopup(
                context: context,
                semanticsDismissible: false,
                builder: (context) => Container(
                    child: YlPopover.confirm(
                  body: Container(
                    height: 320,
                    color: YlColors.grey3,
                  ),
                  onCanceled: () {
                    print('点击了取消按钮');
                    Navigator.of(context).pop();
                  },
                  onDone: () {
                    print('点击了完成按钮');
                    Navigator.of(context).pop();
                  },
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
