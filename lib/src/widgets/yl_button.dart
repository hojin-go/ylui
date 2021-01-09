import 'package:flutter/cupertino.dart';
import 'package:flutter_ylkit/flutter_ylkit.dart';

typedef ButtonClickCallback = Future<void> Function();

class YlButton extends StatefulWidget {
  final VoidCallback onPressed;
  final ButtonClickCallback onAsyncPressed;
  final double width;
  final double height;
  final Widget child;
  final Color background;
  final BorderRadius radius;

  const YlButton(
      {Key key,
      this.onPressed,
      this.width,
      this.height,
      this.onAsyncPressed,
      this.child,
      this.background,
      this.radius})
      : super(key: key);

  YlButton.text(
      {Key key,
      String title,
      double fontSize,
      this.onPressed,
      this.onAsyncPressed,
      this.width,
      this.height,
      this.background,
      this.radius})
      : child = Text(
          title,
          style: TextStyle(fontSize: fontSize),
        ),
        super(key: key);

  YlButton.plain(
      {Key key,
      this.onPressed,
      this.width,
      this.height,
      this.onAsyncPressed,
      this.child,
      this.radius})
      : background = YlColors.white,
        super(key: key);

  @override
  _YlButtonState createState() => _YlButtonState();
}

class _YlButtonState extends State<YlButton> {
  var isAsync = false;

  @override
  Widget build(BuildContext context) {
    Widget aWidget = widget.child;

    if ((widget.width == null || widget.width == 0) &&
        (widget.height == null || widget.height == 0)) {
      return _normalButton(aWidget);
    }

    return _sizedButton(child: aWidget, padding: EdgeInsets.zero);
  }

  _normalButton(widget) {
    return _sizedButton(child: widget, padding: null);
  }

  _sizedButton({Widget child, EdgeInsets padding}) {
    bool enabled = widget.onPressed != null || widget.onAsyncPressed != null;

    var backgroundColor = widget.background ?? YlColors.branding1;
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: CupertinoTheme(
        data: CupertinoTheme.of(context).copyWith(
            primaryContrastingColor:
                enabled ? Color(0xffffffff) : Color(0x4c000000)),
        child: CupertinoButton(
          borderRadius: widget.radius ?? BorderRadius.all(Radius.circular(10)),
          padding: padding,
          child: child,
          onPressed: (widget.onPressed != null ||
                  (widget.onAsyncPressed != null && isAsync == false))
              ? () async {
                  if (widget.onPressed != null) {
                    widget.onPressed();
                  } else if (widget.onAsyncPressed != null) {
                    setState(() {
                      isAsync = true;
                    });
                    await widget.onAsyncPressed();
                    setState(() {
                      isAsync = false;
                    });
                  }
                }
              : null,
          color: backgroundColor,
          disabledColor: isAsync
              ? backgroundColor.withOpacity(0.6)
              : CupertinoColors.quaternarySystemFill,
        ),
      ),
    );
  }
}
