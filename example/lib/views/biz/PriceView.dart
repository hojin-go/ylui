import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

class PriceViewDemo extends StatefulWidget {
  const PriceViewDemo({Key? key}) : super(key: key);

  @override
  State<PriceViewDemo> createState() => _PriceViewDemoState();
}

class _PriceViewDemoState extends State<PriceViewDemo> {
  YlPriceSize _size = YlPriceSize.small;
  bool _camel = true;
  @override
  Widget build(BuildContext context) {
    final priceList = [
      '¥0.00',
      '¥0.50',
      '¥1.00',
      '¥10.50',
      '¥100.00万',
      '¥1000.00万',
      '¥19000.00元',
      '¥108765.00元',
      '¥1999999.0元',
      '¥10007467.00元',
      '¥99.12—¥123.45元/月',
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
                child: CupertinoSegmentedControl<YlPriceSize>(
                  children: {
                    YlPriceSize.small: Text('small'),
                    YlPriceSize.medium: Text('medium'),
                    YlPriceSize.large: Text('large'),
                    YlPriceSize.xLarge: Text('xLarge'),
                  },
                  onValueChanged: (size) {
                    setState(() {
                      _size = size;
                    });
                  },
                  groupValue: _size,
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
                  // bold: true,
                  camel: _camel,
                  // debugColor: true,
                  short: true,
                  size: _size,
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
