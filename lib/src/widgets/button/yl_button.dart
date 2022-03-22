import 'package:flutter/cupertino.dart';
import 'package:flutter_ylui/flutter_ylui.dart';
import 'package:flutter_ylui/src/widgets/yl_tap_effect.dart';

enum YlButtonSize { small, medium, large, max }

extension YlButtonSizeData on YlButtonSize {
  double get height {
    switch (this) {
      case YlButtonSize.max:
        return 50;
      case YlButtonSize.large:
        return 44;
      case YlButtonSize.medium:
        return 36;
      default:
        return 28;
    }
  }

  BorderRadius get radius {
    var value = 0.0;
    switch (this) {
      case YlButtonSize.max:
        {
          value = 10;
          break;
        }
      case YlButtonSize.large:
        {
          value = 10;
          break;
        }
      default:
        {
          value = height * 0.5;
          break;
        }
    }
    return BorderRadius.circular(value);
  }

  TextStyle get textStyle {
    switch (this) {
      case YlButtonSize.max:
      case YlButtonSize.large:
      case YlButtonSize.medium:
        return YlTextStyles.header5.copyWith(height: 1.3);
      default:
        return YlTextStyles.subHeader2.copyWith(height: 1.3);
    }
  }

  EdgeInsets get padding {
    switch (this) {
      case YlButtonSize.max:
        return EdgeInsets.symmetric(horizontal: 24, vertical: 1);
      case YlButtonSize.large:
        return EdgeInsets.symmetric(horizontal: 24, vertical: 1);
      case YlButtonSize.medium:
        return EdgeInsets.symmetric(horizontal: 16, vertical: 1);
      default:
        return EdgeInsets.symmetric(horizontal: 16, vertical: 1);
    }
  }
}

enum YlButtonType { plain, primary, secondary, alert, subPrimary, subSecondary }

extension YlButtonDataFromType on YlButtonType {
  Color get background {
    switch (this) {
      case YlButtonType.primary:
        return YlColors.branding1;
      case YlButtonType.subPrimary:
        return YlColors.black90;
      default:
        return YlColors.white;
    }
  }

  Color get textColor {
    switch (this) {
      case YlButtonType.primary:
        return YlColors.white;
      case YlButtonType.secondary:
        return YlColors.branding2;
      case YlButtonType.alert:
        return YlColors.alertRed;
      case YlButtonType.subPrimary:
        return YlColors.white;
      case YlButtonType.subSecondary:
        return YlColors.black90;
      default:
        return YlColors.black90;
    }
  }

  Color get pressedCoverColor {
    switch (this) {
      case YlButtonType.primary:
        return YlColors.black10;
      case YlButtonType.secondary:
        return YlColors.branding1.withOpacity(0.1);
      case YlButtonType.alert:
        return YlColors.alertRed.withOpacity(0.1);
      case YlButtonType.subPrimary:
        return YlColors.black10;
      case YlButtonType.subSecondary:
        return YlColors.black.withOpacity(0.05);
      default:
        return YlColors.black10;
    }
  }

  Color? get borderColor {
    switch (this) {
      case YlButtonType.primary:
      case YlButtonType.subPrimary:
        return null;
      case YlButtonType.secondary:
        return YlColors.branding1;
      case YlButtonType.alert:
        return YlColors.alertRed;
      case YlButtonType.subSecondary:
        return YlColors.black90;
      default:
        return null;
    }
  }

  Color get disableBackgroundColor {
    switch (this) {
      case YlButtonType.alert:
      case YlButtonType.subSecondary:
      case YlButtonType.secondary:
        return YlColors.grey1;
      default:
        return YlColors.grey3;
    }
  }

  Color? get disableBorderColor {
    switch (this) {
      case YlButtonType.alert:
      case YlButtonType.subSecondary:
      case YlButtonType.secondary:
        return YlColors.grey3;
      default:
        return null;
    }
  }

  Color get disableTextColor {
    return YlColors.black30;
  }
}

typedef ButtonClickCallback = Future<void> Function();

class YlButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final ButtonClickCallback? onAsyncPressed;
  final double? width;
  final double? height;
  final Widget child;
  final Color? background;
  final BorderRadius? radius;
  final EdgeInsets? padding;
  final BorderSide? border;
  final Color? pressedCoverColor;
  final Color? disableBackgroundColor;
  final Color? disableBorderColor;
  final Color? disableTextColor;
  final TextStyle? textStyle;
  final bool? loading;

  const YlButton(
      {Key? key,
      this.onPressed,
      this.width,
      this.height,
      this.onAsyncPressed,
      required this.child,
      this.background,
      this.radius,
      this.padding,
      this.border,
      this.pressedCoverColor,
      this.disableBackgroundColor,
      this.disableBorderColor,
      this.disableTextColor,
      this.textStyle,
      this.loading})
      : super(key: key);

  YlButton.text({
    Key? key,
    required String title,
    required YlButtonSize size,
    this.onPressed,
    this.onAsyncPressed,
    this.width,
    this.loading,
  })  : this.child = Text(
          title,
        ),
        this.textStyle = size.textStyle,
        this.height = size.height,
        this.padding = size.padding,
        this.background = YlButtonType.primary.background,
        this.border = null,
        this.radius = size.radius,
        this.pressedCoverColor = YlButtonType.primary.pressedCoverColor,
        this.disableBackgroundColor =
            YlButtonType.primary.disableBackgroundColor,
        this.disableBorderColor = null,
        this.disableTextColor = YlButtonType.primary.disableTextColor,
        super(key: key);

  YlButton.fromType({
    required YlButtonSize size,
    required YlButtonType type,
    this.onPressed,
    this.onAsyncPressed,
    this.width,
    required this.child,
    Color? color,
    Color? borderColor,
    Color? textColor,
    Color? pressedCoverColor,
    EdgeInsets? padding,
    this.loading,
  })  : this.background = color ?? type.background,
        this.disableBackgroundColor = type.disableBackgroundColor,
        this.height = size.height,
        this.radius = size.radius,
        this.textStyle =
            size.textStyle.copyWith(color: textColor ?? type.textColor),
        this.border = (borderColor ?? type.borderColor) != null
            ? BorderSide(width: 1, color: borderColor ?? type.borderColor!)
            : null,
        this.pressedCoverColor = pressedCoverColor ?? type.pressedCoverColor,
        this.disableTextColor = type.disableTextColor,
        this.disableBorderColor = type.disableBorderColor,
        this.padding = padding ?? size.padding;

  @override
  _YlButtonState createState() => _YlButtonState();
}

class _YlButtonState extends State<YlButton> {
  var isAsync = false;

  @override
  Widget build(BuildContext context) {
    Widget? aWidget = widget.child;

    if ((widget.width == null || widget.width == 0) &&
        (widget.height == null || widget.height == 0)) {
      return _normalButton(aWidget);
    }

    return _sizedButton(child: aWidget, padding: EdgeInsets.zero);
  }

  _normalButton(widget) {
    return _sizedButton(child: widget, padding: null);
  }

  _sizedButton({Widget? child, EdgeInsets? padding}) {
    bool enabled = widget.onPressed != null || widget.onAsyncPressed != null;

    var backgroundColor = widget.background ?? YlColors.branding1;
    var disableBackgroundColor =
        widget.disableBackgroundColor ?? YlColors.grey3;
    var disableBorderColor = widget.disableBorderColor ?? YlColors.grey3;
    var border = widget.border == null
        ? null
        : Border.all(
            color: enabled ? widget.border!.color : disableBorderColor,
            width: widget.border!.width);

    var textStyle =
        (widget.textStyle ?? YlTextStyles.subHeader3).copyWith(height: 1.3);
    if (!enabled) {
      textStyle = textStyle.copyWith(color: widget.disableTextColor);
    }

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: YlTapEffect(
        radius: widget.radius,
        backgroundColor: widget.pressedCoverColor,
        child: Container(
          padding: widget.padding ??
              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: enabled ? backgroundColor : disableBackgroundColor,
            borderRadius: widget.radius,
            border: border,
          ),
          child: Center(
              child: DefaultTextStyle(
            child: IconTheme(
                data: IconThemeData(
                    color: textStyle.color, size: textStyle.fontSize),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Visibility(
                      visible: isAsync || widget.loading == true,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Transform.scale(
                          scale: (textStyle.fontSize ?? 20) / 20,
                          child: YlLoadingIndicator(
                            color: textStyle.color,
                          ),
                        ),
                      ),
                    ),
                    widget.child,
                  ],
                )),
            style: textStyle,
          )),
        ),
        onTap: (widget.onPressed != null ||
                (widget.onAsyncPressed != null && isAsync == false))
            ? () async {
                if (widget.onPressed != null) {
                  widget.onPressed!();
                } else if (widget.onAsyncPressed != null) {
                  setState(() {
                    isAsync = true;
                  });
                  await widget.onAsyncPressed!();
                  setState(() {
                    isAsync = false;
                  });
                }
              }
            : null,
      ),
    );
  }
}
