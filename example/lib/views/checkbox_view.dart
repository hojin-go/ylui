import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

import 'componnets/demo_page.dart';

class CheckboxView extends StatefulWidget {
  @override
  State<CheckboxView> createState() => _CheckboxViewState();
}

class _CheckboxViewState extends State<CheckboxView> {
  final data = [
    _CheckboxTile(
      title: '未选中&可点击',
      checked: false,
    ),
    _CheckboxTile(
      title: '未选中&不可点击',
      checked: false,
      enabled: false,
    ),
    _CheckboxTile(
      title: '选中&可点击',
      checked: true,
    ),
    _CheckboxTile(
      title: '选中&不可点击',
      checked: true,
      enabled: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: 'YlCheckbox',
      child: ListView.separated(
          itemBuilder: (context, index) {
            var item = data[index];
            return YlTapDetector(
              onTap: item.enabled
                  ? () {
                      setState(() {
                        item.checked = !item.checked;
                      });

                      print(
                          data.map((e) => '${e.title}: ${e.checked}').toList());
                    }
                  : null,
              child: SizedBox(
                height: 44,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(item.title),
                    YlCheckboxWidget(
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

class _CheckboxTile {
  final String title;
  bool checked;
  final bool enabled;

  _CheckboxTile({
    required this.title,
    this.enabled = true,
    required this.checked,
  });
}
