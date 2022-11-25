import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';
import 'package:intl/intl.dart';

enum _PriceTextTag {
  other,
  integer,
  decimal,
}

class _PriceTextWrap {
  final String text;
  final _PriceTextTag tag;

  _PriceTextWrap(this.text, this.tag);

  String toString() {
    return '$text (${tag.toString().split('.').last})';
  }

  double get heightScale {
    switch (tag) {
      case _PriceTextTag.integer:
        return 1.0;
      case _PriceTextTag.decimal:
        return 0.65;
      default:
        return 0.5;
    }
  }

  TextStyle getStyle(
      {double? fontSize, Color? color, bool ignoreScale = false}) {
    if (ignoreScale) {
      return TextStyle(fontSize: fontSize, color: color);
    }
    final size = max(11.0, (fontSize ?? 16) * heightScale);
    final style = tag != _PriceTextTag.other
        ? YlTextStyles.number(size, height: 1)
        : TextStyle(fontSize: size);

    return style.copyWith(
      color: color ?? YlColors.amount,
    );
  }
}

class YlPrice extends StatelessWidget {
  /// 金额文本，可包含金额符号和单位，例如：¥ 100.00 元
  final String price;

  /// 高度样式
  final bool camel;

  /// 是否缩短显示，仅当金额超过99999时有效
  final bool short;

  /// 文字颜色
  final Color? color;

  /// 金额大小，取金额部分的字体大小
  final double size;

  final bool? bold;

  const YlPrice({
    Key? key,
    required this.price,
    this.camel = true,
    this.short = false,
    this.color,
    this.size = 18,
    this.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wraps = _getWrapsFromText(price, short: true);
    print(wraps.map((e) => e.toString()).join(' '));

    final spans = wraps.map((e) {
      return TextSpan(
          text: e.text,
          style: e.getStyle(
            fontSize: size,
            color: color,
            ignoreScale: !camel,
          ));
    }).toList();

    final style = TextStyle(
      color: color ?? YlColors.amount,
      fontWeight: bold == true ? YlFontWeight.bold : FontWeight.normal,
    );
    return RichText(
      text: TextSpan(
        style: style,
        children: spans,
      ),
    );
  }

  List<_PriceTextWrap> _getWrapsFromPrice(
    String price, {
    bool short = false,
  }) {
    if (price.isEmpty) {
      return [];
    }
    final num = double.tryParse(price) ?? 0.0;

    final wraps = <_PriceTextWrap>[];

    if (short && num > 999999) {
      // 金额大于999999时，单位为万
      final value = num / 10000;
      final fmtter = NumberFormat("###.##");
      final priceStr = fmtter.format(value);
      wraps.addAll(
        _getWrapsFromPrice(
          priceStr,
          short: false,
        ),
      );
      wraps.add(_PriceTextWrap('万', _PriceTextTag.other));
    } else {
      final fmtter = NumberFormat("###.##");
      final priceStr = fmtter.format(num);
      final comps = priceStr.split('.');
      final integer = comps[0];
      wraps.add(
        _PriceTextWrap(integer, _PriceTextTag.integer),
      );
      final decimal = comps.length > 1 ? comps[1] : null;
      if (decimal != null) {
        wraps.add(_PriceTextWrap('.', _PriceTextTag.other));
        wraps.add(
          _PriceTextWrap(decimal, _PriceTextTag.decimal),
        );
      }
    }

    return wraps;
  }

  List<_PriceTextWrap> _getWrapsFromText(
    String text, {
    bool short = false,
  }) {
    final regexp = RegExp(r'\d+(\.\d+)?');
    final matchs = regexp.allMatches(price);
    if (matchs.isEmpty) {
      return [
        _PriceTextWrap(text, _PriceTextTag.other),
      ];
    }
    final tmp = <_PriceTextWrap>[];
    int offset = 0;
    for (var match in matchs) {
      if (match.start > offset) {
        final text = price.substring(offset, match.start);
        tmp.add(_PriceTextWrap(text, _PriceTextTag.other));
        offset = match.start;
      }
      final priceText = price.substring(match.start, match.end);
      tmp.addAll(_getWrapsFromPrice(priceText, short: short));
      offset = match.end;
    }

    if (offset < price.length) {
      final text = price.substring(offset);
      tmp.add(_PriceTextWrap(text, _PriceTextTag.other));
    }
    return tmp;
  }
}
