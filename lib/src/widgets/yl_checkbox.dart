import 'package:flutter/cupertino.dart';
import 'package:flutter_ylui/flutter_ylui.dart';
import 'package:flutter_ylui/src/helper.dart';

class YlCheckbox extends StatefulWidget {
  final ValueChanged<bool>? onChanged;
  final bool checked;

  const YlCheckbox({
    Key? key,
    this.onChanged,
    this.checked = false,
  }) : super(key: key);

  @override
  _YlCheckboxState createState() => _YlCheckboxState(isCheck: checked);
}

class _YlCheckboxState extends State<YlCheckbox> {
  bool isCheck;

  _YlCheckboxState({this.isCheck = false});

  @override
  Widget build(BuildContext context) {
    bool enabled = widget.onChanged != null;

    return YlTapDetector(
      onTap: enabled
          ? () {
              setState(() {
                isCheck = !isCheck;
              });
              widget.onChanged!(isCheck);
            }
          : null,
      child: Container(
        width: 22,
        height: 22,
        margin: EdgeInsets.all(11),
        child: YlCheckboxWidget(checked: isCheck, enabled: enabled),
      ),
    );
  }
}

class YlRadioboxWidget extends YlCheckWidget {
  YlRadioboxWidget({
    required bool checked,
    required bool enabled,
  }) : super(
            checked: checked,
            enabled: enabled,
            imageGetter: (checked, enabled) {
              return checked
                  ? 'radio_selected${enabled ? '' : '_disable'}'
                  : 'radio_unselected${enabled ? '' : '_disable'}';
            });
}

class YlCheckboxWidget extends YlCheckWidget {
  YlCheckboxWidget({required bool checked, required bool enabled})
      : super(
            checked: checked,
            enabled: enabled,
            imageGetter: (checked, enabled) {
              return checked
                  ? 'cb_selected${enabled ? '' : '_disable'}'
                  : 'cb_unselected${enabled ? '' : '_disable'}';
            });
}

typedef String YlCheckboxImageGetter(bool checked, bool enabled);

abstract class YlCheckWidget extends StatelessWidget {
  final bool checked;
  final bool enabled;
  final YlCheckboxImageGetter imageGetter;
  const YlCheckWidget(
      {Key? key,
      required this.checked,
      required this.enabled,
      required this.imageGetter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return getImageFromAssets(imageGetter(checked, enabled), ext: 'png');
  }
}
