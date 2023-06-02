import 'package:flutter/material.dart';

import '../componnets/demo_page.dart';
import 'horizontal_tabs_view.dart';
import 'vertical_tabs_view.dart';

class TabsView extends StatelessWidget {
  const TabsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: 'Tabs',
      contentPadding: EdgeInsets.zero,
      child: ListView(
        children: [
          ListTile(
            title: Text('横向均分'),
            trailing: Icon(Icons.chevron_right),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HorizontalTabsView(
                  isScrollable: false,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text('横向非均分'),
            trailing: Icon(Icons.chevron_right),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HorizontalTabsView(
                  isScrollable: true,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text('横向非均分 & 定制'),
            trailing: Icon(Icons.chevron_right),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HorizontalTabsView(
                  isScrollable: true,
                  custom: true,
                ),
              ),
            ),
          ),
          ListTile(
            title: Text('竖向'),
            trailing: Icon(Icons.chevron_right),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => VerticalTabsView(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
