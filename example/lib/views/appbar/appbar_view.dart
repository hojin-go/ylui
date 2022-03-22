import 'package:example/views/componnets/demo_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: 'AppBarView',
      contentPadding: EdgeInsets.zero,
      backgroundColor: YlColors.background,
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 20),
        children: [
          YlAppBar(
            title: Text('选择远程工作原因原因原因'),
            leading: YlAppBarBackButton(
              backgroundColor: Colors.yellow[100],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          YlAppBar(
            title: Text('选择远程工作原因'),
            leading: YlAppBarBackButton(
              backgroundColor: Colors.yellow[100],
            ),
            actions: [
              YlAppBarButton(
                backgroundColor: Colors.green[100],
                child: YlButton.fromType(
                  size: YlButtonSize.small,
                  type: YlButtonType.primary,
                  child: Text('保存'),
                  onPressed: () {},
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          YlAppBar(
            title: Text('圆领官方'),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.red,
            leading: YlAppBarBackButton(),
            actions: [
              YlAppBarButton(
                child: Icon(CupertinoIcons.ellipsis),
                backgroundColor: Colors.pink[100],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          YlAppBar(
            leading: YlAppBarBackButton(
              backgroundColor: Colors.yellow[100],
            ),
            actions: [
              YlAppBarButton(
                child: Icon(
                  CupertinoIcons.chart_pie,
                ),
                backgroundColor: Colors.yellow[100],
              ),
              YlAppBarButton(
                child: Icon(CupertinoIcons.share),
                backgroundColor: Colors.red[100],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
