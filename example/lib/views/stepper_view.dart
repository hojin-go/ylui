import 'package:example/views/componnets/demo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class StepperView extends StatefulWidget {
  const StepperView({Key? key}) : super(key: key);

  @override
  State<StepperView> createState() => _StepperViewState();
}

class _StepperViewState extends State<StepperView> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return YlTapDetector(
      onTap: () {
        // hide keyboard
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: DemoPage(
        title: 'Stepper',
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('当前值: $_value'),
              const SizedBox(height: 20),
              YlStepper(
                value: _value,
                minimum: 1,
                maximum: 12,
                height: 30,
                disable: true,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                },
                onSelectedLessThenMin: () {
                  YlToast.text('不得少于1');
                },
                onSelectedMoreThenMax: () {
                  YlToast.text('不得大于12');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
