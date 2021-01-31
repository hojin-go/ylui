import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_ylkit/flutter_ylkit.dart';

class PopoverView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: YlBackButton(),
        title: Text('Popover'),
      ),
      body: Center(
        child: Column(
          children: [
            // Builder(
            //   builder: (context) => RaisedButton(
            //     child: Text('showModalBottomSheet'),
            //     onPressed: () => showModalBottomSheet(
            //       context: context,
            //       backgroundColor: YlColors.transparent,
            //       builder: (context) => _popoverBody(),
            //     ),
            //   ),
            // ),
            RaisedButton(
              child: Text('header 是关闭按钮的'),
              onPressed: () => showCupertinoModalPopup(
                context: context,
                semanticsDismissible: false,
                builder: (context) => Container(
                    child: _popoverBody()),
              ),
            ),
            // Builder(
            //   builder: (context) => RaisedButton(
            //     child: Text('showModalBottomSheet.confirm'),
            //     onPressed: () => showModalBottomSheet(
            //       context: context,
            //       backgroundColor: YlColors.transparent,
            //       builder: (context) => _popoverBodyConfirm(context),
            //     ),
            //   ),
            // ),
            RaisedButton(
              child: Text('header 是取消&完成按钮的'),
              onPressed: () => showCupertinoModalPopup(
                context: context,
                semanticsDismissible: false,
                builder: (context) => Container(
                    child: _popoverBodyConfirm(context)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _popoverBody() {
    return YlPopover(
      body: Container(height: 320, color: YlColors.grey3,),
    );
  }

  _popoverBodyConfirm(BuildContext context) {
    return YlPopoverConfirm(
      body: Container(height: 320, color: YlColors.grey3,),
      doneAction: () {
        print('点击了完成按钮');
        Navigator.of(context).pop();
      },
    );
  }


}
