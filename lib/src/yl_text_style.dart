import 'dart:io';

import 'package:flutter/painting.dart';

import 'yl_color.dart';

class YlTextStyles {
  YlTextStyles._();

  static final _bold = Platform.isAndroid ? FontWeight.w600 : FontWeight.w500;

  static final header1 = TextStyle(
      fontSize: 34, color: YlColors.black90, fontWeight: _bold, height: 1.294);

  static final header2 = TextStyle(
      fontSize: 28, color: YlColors.black90, fontWeight: _bold, height: 1.286);

  static final header3 = TextStyle(
      fontSize: 24, color: YlColors.black90, fontWeight: _bold, height: 1.33);

  static final header4 = TextStyle(
      fontSize: 20, color: YlColors.black90, fontWeight: _bold, height: 1.5);

  static final header5 = TextStyle(
      fontSize: 17, color: YlColors.black90, fontWeight: _bold, height: 1.412);

  static final subHeader1 = TextStyle(
      fontSize: 16, color: YlColors.black90, fontWeight: _bold, height: 1.5);

  static final subHeader2 = TextStyle(
      fontSize: 15, color: YlColors.black90, fontWeight: _bold, height: 1.467);

  static final subHeader3 = TextStyle(
      fontSize: 14, color: YlColors.black90, fontWeight: _bold, height: 1.429);

  static final body1 = TextStyle(
      fontSize: 17,
      color: YlColors.black90,
      fontWeight: FontWeight.normal,
      height: 1.412);

  static final body2 = TextStyle(
      fontSize: 16,
      color: YlColors.black90,
      fontWeight: FontWeight.normal,
      height: 1.5);

  static final body3 = TextStyle(
      fontSize: 15,
      color: YlColors.black90,
      fontWeight: FontWeight.normal,
      height: 1.467);

  static final body4 = TextStyle(
      fontSize: 14,
      color: YlColors.black90,
      fontWeight: FontWeight.normal,
      height: 1.429);

  static final caption1 = TextStyle(
      fontSize: 12,
      color: YlColors.black90,
      fontWeight: FontWeight.normal,
      height: 1.5);

  static final caption2 = TextStyle(
      fontSize: 10,
      color: YlColors.black90,
      fontWeight: FontWeight.normal,
      height: 1.4);
}
