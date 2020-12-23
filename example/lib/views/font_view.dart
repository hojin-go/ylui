import 'package:flutter/material.dart';

class FontTileData {
  final String title;
  final TextStyle style;

  FontTileData(this.title, this.style);
}

class FontView extends StatelessWidget {
  List<FontTileData> data;

  _makeFontData(BuildContext context) {
    data = [
      FontTileData('H1', Theme.of(context).textTheme.headline1),
      FontTileData('H2', Theme.of(context).textTheme.headline2),
      FontTileData('H3', Theme.of(context).textTheme.headline3),
      FontTileData('H4', Theme.of(context).textTheme.headline4),
      FontTileData('H5', Theme.of(context).textTheme.headline5),
      FontTileData('H6', Theme.of(context).textTheme.headline6),
      FontTileData('Subtitle1', Theme.of(context).textTheme.subtitle1),
      FontTileData('Subtitle2', Theme.of(context).textTheme.subtitle2),
      FontTileData('BodyText1', Theme.of(context).textTheme.bodyText1),
      FontTileData('BodyText2', Theme.of(context).textTheme.bodyText2),
      FontTileData('Button', Theme.of(context).textTheme.button),
      FontTileData('Caption', Theme.of(context).textTheme.caption),
      FontTileData('Overline', Theme.of(context).textTheme.overline),
    ];
  }

  @override
  Widget build(BuildContext context) {
    _makeFontData(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Font'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            data[index].title,
            style: data[index].style,
          ),
          subtitle: Text(
              'fontsize: ${data[index].style.fontSize}, fontweight: ${data[index].style.fontWeight}'),
        ),
      ),
    );
  }
}
