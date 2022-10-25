import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';
import 'package:intl/intl.dart';

class YlPrice extends StatelessWidget {
  final String? prefix;
  final dynamic price;
  final String? suffix;
  final Color? color;
  final TextStyle? prefixStyle;
  final TextStyle? priceStyle;
  final TextStyle? suffixStyle;
  final bool? showComma;
  const YlPrice({
    Key? key,
    this.prefix,
    this.price,
    this.suffix,
    this.color,
    this.prefixStyle,
    this.priceStyle,
    this.suffixStyle,
    this.showComma,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fmtter = NumberFormat(showComma == true ? "#,###.##" : "###.##");
    final value = double.tryParse(price.toString());
    final priceText = fmtter.format(value ?? '0');
    return RichText(
      text: TextSpan(
          style: TextStyle(
            color: color ?? YlColors.amount,
          ),
          children: [
            TextSpan(
                text: prefix, style: prefixStyle ?? YlTextStyles.number(16)),
            TextSpan(
              text: priceText,
              style: priceStyle ?? YlTextStyles.number(28),
            ),
            TextSpan(
              text: suffix,
              style: suffixStyle ?? TextStyle(fontSize: 12),
            ),
          ]),
    );
  }
}
