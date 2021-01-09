import 'package:flutter/widgets.dart';
import 'package:flutter_ylkit/flutter_ylkit.dart';

class YlCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry maigin;
  final Color backgroundColor;

  const YlCard(
      {Key key,
      this.child,
      this.padding = EdgeInsets.zero,
      this.maigin = const EdgeInsets.all(5),
      this.backgroundColor = YlColors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: maigin,
      child: child,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Color(0x11000000),
              blurRadius: 16,
            ),
          ]),
    );
  }
}
