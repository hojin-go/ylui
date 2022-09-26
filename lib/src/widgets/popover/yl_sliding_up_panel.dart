import 'package:flutter/cupertino.dart';
import 'package:flutter_ylui/src/yl_color.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class YlSlidingUpPanel extends StatelessWidget {
  final Widget Function(ScrollController sc) panelBuilder;
  final Widget body;

  const YlSlidingUpPanel(
      {Key? key, required this.panelBuilder, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      body: body,
      panelBuilder: panelBuilder,
      minHeight: 112 + MediaQuery.of(context).padding.bottom,
      maxHeight: MediaQuery.of(context).size.height - 88,
      boxShadow: [
        BoxShadow(
            color: YlColors.black.withOpacity(0.04),
            offset: Offset(0, -2),
            blurRadius: 8)
      ],
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
    );
  }
}
