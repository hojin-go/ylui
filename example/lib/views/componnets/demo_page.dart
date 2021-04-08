import 'package:flutter/cupertino.dart';

class DemoPage extends StatelessWidget {
  final Widget child;
  final String title;
  final EdgeInsets contentPadding;

  const DemoPage({Key key, this.title, this.child, this.contentPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        brightness: Brightness.light,
        middle: Text(title),
      ),
      child: SafeArea(
          child: Padding(
        padding:
            contentPadding ?? EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: child,
      )),
    );
  }
}
