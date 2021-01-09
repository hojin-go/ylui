import 'package:flutter/cupertino.dart';
import 'package:flutter_ylkit/flutter_ylkit.dart';

class YlBackButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color color;
  final IconData icon;

  const YlBackButton(
      {Key key, this.onTap, this.color = YlColors.black90, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Icon(
          icon ?? CupertinoIcons.back,
          color: color,
        ),
      ),
      onPressed: onTap ?? () => Navigator.of(context).pop(),
    );
  }
}
