import 'package:example/views/componnets/demo_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class SlidingUpPanelDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: 'SlidingUpPanelDemo',
      sourceCodePath: 'lib/views/sliding_up_panel_demo.dart',
      contentPadding: EdgeInsets.zero,
      bottomSafe: false,
      child: YlSlidingUpPanel(
        body: Container(
          height: 500,
        ),
        panelBuilder: (sc) => _panel(sc),
      ),
    );
  }

  Widget _panel(ScrollController sc) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _pin(),
          Expanded(
            child: ListView.separated(
              controller: sc,
              itemCount: 50,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Text('$index'),
              ),
              separatorBuilder: (context, index) => Divider(),
            ),
          ),
          SafeArea(
            top: false,
            child: YlButtonGroup(
              weight: YlButtonGroupWeight.equaly,
              children: [
                YlButtonGroupItem(
                  child: Text('拒绝'),
                  type: YlButtonType.subSecondary,
                  onPressed: () {},
                ),
                YlButtonGroupItem(
                  child: Text('接受'),
                  type: YlButtonType.primary,
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _pin() {
    return SizedBox(
      height: 25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 5,
            width: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: YlColors.grey3,
            ),
          )
        ],
      ),
    );
  }
}
