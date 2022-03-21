import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

import 'limited_underline_tab_indicator.dart';

class YlHorizontalTabs extends StatelessWidget {
  final Color? backgroundColor;
  final List<Tab> tabs;
  final TabController tabController;
  final bool isScrollable;

  const YlHorizontalTabs({
    Key? key,
    this.backgroundColor,
    required this.tabController,
    required this.tabs,
    this.isScrollable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle labelStyle;
    TextStyle unselectedLabelStyle;
    Decoration indicator;
    Color labelColor;
    Color unselectedLabelColor;

    if (isScrollable) {
      labelStyle = TextStyle(fontSize: 20, fontWeight: YlFontWeight.bold);
      unselectedLabelStyle = TextStyle(fontSize: 16);
      indicator = LimitedUnderlineTabIndicator(
        insets: EdgeInsets.only(bottom: 0),
        width: 32,
        borderSide: BorderSide(
          color: YlColors.branding1,
          width: 3,
        ),
      );
      labelColor = YlColors.black90;
      unselectedLabelColor = YlColors.black50;
    } else {
      labelStyle = TextStyle(fontSize: 14, fontWeight: YlFontWeight.bold);
      unselectedLabelStyle = TextStyle(fontSize: 14);
      indicator = LimitedUnderlineTabIndicator(
        insets: EdgeInsets.only(bottom: 0),
        width: 56,
        borderSide: BorderSide(
          color: YlColors.branding1,
          width: 2,
        ),
      );
      labelColor = YlColors.black90;
      unselectedLabelColor = YlColors.black70;
    }

    return Container(
      color: backgroundColor,
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
    );
  }
}
