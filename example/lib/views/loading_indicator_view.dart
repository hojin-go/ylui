import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

import 'componnets/demo_page.dart';

class LoadingIndicatorView extends StatelessWidget {
  const LoadingIndicatorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: 'Loading indicator',
      child: Center(
        child: YlLoadingIndicator(
          color: Colors.red,
        ),
      ),
    );
  }
}
