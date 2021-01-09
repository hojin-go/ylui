import 'package:flutter/cupertino.dart';
import 'package:flutter_ylkit/flutter_ylkit.dart';

class YlCheckbox extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  final bool check;
  final Color color;
  final double size;
  final IconData checkedIcon;
  final IconData uncheckedIcon;

  const YlCheckbox(
      {Key key,
      this.onChanged,
      this.check = false,
      this.color = YlColors.branding2,
      this.size = 20,
      this.checkedIcon = CupertinoIcons.checkmark_square_fill,
      this.uncheckedIcon = CupertinoIcons.checkmark_square})
      : super(key: key);

  @override
  _YlCheckboxState createState() => _YlCheckboxState(isCheck: check);
}

class _YlCheckboxState extends State<YlCheckbox> {
  bool isCheck;

  _YlCheckboxState({this.isCheck});

  @override
  Widget build(BuildContext context) {
    bool enabled = widget.onChanged != null;

    return Container(
      child: CupertinoButton(
        padding: EdgeInsets.all(8),
        minSize: 30,
        child: isCheck
            ? Icon(
                widget.checkedIcon,
                color: enabled ? widget.color : YlColors.grey2,
                size: widget.size,
              )
            : Icon(
                widget.uncheckedIcon,
                color: enabled ? YlColors.black50 : YlColors.grey2,
                size: widget.size,
              ),
        onPressed: enabled
            ? () {
                setState(() {
                  isCheck = !isCheck;
                });
                widget.onChanged(isCheck);
              }
            : null,
      ),
    );
  }
}
