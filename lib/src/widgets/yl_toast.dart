import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class YlToast {
  // 在屏幕中 y 517
  // 屏幕高度 h 667
  // 屏幕高度/2 h2 334
  // 在屏幕下半屏 y2 = 517 - 334 = 183
  // 中心点在下半屏的位置百分比 x = 183 / 333 = 0.549 = 0.55
  static const _defaultOffsetY = 0.55;

  static const _defaultDuration = Duration(seconds: 2);
  static const _defaultPadding =
      EdgeInsets.symmetric(horizontal: 16, vertical: 11);

  static CancelFunc _textToastCancelFunc;

  static void text(String content,
      {Duration duration, Color bgColor, Alignment alignment}) {
    _textToast(content,
        duration: duration, bgColor: bgColor, alignment: alignment);
  }

  static void loading({String content = '请求中', bool bLong = false}) {
    String message;
    if (content == null || content.isEmpty) {
      message = '';
    } else {
      message = content;
    }
    BotToast.showCustomLoading(
        clickClose: true,
        toastBuilder: (_) => GestureDetector(
              onTap: () => BotToast.closeAllLoading(),
              child: Container(
                padding: _defaultPadding,
                // constraints: BoxConstraints(minWidth: 128, maxWidth: 300),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: YlColors.black70),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Theme(
                        data: ThemeData(
                            cupertinoOverrideTheme: CupertinoThemeData(
                                brightness: Brightness.dark)),
                        child: CupertinoActivityIndicator(
                          radius: 15 * 1.3 * 0.5,
                        )),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      message ?? '',
                      style: YlTextStyles.body3
                          .copyWith(color: YlColors.white, height: 1.3),
                    )
                  ],
                ),
              ),
            ));
  }

  static void cancel() {
    BotToast.cleanAll();
  }

  static void success(String content) {
    _iconToast(content,
        icon: Icon(
          CupertinoIcons.checkmark_circle,
        ));
  }

  static void error(String content) {
    _iconToast(content,
        icon: Icon(
          CupertinoIcons.xmark_circle,
        ));
  }

  static _textToast(String content,
      {Widget prefix, Duration duration, Color bgColor, Alignment alignment}) {
    if (_textToastCancelFunc != null) {
      _textToastCancelFunc();
    }

    Widget widget = Text(
      content ?? '',
      maxLines: 1,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: YlTextStyles.body3.copyWith(color: YlColors.white, height: 1.3),
    );
    if (prefix != null) {
      widget = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          prefix,
          SizedBox(
            width: 4,
          ),
          widget
        ],
      );
    }
    _textToastCancelFunc = BotToast.showCustomText(
        wrapAnimation: (AnimationController controller, CancelFunc cancelFunc,
                Widget child) =>
            FadeAnimation(
              controller: controller,
              child: child,
            ),
        wrapToastAnimation: null,
        duration: duration ?? _defaultDuration,
        align: const Alignment(0, _defaultOffsetY),
        toastBuilder: (_) => Container(
              constraints: BoxConstraints(minWidth: 128, maxWidth: 300),
              padding: _defaultPadding,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: bgColor ?? YlColors.black70),
              child: widget,
            ));
  }

  static void _iconToast(String content, {@required Widget icon}) {
    var fixedPrefix = Container(
      padding: EdgeInsets.only(bottom: 2),
      child: IconTheme(
          data: IconThemeData(color: YlColors.white, size: 20), child: icon),
    );
    _textToast(content, prefix: fixedPrefix);
  }
}

//淡出淡入动画
class FadeAnimation extends StatefulWidget {
  final Widget child;
  final AnimationController controller;

  const FadeAnimation({Key key, this.child, this.controller}) : super(key: key);

  @override
  FadeAnimationState createState() => FadeAnimationState();
}

class FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  static final Tween<double> tweenOpacity = Tween<double>(begin: 0, end: 1);
  Animation<double> animation;
  Animation<double> animationOpacity;

  @override
  void initState() {
    animation =
        CurvedAnimation(parent: widget.controller, curve: Curves.decelerate);

    animationOpacity = tweenOpacity.animate(animation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationOpacity,
      child: widget.child,
    );
  }
}
