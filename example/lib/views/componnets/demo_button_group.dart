import 'package:flutter/cupertino.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class DemoButtonGroupItem {
  final String title;
  final VoidCallback action;

  DemoButtonGroupItem(this.title, this.action);
}

class DemoButtonVerticalGroup extends StatelessWidget {
  final List<DemoButtonGroupItem> items;

  const DemoButtonVerticalGroup({Key? key, required this.items})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...items.map((e) => Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: YlButton.fromType(
                  onPressed: e.action,
                  child: Text(e.title),
                  width: 200,
                  size: YlButtonSize.medium,
                  type: YlButtonType.primary),
            ))
      ],
    );
  }
}
