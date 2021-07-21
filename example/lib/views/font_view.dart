import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

import 'componnets/demo_page.dart';

class FontTileData {
  final String title;
  final TextStyle style;

  FontTileData(this.title, this.style);
}

class FontView extends StatelessWidget {
  final List<FontTileData> data = [
    FontTileData('Header1', YlTextStyles.header1),
    FontTileData('Header2', YlTextStyles.header2),
    FontTileData('Header3', YlTextStyles.header3),
    FontTileData('Header4', YlTextStyles.header4),
    FontTileData('Header5', YlTextStyles.header5),
    FontTileData('Subheader1', YlTextStyles.subHeader1),
    FontTileData('Subheader2', YlTextStyles.subHeader2),
    FontTileData('Subheader3', YlTextStyles.subHeader3),
    FontTileData('Body1', YlTextStyles.body1),
    FontTileData('Body2', YlTextStyles.body2),
    FontTileData('Body3', YlTextStyles.body3),
    FontTileData('Body4', YlTextStyles.body4),
    FontTileData('Caption1', YlTextStyles.caption1),
    FontTileData('Caption2', YlTextStyles.caption2),
  ];

  @override
  Widget build(BuildContext context) {
    var widgets = <Widget>[];
    data.forEach((element) {
      widgets.add(Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              element.title,
              style: element.style,
            ),
          )
        ],
      ));
    });

    return DemoPage(
        title: 'YlTextStyles',
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: widgets,
          ),
        ));
  }
}
