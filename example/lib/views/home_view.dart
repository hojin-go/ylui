import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class HomeView extends StatelessWidget {
  final cellData = [
    {'title': 'YlColor', 'route': '/color'},
    {'title': 'YlTextStyle', 'route': '/font'},
    {'title': 'YlCheckBox', 'route': '/checkbox'},
    {'title': 'YlConfirm', 'route': '/confirm'},
    {'title': 'YlPopover', 'route': '/popover'},
    {'title': 'YlButton', 'route': '/button'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: YlColors.grey4,
      appBar: AppBar(
        title: Text('YlKit'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 1,
            mainAxisSpacing: 1,
            crossAxisCount: 3,
            childAspectRatio: 21.0 / 9.0),
        itemCount: cellData.length,
        itemBuilder: (context, index) {
          var item = cellData[index];
          return YlTapEffect(
            child: Container(
                alignment: Alignment.center,
                color: YlColors.white,
                width: double.infinity,
                height: double.infinity,
                child: Text(item['title'])),
            onTap: () => Navigator.pushNamed(context, item['route']),
          );
        },
      ),
    );
  }
}
