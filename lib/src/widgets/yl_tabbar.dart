import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class YlTabBar extends StatelessWidget {
  final int? index;
  final ValueChanged<int>? onTap;
  final List<BottomNavigationBarItem> items;

  const YlTabBar({
    Key? key,
    this.index,
    this.onTap,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        items: items,
        selectedItemColor: YlColors.branding2,
        unselectedItemColor: YlColors.black50,
        selectedFontSize: 10,
        selectedLabelStyle: TextStyle(
          fontSize: 10,
          fontWeight: YlFontWeight.bold,
          color: YlColors.branding2,
        ),
        unselectedFontSize: 10,
        unselectedLabelStyle: TextStyle(
          fontWeight: YlFontWeight.bold,
          color: YlColors.black50,
        ),
        iconSize: 28.0,
        elevation: 4.0,
        currentIndex: index ?? 0,
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
      ),
    );
  }
}
