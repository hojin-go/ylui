import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class PriceViewDemo extends StatefulWidget {
  const PriceViewDemo({Key? key}) : super(key: key);

  @override
  State<PriceViewDemo> createState() => _PriceViewDemoState();
}

class _PriceViewDemoState extends State<PriceViewDemo> {
  int _fontSize = 18;
  bool _camel = true;
  @override
  Widget build(BuildContext context) {
    final priceList = [
      '¥0.00',
      '¥0.50',
      '¥1.00',
      '¥10.50',
      '¥100.00/周',
      '¥1000.00/月',
      '¥19000.00/年',
      '¥108765.00/年',
      '¥1000000.00/年',
      '¥10007467.00/年',
      '¥99.12-¥123.45/月',
    ];
    return Scaffold(
      appBar: YlAppBar(
        title: Text('PriceViewDemo'),
      ),
      backgroundColor: YlColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text('    字号'),
              Expanded(
                child: CupertinoSegmentedControl<int>(
                  children: {
                    18: Text('18'),
                    20: Text('20'),
                    26: Text('26'),
                    28: Text('28'),
                  },
                  onValueChanged: (fontSize) {
                    setState(() {
                      _fontSize = fontSize;
                    });
                  },
                  groupValue: _fontSize,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text('    驼峰样式'),
              Expanded(
                child: CupertinoSegmentedControl<bool>(
                  children: {
                    true: Text('是'),
                    false: Text('否'),
                  },
                  onValueChanged: (style) {
                    setState(() {
                      _camel = style;
                    });
                  },
                  groupValue: _camel,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (ctx, index) => ListTile(
                title: YlPrice(
                  price: priceList[index],
                  size: _fontSize.toDouble(),
                  bold: true,
                  camel: _camel,
                ),
              ),
              separatorBuilder: (ctx, index) => Divider(
                height: 1,
              ),
              itemCount: priceList.length,
            ),
          ),
        ],
      ),
    );
  }
}
