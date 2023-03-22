import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';
import 'package:intl/intl.dart';

enum _PriceTextTag {
  symbol,
  unit,
  point,
  integer,
  decimal,
  other2,
}

enum YlPriceSize {
  small,
  medium,
  large,
  xLarge,
}

extension _Ext on YlPriceSize {
  double get fontSize {
    switch (this) {
      case YlPriceSize.small:
        return 18;
      case YlPriceSize.medium:
        return 22;
      case YlPriceSize.large:
        return 28;
      case YlPriceSize.xLarge:
        return 36;
    }
  }

  double get unitFontSize {
    switch (this) {
      case YlPriceSize.small:
        return 11;
      case YlPriceSize.medium:
        return 11;
      case YlPriceSize.large:
        return 12;
      case YlPriceSize.xLarge:
        return 14;
    }
  }

  double get symbolFontSize {
    switch (this) {
      case YlPriceSize.small:
        return 12;
      case YlPriceSize.medium:
        return 14;
      case YlPriceSize.large:
        return 16;
      case YlPriceSize.xLarge:
        return 20;
    }
  }
}

class _PriceTextWrap {
  final String text;
  final _PriceTextTag tag;

  _PriceTextWrap(this.text, this.tag);

  String toString() {
    return '$text (${tag.toString().split('.').last})';
  }

  TextStyle getStyle({
    Color? color,
    bool ignoreScale = false,
    required YlPriceSize size,
  }) {
    if (ignoreScale) {
      return TextStyle(
        fontSize: size.fontSize,
        color: color,
        height: 1.3,
      );
    }

    late TextStyle style;

    switch (tag) {
      case _PriceTextTag.integer:
        style = YlTextStyles.number(
          size.fontSize,
          height: 1.2,
        );
        break;
      case _PriceTextTag.decimal:
      case _PriceTextTag.point:
        style = YlTextStyles.number(
          size.unitFontSize * 1.3,
          height: 1.2 * size.fontSize / size.unitFontSize / 1.4,
        );
        break;
      case _PriceTextTag.symbol:
        style = YlTextStyles.number(
          size.symbolFontSize,
          height: 1.2 * size.fontSize / size.symbolFontSize * 1,
        );
        break;
      case _PriceTextTag.unit:
        style = TextStyle(
          fontSize: size.unitFontSize,
          height: 1.2 * size.fontSize / size.unitFontSize / 1.1,
        );
        break;
      default:
        style = TextStyle(
          fontSize: size.fontSize,
          height: 1.2,
        );
        break;
    }

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
  final YlPriceSize size;

  final bool? bold;

  final bool debugColor;

  const YlPrice({
    Key? key,
    required this.price,
    this.camel = true,
    this.short = false,
    this.color,
    this.size = YlPriceSize.small,
    this.bold,
    this.debugColor = false,
  }) : super(key: key);

  factory YlPrice.small({
    Key? key,
    required String price,
    bool camel = true,
    bool short = false,
    Color? color,
    bool? bold,
    double? height,
    bool debugColor = false,
  }) {
    return YlPrice(
      key: key,
      price: price,
      camel: camel,
      short: short,
      color: color,
      size: YlPriceSize.small,
      bold: bold,
      debugColor: debugColor,
    );
  }

  factory YlPrice.medium({
    Key? key,
    required String price,
    bool camel = true,
    bool short = false,
    Color? color,
    bool? bold,
    double? height,
    bool debugColor = false,
  }) {
    return YlPrice(
      key: key,
      price: price,
      camel: camel,
      short: short,
      color: color,
      size: YlPriceSize.medium,
      bold: bold,
      debugColor: debugColor,
    );
  }

  factory YlPrice.large({
    Key? key,
    required String price,
    bool camel = true,
    bool short = false,
    Color? color,
    bool? bold,
    double? height,
    bool debugColor = false,
  }) {
    return YlPrice(
      key: key,
      price: price,
      camel: camel,
      short: short,
      color: color,
      size: YlPriceSize.large,
      bold: bold,
      debugColor: debugColor,
    );
  }

  factory YlPrice.xLarge({
    Key? key,
    required String price,
    bool camel = true,
    bool short = false,
    Color? color,
    bool? bold,
    double? height,
    bool debugColor = false,
  }) {
    return YlPrice(
      key: key,
      price: price,
      camel: camel,
      short: short,
      color: color,
      size: YlPriceSize.xLarge,
      bold: bold,
      debugColor: debugColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    final wraps = _getWrapsFromText(price, short: short);

    final spans = wraps.map((e) {
      final style = e.getStyle(
        size: size,
        color: color,
        ignoreScale: !camel,
      );

      final widget = Text(
        e.text,
        style: style,
        strutStyle: e.tag == _PriceTextTag.unit
            ? StrutStyle(
                leading: 0.4,
              )
            : null,
      );

      return Container(
        color: debugColor == true ? Colors.blue[100] : null,
        child: widget,
        // margin: const EdgeInsets.only(right: 2),
      );
    }).toList();

    final style = TextStyle(
      color: color ?? YlColors.amount,
      fontWeight: bold == true ? YlFontWeight.bold : FontWeight.normal,
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
      wraps.add(_PriceTextWrap('万', _PriceTextTag.unit));
    } else {
      final value = (num * 1000).floor() / 1000.0;
      final fmtter = NumberFormat("###.##");
      final priceStr = fmtter.format(value);
      final comps = priceStr.split('.');
      final integer = comps[0];
      wraps.add(
        _PriceTextWrap(integer, _PriceTextTag.integer),
      );
      final decimal = comps.length > 1 ? comps[1] : null;
      if (decimal != null) {
        wraps.add(_PriceTextWrap('.', _PriceTextTag.point));
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
        _PriceTextWrap(text, _PriceTextTag.other2),
      ];
    }
    final tmp = <_PriceTextWrap>[];
    int offset = 0;
    for (var match in matchs) {
      if (match.start > offset) {
        final text = price.substring(offset, match.start);
        tmp.add(_PriceTextWrap(text, _PriceTextTag.symbol));
        offset = match.start;
      }
      final priceText = price.substring(match.start, match.end);
      tmp.addAll(_getWrapsFromPrice(priceText, short: short));
      offset = match.end;
    }

    if (offset < price.length) {
      final text = price.substring(offset);
      tmp.add(_PriceTextWrap(text, _PriceTextTag.unit));
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
      /// 不做计算，防止精度丢失
      // final value = (num * 100).floor() / 100.0;
      // final fmtter = NumberFormat("###.##");
      // final priceStr = fmtter.format(value);
      // return priceStr;
      return price.toString();
    }
  }
}
