import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';
import 'package:intl/intl.dart';

enum YlPriceHeightStyle {
  // 高度相等
  equal,
  // 驼峰
  camel,
}

enum YlPriceFontFamily {
  // 默认
  system,
  // 粗体
  din,
}

class _YlPrice extends StatelessWidget {
  /// 金额前缀，通常为金额符号
  final String? prefix;

  /// 金额，可以是整数，也可以是小数，也可以是字符串
  final dynamic price;

  /// 金额单位
  final String? suffix;

  /// 文字颜色
  final Color? color;

  /// 前缀样式
  final double? prefixFontSize;

  /// 金额样式
  final double fontSize;

  /// 小数样式
  final double? decimalFontSize;

  /// 后缀样式
  final double? suffixFontSize;

  /// 高度风格
  final YlPriceHeightStyle heightStyle;

  /// 是否缩短显示，仅当金额超过99999时有效
  final bool short;

  final YlPriceFontFamily fontFamily;

  /// 行高
  final double? height;
  const _YlPrice({
    Key? key,
    this.prefix,
    this.price,
    this.suffix,
    this.color,
    this.short = true,
    this.heightStyle = YlPriceHeightStyle.camel,
    this.prefixFontSize,
    this.fontSize = 16,
    this.decimalFontSize,
    this.suffixFontSize,
    this.height,
    this.fontFamily = YlPriceFontFamily.din,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fmtter = NumberFormat("###.##");
    var value = double.tryParse(price.toString()) ?? 0.0;
    var unit = '';
    if (short && value > 99999) {
      // 金额大于99999时，单位为万
      unit = '万';
      value = value / 10000;
    }
    final priceStr = fmtter.format(value);
    // 提取整数和小数部分
    final comps = priceStr.split('.');
    final integer = priceStr.split('.').first;
    final decimal = comps.length == 2 ? priceStr.split('.').last : null;

    final _fontSize = max(12.0, fontSize);

    var _prefixFontSize = prefixFontSize ?? _fontSize;
    var _decimalFontSize = decimalFontSize ?? _fontSize;
    var _suffixFontSize = suffixFontSize ?? _fontSize;

    if (heightStyle == YlPriceHeightStyle.camel) {
      _prefixFontSize = 12;
      _decimalFontSize = max(12, _fontSize * 14.0 / 18.0);
      _suffixFontSize = 12;
    }

    final getStyle = (double size) {
      return fontFamily == YlPriceFontFamily.din
          ? YlTextStyles.number(size)
          : TextStyle(fontSize: size);
    };

    final prefixStyle = getStyle(_prefixFontSize);
    final integerStyle = getStyle(_fontSize);
    final decimalStyle = getStyle(_decimalFontSize);
    final suffixStyle = getStyle(_suffixFontSize);

    return RichText(
      text: TextSpan(
          style: TextStyle(
            color: color ?? YlColors.amount,
            height: height,
          ),
          children: [
            TextSpan(text: prefix, style: prefixStyle),
            TextSpan(
              text: integer,
              style: integerStyle,
            ),
            if (decimal != null)
              TextSpan(
                text: '.$decimal',
                style: decimalStyle,
              ),
            TextSpan(text: unit, style: suffixStyle),
            TextSpan(
              text: suffix,
              style: suffixStyle,
            ),
          ]),
    );
  }
}

class YlPriceFormatter extends StatelessWidget {
  /// 金额文本，可包含金额符号和单位，例如：¥ 100.00 元
  final String price;

  /// 高度样式
  final YlPriceHeightStyle heightStyle;

  /// 是否缩短显示，仅当金额超过99999时有效
  final bool short;

  /// 文字颜色
  final Color? color;

  /// 金额大小，取金额部分的字体大小
  final double size;
  final double? height;

  final YlPriceFontFamily fontFamily;
  const YlPriceFormatter({
    Key? key,
    required this.price,
    this.heightStyle = YlPriceHeightStyle.camel,
    this.short = true,
    this.color,
    this.size = 18,
    this.height,
    this.fontFamily = YlPriceFontFamily.din,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final regexp = RegExp(r'\d+(\.\d+)?');
    final number = regexp.stringMatch(price);
    if (number == null) {
      return Text(price);
    }

    final prefix = price.substring(0, price.indexOf(number));
    final suffix = price.substring(price.indexOf(number) + number.length);
    return _YlPrice(
      prefix: prefix,
      price: number,
      suffix: suffix,
      short: short,
      heightStyle: heightStyle,
      color: color,
      fontSize: size,
      height: height,
      fontFamily: fontFamily,
    );
  }
}
