import 'package:flutter/widgets.dart';

class YlDot extends StatelessWidget {
  final Color? color;
  final double radius;

  const YlDot({Key? key, this.color, this.radius = 10}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
