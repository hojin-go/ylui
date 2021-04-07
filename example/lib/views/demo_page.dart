import 'package:flutter/cupertino.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class DemoPage extends StatelessWidget {
  final Widget child;
  final String title;

  const DemoPage({Key key, this.title, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: YlColors.grey4,
      navigationBar: CupertinoNavigationBar(
        brightness: Brightness.light,
        middle: Text(title),
      ),
      child: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: child),
    );
  }
}
