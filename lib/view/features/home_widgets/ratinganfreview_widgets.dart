import 'package:flutter/material.dart';

import '../../../view_model/utils/export_utls.dart';

class RatingandReviewWidget extends StatelessWidget {
  final String view;
  const RatingandReviewWidget({
    super.key,
    required this.view,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.yellow[700],
            ),
            SizedBox(
              width: sizewidth(context) * .01,
            ),
            Text(
              "4.4",
              style:
                  TextStyle(fontSize: 14, fontWeight: AppFontWeight.semiBold),
            ),
            SizedBox(
              width: sizewidth(context) * .03,
            ),
            Text(
              "125+",
              style:
                  TextStyle(fontSize: 14, fontWeight: AppFontWeight.semiBold),
            ),
            SizedBox(
              width: sizewidth(context) * 0.02,
            ),
            Text(
              "Review",
              style:
                  TextStyle(fontSize: 14, fontWeight: AppFontWeight.semiBold),
            )
          ],
        ),
        Row(children: [
          Icon(
            Icons.remove_red_eye_outlined,
            size: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: sizewidth(context) * .02),
            child: Text(
              view,
              style: TextStyle(
                  color: AppColor.black,
                  fontSize: 12,
                  fontWeight: AppFontWeight.semiBold),
            ),
          ),
          Text("View",
              style: TextStyle(
                  color: AppColor.black,
                  fontSize: 12,
                  fontWeight: AppFontWeight.semiBold))
        ])
      ],
    );
  }
}
