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
    return DemoPage(
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
              maximum: 3,
              textBuilder: (value) => '$value周',
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
