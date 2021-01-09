import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ylkit/flutter_ylkit.dart';

class CheckboxView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CheckboxState();
}

class _CheckboxState extends State<CheckboxView> {
  var checkState = false;

  final data = [
    _CheckboxTile(
      size: 20,
      color: YlColors.branding2,
      title: 'Branding2 x 20',
    ),
    _CheckboxTile(
      size: 40,
      color: YlColors.lanehubBlue,
      title: 'LanehubBlue x 40',
    ),
    _CheckboxTile(
      size: 60,
      color: YlColors.alertRed,
      title: 'AlertRed x 60',
    ),
    _CheckboxTile(
      size: 30,
      color: YlColors.black70,
      checked: CupertinoIcons.checkmark_seal_fill,
      unchecked: CupertinoIcons.checkmark_seal,
      title: 'Black70 x 30 x 指定图标',
    ),
    _CheckboxTile(
      size: 30,
      enabled: false,
      color: YlColors.black70,
      checked: CupertinoIcons.checkmark_seal_fill,
      unchecked: CupertinoIcons.checkmark_seal,
      title: 'Black70 x 30 x 指定图标 x 不可用',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: YlBackButton(),
        title: Text('YlCheckbox'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => data[index],
          separatorBuilder: (context, index) => Divider(),
          itemCount: data.length),
    );
  }
}

class _CheckboxTile extends StatefulWidget {
  final double size;
  final Color color;
  final IconData checked;
  final IconData unchecked;
  final String title;
  final bool enabled;

  const _CheckboxTile(
      {Key key,
      @required this.title,
      this.size,
      this.color,
      this.checked = CupertinoIcons.checkmark_square_fill,
      this.unchecked = CupertinoIcons.checkmark_square,
      this.enabled = true})
      : super(key: key);
  @override
  __CheckboxTileState createState() => __CheckboxTileState();
}

class __CheckboxTileState extends State<_CheckboxTile> {
  bool checked = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.title),
          YlCheckbox(
            check: checked,
            size: widget.size,
            color: widget.color,
            checkedIcon: widget.checked,
            uncheckedIcon: widget.unchecked,
            onChanged: widget.enabled
                ? (value) {
                    setState(() {
                      checked = value;
                    });
                  }
                : null,
          )
        ],
      ),
    );
  }
}
