import 'package:flutter/cupertino.dart';
import 'package:flutter_ylui/flutter_ylui.dart';
import 'package:flutter_ylui/src/widgets/yl_tap_detector.dart';

class YlTapEffect extends StatefulWidget {
  final Widget child;
  final Color backgroundColor;
  final BorderRadius radius;
  final VoidCallback onTap;

  const YlTapEffect(
      {Key key,
      this.backgroundColor = YlColors.white,
      this.child,
      this.onTap,
      this.radius})
      : super(key: key);

  @override
  _YlTapEffectState createState() => _YlTapEffectState();
}

class _YlTapEffectState extends State<YlTapEffect> {
  bool _tappingDown = false;

  @override
  Widget build(BuildContext context) {
    var tappedCoverColor =
        (widget.backgroundColor ?? YlColors.black).withOpacity(0.1);

    return YlTapDetector(
      onTap: widget.onTap,
      onTapDown: () {
        if (widget.onTap != null) {
          setState(() {
            _tappingDown = true;
          });
        }
      },
      onTapUp: () {
        if (widget.onTap != null) {
          setState(() {
            _tappingDown = false;
          });
        }
      },
      child: Stack(
        children: [
          widget.child,
          Visibility(
            visible: _tappingDown,
            child: Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: widget.radius, color: tappedCoverColor),
                )),
          )
        ],
      ),
    );
  }
}
