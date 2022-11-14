import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_ylui/flutter_ylui.dart';
import 'package:flutter_ylui/src/helper.dart';

class YlRatingBar extends StatelessWidget {
  final double itemWidth;
  final double initialRating;
  final void Function(double rating) onRatingUpdate;
  final String Function(double rating)? getLabel;
  const YlRatingBar({
    Key? key,
    required this.itemWidth,
    required this.onRatingUpdate,
    required this.initialRating,
    this.getLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    children.add(RatingBar(
      initialRating: initialRating,
      allowHalfRating: false,
      itemCount: 5,
      itemSize: itemWidth > 32 ? 32 : itemWidth,
      // glowColor: Colors.white,
      glow: false,
      ratingWidget: RatingWidget(
        full: getImageFromAssets('star'),
        half: getImageFromAssets('star'),
        empty: getImageFromAssets('star_empty'),
      ),
      itemPadding: const EdgeInsets.symmetric(horizontal: 3),
      onRatingUpdate: onRatingUpdate,
    ));

    if (getLabel != null) {
      children.add(
        const SizedBox(width: 20),
      );
      children.add(Text(
        getLabel!.call(initialRating),
        style: const TextStyle(
          fontSize: 14,
          color: YlColors.black30,
        ),
      ));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }
}
