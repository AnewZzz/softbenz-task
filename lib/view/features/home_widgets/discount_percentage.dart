import 'package:flutter/material.dart';

import '../../../view_model/utils/export_utls.dart';

class DisctountPercentageWidget extends StatelessWidget {
  final double discount;
  const DisctountPercentageWidget({
    super.key,
    required this.discountPercentage,
    required this.discount,
  });

  final double? discountPercentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColor.white.withOpacity(0.2)),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: sizeHeight(context) * 0.003,
              horizontal: sizewidth(context) * 0.02),
          child: Text(
            discountPercentage != null ? "${discount} %" : "0 %",
            style: TextStyle(
                color: AppColor.white,
                fontSize: 14,
                fontWeight: AppFontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
