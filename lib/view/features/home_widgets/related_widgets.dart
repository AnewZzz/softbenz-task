import 'package:flutter/material.dart';
import 'package:softbenz/view_model/utils/export_utls.dart';

class RelatedWidget extends StatelessWidget {
  final double discount;
  final String productName;
  final int price;
  final int strikePrice;
  final String productImage;
  const RelatedWidget({
    super.key,
    required this.discount,
    required this.productName,
    required this.price,
    required this.strikePrice,
    required this.productImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizewidth(context) * 0.4,
      height: sizeHeight(context) * 0.25,
      decoration: BoxDecoration(
        color: AppColor.darkGray.withOpacity(.15),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColor.darkGray.withOpacity(.2),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Image.network(
                  productImage,
                  height: sizeHeight(context) * 0.4,
                  width: sizewidth(context),
                  fit: BoxFit.cover, // Adjusts image scaling
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      discount.toString(),
                      style: const TextStyle(
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Text and price section
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productName,
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColor.black,
                      fontWeight: AppFontWeight.semiBold,
                    ),
                    maxLines: 2, // Limit to 2 lines for clean display
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Rs.",
                        style: TextStyle(
                          color: AppColor.red,
                          fontWeight: AppFontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        price.toString(),
                        style: const TextStyle(
                          color: AppColor.red,
                          fontWeight: AppFontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        width: sizewidth(context) * 0.03,
                      ),
                      Text(
                        strikePrice.toString(),
                        style: const TextStyle(
                          color: AppColor.red,
                          fontWeight: AppFontWeight.regular,
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
