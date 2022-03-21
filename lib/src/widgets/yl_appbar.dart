import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class YlAppBar extends AppBar {
  final Brightness brightness;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Widget? leading;
  final Widget? title;
  final Widget? trailing;
  final bool automaticallyImplyLeading;

  YlAppBar(
      {Key? key,
      this.brightness = Brightness.light,
      this.backgroundColor = Colors.white,
      this.foregroundColor = Colors.black,
      this.leading,
      this.title,
      this.trailing,
      this.automaticallyImplyLeading = true})
      : super(
          key: key,
          backgroundColor: backgroundColor,
          brightness: brightness,
          toolbarHeight: 44,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: automaticallyImplyLeading,
          leading: leading,
          title: title,
          actions: [
            Container(
              alignment: Alignment.center,
              child: trailing,
            ),
            SizedBox(
              width: 10,
            )
          ],
          textTheme: TextTheme(
            headline6: TextStyle(
              color: foregroundColor,
              fontSize: 17,
              fontWeight: YlFontWeight.bold,
            ),
          ),
          iconTheme: IconThemeData(color: foregroundColor),
        );
}
