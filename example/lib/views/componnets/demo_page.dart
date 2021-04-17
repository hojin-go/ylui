import 'package:flutter/cupertino.dart';

class DemoPage extends StatelessWidget {
  final Widget? child;
  final String title;
  final EdgeInsets? contentPadding;
  final bool ignoreSafearea;

  const DemoPage(
      {Key? key,
      required this.title,
      this.child,
      this.contentPadding,
      this.ignoreSafearea = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget body = Padding(
      padding:
          contentPadding ?? EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: child,
    );
    if (!ignoreSafearea) {
      body = SafeArea(child: body);
    }
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        brightness: Brightness.light,
        middle: Text(title),
      ),
      child: body,
    );
  }
}
