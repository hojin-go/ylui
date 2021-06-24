import 'package:flutter/cupertino.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

const _defaultRichDialogWidth = 300.0;

class YlRichDialog extends StatelessWidget {
  final bool closeale;
  final String title;
  final Widget? body;
  final Widget? footer;

  const YlRichDialog(
      {Key? key, this.closeale = true, this.title = '', this.body, this.footer})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget child = Center(
      child: CupertinoPopupSurface(
        child: Container(
          width: _defaultRichDialogWidth,
          decoration: BoxDecoration(color: YlColors.white),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (title.isNotEmpty) _header(context, title: title),
                  body ??
                      Container(
                        height: 200,
                      ),
                  if (footer != null) footer!
                ],
              ),
              if (closeale)
                Positioned(
                  top: 10,
                  right: 10,
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Image.asset(
                      'lib/assets/x-mark.png',
                      width: 12,
                      height: 12,
                      package: 'flutter_ylui',
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )
            ],
          ),
        ),
      ),
    );

    if (closeale == false) {
      child = WillPopScope(
        onWillPop: () => Future.value(false),
        child: child,
      );
    }

    return child;
  }

  Widget _header(BuildContext context, {required String title}) {
    return Container(
      width: double.infinity,
      height: 64,
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              width: 160,
              child: DefaultTextStyle(
                style: YlTextStyles.header3.copyWith(height: 1.3),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<T?> showYlRichDialog<T>(BuildContext context,
    {required YlRichDialog dialog, RouteSettings? routeSettings}) {
  return showCupertinoDialog<T>(
      context: context,
      routeSettings: routeSettings,
      builder: (context) => dialog);
}
