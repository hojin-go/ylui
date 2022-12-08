import 'package:flutter/material.dart';

class YlOpacityTapEffect extends StatefulWidget {
  final VoidCallback onTap;
  final Widget child;
  const YlOpacityTapEffect({
    Key? key,
    required this.onTap,
    required this.child,
  }) : super(key: key);

  @override
  State<YlOpacityTapEffect> createState() => _YlOpacityTapEffectState();
}

class _YlOpacityTapEffectState extends State<YlOpacityTapEffect> {
  bool _taping = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (details) {
        setState(() {
          _taping = true;
        });
      },
      onTapUp: (details) {
        setState(() {
          _taping = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _taping = false;
        });
      },
      onTap: widget.onTap,
      child: Opacity(
        opacity: _taping ? 0.5 : 1.0,
        child: widget.child,
      ),
    );
  }
}
