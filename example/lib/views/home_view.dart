import 'package:example/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

import 'componnets/demo_page.dart';

class HomeView extends StatelessWidget {
  final cellData = defineRouteObjects();

  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: 'YLUI',
      child:  GridView.builder(
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
                child: Text(item.description)),
            onTap: () => Navigator.pushNamed(context, item.route),
          );
        },
      ),
    );
  }
}
