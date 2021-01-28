import 'package:flutter/material.dart';

import 'package:flutter_ylkit/flutter_ylkit.dart';

class PopoverView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: YlBackButton(),
        title: Text('Popover'),
      ),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => showModalBottomSheet(
            clipBehavior: Clip.antiAlias,
            barrierColor: Colors.yellow.shade50.withOpacity(0.12),
            elevation: 0,
            backgroundColor: YlColors.transparent,
            context: context,
            builder: (context) => Container(child: YlPopover()),
          ),
        ),
      ),
    );
  }
}
