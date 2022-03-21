import 'package:flutter/widgets.dart';

Image getImageFromAssets(
  String name, {
  String ext = 'png',
  Color? color,
}) {
  return Image.asset(
    'lib/assets/$name.$ext',
    package: 'flutter_ylui',
    color: color,
  );
}
