import 'package:flutter/material.dart';
import 'package:flutter_ylui/src/yl_color.dart';
import 'package:flutter_ylui/src/yl_text_style.dart';

import '../yl_tap_detector.dart';

class ExpandedRichText extends StatefulWidget {
  final int maxLines;
  final InlineSpan textSpan;
  final String? foldText;
  final String? unfoldText;

  const ExpandedRichText({
    Key? key,
    required this.maxLines,
    required this.textSpan,
    this.foldText,
    this.unfoldText,
  }) : super(key: key);

  @override
  State<ExpandedRichText> createState() => _ExpandedRichTextState();
}

class _ExpandedRichTextState extends State<ExpandedRichText> {
  bool _textFold = true;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      final tp = TextPainter(
        text: widget.textSpan,
        maxLines: widget.maxLines,
        textDirection: TextDirection.ltr,
      );
      tp.layout(maxWidth: constrains.maxWidth);

      if (tp.didExceedMaxLines) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RichText(
              text: widget.textSpan,
              maxLines: _textFold ? widget.maxLines : null,
              overflow: _textFold ? TextOverflow.ellipsis : TextOverflow.clip,
            ),
            YlTapDetector(
              onTap: () {
                setState(() {
                  _textFold = !_textFold;
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  _textFold
                      ? (widget.unfoldText ?? '展开更多')
                      : (widget.foldText ?? '收起'),
                  style: YlTextStyles.n12(color: YlColors.lanehubBlue),
                ),
              ),
            ),
          ],
        );
      } else {
        return RichText(
          text: widget.textSpan,
          maxLines: null,
        );
      }
    });
  }
}
