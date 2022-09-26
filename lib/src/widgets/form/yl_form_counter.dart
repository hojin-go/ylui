import 'package:flutter/material.dart';

import '../../yl_color.dart';

class YlTextFormCounter extends StatelessWidget {
  final int? minLength;
  final int? maxLength;
  final int? length;

  const YlTextFormCounter({
    Key? key,
    this.minLength,
    this.maxLength,
    this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var comps = <String>[];

    if (length != null && length! > 0) {
      if (maxLength != null && maxLength! > 0) {
        comps.add('$length/$maxLength');
      } else {
        comps.add('字数$length');
      }
    }
    if (minLength != null && minLength! > 0) {
      comps.add('至少$minLength字');
    }
    return Text(
      comps.join('，'),
      style: TextStyle(
        fontSize: 12,
        color: YlColors.black30,
      ),
    );
  }
}
