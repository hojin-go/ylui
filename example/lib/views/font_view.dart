import 'package:flutter/material.dart';
import 'package:flutter_ylkit/flutter_ylkit.dart';

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
    FontTileData('Subheader1', YlTextStyles.subHeader1),
    FontTileData('Subheader2', YlTextStyles.subHeader2),
    FontTileData('Subheader3', YlTextStyles.subHeader3),
    FontTileData('Body1', YlTextStyles.body1),
    FontTileData('Body2', YlTextStyles.body2),
    FontTileData('Body3', YlTextStyles.body3),
    FontTileData('Body4', YlTextStyles.body4),
    FontTileData('Caption', YlTextStyles.caption),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('YlTextStyle'),
      ),
      body: ListView.separated(
        itemCount: data.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) => ListTile(
          title: Text(
            data[index].title,
            style: data[index].style,
          ),
          subtitle: Text(data[index].style.toString()),
        ),
      ),
    );
  }
}
