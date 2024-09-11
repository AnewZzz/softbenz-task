import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:softbenz/view_model/utils/export_utls.dart';

class CarouselWidget extends StatelessWidget {
  final List<String> imagesList;
  final bool autoPlay;
  final bool indicator;
  final int input;
  final Function(int, CarouselPageChangedReason)? onPageChanged;
  final BoxFit? fit;
  final void Function()? onTap;
  final double? aspectRatio;
  final List<Widget>? images;
  final double? viewportFraction;

  const CarouselWidget({
    Key? key,
    required this.imagesList,
    this.autoPlay = false,
    this.indicator = true,
    required this.input,
    this.onPageChanged,
    this.fit,
    this.onTap,
    this.aspectRatio,
    this.images,
    this.viewportFraction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        InkWell(
          onTap: onTap,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(),
            child: CarouselSlider(
              items: images ??
                  imagesList
                      .map(
                        (e) => ClipRRect(
                          borderRadius: BorderRadius.only(),
                          child: Image.network(
                            e,
                            fit: fit ?? BoxFit.contain,
                          ),
                        ),
                      )
                      .toList(),
              options: CarouselOptions(
                autoPlay: autoPlay,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                aspectRatio: aspectRatio ?? 1.78,
                viewportFraction: viewportFraction ?? 1,
                initialPage: input,
                onPageChanged: onPageChanged,
              ),
            ),
          ),
        ),
        indicator
            ? Positioned(
                bottom: 20,
                child: Row(
                  children: List.generate(imagesList.length, (index) {
                    bool isSelected = index == input;
                    return Container(
                      margin: const EdgeInsets.only(right: 3),
                      height: 5,
                      width: isSelected ? 17 : 9,
                      decoration: BoxDecoration(
                          color:
                              isSelected ? AppColor.primary : AppColor.darkGray,
                          borderRadius: BorderRadius.circular(2.5)),
                    );
                  }),
                ))
            : const SizedBox.shrink(),
      ],
    );
  }
}
