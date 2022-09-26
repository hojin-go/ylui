// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';
import 'package:flutter_ylui/src/helper.dart';

import 'yl_form_divider.dart';
import 'yl_form_error_helper.dart';
import 'yl_form_label.dart';

export 'package:flutter/services.dart' show SmartQuotesType, SmartDashesType;

class YlSelectorFormField<T> extends FormField<T> {
  YlSelectorFormField({
    Key? key,
    T? initialValue,
    String? placeholder,
    String? label,
    TextStyle? labelStyle,
    bool? isRequired,
    YlFormFieldRequiredPosition requiredPosition =
        YlFormFieldRequiredPosition.end,
    String? helperText,
    ValueChanged<T>? onChanged,
    Future<T?> Function(T?)? onTap,
    FormFieldSetter<T>? onSaved,
    FormFieldValidator<T>? validator,
    AutovalidateMode? autovalidateMode,
    bool? enabled,
    String? restorationId,
    required Widget Function(BuildContext, T?) contentBuilder,
  }) : super(
          key: key,
          restorationId: restorationId,
          initialValue: initialValue,
          onSaved: onSaved,
          validator: validator,
          enabled: enabled ?? true,
          autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
          builder: (FormFieldState<T> field) {
            Widget body = Container(
              padding: const EdgeInsets.only(top: 4, bottom: 12),
              child: Row(
                children: [
                  Expanded(child: contentBuilder(field.context, field.value)),
                  getImageFromAssets('icon_right'),
                ],
              ),
            );

            if (enabled ?? true) {
              body = GestureDetector(
                onTap: () async {
                  if (onTap != null) {
                    var result = await onTap(field.value);
                    if (result != null) {
                      field.didChange(result);
                      if (onChanged != null) {
                        onChanged(result);
                      }
                    }
                  }
                },
                behavior: HitTestBehavior.opaque,
                child: body,
              );
            }

            var widget = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (label != null)
                  YlFormLabel(
                    label: label,
                    isRequired: isRequired,
                    requiredPosition: requiredPosition,
                  ),
                body,
                YlFormDivider(field: field),
                YlFormErrorHelper(
                  hasError: field.hasError,
                  errorText: field.errorText,
                  helperText: helperText,
                ),
              ],
            );
            return widget;
          },
        );
}
