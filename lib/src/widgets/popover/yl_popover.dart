import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../flutter_ylkit.dart';
import '../../../flutter_ylkit.dart';
import '../../../flutter_ylkit.dart';

class YlPopover extends StatelessWidget {
  final Widget header;
  final Widget body;

  const YlPopover({Key key, this.body, this.header}) : super(key: key);

  YlPopover.close({Key key, this.body, VoidCallback onClosed})
      : this.header = Container(
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
                onPressed: onClosed,
              )
            ],
          ),
        );

  YlPopover.confirm(
      {Key key, this.body, VoidCallback onCanceled, VoidCallback onDone})
      : this.header = Container(
          child: Row(
            children: [
              CupertinoButton(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  '取消',
                  style: YlTextStyles.body1.copyWith(color: YlColors.black70),
                ),
                onPressed: onCanceled,
              ),
              Spacer(),
              CupertinoButton(
                padding: EdgeInsets.only(top: 20, right: 20),
                child: Text(
                  '完成',
                  style: YlTextStyles.body1.copyWith(color: YlColors.branding1),
                ),
                onPressed: onDone,
              )
            ],
          ),
        );

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
              header ??
                  Container(
                    height: 44,
                  ),
              if (body != null) body
            ],
          ),
        ),
      ),
    );
  }
}
