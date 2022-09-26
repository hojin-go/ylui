import 'package:flutter/widgets.dart';

Image getImageFromAssets(
  String name, {
  String ext = 'png',
  Color? color,
  double? width,
  double? height,
  BoxFit? fit,
}) {
  return Image.asset(
    'lib/assets/$name.$ext',
    package: 'flutter_ylui',
    color: color,
    width: width,
    height: height,
    fit: fit,
  );
}
