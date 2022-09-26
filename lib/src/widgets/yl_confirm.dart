import 'package:flutter/cupertino.dart';

class YlConfirm extends StatelessWidget {
  final String? title;
  final String? message;
  final List<CupertinoActionSheetAction>? actions;

  const YlConfirm({Key? key, this.title, this.message, this.actions}) : super(key: key);

  YlConfirm.report({required VoidCallback onConfirm}) : title = null, message = null, actions = [
    CupertinoActionSheetAction(onPressed: onConfirm, child: Text('确认举报'), isDestructiveAction: true,)
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: title != null ? Text(title!) : null,
      message: message != null ? Text(message!) : null,
      actions: actions,
      cancelButton: CupertinoActionSheetAction(
        child: Text('取消'),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
