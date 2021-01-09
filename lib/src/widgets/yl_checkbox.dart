import 'package:flutter/cupertino.dart';
import 'package:flutter_ylkit/flutter_ylkit.dart';

class YlCheckbox extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  final bool check;
  final Color color;

  const YlCheckbox({Key key, this.onChanged, this.check = false, this.color})
      : super(key: key);

  @override
  _YlCheckboxState createState() => _YlCheckboxState(isCheck: check);
}

class _YlCheckboxState extends State<YlCheckbox> {
  bool isCheck;

  _YlCheckboxState({this.isCheck});

  @override
  Widget build(BuildContext context) {
    var tintColor = widget.color ?? YlColors.branding1;
    return Container(
      child: CupertinoButton(
        padding: EdgeInsets.all(8),
        minSize: 30,
        child: isCheck
            ? Icon(
                CupertinoIcons.checkmark_square_fill,
                color: tintColor,
                size: 20,
              )
            : Icon(
                CupertinoIcons.checkmark_square,
                color: YlColors.black50,
                size: 20,
              ),
        onPressed: () {
          setState(() {
            isCheck = !isCheck;
          });
          if (widget.onChanged != null) {
            widget.onChanged(isCheck);
          }
        },
      ),
    );
  }
}
