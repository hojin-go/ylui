import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

import '../componnets/demo_page.dart';

class VerticalTabsView extends StatefulWidget {
  const VerticalTabsView({Key? key}) : super(key: key);

  @override
  State<VerticalTabsView> createState() => _VerticalTabsViewState();
}

class _VerticalTabsViewState extends State<VerticalTabsView> {
  late final _controller = YlVerticalTabsController(index: 1);

  final data = ['研发', '产品', '设计&创意', '市场&销售', '运营'];

  @override
  void initState() {
    super.initState();
    _controller.addListener(_handleIndexChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_handleIndexChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DemoPage(
      backgroundColor: YlColors.grey2,
      contentPadding: EdgeInsets.zero,
      title: '竖向Tabs',
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 102,
            child: YlVerticalTabs(
              controller: _controller,
              tabs: data.map((e) => Text(e)).toList(),
            ),
          ),
          Expanded(
              child: Container(
            height: double.infinity,
            color: Colors.white,
            child: Center(child: Text('${data[_controller.index]} selected')),
          ))
        ],
      ),
    );
  }

  _handleIndexChanged() {
    print('index changed: ${data[_controller.index]}');
    setState(() {});
  }
}
