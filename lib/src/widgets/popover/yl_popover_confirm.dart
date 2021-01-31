import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../yl_color.dart';
import '../../yl_text_style.dart';


class YlPopoverConfirm extends StatelessWidget {
  final Widget body;
  final VoidCallback doneAction;
  const YlPopoverConfirm({Key key, this.body, this.doneAction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: YlColors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: SafeArea(
        top: false,
        bottom: true,
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _header(
                closeAction: () => Navigator.of(context).pop(),
                doneAction: doneAction,
              ),
              if (body != null) body
            ],
          ),
        ),
      ),
    );
  }

  _header({VoidCallback closeAction, VoidCallback doneAction}) {
    return Container(
      child: Row(
        children: [
          CupertinoButton(
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Text('取消', style: YlTextStyles.body1.copyWith(color: YlColors.black70),),
            onPressed: closeAction,
          ),
          Spacer(),
          CupertinoButton(
            padding: EdgeInsets.only(top: 20, right: 20),
            child: Text('完成', style: YlTextStyles.body1.copyWith(color: YlColors.branding1),),
            onPressed: doneAction,
          )
        ],
      ),
    );
  }
}
