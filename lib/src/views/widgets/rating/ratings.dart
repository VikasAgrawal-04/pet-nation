import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Ratings extends StatelessWidget {
  const Ratings({
    required this.rating,
    required this.onChange,
    this.ignoreGestures = true,
    super.key,
  });
  final double rating;
  final bool ignoreGestures;
  final void Function(double value) onChange;

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      allowHalfRating: true,
      ignoreGestures: ignoreGestures,
      initialRating: rating,
      itemSize: 2.h,
      ratingWidget: RatingWidget(
        full: SvgPicture.asset(
          'assets/icons/full_star.svg',
        ),
        half: SvgPicture.asset(
          'assets/icons/half_star.svg',
        ),
        empty: SvgPicture.asset(
          'assets/icons/empty_star.svg',
        ),
      ),
      onRatingUpdate: onChange,
    );
  }
}
