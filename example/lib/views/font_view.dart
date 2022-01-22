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
    FontTileData(
        'Header1',
        YlTextStyles.b34(
          color: YlColors.black90,
        )),
    FontTileData(
        'Header2',
        YlTextStyles.b28(
          color: YlColors.black90,
        )),
    FontTileData(
        'Header3',
        YlTextStyles.b24(
          color: YlColors.black90,
        )),
    FontTileData(
        'Header4',
        YlTextStyles.b20(
          color: YlColors.black90,
        )),
    FontTileData(
        'Header5',
        YlTextStyles.b17(
          color: YlColors.black90,
        )),
    FontTileData(
        'Subheader1',
        YlTextStyles.b16(
          color: YlColors.black90,
        )),
    FontTileData(
        'Subheader2',
        YlTextStyles.b15(
          color: YlColors.black90,
        )),
    FontTileData(
        'Subheader3',
        YlTextStyles.b14(
          color: YlColors.black90,
        )),
    FontTileData(
        'Body1',
        YlTextStyles.n17(
          color: YlColors.black90,
        )),
    FontTileData(
        'Body2',
        YlTextStyles.n16(
          color: YlColors.black90,
        )),
    FontTileData(
        'Body3',
        YlTextStyles.n15(
          color: YlColors.black90,
        )),
    FontTileData(
        'Body4',
        YlTextStyles.n14(
          color: YlColors.black90,
        )),
    FontTileData(
        'Caption1',
        YlTextStyles.n12(
          color: YlColors.black90,
        )),
    FontTileData(
        'Caption2',
        YlTextStyles.n10(
          color: YlColors.black90,
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return DemoPage(
        title: 'YlTextStyles',
        child: ListView.separated(
          itemBuilder: (context, index) {
            return Text(
              data[index].title,
              style: data[index].style,
            );
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: data.length,
        ));
  }
}
