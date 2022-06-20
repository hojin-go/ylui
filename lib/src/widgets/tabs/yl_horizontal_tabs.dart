import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

import 'yl_underline_tab_indicator.dart';

class YlHorizontalTabs extends StatelessWidget {
  /// 背景色
  final Color? backgroundColor;
  final List<Tab> tabs;
  final TabController tabController;

  /// 是否可滚动
  final bool isScrollable;

  /// 选中的文字样式
  final TextStyle? labelStyle;

  /// 未选中tab文字样式
  final TextStyle? unselectedLabelStyle;

  /// 指示器，可使用 [YlUnderlineTabIndicator] 定制效果
  final Decoration? indicator;

  const YlHorizontalTabs({
    Key? key,
    this.backgroundColor,
    required this.tabController,
    required this.tabs,
    this.isScrollable = false,
    this.labelStyle,
    this.unselectedLabelStyle,
    this.indicator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle labelStyle;
    TextStyle unselectedLabelStyle;
    Decoration indicator;
    Color labelColor;
    Color unselectedLabelColor;

    if (isScrollable) {
      labelStyle = this.labelStyle ??
          TextStyle(fontSize: 20, fontWeight: YlFontWeight.bold);
      unselectedLabelStyle =
          this.unselectedLabelStyle ?? TextStyle(fontSize: 16);
      indicator = this.indicator ??
          YlUnderlineTabIndicator(
            insets: EdgeInsets.only(bottom: 0),
            width: 32,
            borderSide: BorderSide(
              color: YlColors.branding1,
              width: 3,
            ),
          );
      labelColor = this.labelStyle?.color ?? YlColors.black90;
      unselectedLabelColor =
          this.unselectedLabelStyle?.color ?? YlColors.black50;
    } else {
      labelStyle = this.labelStyle ??
          TextStyle(fontSize: 14, fontWeight: YlFontWeight.bold);
      unselectedLabelStyle =
          this.unselectedLabelStyle ?? TextStyle(fontSize: 14);
      indicator = this.indicator ??
          YlUnderlineTabIndicator(
            insets: EdgeInsets.only(bottom: 0),
            width: 56,
            borderSide: BorderSide(
              color: YlColors.branding1,
              width: 2,
            ),
          );
      labelColor = this.labelStyle?.color ?? YlColors.black90;
      unselectedLabelColor =
          this.unselectedLabelStyle?.color ?? YlColors.black70;
    }

    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Container(
        color: backgroundColor,
        width: double.infinity,
        height: 44,
        child: TabBar(
          padding: EdgeInsets.zero,
          controller: tabController,
          isScrollable: isScrollable,
          labelStyle: labelStyle,
          labelPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
          unselectedLabelStyle: unselectedLabelStyle,
          labelColor: labelColor,
          unselectedLabelColor: unselectedLabelColor,
          indicator: indicator,
          tabs: tabs,
        ),
      ),
    );
  }
}
