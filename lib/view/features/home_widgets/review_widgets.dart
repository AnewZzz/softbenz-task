import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../view_model/utils/export_utls.dart';

class ReviewWidgets extends StatelessWidget {
  final String images;
  const ReviewWidgets({
    super.key,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: sizeHeight(context) * 0.01),
      child: Container(
        width: sizewidth(context),
        height: sizeHeight(context) * .11,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColor.darkGray.withOpacity(0.25),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: sizeHeight(context) * .01,
              horizontal: sizewidth(context) * 0.02),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "static rating text because there is no rating api but its requried at the task, random text bla bla bla bla",
                      style: TextStyle(
                        fontSize: 10,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: sizeHeight(context) * 0.005,
                    ),
                    RatingBar.builder(
                      initialRating: 4.4,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 14,
                      unratedColor: AppColor.darkGray.withOpacity(.7),
                      itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Image.network(images)),
                    ),
                    Expanded(
                      child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Image.network(images)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
