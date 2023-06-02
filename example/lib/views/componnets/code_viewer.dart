import 'package:flutter/cupertino.dart';
import 'package:flutter_ylui/flutter_ylui.dart';

import 'demo_page.dart';

class CodeViewerPage extends StatelessWidget {
  final String filePath;

  const CodeViewerPage({Key? key, required this.filePath}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: '源码',
      contentPadding: EdgeInsets.zero,
      child: DefaultTextStyle(
        style: YlTextStyles.caption1,
        child: Container(),
        // SourceCodeView(
        //   filePath: filePath,
        // ),
      ),
    );
  }
}
