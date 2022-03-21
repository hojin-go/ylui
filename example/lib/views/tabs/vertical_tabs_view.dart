import 'package:example/views/componnets/demo_page.dart';
import 'package:flutter/material.dart';

class VerticalTabsView extends StatefulWidget {
  const VerticalTabsView({Key? key}) : super(key: key);

  @override
  State<VerticalTabsView> createState() => _VerticalTabsViewState();
}

class _VerticalTabsViewState extends State<VerticalTabsView> {
  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: '竖向Tabs',
      child: Container(),
    );
  }
}
