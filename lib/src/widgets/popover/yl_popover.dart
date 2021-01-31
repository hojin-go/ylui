import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../flutter_ylkit.dart';
import '../../../flutter_ylkit.dart';
import '../../../flutter_ylkit.dart';

class YlPopover extends StatelessWidget {
  final Widget body;
  const YlPopover({Key key, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: YlColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: SafeArea(
        top: false,
        bottom: true,
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _header(
                closeAction: () => Navigator.of(context).pop(),
              ),
              if (body != null) body
            ],
          ),
        ),
      ),
    );
  }

  _header({VoidCallback closeAction}) {
    return Container(
      child: Row(
        children: [
          Spacer(),
          CupertinoButton(
            padding: EdgeInsets.only(top: 20, right: 20),
            child: Icon(
              CupertinoIcons.xmark,
              size: 24,
              color: YlColors.black,
            ),
            onPressed: closeAction,
          )
        ],
      ),
    );
  }
}
