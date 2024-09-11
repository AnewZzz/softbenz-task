import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:softbenz/view/features/home_widgets/export_widgets.dart';

import '../../../view_model/utils/export_utls.dart';

class ReviewtabWidgets extends StatelessWidget {
  final String productImage;
  const ReviewtabWidgets({
    super.key,
    required this.productImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: sizeHeight(context) * 0.02,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Text(
                  "Rating & Reviews",
                  style:
                      TextStyle(fontSize: 14, fontWeight: AppFontWeight.bold),
                ),
                Text(
                  "( 79 )",
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
            Row(
              children: [
                const Text(
                  '4.4',
                  style: TextStyle(
                      fontSize: 12, fontWeight: AppFontWeight.semiBold),
                ),
                SizedBox(
                  width: sizewidth(context) * .01,
                ),
                RatingBar.builder(
                  initialRating: 4.4,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 14,
                  unratedColor: AppColor.darkGray.withOpacity(.7),
                  itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
              ],
            ),
          ],
        ),
        ReviewWidgets(images: productImage),
        ReviewWidgets(images: productImage),
        ReviewWidgets(images: productImage),
        ReviewWidgets(images: productImage),
        ReviewWidgets(images: productImage),
      ],
    );
  }
}
