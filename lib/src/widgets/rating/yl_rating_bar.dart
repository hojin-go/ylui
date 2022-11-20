import 'package:flutter/material.dart';
import 'package:flutter_ylui/flutter_ylui.dart';
import 'package:flutter_ylui/src/helper.dart';

import 'custom_rating_bar.dart';

class YlRatingBar extends StatelessWidget {
  final double itemWidth;
  final double initialRating;
  final double minRating;
  final void Function(double rating) onRatingUpdate;
  final VoidCallback? onRatingLess;
  final String Function(double rating)? getLabel;
  const YlRatingBar({
    Key? key,
    required this.itemWidth,
    required this.onRatingUpdate,
    required this.initialRating,
    this.getLabel,
    this.onRatingLess,
    this.minRating = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    children.add(CustomRatingBar(
      initialRating: initialRating,
      allowHalfRating: false,
      itemCount: 5,
      itemSize: itemWidth > 32 ? 32 : itemWidth,
      // glowColor: Colors.white,
      glow: false,
      ratingWidget: CustomRatingWidget(
        full: Container(
          child: getImageFromAssets('star'),
          color: Colors.white,
        ),
        half: Container(
          child: getImageFromAssets('star'),
          color: Colors.white,
        ),
        empty: Container(
          child: getImageFromAssets('star_empty'),
          color: Colors.white,
        ),
      ),
      itemPadding: const EdgeInsets.symmetric(horizontal: 3),
      onRatingUpdate: onRatingUpdate,
      minRating: minRating,
      onRatingLessThanMin: onRatingLess,
    ));

    if (getLabel != null) {
      children.add(
        const SizedBox(width: 20),
      );
      children.add(Container(
          color: Colors.white,
          child: Text(
            getLabel!.call(initialRating),
            style: const TextStyle(
              fontSize: 14,
              color: YlColors.black30,
            ),
          )));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }
}
