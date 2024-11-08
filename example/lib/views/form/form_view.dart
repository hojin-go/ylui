import 'package:flutter/cupertino.dart';
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
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selector',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: YlSelectorFormField<DateTime>(
                  label: '选择日期',
                  isRequired: true,
                  placeholder: '请选择',
                  initialValue: DateTime.now(),
                  enabled: false,
                  contentBuilder: (context, value) {
                    return YlFormTextContent(
                      _formatDate(value),
                      placeholder: '请选择',
                      enabled: false,
                    );
                  },
                  onTap: (value) async {
                    var ret = await showDatePicker(
                        context: context,
                        initialDate: value ?? DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2030));

                    return ret;
                  },
                  validator: (value) {
                    if (value == null) {
                      return '请选择日期';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: YlSelectorFormField<DateTime>(
                  label: '选择日期',
                  isRequired: true,
                  placeholder: '请选择',
                  initialValue: DateTime.now(),
                  enabled: true,
                  contentBuilder: (context, value) {
                    return YlFormTextContent(
                      _formatDate(value),
                      placeholder: '请选择',
                      enabled: true,
                    );
                  },
                  onTap: (value) async {
                    var ret = await showDatePicker(
                        context: context,
                        initialDate: value ?? DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2030));

                    return ret;
                  },
                  validator: (value) {
                    if (value == null) {
                      return '请选择日期';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: YlSelectorFormField<String>(
                  label: '选择日期范围',
                  isRequired: true,
                  placeholder: '请选择',
                  contentBuilder: (context, value) {
                    return YlFormTextContent(
                      value ?? '',
                      placeholder: '请选择',
                    );
                  },
                  onTap: (value) async {
                    var ret = await showDateRangePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030),
                        builder: (ctx, child) => Theme(
                              data: ThemeData.light().copyWith(
                                primaryColor: const Color(0xFF8CE7F1),
                                colorScheme: ColorScheme.light(
                                    primary: const Color(0xFF8CE7F1)),
                                buttonTheme: ButtonThemeData(
                                    textTheme: ButtonTextTheme.primary),
                              ),
                              child: child!,
                            ));

                    if (ret == null) {
                      return null;
                    }

                    return '${_formatDate(ret.start)} 至\n${_formatDate(ret.end)}';
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '请选择日期范围';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: YlSelectorFormField<DateTimeRange>(
                  label: '选择日期范围',
                  isRequired: true,
                  placeholder: '请选择',
                  contentBuilder: (context, value) {
                    return Row(
                      children: [
                        Expanded(
                            child: YlFormTextContent(_formatDate(value?.start),
                                placeholder: '请选择')),
                        Container(
                          height: 1,
                          color: YlColors.black30,
                          width: 12,
                          margin: const EdgeInsets.all(8),
                        ),
                        Expanded(
                            child: YlFormTextContent(_formatDate(value?.end),
                                placeholder: '请选择')),
                      ],
                    );
                  },
                  onTap: (value) async {
                    var ret = await showDateRangePicker(
                        context: context,
                        initialDateRange: value,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030),
                        builder: (ctx, child) => Theme(
                              data: ThemeData.light().copyWith(
                                primaryColor: const Color(0xFF8CE7F1),
                                colorScheme: ColorScheme.light(
                                    primary: const Color(0xFF8CE7F1)),
                                buttonTheme: ButtonThemeData(
                                    textTheme: ButtonTextTheme.primary),
                              ),
                              child: child!,
                            ));

                    return ret;
                  },
                  validator: (value) {
                    if (value == null) {
                      return '请选择日期范围';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ///////////////////////////////////////////////////////////////////////
              Text(
                'TextFormField',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: YlTextFormField(
                  label: '禁止',
                  enabled: false,
                  textInputAction: TextInputAction.done,
                  placeholder: '请输入',
                  initialValue: '不可输入',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: YlTextFormField(
                  label: '昵称',
                  textInputAction: TextInputAction.next,
                  isRequired: true,
                  placeholder: '请输入',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '请输入昵称';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: YlTextFormField(
                  label: '用一句话介绍自己',
                  textInputAction: TextInputAction.next,
                  isRequired: true,
                  minLength: 10,
                  maxLength: 50,
                  minLines: 1,
                  maxLines: 3,
                  countTrim: true,
                  placeholder: '请输入',
                  helperText: '前后空白符将不被计数，最少10字，最多50字',
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.trim().length < 10) {
                      return '至少10字';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: YlTextFormField(
                  label: '随意写些什么',
                  textInputAction: TextInputAction.next,
                  helperText: '无长度限制',
                  minLines: 1,
                  maxLines: 5,
                  placeholder: '请输入',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: YlTextFormField(
                  label: '回车收起键盘',
                  textInputAction: TextInputAction.done,
                  placeholder: '请输入',
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

String _formatDate(DateTime? dt) {
  return dt == null ? '' : '${dt.year}-${dt.month}-${dt.day}';
}
