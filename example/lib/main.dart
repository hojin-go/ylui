import 'package:bot_toast/bot_toast.dart';
import 'package:example/route.dart';
import 'package:example/views/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

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
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
        ),
      ),
      routes: routesMap,
      home: HomeView(),
      builder: BotToastInit(),
      localizationsDelegates: [
        DefaultMaterialLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      navigatorObservers: [BotToastNavigatorObserver()],
    );
  }
}
