import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class YlFormTextContent extends StatelessWidget {
  final String text;
  final int? maxLines;
  final String placeholder;
  final bool? enabled;
  const YlFormTextContent(
    this.text, {
    Key? key,
    required this.placeholder,
    this.maxLines,
    this.enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var maxLines = this.maxLines ?? 1;
    var style = maxLines > 1 ? YlTextStyles.n17() : TextStyle(fontSize: 17);
    if (text.isEmpty) {
      return Text(placeholder, style: style.copyWith(color: YlColors.black30));
    }
    if (enabled ?? true) {
      return Text(text, style: style.copyWith(color: YlColors.black90));
    }
    return Text(
      text,
      style: style.copyWith(color: YlColors.black50),
    );
  }
}
