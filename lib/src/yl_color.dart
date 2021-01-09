import 'dart:ui';

class YlColors {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  // ignore: unused_element
  YlColors._();

  /// 主题色，名称取自 figma
  static const branding1 = Color.fromRGBO(0, 191, 87, 1);

  /// 辅助主题色
  static const branding2 = Color.fromRGBO(0, 152, 69, 1);

  static const white = Color(0xFFFFFFFF);

  /// 黑色，名称取自 Colors.black
  static const black = Color(0xFF000000);
  static const black90 = Color.fromRGBO(0, 0, 0, 0.9);
  static const black70 = Color.fromRGBO(0, 0, 0, 0.7);
  static const black50 = Color.fromRGBO(0, 0, 0, 0.5);
  static const black30 = Color.fromRGBO(0, 0, 0, 0.3);
  static const black10 = Color.fromRGBO(0, 0, 0, 0.1);

  /// 透明色
  static const transparent = Color(0x00000000);

  /// 灰色
  /// 分割线
  static const grey1 = Color.fromRGBO(230, 232, 235, 1);

  /// 可点击、线框
  static const grey2 = Color.fromRGBO(239, 240, 242, 1);

  /// 灰块分割
  static const grey3 = Color.fromRGBO(245, 246, 248, 1);

  /// 底色
  static const grey4 = Color.fromRGBO(250, 250, 251, 1);

  /// 分割线颜色, 命名取自 CupertinoColors.separator
  static const separator = grey1;

  /// 提醒色，命名取自 CupertinoColors.destructiveRed
  static const alertRed = Color.fromRGBO(250, 36, 60, 1);

  /// 警告色，橙色，浅色
  static const orangeLight = Color.fromRGBO(255, 169, 2, 1);

  /// 警告色，橙色，深色
  static const orangeDark = Color.fromRGBO(255, 149, 0, 1);

  /// 瓴里蓝色
  static const lanehubBlue = Color.fromRGBO(60, 88, 242, 1);
}
