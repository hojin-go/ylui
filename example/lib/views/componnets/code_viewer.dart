import 'package:example/views/componnets/demo_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ylui/flutter_ylui.dart';
import 'package:widget_with_codeview/source_code_view.dart';

class CodeViewerPage extends StatelessWidget {
  final String filePath;

  const CodeViewerPage({Key key, this.filePath}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DemoPage(
      title: '源码',
      contentPadding: EdgeInsets.zero,
      child: DefaultTextStyle(
        style: YlTextStyles.caption,
        child: SourceCodeView(
          filePath: filePath,
        ),
      ),
    );
  }
}
