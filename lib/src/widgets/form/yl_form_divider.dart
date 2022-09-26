import 'package:flutter/material.dart';

import '../../yl_color.dart';

class YlFormDivider extends StatelessWidget {
  final FormFieldState field;
  const YlFormDivider({
    Key? key,
    required this.field,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 0.5,
      color: field.hasError ? YlColors.alertRed : YlColors.grey3,
    );
  }
}
