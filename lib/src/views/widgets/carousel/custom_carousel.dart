import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_nations/src/views/widgets/indicator/dot_indicator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomCarousel extends StatefulWidget {
  final List<String> images;
  final Function(int index) onTap;
  final double? width;
  final BoxFit? fit;
  const CustomCarousel(
      {required this.images,
      this.width,
      required this.onTap,
      this.fit,
      super.key});

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  final initialImg = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.images.length,
          itemBuilder: (context, i, j) {
            final img = widget.images[i];
            return GestureDetector(
              onTap: () {
                widget.onTap(i);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  img,
                  width: widget.width ?? 100.w,
                  fit: widget.fit ?? BoxFit.fill,
                ),
              ),
            );
          },
          options: CarouselOptions(
              enableInfiniteScroll: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                initialImg.value = index;
              }),
        ),
        SizedBox(height: 1.h),
        DotIndicator(
          curIndex: initialImg,
          length: widget.images.length,
          color: true,
        )
      ],
    );
  }
}
