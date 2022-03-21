import 'package:example/views/action_sheet_demo.dart';
import 'package:example/views/appbar/appbar_view.dart';
import 'package:example/views/button_group_demo.dart';
import 'package:example/views/button_view.dart';
import 'package:example/views/checkbox_view.dart';
import 'package:example/views/color_view.dart';
import 'package:example/views/confirm_view.dart';
import 'package:example/views/dialog_demo.dart';
import 'package:example/views/floating_bottom_view.dart';
import 'package:example/views/font_view.dart';
import 'package:example/views/loading_indicator_view.dart';
import 'package:example/views/popover_demo.dart';
import 'package:example/views/radiobox_view.dart';
import 'package:example/views/rich_dialog_demo.dart';
import 'package:example/views/sliding_up_panel_demo.dart';
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
    RouteObject('/checkbox', '多选', (context) => CheckboxView()),
    RouteObject('/radiobox', '单选', (context) => RadioboxView()),
    RouteObject('/confirm', 'YlConfirm', (context) => ConfirmView()),
    RouteObject('/popover', 'YlPopover', (context) => PopoverDemoPage()),
    RouteObject('/button', '按钮', (context) => ButtonView()),
    RouteObject(
        '/button/group', 'YlButtonGroup', (context) => ButtonGroupDemoPage()),
    RouteObject('/toast', 'Toast', (context) => YlToastDemoPage()),
    RouteObject('/floating_bottom', 'YlFloatingBottom',
        (context) => FloatingBottomView()),
    RouteObject('/dialog', 'YlDialog', (context) => DialogDemoPage()),
    RouteObject(
        '/action_sheet', 'YlActionSheet', (context) => ActionSheetDemoPage()),
    RouteObject('/dialog/rich', 'YlRichDialog', (context) => RichDialogDemo()),
    RouteObject('/sliding_up_panel', 'YlSlidingUpPanel',
        (context) => SlidingUpPanelDemo()),
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
