import 'dart:ui';

import 'package:flutter/material.dart';

/// https://www.figma.com/file/9T1OmAr4MqUcY0u1Y2FZdw/%F0%9F%93%97-YLApp-Components?node-id=4215%3A8832
class YlColors {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  // ignore: unused_element
  YlColors._();

  /// 主题色，名称取自 figma, #00BF57
  static const branding1 = Color(0xFF00BF57);

  /// 辅助主题色, #FFA902
  static const branding2 = Color(0xFF00AB4C);

  /// 品牌/成功底色
  static final branding3 = Color(0xFFEBF9EB);

  /// 透明色
  static const transparent = Color(0x00000000);

  static const white = Color(0xFFFFFFFF);

  /// 黑色，名称取自 Colors.black
  static const black = Color(0xFF000000);
  static const black90 = Color.fromRGBO(0, 0, 0, 0.9);
  static const black70 = Color.fromRGBO(0, 0, 0, 0.7);
  static const black50 = Color.fromRGBO(0, 0, 0, 0.5);
  static const black30 = Color.fromRGBO(0, 0, 0, 0.3);
  static const black10 = Color.fromRGBO(0, 0, 0, 0.1);

  /// 底色, #FAFAFB
  static const grey1 = Color(0xFFFAFAFB);
  static const background = grey1;

  /// 灰块分割, #F5F6F8
  static const grey2 = Color(0xFFF5F6F8);
  static const dividerBlock = grey2;

  /// 暗示可点击、线框, #EFF0F2
  static const grey3 = Color(0xFFEFF0F2);
  static const border = grey3;

  /// 灰色，分割线, #E6E8EB
  static const grey4 = Color(0xFFE6E8EB);
  static const divider = grey4;
  static const separator = grey4;

  /// 浅色插画
  static const grey5 = Color(0xFFD6DAE0);

  /// 提醒色，命名取自, #FA243C
  static const alertRed = Color(0xFFFA243C);

  /// 警示性提示条底色
  static const alertRedBg = Color(0xFFFFF5F6);

  /// 强提醒文案
  static const reminderOrange = Color(0xFFDE8D13);

  /// 强提示条底色
  static final reminderBg = Color(0xFFFDF6EC);

  /// 警告色，橙色，浅色, #FFA902
  static const orangeLight = Color.fromRGBO(255, 169, 2, 1);

  /// 警告色，橙色，深色, #FF9500
  @Deprecated('使用 reminderOrange 代替')
  static const orangeDark = reminderOrange;

  /// 瓴里蓝色, #5C769D
  static const lanehubBlue = Color.fromRGBO(92, 118, 157, 1);

  static const note = Color(0xFFC22CDB);

  /// 金色，浅色，尝试性颜色
  static const gold1 = Color(0xFFF3D6A3);

  /// 金色，深色，尝试性颜色
  static const gold2 = Color(0xFF976830);
}
