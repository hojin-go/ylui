import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class PriceViewDemo extends StatelessWidget {
  const PriceViewDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: YlAppBar(
        title: Text('PriceViewDemo'),
      ),
      backgroundColor: YlColors.white,
      body: ListView(
        children: [
          ListTile(
            title: YlPrice(
              prefix: '¥',
              price: '9.1278',
              suffix: '/周',
            ),
          ),
          ListTile(
            title: YlPrice(
              prefix: '\$',
              price: '1009.1278',
              suffix: '',
            ),
          ),
          ListTile(
            title: YlPrice(
              prefix: '¥',
              price: '1234567.89',
              suffix: '/周',
              showComma: true,
            ),
          ),
          ListTile(
            title: YlPrice(
              prefix: '¥',
              price: '1234567.00',
              suffix: '/周',
              showComma: true,
            ),
          ),
        ],
      ),
    );
  }
}
