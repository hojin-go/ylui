import 'package:flutter/material.dart';
import 'package:flutter_ylkit/flutter_ylkit.dart';

class ColorTileData {
  final Color color;
  final String title;

  ColorTileData(this.color, this.title);
}

class ColorView extends StatelessWidget {
  final data = [
    ColorTileData(YlColors.branding1, 'Brand Color'),
    ColorTileData(YlColors.branding2, 'Secondary Brand Color'),
    ColorTileData(YlColors.alertRed, 'Destructive Red'),
    ColorTileData(YlColors.orangeLight, 'Reminder Orange Light'),
    ColorTileData(YlColors.orangeDark, 'Reminder Orange Dark'),
    ColorTileData(YlColors.lanehubBlue, 'Lanehub Blue'),
    ColorTileData(YlColors.black, 'Black'),
    ColorTileData(YlColors.black90, 'Black Alpha90'),
    ColorTileData(YlColors.black70, 'Black Alpha70'),
    ColorTileData(YlColors.black50, 'Black Alpha50'),
    ColorTileData(YlColors.black30, 'Black Alpha30'),
    ColorTileData(YlColors.black10, 'Black Alpha10'),
    ColorTileData(YlColors.grey1, 'Grey1'),
    ColorTileData(YlColors.grey2, 'Grey2'),
    ColorTileData(YlColors.grey3, 'Grey3'),
    ColorTileData(YlColors.grey4, 'Grey4'),
    ColorTileData(YlColors.white, 'White'),
    ColorTileData(YlColors.transparent, 'Transparent'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('YlColor'),
      ),
      body: ListView.separated(
        itemCount: data.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) => ListTile(
          leading: Container(width: 80, height: 45, color: data[index].color),
          title: Text(data[index].title),
          subtitle: Text(data[index].color.toString()),
        ),
      ),
    );
  }
}
