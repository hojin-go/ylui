import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

/// 步进组件
class YlStepper extends StatefulWidget {
  /// 当前值
  final int value;

  /// 最小值，如果为null，则默认为0
  final int? minimum;

  /// 最大值
  final int? maximum;

  /// 文本构建器
  final String Function(int value) textBuilder;

  /// 值改变回调
  final void Function(int value)? onChanged;
  const YlStepper({
    Key? key,
    required this.value,
    required this.textBuilder,
    this.minimum,
    this.maximum,
    this.onChanged,
  }) : super(key: key);

  @override
  State<YlStepper> createState() => _YlStepperState();
}

class _YlStepperState extends State<YlStepper> {
  late int _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    final min = widget.minimum ?? 0;
    final activeColor = const Color(0xFF7E7E7E);
    final inactiveColor = YlColors.grey5;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        YlTapDetector(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: YlColors.grey5,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                ),
                color: _value == min ? YlColors.grey2 : Colors.white),
            width: 44,
            height: 40,
            child: Icon(
              Icons.remove,
              color: _value == min ? inactiveColor : activeColor,
            ),
          ),
          onTap: () async {
            if (_value == min) {
              return;
            }

            setState(() {
              _value--;
            });

            widget.onChanged?.call(_value);
          },
        ),
        Container(
          alignment: Alignment.center,
          width: 60,
          height: 40,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 1,
                color: YlColors.grey5,
              ),
              bottom: BorderSide(
                width: 1,
                color: YlColors.grey5,
              ),
            ),
          ),
          child: Text(
            widget.textBuilder(_value),
            style: YlTextStyles.n14(color: YlColors.black),
          ),
        ),
        YlTapDetector(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: YlColors.grey5,
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(4),
                bottomRight: Radius.circular(4),
              ),
              color: widget.maximum != null && _value == widget.maximum
                  ? YlColors.grey2
                  : Colors.white,
            ),
            width: 44,
            height: 40,
            child: Icon(
              Icons.add,
              color: widget.maximum != null && _value == widget.maximum
                  ? inactiveColor
                  : activeColor,
            ),
          ),
          onTap: () async {
            if (widget.maximum != null && _value == widget.maximum) {
              return;
            }

            setState(() {
              _value++;
            });

            widget.onChanged?.call(_value);
          },
        ),
      ],
    );
  }
}
