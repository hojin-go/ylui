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

  /// 组件高度定制
  final double? height;

  /// 组件宽度定制
  final double? width;

  final bool? disable;

  /// 组件选择超出范围回调
  final VoidCallback? onSelectedLessThenMin;
  final VoidCallback? onSelectedMoreThenMax;

  /// 值改变回调
  final void Function(int value)? onChanged;
  const YlStepper({
    Key? key,
    required this.value,
    this.minimum,
    this.maximum,
    this.onChanged,
    this.height,
    this.width,
    this.onSelectedLessThenMin,
    this.onSelectedMoreThenMax,
    this.disable,
  }) : super(key: key);

  @override
  State<YlStepper> createState() => _YlStepperState();
}

class _YlStepperState extends State<YlStepper> {
  late int _value;
  late TextEditingController _textController;
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _value = widget.value;
    _textController = TextEditingController(text: '$_value');
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        _onChanged(int.tryParse(_textController.text) ?? 0);
      } else {
        _textController.selection = TextSelection(
          baseOffset: 0,
          extentOffset: _textController.text.length,
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _textController.dispose();
    _focusNode.dispose();
  }

  @override
  void didUpdateWidget(covariant YlStepper oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _value = widget.value;
      _textController.text = '$_value';
    }

    // update disable
    if (oldWidget.disable != widget.disable) {
      if (widget.disable == true) {
        _focusNode.unfocus();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final min = widget.minimum ?? 0;
    final activeColor = const Color(0xFF7E7E7E);
    final inactiveColor = YlColors.grey5;
    final height = widget.height ?? 40.0;
    final controlWidth = 32.0;
    final valueWidth =
        widget.width != null ? (widget.width! - controlWidth * 2) : 31.0;

    final minusAble = widget.disable != true && _value > min;
    final plusAble = widget.disable != true &&
        (widget.maximum == null || _value < widget.maximum!);
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
                color: !minusAble ? YlColors.grey2 : Colors.white),
            width: controlWidth,
            height: height,
            child: Icon(
              Icons.remove,
              color: !minusAble ? inactiveColor : activeColor,
            ),
          ),
          onTap: () async {
            if (widget.disable == true) {
              return;
            }
            if (_value == min) {
              return;
            }

            _focusNode.unfocus();
            _onChanged(_value - 1);
          },
        ),
        Container(
          alignment: Alignment.center,
          width: valueWidth,
          height: height,
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
          child: TextField(
            controller: _textController,
            textAlign: TextAlign.center,
            style: TextStyle(
                color:
                    widget.disable == true ? YlColors.black30 : YlColors.black,
                fontSize: 14,
                height: 1.6),
            focusNode: _focusNode,
            readOnly: widget.disable ?? false,
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
            toolbarOptions: ToolbarOptions(copy: false, selectAll: false),
            keyboardType: TextInputType.number,
            onEditingComplete: () {
              // _onChanged(int.tryParse(_textController.text) ?? 0);
              debugPrint("stepper onEditingComplete");
              _focusNode.unfocus();
            },
            onSubmitted: (value) {
              // _onChanged(int.tryParse(value) ?? 0);
              debugPrint("stepper onSubmitted");
              _focusNode.unfocus();
            },
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
              color: !plusAble ? YlColors.grey2 : Colors.white,
            ),
            width: controlWidth,
            height: height,
            child: Icon(
              Icons.add,
              color: !plusAble ? inactiveColor : activeColor,
            ),
          ),
          onTap: () async {
            if (!plusAble) {
              return;
            }
            if (widget.maximum != null && _value == widget.maximum) {
              return;
            }

            _focusNode.unfocus();
            _onChanged(_value + 1);
          },
        ),
      ],
    );
  }

  _onChanged(int newValue) {
    if (newValue < (widget.minimum ?? 0)) {
      newValue = widget.minimum ?? 0;
      widget.onSelectedLessThenMin?.call();
    }

    if (widget.maximum != null && newValue > widget.maximum!) {
      newValue = widget.maximum!;
      widget.onSelectedMoreThenMax?.call();
    }

    if (newValue == _value) {
      _textController.text = '$_value';
      return;
    }

    setState(() {
      _value = newValue;
      _textController.text = '$_value';
    });

    widget.onChanged?.call(_value);
  }
}
