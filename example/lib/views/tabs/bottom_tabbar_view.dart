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
    var items = [
      BottomNavigationBarItem(
        icon: Image.asset('images/tabs_icon/work_default.png'),
        activeIcon: Image.asset('images/tabs_icon/work_selected.png'),
        label: '工作',
      ),
      BottomNavigationBarItem(
        icon: Image.asset('images/tabs_icon/message_default.png'),
        activeIcon: Image.asset(
          'images/tabs_icon/message_selected.png',
        ),
        label: '消息',
      ),
      BottomNavigationBarItem(
        icon: Image.asset('images/tabs_icon/community_default.png'),
        activeIcon: Image.asset('images/tabs_icon/community_selected.png'),
        label: '社区',
      ),
      BottomNavigationBarItem(
        icon: Image.asset('images/tabs_icon/me_default.png'),
        activeIcon: Image.asset('images/tabs_icon/me_selected.png'),
        label: '我的',
      ),
    ];
    return Scaffold(
      bottomNavigationBar:
          YlTabBar(items: items, index: _index, onTap: _handleIndexChanged),
    );
  }
}
