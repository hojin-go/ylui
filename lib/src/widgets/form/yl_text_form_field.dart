// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

export 'package:flutter/services.dart' show SmartQuotesType, SmartDashesType;

/// A [FormField] that contains a [TextField].
///
/// This is a convenience widget that wraps a [TextField] widget in a
/// [FormField].
///
/// A [Form] ancestor is not required. The [Form] simply makes it easier to
/// save, reset, or validate multiple fields at once. To use without a [Form],
/// pass a [GlobalKey] to the constructor and use [GlobalKey.currentState] to
/// save or reset the form field.
///
/// When a [controller] is specified, its [TextEditingController.text]
/// defines the [initialValue]. If this [FormField] is part of a scrolling
/// container that lazily constructs its children, like a [ListView] or a
/// [CustomScrollView], then a [controller] should be specified.
/// The controller's lifetime should be managed by a stateful widget ancestor
/// of the scrolling container.
///
/// If a [controller] is not specified, [initialValue] can be used to give
/// the automatically generated controller an initial value.
///
/// {@macro flutter.material.textfield.wantKeepAlive}
///
/// Remember to call [TextEditingController.dispose] of the [TextEditingController]
/// when it is no longer needed. This will ensure we discard any resources used
/// by the object.
///
/// By default, `decoration` will apply the [ThemeData.inputDecorationTheme] for
/// the current context to the [InputDecoration], see
/// [InputDecoration.applyDefaults].
///
/// For a documentation about the various parameters, see [TextField].
///
/// {@tool snippet}
///
/// Creates a [YlTextFormField] with an [InputDecoration] and validator function.
///
/// ![If the user enters valid text, the TextField appears normally without any warnings to the user](https://flutter.github.io/assets-for-api-docs/assets/material/text_form_field.png)
///
/// ![If the user enters invalid text, the error message returned from the validator function is displayed in dark red underneath the input](https://flutter.github.io/assets-for-api-docs/assets/material/text_form_field_error.png)
///
/// ```dart
/// TextFormField(
///   decoration: const InputDecoration(
///     icon: Icon(Icons.person),
///     hintText: 'What do people call you?',
///     labelText: 'Name *',
///   ),
///   onSaved: (String? value) {
///     // This optional block of code can be used to run
///     // code when the user saves the form.
///   },
///   validator: (String? value) {
///     return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
///   },
/// )
/// ```
/// {@end-tool}
///
/// {@tool dartpad}
/// This example shows how to move the focus to the next field when the user
/// presses the SPACE key.
///
/// ** See code in examples/api/lib/material/text_form_field/text_form_field.1.dart **
/// {@end-tool}
///
/// See also:
///
///  * <https://material.io/design/components/text-fields.html>
///  * [TextField], which is the underlying text field without the [Form]
///    integration.
///  * [InputDecorator], which shows the labels and other visual elements that
///    surround the actual text editing widget.
///  * Learn how to use a [TextEditingController] in one of our [cookbook recipes](https://flutter.dev/docs/cookbook/forms/text-field-changes#2-use-a-texteditingcontroller).
class YlTextFormField extends FormField<String> {
  /// Creates a [FormField] that contains a [TextField].
  ///
  /// When a [controller] is specified, [initialValue] must be null (the
  /// default). If [controller] is null, then a [TextEditingController]
  /// will be constructed automatically and its `text` will be initialized
  /// to [initialValue] or the empty string.
  ///
  /// For documentation about the various parameters, see the [TextField] class
  /// and [new TextField], the constructor.
  ///
  /// [placeholder] is used to set the placeholder text in the text field.
  ///
  /// [label] is used to set the label text in the text field.
  ///
  /// [isRequired] 用来设置表单项是否为必须.
  YlTextFormField({
    Key? key,
    this.controller,
    String? initialValue,
    String? placeholder,
    String? label,
    TextStyle? labelStyle,
    bool? isRequired,
    YlFormFieldRequiredPosition requiredPosition =
        YlFormFieldRequiredPosition.end,
    FocusNode? focusNode,
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    bool autofocus = false,
    bool readOnly = false,
    ToolbarOptions? toolbarOptions,
    String obscuringCharacter = '•',
    bool obscureText = false,
    bool autocorrect = true,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    bool enableSuggestions = true,
    @Deprecated(
      'Use maxLengthEnforcement parameter which provides more specific '
      'behavior related to the maxLength limit. '
      'This feature was deprecated after v1.25.0-5.0.pre.',
    )
        bool maxLengthEnforced = true,
    MaxLengthEnforcement? maxLengthEnforcement,
    int? maxLines = 1,
    int? minLines,
    bool expands = false,
    int? maxLength,
    ValueChanged<String>? onChanged,
    GestureTapCallback? onTap,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    List<TextInputFormatter>? inputFormatters,
    bool? enabled,
    Brightness? keyboardAppearance,
    EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
    bool enableInteractiveSelection = true,
    TextSelectionControls? selectionControls,
    ScrollPhysics? scrollPhysics,
    Iterable<String>? autofillHints,
    AutovalidateMode? autovalidateMode,
    ScrollController? scrollController,
    String? restorationId,
    bool enableIMEPersonalizedLearning = true,
  })  : assert(initialValue == null || controller == null),
        assert(
          maxLengthEnforced || maxLengthEnforcement == null,
          'maxLengthEnforced is deprecated, use only maxLengthEnforcement',
        ),
        assert(maxLines == null || maxLines > 0),
        assert(minLines == null || minLines > 0),
        assert(
          (maxLines == null) || (minLines == null) || (maxLines >= minLines),
          "minLines can't be greater than maxLines",
        ),
        assert(
          !expands || (maxLines == null && minLines == null),
          'minLines and maxLines must be null when expands is true.',
        ),
        assert(!obscureText || maxLines == 1,
            'Obscured fields cannot be multiline.'),
        assert(maxLength == null ||
            maxLength == TextField.noMaxLength ||
            maxLength > 0),
        super(
          key: key,
          restorationId: restorationId,
          initialValue:
              controller != null ? controller.text : (initialValue ?? ''),
          onSaved: onSaved,
          validator: validator,
          enabled: enabled ?? true,
          autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
          builder: (FormFieldState<String> field) {
            final _YlTextFormFieldState state = field as _YlTextFormFieldState;

            void onChangedHandler(String value) {
              field.didChange(value);
              if (onChanged != null) {
                onChanged(value);
              }
            }

            // 判断是否展示多行，单行和多行的样式不一致
            bool mutipleLine = (maxLines ?? 1) > 1;
            TextStyle style;
            if (!mutipleLine) {
              style = TextStyle(
                fontSize: 17,
                color: (enabled ?? true) ? YlColors.black90 : YlColors.black50,
              );
            } else {
              // 多行时，行间距不同
              style = YlTextStyles.n17(
                color: (enabled ?? true) ? YlColors.black90 : YlColors.black50,
              );
            }

            // 隐藏组件自带的实心底线
            var border = InputBorder.none;
            var focusBorder = InputBorder.none;

            return UnmanagedRestorationScope(
              bucket: field.bucket,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (label != null)
                    Text.rich(
                      TextSpan(
                        style: labelStyle ??
                            TextStyle(
                              fontSize: 15,
                              fontWeight: YlFontWeight.bold,
                              color: YlColors.black70,
                            ),
                        children: [
                          if ((isRequired ?? false) &&
                              requiredPosition ==
                                  YlFormFieldRequiredPosition.start)
                            TextSpan(
                              text: '* ',
                              style: TextStyle(
                                color: YlColors.alertRed,
                              ),
                            ),
                          TextSpan(text: label),
                          if ((isRequired ?? false) &&
                              requiredPosition ==
                                  YlFormFieldRequiredPosition.end)
                            TextSpan(
                              text: ' *',
                              style: TextStyle(
                                color: YlColors.alertRed,
                              ),
                            ),
                        ],
                      ),
                    ),
                  TextField(
                    restorationId: restorationId,
                    controller: state._effectiveController,
                    focusNode: focusNode,
                    decoration: InputDecoration(
                      hintText: placeholder,
                      hintStyle: style.copyWith(color: YlColors.black30),
                      // 调整输入框的高度的内边距
                      isDense: true,
                      contentPadding: const EdgeInsets.only(top: 4, bottom: 12),
                      border: border,
                      enabledBorder: border,
                      disabledBorder: border,
                      focusedBorder: focusBorder,
                      // 禁止自带的文字计数样式
                      counterText: '',
                    ),
                    keyboardType: keyboardType,
                    textInputAction: textInputAction,
                    style: style,
                    textCapitalization: textCapitalization,
                    autofocus: autofocus,
                    toolbarOptions: toolbarOptions,
                    readOnly: readOnly,
                    obscuringCharacter: obscuringCharacter,
                    obscureText: obscureText,
                    autocorrect: autocorrect,
                    smartDashesType: smartDashesType ??
                        (obscureText
                            ? SmartDashesType.disabled
                            : SmartDashesType.enabled),
                    smartQuotesType: smartQuotesType ??
                        (obscureText
                            ? SmartQuotesType.disabled
                            : SmartQuotesType.enabled),
                    enableSuggestions: enableSuggestions,
                    maxLengthEnforced: maxLengthEnforced,
                    maxLengthEnforcement: maxLengthEnforcement,
                    maxLines: maxLines,
                    minLines: minLines,
                    expands: expands,
                    maxLength: maxLength,
                    // buildCounter: (ctx,
                    //     {required int currentLength,
                    //     required bool isFocused,
                    //     required int? maxLength}) {
                    //   return null;
                    // },
                    onChanged: onChangedHandler,
                    onTap: onTap,
                    onEditingComplete: onEditingComplete,
                    onSubmitted: onFieldSubmitted,
                    inputFormatters: inputFormatters,
                    enabled: enabled ?? true,
                    cursorColor: YlColors.branding1,
                    scrollPadding: scrollPadding,
                    scrollPhysics: scrollPhysics,
                    keyboardAppearance: keyboardAppearance,
                    enableInteractiveSelection: enableInteractiveSelection,
                    selectionControls: selectionControls,
                    autofillHints: autofillHints,
                    scrollController: scrollController,
                    enableIMEPersonalizedLearning:
                        enableIMEPersonalizedLearning,
                  ),
                  // 自定义计数器和表单错误效果
                  if (mutipleLine)
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      alignment: Alignment.centerRight,
                      child: Text.rich(
                        TextSpan(
                            children: [
                              if (field.hasError)
                                TextSpan(
                                  text: field.errorText,
                                  style: TextStyle(
                                    color: YlColors.alertRed,
                                  ),
                                ),
                              if (field.hasError)
                                WidgetSpan(
                                  child: SizedBox(width: 12),
                                ),
                              TextSpan(
                                  text: '字数 ' +
                                      state._effectiveController.text.length
                                          .toString()),
                            ],
                            style: TextStyle(
                              fontSize: 12,
                              color: YlColors.black30,
                            )),
                      ),
                    ),
                  // 自定义表单底线
                  Divider(
                    height: 1,
                    thickness: 0.5,
                    color: field.hasError ? YlColors.alertRed : YlColors.grey3,
                  ),
                  // 自定义单行表单时的报错展示效果
                  if (field.hasError && !mutipleLine)
                    Padding(
                      padding: const EdgeInsets.only(top: 2),
                      child: Text(
                        field.errorText!,
                        style:
                            TextStyle(fontSize: 12, color: YlColors.alertRed),
                      ),
                    )
                ],
              ),
            );
          },
        );

  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [TextEditingController] and
  /// initialize its [TextEditingController.text] with [initialValue].
  final TextEditingController? controller;

  @override
  FormFieldState<String> createState() => _YlTextFormFieldState();
}

