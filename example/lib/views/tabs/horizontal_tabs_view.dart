import 'package:example/views/componnets/demo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class HorizontalTabsView extends StatefulWidget {
  final bool isScrollable;
  final bool custom;
  const HorizontalTabsView({
    Key? key,
    required this.isScrollable,
    this.custom = false,
  }) : super(key: key);

  @override
  State<HorizontalTabsView> createState() => _HorizontalTabsViewState();
}

class _HorizontalTabsViewState extends State<HorizontalTabsView>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    final length = 4;
    _tabController ??= TabController(length: length, vsync: this);
    String title;
    List<Tab> tabs;
    List<Widget> tabViews;
    if (widget.isScrollable) {
      title = '横向非均分Tabs';
      tabs = List.generate(length, (index) => Tab(text: 'Tab $index'));
      tabViews = List.generate(
          length,
          (index) => Container(
                color: Colors.primaries[index % Colors.primaries.length],
                child: Center(
                  child: Text('Tab $index'),
                ),
              ));
    } else {
      title = '横向均分Tabs';
      tabs = List.generate(length, (index) => Tab(text: 'Tab $index'));
      tabViews = List.generate(
          length,
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
            backgroundColor: widget.custom ? YlColors.branding1 : Colors.white,
            tabController: _tabController!,
            isScrollable: widget.isScrollable,
            labelStyle: widget.custom
                ? TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)
                : null,
            unselectedLabelStyle: widget.custom
                ? TextStyle(fontSize: 20, color: YlColors.white)
                : null,
            indicator: widget.custom
                ? YlUnderlineTabIndicator(
                    width: 20,
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 4,
                    ))
                : null,
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
