import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

import 'componnets/demo_page.dart';

class RadioboxView extends StatefulWidget {
  @override
  State<RadioboxView> createState() => _RadioboxViewState();
}

class _RadioboxViewState extends State<RadioboxView> {
  final data = [
    _RadioboxTile(
      title: '未选中&可点击',
      checked: false,
    ),
    _RadioboxTile(
      title: '未选中&不可点击',
      checked: false,
      enabled: false,
    ),
    _RadioboxTile(
      title: '选中&可点击',
      checked: true,
    ),
    _RadioboxTile(
      title: '选中&不可点击',
      checked: true,
      enabled: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: 'YlRadiobox',
      backgroundColor: Colors.white,
      child: ListView.separated(
          itemBuilder: (context, index) {
            var item = data[index];
            return YlTapDetector(
              onTap: item.enabled
                  ? () {
                      setState(() {
                        data.forEach((e) => e.checked = false);
                        item.checked = true;
                      });
                    }
                  : null,
              child: SizedBox(
                height: 44,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(item.title),
                    YlRadioboxWidget(
                      checked: item.checked,
                      enabled: item.enabled,
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: data.length),
    );
  }
}

class _RadioboxTile {
  final String title;
  bool checked;
  final bool enabled;

  _RadioboxTile({
    required this.title,
    this.enabled = true,
    required this.checked,
  });
}
