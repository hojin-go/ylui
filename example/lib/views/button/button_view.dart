import 'package:example/common/yl_iconfont.dart';
import 'package:example/views/componnets/demo_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class ButtonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: 'YlButton',
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ..._wrapButton(YlButtonType.primary, title: 'Primary'),
            ..._wrapButton(YlButtonType.secondary, title: 'Secondary'),
            ..._wrapButton(YlButtonType.subPrimary, title: 'Sub Primary'),
            ..._wrapButton(YlButtonType.subSecondary, title: 'Sub Secondary'),
            ..._wrapButton(YlButtonType.alert, title: 'Alert'),
            ..._wrapButton(YlButtonType.plain, title: 'Plain'),
          ],
        ),
      ),
    );
  }

  _wrapButton(YlButtonType type, {required String title}) {
    return [
      Text(
        title,
        style: YlTextStyles.header1,
      ),
      Container(
        margin: EdgeInsets.only(bottom: 10),
        alignment: Alignment.center,
        child: YlButton.fromType(
          size: YlButtonSize.small,
          type: type,
          child: Text('小号'),
          loading: true,
          onPressed: () {},
        ),
      ),
      Container(
        margin: EdgeInsets.only(bottom: 10),
        alignment: Alignment.center,
        child: YlButton.fromType(
          size: YlButtonSize.medium,
          type: type,
          child: Row(
            children: [
              Icon(YlIcons.scan),
              SizedBox(
                width: 8,
              ),
              Text('中号'),
            ],
          ),
          // onPressed: () {},
          onAsyncPressed: () => Future.delayed(
            Duration(seconds: 2),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(bottom: 10),
        alignment: Alignment.center,
        child: YlButton.fromType(
          size: YlButtonSize.large,
          type: type,
          child: Row(
            children: [
              Icon(YlIcons.scan),
              SizedBox(
                width: 8,
              ),
              Text('大号'),
            ],
          ),
          // onPressed: () {},
          onAsyncPressed: () => Future.delayed(
            Duration(seconds: 2),
          ),
        ),
      ),
      Container(
        margin: EdgeInsets.only(bottom: 10),
        alignment: Alignment.center,
        child: YlButton.fromType(
          size: YlButtonSize.max,
          type: type,
          child: Row(
            children: [
              Icon(YlIcons.scan),
              SizedBox(
                width: 8,
              ),
              Text('超大号'),
            ],
          ),
          // onPressed: () {},
          onAsyncPressed: () => Future.delayed(
            Duration(seconds: 2),
          ),
        ),
      ),
    ];
  }
}
