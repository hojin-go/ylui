import 'package:flutter/cupertino.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class ButtonGroupItem {
  final String title;
  final VoidCallback action;

  ButtonGroupItem(this.title, this.action);
}

class ButtonGroup extends StatelessWidget {
  final List<ButtonGroupItem> items;

  const ButtonGroup({Key key, this.items}) : super(key: key);
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
