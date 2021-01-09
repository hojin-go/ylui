import 'package:example/route.dart';
import 'package:example/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ylkit/flutter_ylkit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YlKits',
      theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: YlColors.branding2),
      routes: defineRoutes(),
      home: HomeView(),
    );
  }
}
