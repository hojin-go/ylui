import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

import '../componnets/demo_page.dart';

class FormView extends StatefulWidget {
  const FormView({Key? key}) : super(key: key);

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  // 点击按钮时，用来获取form，执行校验和保存
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return DemoPage(
      title: '表单',
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: YlTextFormField(
                  label: '必选标识在前',
                  textInputAction: TextInputAction.next,
                  isRequired: true,
                  requiredPosition: YlFormFieldRequiredPosition.start,
                  placeholder: '请输入',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: YlTextFormField(
                  label: '必选标志在后',
                  textInputAction: TextInputAction.next,
                  isRequired: true,
                  placeholder: '请输入',
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: YlTextFormField(
                  label: '可选',
                  textInputAction: TextInputAction.next,
                  placeholder: '请输入',
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: YlTextFormField(
                  label: '标题样式定制',
                  labelStyle: TextStyle(
                    fontSize: 12,
                    color: YlColors.black30,
                  ),
                  textInputAction: TextInputAction.next,
                  placeholder: '请输入',
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: YlTextFormField(
                  label: '多行文本',
                  textInputAction: TextInputAction.next,
                  isRequired: true,
                  maxLength: 50,
                  minLines: 1,
                  maxLines: 3,
                  placeholder: '请输入',
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.length < 10) {
                      return '请输入超过10字符';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: YlTextFormField(
                  label: '有帮助文字',
                  textInputAction: TextInputAction.next,
                  isRequired: true,
                  helperText: '*我是帮助文字，可做一些解释说明',
                  placeholder: '请输入',
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.length < 10) {
                      return '请输入超过10字符';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: YlTextFormField(
                  label: '有帮助文字 | 多行情况',
                  textInputAction: TextInputAction.next,
                  isRequired: true,
                  maxLength: 50,
                  minLines: 1,
                  maxLines: 3,
                  helperText: '我是帮助文字，可做一些解释说明',
                  placeholder: '请输入',
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.length < 10) {
                      return '请输入超过10字符';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: YlTextFormField(
                  label: '回车收起键盘',
                  textInputAction: TextInputAction.done,
                  isRequired: true,
                  placeholder: '请输入',
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onFieldSubmitted: (str) {
                    print('changed: $str');
                  },
                  onSaved: (str) {
                    print('save: $str');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: YlTextFormField(
                  label: '禁止',
                  enabled: false,
                  textInputAction: TextInputAction.done,
                  placeholder: '请输入',
                  initialValue: '不可输入',
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      child: const Text('Submit'),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _formKey.currentState!.reset();
                      },
                      child: const Text('Reset'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
