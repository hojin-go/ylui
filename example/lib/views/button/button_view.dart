import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

import '../../common/yl_iconfont.dart';
import '../componnets/demo_page.dart';

class ButtonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: 'YlButton',
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ..._wrapButton(
              YlButtonType.primary,
              title: 'Primary',
              enabled: true,
            ),
            ..._wrapButton(
              YlButtonType.primary,
              title: 'Primary Disabled',
            ),
            ..._wrapButton(
              YlButtonType.secondary,
              title: 'Secondary',
              enabled: true,
            ),
            ..._wrapButton(
              YlButtonType.secondary,
              title: 'Secondary Disabled',
            ),
            ..._wrapButton(
              YlButtonType.subPrimary,
              title: 'Sub Primary',
              enabled: true,
            ),
            ..._wrapButton(
              YlButtonType.subPrimary,
              title: 'Sub Primary Disabled',
            ),
            ..._wrapButton(
              YlButtonType.subSecondary,
              title: 'Sub Secondary',
              enabled: true,
            ),
            ..._wrapButton(
              YlButtonType.subSecondary,
              title: 'Sub Secondary Disabled',
            ),
            ..._wrapButton(
              YlButtonType.alert,
              title: 'Alert',
              enabled: true,
            ),
            ..._wrapButton(
              YlButtonType.alert,
              title: 'Alert Disabled',
            ),
            ..._wrapButton(
              YlButtonType.plain,
              title: 'Plain',
              enabled: true,
            ),
            ..._wrapButton(
              YlButtonType.plain,
              title: 'Plain Disabled',
            ),
          ],
        ),
      ),
    );
  }

  _wrapButton(
    YlButtonType type, {
    required String title,
    bool? enabled,
  }) {
    return [
      Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 20),
        child: Text(
          title,
          style: YlTextStyles.n17(color: YlColors.black50),
        ),
      ),
      YlButton.fromType(
        size: YlButtonSize.small,
        type: type,
        child: Text('小号'),
        loading: true,
        onPressed: enabled == true ? () {} : null,
      ),
      YlButton.fromType(
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
        onAsyncPressed: enabled == true
            ? () => Future.delayed(
                  Duration(seconds: 2),
                )
            : null,
      ),
      YlButton.fromType(
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
        onAsyncPressed: enabled == true
            ? () => Future.delayed(
                  Duration(seconds: 2),
                )
            : null,
      ),
      YlButton.fromType(
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
        onAsyncPressed: enabled == true
            ? () => Future.delayed(
                  Duration(seconds: 2),
                )
            : null,
      ),
    ];
  }
}
