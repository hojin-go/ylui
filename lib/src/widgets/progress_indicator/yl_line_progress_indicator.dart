import 'package:flutter/material.dart';

class YlLineProgressIndicator extends StatelessWidget {
  final double value;
  final double? height;
  final Color? backgroundColor;
  final Gradient? gradient;
  const YlLineProgressIndicator({
    Key? key,
    required this.value,
    this.height,
    this.backgroundColor,
    this.gradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final layoutHeight = height ?? 8.0;
    final radius = layoutHeight * 0.5;
    return LayoutBuilder(
      builder: (context, constraints) => ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Stack(
          children: [
            Container(
              color: backgroundColor ?? const Color(0xFFF8F8F8),
              height: layoutHeight,
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              width: constraints.maxWidth * value,
              child: Container(
                decoration: BoxDecoration(
                  gradient: gradient ??
                      const LinearGradient(
                        colors: [Color(0x7300BF57), Color(0xFF00BF57)],
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
