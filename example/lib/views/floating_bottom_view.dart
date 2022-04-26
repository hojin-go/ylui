import 'package:example/views/componnets/demo_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class FloatingBottomView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: 'YlFloatingBottom',
      sourceCodePath: 'lib/views/floating_bottom_view.dart',
      contentPadding: EdgeInsets.zero,
      bottomSafe: false,
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: CupertinoDatePicker(
                onDateTimeChanged: (dt) {},
                initialDateTime: DateTime.now(),
              ),
            ),
          ),
          YlFloatingBottom(
            backgroundColor: YlColors.white,
            child: YlButton.fromType(
              size: YlButtonSize.max,
              type: YlButtonType.primary,
              child: Text('Button'),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
