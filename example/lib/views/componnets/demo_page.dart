import 'package:example/views/componnets/code_viewer.dart';
import 'package:flutter/cupertino.dart';

class DemoPage extends StatelessWidget {
  final Widget child;
  final String title;
  final EdgeInsets contentPadding;
  final String sourceCodePath;
  final bool bottomSafe;

  const DemoPage(
      {Key key,
      this.title,
      this.child,
      this.contentPadding,
      this.sourceCodePath,
      this.bottomSafe = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        brightness: Brightness.light,
        middle: Text(title),
        trailing: sourceCodePath != null
            ? CupertinoButton(
                padding: EdgeInsets.zero,
                minSize: 30,
                child: Icon(CupertinoIcons.chevron_left_slash_chevron_right),
                onPressed: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                      fullscreenDialog: true,
                      builder: (context) => CodeViewerPage(
                        filePath: sourceCodePath,
                      ),
                    )),
              )
            : null,
      ),
      child: SafeArea(
        top: true,
        bottom: bottomSafe,
        child: Padding(
          padding: contentPadding ??
              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: child,
        ),
      ),
    );
  }
}
