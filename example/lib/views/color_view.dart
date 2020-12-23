import 'package:flutter/material.dart';
import 'package:flutter_ylkit/flutter_ylkit.dart';

class ColorTileData {
  final Color color;
  final String title;

  ColorTileData(this.color, this.title);
}

class ColorView extends StatelessWidget {
  var data = [
    ColorTileData(YlColors.brandColor, 'Brand Color'),
    ColorTileData(YlColors.secondaryBrandColor, 'Secondary Brand Color'),
    ColorTileData(YlColors.destructiveRed, 'Destructive Red'),
    ColorTileData(YlColors.black, 'Black'),
    ColorTileData(YlColors.black90, 'Black Alpha90'),
    ColorTileData(YlColors.black70, 'Black Alpha70'),
    ColorTileData(YlColors.black50, 'Black Alpha50'),
    ColorTileData(YlColors.black30, 'Black Alpha30'),
    ColorTileData(YlColors.grey1, 'Grey1'),
    ColorTileData(YlColors.grey2, 'Grey2'),
    ColorTileData(YlColors.grey3, 'Grey3'),
    ColorTileData(YlColors.grey4, 'Grey4'),
    ColorTileData(YlColors.separator, 'Separator'),
    ColorTileData(YlColors.white, 'White'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('YlColor'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => ListTile(
          leading: Container(width: 30, height: 30, color: data[index].color),
          title: Text(data[index].title),
        ),
      ),
    );
  }
}
