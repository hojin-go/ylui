import 'dart:ui';

class YlColors {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  // ignore: unused_element
  YlColors._();

  /// 主题色，名称取自 figma
  static const brandColor = Color(0xFF00BF57);
  /// 辅助主题色
  static const secondaryBrandColor = Color(0xFF009845);

  static const white = Color(0xFFFFFFFF);
  /// 黑色，名称取自 Colors.black
  static const black = Color(0xFF000000);
  static const black90 = Color(0xE6000000);
  static const black70 = Color(0xB2000000);
  static const black50 = Color(0x7F000000);
  static const black30 = Color(0x4F000000);

  /// 灰色
  static const grey1 = Color(0xFFE6E8EB);
  static const grey2 = Color(0xFFEFF0F2);
  static const grey3 = Color(0xFFF5F6F8);
  static const grey4 = Color(0xFFFAFAFB);

  /// 分割线颜色, 命名取自 CupertinoColors.separator
  static const separator = Color(0xFFFAFAFA);

  /// 提醒色，命名取自 CupertinoColors.destructiveRed
  static const destructiveRed = Color(0xFFFA243C);
}