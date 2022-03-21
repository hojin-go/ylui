import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_ylui/src/helper.dart';

class YlLoadingIndicator extends StatefulWidget {
  final Color? color;
  const YlLoadingIndicator({Key? key, this.color}) : super(key: key);

  @override
  State<YlLoadingIndicator> createState() => _YlLoadingIndicatorState();
}

class _YlLoadingIndicatorState extends State<YlLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Transform.rotate(
        angle: _controller.value * 2 * math.pi,
        child: child,
      ),
      child: getImageFromAssets(
        'loading_indicator',
        color: widget.color,
      ),
    );
  }
}
