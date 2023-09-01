import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

import 'yl_color.dart';

class YlFontWeight {
  static FontWeight bold =
      !kIsWeb && Platform.isAndroid ? FontWeight.w600 : FontWeight.w500;
}

class YlTextStyles {
  YlTextStyles._();

  static final header1 = b34(color: YlColors.black90);

  static final header2 = b28(color: YlColors.black90);

  static final header3 = b24(color: YlColors.black90);

  static final header4 = b20(color: YlColors.black90);

  static final header5 = b17(color: YlColors.black90);

  static final subHeader1 = b16(color: YlColors.black90);

  static final subHeader2 = b15(color: YlColors.black90);

  static final subHeader3 = b14(color: YlColors.black90);

  static final body1 = n17(color: YlColors.black90);

  static final body2 = n16(color: YlColors.black90);

  static final body3 = n15(color: YlColors.black90);

  static final body4 = n14(color: YlColors.black90);

  static final caption1 = n12(color: YlColors.black90);

  static final caption2 = n10(color: YlColors.black90);

  /// 数字文本默认字体
  static String? _defaultNumFontFamily;

  /// 设置数字默认字体，通过该方法设定后，[number]方法才会起作用
  static setDefaultNumFontFamily(String fontFamily) {
    _defaultNumFontFamily = fontFamily;
  }

  /// 获取数字类型文本的字体样式
  static TextStyle number(
    double fontSize, {
    FontWeight? fontWeight,
    Color? color,
    double? height,
  }) =>
      TextStyle(
        fontFamily: _defaultNumFontFamily,
        fontSize: fontSize,
        height: height,
        color: color,
      );

  /// 34号字体，加粗
  static TextStyle b34(
          {Color? color, double? height = 44 / 34.0, bool? bold = true}) =>
      style(color: color, size: 34, height: height, bold: bold);

  /// 28号字体，加粗
  static TextStyle b28(
          {Color? color, double? height = 36.0 / 28.0, bool? bold = true}) =>
      style(color: color, size: 28, height: height, bold: bold);

  /// 24号字体，加粗
  static TextStyle b24(
          {Color? color, double? height = 32.0 / 24.0, bool? bold = true}) =>
      style(color: color, size: 24, height: height, bold: bold);

  /// 20号字体，加粗
  static TextStyle b20(
          {Color? color, double? height = 28.0 / 20.0, bool? bold = true}) =>
      style(color: color, size: 20, height: height, bold: bold);

  /// 17号字体，加粗
  static TextStyle b17(
          {Color? color, double? height = 24.0 / 17.0, bool? bold = true}) =>
      style(color: color, size: 17, height: height, bold: bold);

  /// 17号字体
  static TextStyle n17(
          {Color? color, double? height = 24.0 / 17.0, bool? bold = false}) =>
      style(color: color, size: 17, height: height, bold: bold);

  /// 16号字体，加粗
  static TextStyle b16(
          {Color? color, double? height = 24.0 / 16.0, bool? bold = true}) =>
      style(color: color, size: 16, height: height, bold: bold);

  /// 16号字体
  static TextStyle n16(
          {Color? color, double? height = 24.0 / 16.0, bool? bold = false}) =>
      style(color: color, size: 16, height: height, bold: bold);

  /// 15号字体，加粗
  static TextStyle b15(
          {Color? color, double? height = 22.0 / 15.0, bool? bold = true}) =>
      style(color: color, size: 15, height: height, bold: bold);

  /// 15号字体
  static TextStyle n15(
          {Color? color, double? height = 22.0 / 15.0, bool? bold = false}) =>
      style(color: color, size: 15, height: height, bold: bold);

  /// 14号字体，加粗
  static TextStyle b14(
          {Color? color, double? height = 20.0 / 14.0, bool? bold = true}) =>
      style(color: color, size: 14, height: height, bold: bold);

  /// 14号字体
  static TextStyle n14(
          {Color? color, double? height = 20.0 / 14.0, bool? bold = false}) =>
      style(color: color, size: 14, height: height, bold: bold);

  /// 12号字体
  static TextStyle n12(
          {Color? color, double? height = 18.0 / 12.0, bool? bold = false}) =>
      style(color: color, size: 12, height: height, bold: bold);

  /// 10号字体
  static TextStyle n10(
          {Color? color, double? height = 14.0 / 10.0, bool? bold = false}) =>
      style(color: color, size: 10, height: height, bold: bold);

  static TextStyle style(
          {required Color? color,
          required double? size,
          required double? height,
          required bool? bold}) =>
      TextStyle(
          fontSize: size,
          height: height,
          color: color,
          fontWeight: bold == true ? YlFontWeight.bold : FontWeight.normal);

  List<TextStyle> get buildinStyles => [
        b34(),
        b28(),
        b24(),
        b20(),
        b17(),
        b16(),
        b15(),
        b14(),
        n17(),
        n16(),
        n15(),
        n14(),
        n12(),
        n10()
      ];
}
