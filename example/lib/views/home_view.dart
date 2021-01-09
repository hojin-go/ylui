import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ylkit/flutter_ylkit.dart';

class HomeView extends StatelessWidget {
  final cellData = [
    {'title': 'YlColor', 'route': '/color'},
    {'title': 'YlTextStyle', 'route': '/font'},
    {'title': 'YlCheckBox', 'route': '/checkbox'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: YlColors.white,
      appBar: AppBar(
        title: Text('YlKit'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                title: Text(cellData[index]['title']),
                trailing: Icon(Icons.chevron_right),
                onTap: () =>
                    Navigator.of(context).pushNamed(cellData[index]['route']),
              ),
          separatorBuilder: (context, index) => Divider(),
          itemCount: cellData.length),
    );
  }
}
