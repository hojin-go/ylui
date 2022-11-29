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
        return 0.75;
      default:
        return 0.62;
    }
  }

  TextStyle getStyle({
    double? fontSize,
    double? height,
    Color? color,
    bool ignoreScale = false,
  }) {
    fontSize ??= 16;
    height ??= 1.2;

    if (ignoreScale) {
      return TextStyle(
        fontSize: fontSize,
        color: color,
        height: height,
      );
    }

    final renderFontsize = fontSize * heightScale;

    final style = tag != _PriceTextTag.other
        ? YlTextStyles.number(
            renderFontsize,
            height: fontSize * height / renderFontsize,
          )
        : TextStyle(
            fontSize: renderFontsize,
            height: fontSize * height / renderFontsize,
          );

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

  /// 行高
  final double? height;

  final bool debugColor;

  const YlPrice({
    Key? key,
    required this.price,
    this.camel = true,
    this.short = false,
    this.color,
    this.size = 18,
    this.bold,
    this.height,
    this.debugColor = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wraps = _getWrapsFromText(price, short: short);

    final spans = wraps.map((e) {
      final style = e.getStyle(
        fontSize: size,
        height: height,
        color: color,
        ignoreScale: !camel,
      );

      final widget = Text(e.text, style: style);

      if (debugColor == true) {
        return Container(
          color: Colors.blue[100],
          child: widget,
        );
      }
      return widget;
    }).toList();

    final style = TextStyle(
      color: color ?? YlColors.amount,
      fontWeight: bold == true ? YlFontWeight.bold : FontWeight.normal,
      height: height,
    );
    return DefaultTextStyle(
      style: style,
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
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
      final value = (num / 100).floor() / 100.0;
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
      final value = (num / 100).floor() / 100.0;
      final fmtter = NumberFormat("###.##");
      final priceStr = fmtter.format(value);
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

  static String formatPrice(dynamic price, {bool short = false}) {
    final num = double.tryParse(price) ?? 0.0;

    if (short && num > 999999) {
      // 金额大于999999时，单位为万
      final value = (num / 100).floor() / 100.0;
      final fmtter = NumberFormat("###.##");
      final priceStr = fmtter.format(value);
      return priceStr + '万';
    } else {
      final value = (num * 100).floor() / 100.0;
      final fmtter = NumberFormat("###.##");
      final priceStr = fmtter.format(value);
      return priceStr;
    }
  }
}
