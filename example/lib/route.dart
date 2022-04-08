import 'package:example/views/button/button_demo.dart';
import 'package:example/views/appbar/appbar_view.dart';
import 'package:example/views/color_view.dart';
import 'package:example/views/dialog/dialog_view.dart';
import 'package:example/views/floating_bottom_view.dart';
import 'package:example/views/font_view.dart';
import 'package:example/views/form/form_view.dart';
import 'package:example/views/loading_indicator_view.dart';
import 'package:example/views/selector/selector_view.dart';
import 'package:example/views/tabs/bottom_tabbar_view.dart';
import 'package:example/views/tabs/tabs_view.dart';
import 'package:example/views/yl_toast_demo.dart';
import 'package:flutter/material.dart';

class RouteObject {
  final String route;
  final String description;
  final WidgetBuilder builder;

  RouteObject(this.route, this.description, this.builder);
}

List<RouteObject> defineRouteObjects() {
  return [
    RouteObject('/color', '颜色', (context) => ColorView()),
    RouteObject('/font', '字体样式', (context) => FontView()),
    RouteObject('/checkbox', '选择器', (context) => SelectorView()),
    RouteObject('/button', '按钮', (context) => ButtonDemo()),
    RouteObject('/popover', '弹窗', (context) => DialogView()),
    RouteObject('/toast', 'Toast', (context) => YlToastDemoPage()),
    RouteObject('/floating_bottom', 'YlFloatingBottom',
        (context) => FloatingBottomView()),
    RouteObject(
      '/loading_indicator',
      '加载指示器',
      (context) => LoadingIndicatorView(),
    ),
    RouteObject(
      '/tabs',
      'Tabs',
      (context) => TabsView(),
    ),
    RouteObject(
      '/appbar',
      '导航栏',
      (context) => AppBarView(),
    ),
    RouteObject(
      '/bottom_tabbar',
      '底部导航栏',
      (context) => BottomTabbarView(),
    ),
    RouteObject(
      '/form_view',
      '表单',
      (context) => FormView(),
    ),
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
