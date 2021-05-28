import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class YlToast {
  static const _defaultDuration = Duration(seconds: 2);

  static CancelFunc? _textToastCancelFunc;

  static void text(String content,
      {Duration? duration,
      Color bgColor = const Color.fromRGBO(51, 51, 51, 0.8),
      Alignment alignment = const Alignment(0, 0.8)}) {
    if (_textToastCancelFunc != null) {
      _textToastCancelFunc!();
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
        align: alignment,
        toastBuilder: (_) => Container(
              constraints: BoxConstraints(minWidth: 128, maxWidth: 295),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25), color: bgColor),
              child: Text(
                content,
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: YlTextStyles.body3
                    .copyWith(color: YlColors.white, height: 1.3),
              ),
            ));
  }

  static void loading({String content = '请求中', bool bLong = false}) {
    String message;
    if (content.isEmpty) {
      message = '';
    } else {
      message = content;
    }
    BotToast.showCustomLoading(
        clickClose: true,
        toastBuilder: (_) => GestureDetector(
              onTap: () => BotToast.closeAllLoading(),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color.fromRGBO(51, 51, 51, 0.8)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
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
                      message,
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

  static void _iconToast(String content, {required Widget icon}) {
    BotToast.showCustomText(
        align: Alignment.center,
        wrapAnimation: (AnimationController controller, CancelFunc cancelFunc,
                Widget child) =>
            FadeAnimation(
              controller: controller,
              child: child,
            ),
        wrapToastAnimation: null,
        duration: _defaultDuration,
        toastBuilder: (_) => Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color.fromRGBO(51, 51, 51, 0.8)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    // color: YlColors.alertRed,
                    padding: EdgeInsets.only(bottom: 2),
                    child: IconTheme(
                        data: IconThemeData(color: YlColors.white, size: 20),
                        child: icon),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Container(
                    // color: YlColors.lanehubBlue,
                    child: Text(
                      content,
                      style: YlTextStyles.body3
                          .copyWith(color: YlColors.white, height: 1.3),
                    ),
                  )
                ],
              ),
            ));
  }
}

//淡出淡入动画
class FadeAnimation extends StatefulWidget {
  final Widget? child;
  final AnimationController? controller;

  const FadeAnimation({Key? key, this.child, this.controller})
      : super(key: key);

  @override
  FadeAnimationState createState() => FadeAnimationState();
}

class FadeAnimationState extends State<FadeAnimation>
    with SingleTickerProviderStateMixin {
  static final Tween<double> tweenOpacity = Tween<double>(begin: 0, end: 1);
  late Animation<double> animation;
  late Animation<double> animationOpacity;

  @override
  void initState() {
    animation =
        CurvedAnimation(parent: widget.controller!, curve: Curves.decelerate);

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
