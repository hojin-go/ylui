import 'package:example/views/componnets/demo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class HorizontalTabsView extends StatefulWidget {
  final bool isScrollable;
  const HorizontalTabsView({
    Key? key,
    required this.isScrollable,
  }) : super(key: key);

  @override
  State<HorizontalTabsView> createState() => _HorizontalTabsViewState();
}

class _HorizontalTabsViewState extends State<HorizontalTabsView>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    _tabController ??=
        TabController(length: widget.isScrollable ? 10 : 4, vsync: this);
    String title;
    List<Tab> tabs;
    List<Widget> tabViews;
    if (widget.isScrollable) {
      title = '横向非均分Tabs';
      tabs = List.generate(10, (index) => Tab(text: 'Tab $index'));
      tabViews = List.generate(
          10,
          (index) => Container(
                color: Colors.primaries[index % Colors.primaries.length],
                child: Center(
                  child: Text('Tab $index'),
                ),
              ));
    } else {
      title = '横向均分Tabs';
      tabs = List.generate(4, (index) => Tab(text: 'Tab $index'));
      tabViews = List.generate(
          4,
          (index) => Container(
                color: Colors.primaries[index % Colors.primaries.length],
                child: Center(
                  child: Text('Tab $index'),
                ),
              ));
    }

    return DemoPage(
      backgroundColor: YlColors.background,
      contentPadding: EdgeInsets.zero,
      title: title,
      child: Column(
        children: [
          YlHorizontalTabs(
            backgroundColor: Colors.white,
            tabController: _tabController!,
            isScrollable: widget.isScrollable,
            tabs: tabs,
          ),
          Expanded(
            child: TabBarView(
              children: tabViews,
              controller: _tabController,
            ),
          )
        ],
      ),
    );
  }
}
