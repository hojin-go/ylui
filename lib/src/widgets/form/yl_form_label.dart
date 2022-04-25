import 'package:flutter/material.dart';

import '../../yl_color.dart';
import '../../yl_text_style.dart';
import 'yl_form_field.dart';

class YlFormLabel extends StatelessWidget {
  final bool? isRequired;
  final String label;
  final TextStyle? style;
  final YlFormFieldRequiredPosition? requiredPosition;

  const YlFormLabel({
    Key? key,
    this.isRequired,
    required this.label,
    this.style,
    this.requiredPosition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: style ??
            TextStyle(
              fontSize: 15,
              fontWeight: YlFontWeight.bold,
              color: YlColors.black70,
            ),
        children: [
          if ((isRequired ?? false) &&
              requiredPosition == YlFormFieldRequiredPosition.start)
            TextSpan(
              text: '* ',
              style: TextStyle(
                color: YlColors.alertRed,
              ),
            ),
          TextSpan(text: label),
          if ((isRequired ?? false) &&
              requiredPosition == YlFormFieldRequiredPosition.end)
            TextSpan(
              text: ' *',
              style: TextStyle(
                color: YlColors.alertRed,
              ),
            ),
        ],
      ),
    );
  }
}
