import 'package:flutter/material.dart';

import '../../yl_color.dart';
import '../../yl_text_style.dart';

class YlFormErrorHelper extends StatelessWidget {
  final String? helperText;
  final bool hasError;
  final String? errorText;
  const YlFormErrorHelper(
      {Key? key, this.helperText, required this.hasError, this.errorText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (hasError && errorText != null) {
      return Padding(
        padding: const EdgeInsets.only(top: 2),
        child: Text(
          errorText!,
          style: YlTextStyles.n12(color: YlColors.alertRed),
        ),
      );
    }
    // 有helperText的情况下
    if (helperText != null) {
      return Padding(
        padding: const EdgeInsets.only(top: 2),
        child: Text(
          helperText!,
          style: YlTextStyles.n12(
            color: YlColors.black30,
          ),
        ),
      );
    }
    return SizedBox.shrink();
  }
}
