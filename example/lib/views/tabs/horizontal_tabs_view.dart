import 'package:example/views/componnets/demo_page.dart';
import 'package:flutter/material.dart';

class HorizontalTabsView extends StatefulWidget {
  const HorizontalTabsView({Key? key}) : super(key: key);

  @override
  State<HorizontalTabsView> createState() => _HorizontalTabsViewState();
}

class _HorizontalTabsViewState extends State<HorizontalTabsView> {
  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: '横向Tabs',
      child: Container(),
    );
  }
}
