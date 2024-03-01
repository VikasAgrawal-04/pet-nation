import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Ratings extends StatelessWidget {
  final double rating;
  final bool ignoreGestures;
  final Function(double value) onChange;
  const Ratings(
      {required this.rating,
      this.ignoreGestures = true,
      required this.onChange,
      super.key});

  @override
  Widget build(BuildContext context) {
    return RatingBar(
        direction: Axis.horizontal,
        allowHalfRating: true,
        ignoreGestures: ignoreGestures,
        itemCount: 5,
        initialRating: rating,
        itemSize: 2.h,
        ratingWidget: RatingWidget(
            full: SvgPicture.asset(
              'assets/icons/full_star.svg',
            ),
            half: SvgPicture.asset(
              'assets/icons/half-star.svg',
            ),
            empty: SvgPicture.asset(
              'assets/icons/empty_star.svg',
            )),
        onRatingUpdate: onChange);
  }
}
