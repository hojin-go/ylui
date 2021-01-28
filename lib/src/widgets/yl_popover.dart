import 'package:flutter/cupertino.dart';

import '../../flutter_ylkit.dart';

class YlPopover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        bottom: true,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: YlColors.alertRed
          ),
        ),
      ),
    );
  }
}
