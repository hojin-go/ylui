import 'package:flutter/material.dart';

// ignore: must_be_immutable
class YlTapDetector extends StatelessWidget {
  final Widget child;
  final int count;
  final VoidCallback onTap;
  final VoidCallback onTapDown;
  final VoidCallback onTapUp;

  final int _tapDuration = 500;

  int _lastTapTime = 0;
  int _tapCount;

  YlTapDetector(
      {Key key,
      @required this.child,
      this.count = 1,
      this.onTap,
      this.onTapDown,
      this.onTapUp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: child,
      onTap: () {
        var now = DateTime.now().millisecondsSinceEpoch;
        if (_lastTapTime + _tapDuration < now) {
          _tapCount = 0;
        }

        _lastTapTime = now;
        _tapCount++;

        if (onTap != null && _tapCount == count) {
          onTap();
        }
      },
      onTapDown: (_) {
        if (onTapDown != null) {
          onTapDown();
        }
      },
      onTapCancel: () {
        if (onTapUp != null) {
          onTapUp();
        }
      },
      onTapUp: (_) {
        if (onTapUp != null) {
          onTapUp();
        }
      },
    );
  }
}
