import 'package:example/views/font_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ylkit/flutter_ylkit.dart';

import 'views/color_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/color': (context) => ColorView(),
        '/font': (context) => FontView()
      },
      home: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  final cellData = [
    {'title': 'YlColor', 'route': '/color'},
    {'title': 'YlTextStyle', 'route': '/font'}
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
