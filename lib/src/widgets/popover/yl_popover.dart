import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../flutter_ylui.dart';

class YlPopover extends StatelessWidget {
  final Widget? header;
  final Widget? body;
  final Widget? footer;
  final Gradient? gradient;

  const YlPopover(
      {Key? key, this.body, this.header, this.footer, this.gradient})
      : super(key: key);

  YlPopover.close(
      {Key? key,
      Widget? title,
      Widget? subTitle,
      this.body,
      this.footer,
      this.gradient,
      Widget? closeWidget,
      VoidCallback? onClosed})
      : this.header = Container(
          alignment: Alignment.center,
          constraints: BoxConstraints(minHeight: 64),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Builder(
                  builder: (context) {
                    var body = <Widget>[];
                    if (title != null) {
                      body.add(DefaultTextStyle(
                        style: YlTextStyles.header5.copyWith(height: 1.3),
                        child: title,
                      ));
                    }
                    if (title != null && subTitle != null) {
                      body.add(SizedBox(
                        height: 6,
                      ));
                    }
                    if (subTitle != null) {
                      body.add(DefaultTextStyle(
                        style: YlTextStyles.body4
                            .copyWith(height: 1.3, color: YlColors.black50),
                        child: subTitle,
                      ));
                    }
                    return Container(
                      padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: body,
                      ),
                    );
                  },
                ),
              ),
              CupertinoButton(
                padding: EdgeInsets.only(top: 10),
                child: closeWidget ??
                    Image.asset(
                      'lib/assets/x-mark.png',
                      package: 'flutter_ylui',
                    ),
                onPressed: onClosed,
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
        );

  YlPopover.confirm(
      {Key? key,
      Widget? title,
      Widget? subTitle,
      this.body,
      this.footer,
      this.gradient,
      VoidCallback? onCanceled,
      VoidCallback? onDone})
      : this.header = Container(
          margin: const EdgeInsets.only(top: 20),
          child: Row(
            children: [
              CupertinoButton(
                minSize: 0,
                padding: EdgeInsets.only(left: 20, right: 10),
                child: Text(
                  '取消',
                  style: YlTextStyles.body1.copyWith(color: YlColors.black70),
                ),
                onPressed: onCanceled,
              ),
              Expanded(
                child: Builder(builder: (context) {
                  var body = <Widget>[];
                  if (title != null) {
                    body.add(DefaultTextStyle(
                      style: YlTextStyles.b17(color: YlColors.black90),
                      child: title,
                    ));
                  }
                  if (subTitle != null) {
                    body.add(DefaultTextStyle(
                      style: YlTextStyles.body4
                          .copyWith(height: 1.3, color: YlColors.black50),
                      child: subTitle,
                    ));
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: body,
                  );
                }),
              ),
              CupertinoButton(
                minSize: 0,
                padding: EdgeInsets.only(left: 10, right: 20),
                child: Text(
                  '完成',
                  style: YlTextStyles.body1.copyWith(color: YlColors.branding1),
                ),
                onPressed: onDone,
              )
            ],
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: YlColors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: YlColors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            gradient: gradient),
        child: SafeArea(
          top: false,
          bottom: true,
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                header ??
                    Container(
                      height: 44,
                    ),
                if (body != null) body!,
                if (footer != null) footer!
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<T?> showYlPopover<T>(BuildContext context, YlPopover child,
    {RouteSettings? routeSettings, bool barrierDismissible = true}) {
  return showCupertinoModalPopup<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    routeSettings: routeSettings,
    builder: (context) => Dismissible(
      direction: DismissDirection.down,
      onDismissed: (direction) => Navigator.pop(context),
      key: Key(''),
      child: child,
    ),
  );
}

///
Future<bool?> showYlPlainPopover(
  BuildContext context, {
  RouteSettings? routeSettings,
  required String title,
  String? content,
  Widget? contentWidget,
  String? confirmText,
}) {
  assert(content != null || contentWidget != null);

  final maxHeight = MediaQuery.of(context).size.height * 0.75;
  return showYlPopover<bool>(
    context,
    YlPopover.close(
      onClosed: () => Navigator.pop(context, false),
      body: Container(
        constraints: BoxConstraints.loose(Size.fromHeight(maxHeight)),
        child: Scrollbar(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DefaultTextStyle(
                    style: YlTextStyles.b20(
                      color: YlColors.black,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(title),
                    )),
                SizedBox(height: 20),
                DefaultTextStyle(
                    style: YlTextStyles.n16(
                      color: YlColors.black70,
                    ),
                    child: contentWidget ??
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Text(content!))),
                Visibility(
                  visible: confirmText != null,
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 40),
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: YlButton.fromType(
                      width: 200,
                      size: YlButtonSize.large,
                      type: YlButtonType.primary,
                      child: Text(confirmText ?? ''),
                      onPressed: () => Navigator.of(context).pop(true),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
