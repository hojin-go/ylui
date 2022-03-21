import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class BottomTabbarView extends StatefulWidget {
  const BottomTabbarView({Key? key}) : super(key: key);

  @override
  State<BottomTabbarView> createState() => _BottomTabbarViewState();
}

class _BottomTabbarViewState extends State<BottomTabbarView> {
  var _index = 0;

  _handleIndexChanged(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '首页',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '搜索',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle),
              label: '发布',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '我的',
            ),
          ],
          selectedItemColor: YlColors.branding1,
          unselectedItemColor: YlColors.black30,
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
          currentIndex: _index,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            _handleIndexChanged(index);
          },
        ),
      ),
    );
  }
}
