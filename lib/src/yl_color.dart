import 'dart:ui';

class YlColors {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  // ignore: unused_element
  YlColors._();

  /// 主题色，名称取自 figma, #00BF57
  static const branding1 = Color.fromRGBO(0, 191, 87, 1);

  /// 辅助主题色, #FFA902
  static const branding2 = Color.fromRGBO(0, 171, 76, 1);

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
  static const alertRed = Color.fromRGBO(250, 36, 60, 1);

  /// 警告色，橙色，浅色, #FFA902
  static const orangeLight = Color.fromRGBO(255, 169, 2, 1);

  /// 警告色，橙色，深色, #FF9500
  static const orangeDark = Color.fromRGBO(255, 149, 0, 1);

  /// 瓴里蓝色, #5C769D
  static const lanehubBlue = Color.fromRGBO(92, 118, 157, 1);

  static const note = Color(0xFFC22CDB);
}
