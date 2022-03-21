import 'package:example/views/componnets/demo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

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
