import 'package:flutter/cupertino.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class YlBackButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color color;
  final IconData icon;
  final EdgeInsets padding;

  const YlBackButton(
      {Key key, this.onTap, this.color = YlColors.black90, this.icon, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: padding ?? EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.only(right: 16),
        child: Icon(
          icon ?? CupertinoIcons.back,
          color: color,
          size: 24,
        ),
      ),
      onPressed: onTap ?? () => Navigator.of(context).pop(),
    );
  }
}
