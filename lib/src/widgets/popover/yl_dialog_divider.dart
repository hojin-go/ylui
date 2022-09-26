import 'package:flutter/cupertino.dart';
import 'package:flutter_ylui/src/yl_color.dart';

/// 按钮的分割线
class YlDialogDivider extends StatelessWidget {
  final bool horizontal;

  const YlDialogDivider({Key? key, this.horizontal = true}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: YlColors.grey3,
      width: horizontal ? double.infinity : 0.5,
      height: horizontal ? 0.5 : 56,
    );
  }
}
