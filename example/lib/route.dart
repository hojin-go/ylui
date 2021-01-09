import 'package:example/views/checkbox_view.dart';
import 'package:example/views/color_view.dart';
import 'package:example/views/confirm_view.dart';
import 'package:example/views/font_view.dart';

defineRoutes() {
  return {
    '/color': (context) => ColorView(),
    '/font': (context) => FontView(),
    '/checkbox': (_) => CheckboxView(),
    '/confirm': (_) => ConfirmView()
  };
}
