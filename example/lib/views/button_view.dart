import 'package:flutter/cupertino.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

import 'componnets/demo_page.dart';

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
      Text(title, style: YlTextStyles.header1,),
      Container(
        margin: EdgeInsets.only(bottom: 10),
        alignment: Alignment.center,
        child: YlButton.fromType(
          size: YlButtonSize.small,
          type: type,
          child: Text('small'),
          onPressed: () {},
        ),
      ),
      Container(
        margin: EdgeInsets.only(bottom: 10),
        alignment: Alignment.center,
        child: YlButton.fromType(
          size: YlButtonSize.medium,
          type: type,
          child: Text('medium'),
          onPressed: () {},
        ),
      ),
      Container(
        margin: EdgeInsets.only(bottom: 10),
        alignment: Alignment.center,
        child: YlButton.fromType(
          size: YlButtonSize.large,
          type: type,
          child: Text('large'),
          onPressed: () {},
        ),
      ),
      Container(
        margin: EdgeInsets.only(bottom: 10),
        alignment: Alignment.center,
        child: YlButton.fromType(
          size: YlButtonSize.max,
          type: type,
          child: Text('max'),
          onPressed: () {},
        ),
      ),
    ];
  }
}
