import 'package:flutter/cupertino.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class YlFloatingBottom extends StatelessWidget {
  final EdgeInsets? padding;
  final Widget? child;
  final Color? backgroundColor;

  const YlFloatingBottom({Key? key, this.padding, this.child, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 25),
      decoration: BoxDecoration(
        color: backgroundColor ?? YlColors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 4.0,
              offset: Offset(0, 0),
              color: YlColors.black.withOpacity(0.04))
        ],
      ),
      child: SafeArea(
        top: false,
        child: child ?? Container(width: double.infinity, height: 50,),
      ),
    );
  }
}