class _YlTextFormFieldState extends FormFieldState<String> {
  RestorableTextEditingController? _controller;

  TextEditingController get _effectiveController =>
      widget.controller ?? _controller!.value;

  @override
  YlTextFormField get widget => super.widget as YlTextFormField;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    super.restoreState(oldBucket, initialRestore);
    if (_controller != null) {
      _registerController();
    }
    // Make sure to update the internal [FormFieldState] value to sync up with
    // text editing controller value.
    setValue(_effectiveController.text);
  }

  void _registerController() {
    assert(_controller != null);
    registerForRestoration(_controller!, 'controller');
  }

  void _createLocalController([TextEditingValue? value]) {
    assert(_controller == null);
    _controller = value == null
        ? RestorableTextEditingController()
        : RestorableTextEditingController.fromValue(value);
    if (!restorePending) {
      _registerController();
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _createLocalController(widget.initialValue != null
          ? TextEditingValue(text: widget.initialValue!)
          : null);
    } else {
      widget.controller!.addListener(_handleControllerChanged);
    }
  }

  @override
  void didUpdateWidget(YlTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      widget.controller?.addListener(_handleControllerChanged);

      if (oldWidget.controller != null && widget.controller == null) {
        _createLocalController(oldWidget.controller!.value);
      }

      if (widget.controller != null) {
        setValue(widget.controller!.text);
        if (oldWidget.controller == null) {
          unregisterFromRestoration(_controller!);
          _controller!.dispose();
          _controller = null;
        }
      }
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_handleControllerChanged);
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChange(String? value) {
    super.didChange(value);

    if (_effectiveController.text != value)
      _effectiveController.text = value ?? '';
  }

  @override
  void reset() {
    // setState will be called in the superclass, so even though state is being
    // manipulated, no setState call is needed here.
    _effectiveController.text = widget.initialValue ?? '';
    super.reset();
  }

  void _handleControllerChanged() {
    // Suppress changes that originated from within this class.
    //
    // In the case where a controller has been passed in to this widget, we
    // register this change listener. In these cases, we'll also receive change
    // notifications for changes originating from within this class -- for
    // example, the reset() method. In such cases, the FormField value will
    // already have been set.
    if (_effectiveController.text != value)
      didChange(_effectiveController.text);
  }
}
