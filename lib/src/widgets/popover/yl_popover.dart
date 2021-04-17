import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../flutter_ylui.dart';

class YlPopover extends StatelessWidget {
  final Widget? header;
  final Widget? body;
  final Widget? footer;

  const YlPopover({Key? key, this.body, this.header, this.footer})
      : super(key: key);

  YlPopover.close(
      {Key? key,
      Widget? title,
      this.body,
      this.footer,
      Widget? closeWidget,
      VoidCallback? onClosed})
      : this.header = Container(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (title != null)
                Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: DefaultTextStyle(
                      style: YlTextStyles.header4.copyWith(height: 1.3),
                      child: title,
                    )),
              Spacer(),
              CupertinoButton(
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
      this.body,
      this.footer,
      VoidCallback? onCanceled,
      VoidCallback? onDone})
      : this.header = Container(
          child: Row(
            children: [
              CupertinoButton(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: Text(
                  '取消',
                  style: YlTextStyles.body1.copyWith(color: YlColors.black70),
                ),
                onPressed: onCanceled,
              ),
              Spacer(),
              CupertinoButton(
                padding: EdgeInsets.only(top: 20, right: 20),
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
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: YlColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
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
    );
  }
}

Future<T?> showYlPopover<T>(BuildContext context, YlPopover child) {
  return showCupertinoModalPopup<T>(
    context: context,
    builder: (context) => Dismissible(
      direction: DismissDirection.down,
      onDismissed: (direction) => Navigator.pop(context),
      key: Key(''),
      child: child,
    ),
  );
}
