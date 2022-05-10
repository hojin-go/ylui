import 'package:flutter/cupertino.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

import '../../flutter_ylui.dart';

class YlFloatingBottom extends StatelessWidget {
  final EdgeInsets? padding;
  final Widget? child;
  final Color? backgroundColor;
  final showBoxshadow;
  const YlFloatingBottom(
      {Key? key,
      this.padding,
      this.child,
      this.backgroundColor,
      this.showBoxshadow = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          padding ?? EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: backgroundColor ?? YlColors.white,
        boxShadow: [
          BoxShadow(
              offset: Offset(0.0, -2.0),
              blurRadius: 2.0,
              color: showBoxshadow
                  ? YlColors.black.withOpacity(0.04)
                  : YlColors.white)
        ],
      ),
      child: SafeArea(
        top: false,
        child: child ??
            Container(
              width: double.infinity,
              height: 50,
            ),
      ),
    );
  }
}
