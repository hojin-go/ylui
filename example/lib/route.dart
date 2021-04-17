import 'package:example/views/button_view.dart';
import 'package:example/views/checkbox_view.dart';
import 'package:example/views/color_view.dart';
import 'package:example/views/confirm_view.dart';
import 'package:example/views/dialog_view.dart';
import 'package:example/views/floating_bottom_view.dart';
import 'package:example/views/font_view.dart';
import 'package:example/views/yl_toast_demo.dart';
import 'package:flutter/material.dart';
import 'views/popover_view.dart';

class RouteObject {
  final String route;
  final String description;
  final WidgetBuilder builder;

  RouteObject(this.route, this.description, this.builder);
}

List<RouteObject> defineRouteObjects() {
  return [
    RouteObject('/color', 'YlColors', (context) => ColorView()),
    RouteObject('/font', 'YlTextStyle', (context) => FontView()),
    RouteObject('/checkbox', 'YlCheckbox', (context) => CheckboxView()),
    RouteObject('/confirm', 'YlConfirm', (context) => ConfirmView()),
    RouteObject('/popover', 'YlPopover', (context) => PopoverView()),
    RouteObject('/button', 'YlButton', (context) => ButtonView()),
    RouteObject('/toast', 'YlToast', (context) => YlToastDemoPage()),
    RouteObject('/floating_bottom', 'YlFloatingBottom', (context) => FloatingBottomView()),
    RouteObject('/dialog', 'YlDialog', (context) => DialogView())
  ];
}

Map<String, WidgetBuilder> get routesMap {
  var map = <String, WidgetBuilder>{};
  var routes = defineRouteObjects();
  routes.forEach((element) {
    map.putIfAbsent(element.route, () => element.builder);
  });
  return map;
}
