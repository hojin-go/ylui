import 'package:flutter/material.dart';

import 'views/appbar/appbar_view.dart';
import 'views/biz/PriceView.dart';
import 'views/button/button_demo.dart';
import 'views/color_view.dart';
import 'views/dialog/dialog_view.dart';
import 'views/floating_bottom_view.dart';
import 'views/font_view.dart';
import 'views/form/form_view.dart';
import 'views/loading_indicator_view.dart';
import 'views/selector/selector_view.dart';
import 'views/stepper_view.dart';
import 'views/tabs/bottom_tabbar_view.dart';
import 'views/tabs/tabs_view.dart';
import 'views/yl_toast_demo.dart';

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
        '/loading_indicator', '加载指示器', (context) => LoadingIndicatorView()),
    RouteObject('/tabs', 'Tabs', (context) => TabsView()),
    RouteObject('/appbar', '导航栏', (context) => AppBarView()),
    RouteObject('/bottom_tabbar', '底部导航栏', (context) => BottomTabbarView()),
    RouteObject('/form_view', '表单', (context) => FormView()),
    RouteObject('/biz/price', '价格组件', (context) => PriceViewDemo()),
    RouteObject('/widget/stepper', '步进器', (context) => StepperView())
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
