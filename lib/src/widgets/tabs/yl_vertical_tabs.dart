import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class YlVerticalTabs extends StatefulWidget {
  final YlVerticalTabsController controller;
  final List<Text> tabs;

  // todo text layout type: fitWidth, lineBreak

  const YlVerticalTabs({
    Key? key,
    required this.controller,
    required this.tabs,
  }) : super(key: key);

  @override
  State<YlVerticalTabs> createState() => _YlVerticalTabsState();
}

class _YlVerticalTabsState extends State<YlVerticalTabs> {
  @override
  void initState() {
    widget.controller.addListener(_handleIndexChanged);
    super.initState();
  }

  _handleIndexChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    widget.controller.removeListener(_handleIndexChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> wrapTabs = [];
    for (int i = 0; i < widget.tabs.length; i++) {
      var isChecked = widget.controller.index == i;

      var backgroundColor = isChecked ? Colors.white : Colors.transparent;
      Widget tapableTab = YlTapDetector(
        child: Container(
          color: backgroundColor,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          height: 56,
          alignment: Alignment.centerLeft,
          child: widget.tabs[i],
        ),
        onTap: () {
          widget.controller.index = i;
        },
      );

      // set text color
      TextStyle textStyle;
      if (isChecked) {
        textStyle = TextStyle(
          fontSize: 14,
          fontWeight: YlFontWeight.bold,
          color: YlColors.branding2,
        );
      } else {
        textStyle = TextStyle(
          fontSize: 14,
          color: YlColors.black90,
        );
      }
      tapableTab = DefaultTextStyle(
        style: textStyle,
        child: tapableTab,
      );

      wrapTabs.add(
        tapableTab,
      );
    }

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: wrapTabs,
      ),
    );
  }
}
