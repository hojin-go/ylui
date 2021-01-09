import 'package:flutter/cupertino.dart';

class YlBackButton extends StatelessWidget {
  final VoidCallback onTap;

  const YlBackButton({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Icon(
        CupertinoIcons.back,
      ),
      onTap: onTap ?? () => Navigator.of(context).pop(),
    );
  }
}
