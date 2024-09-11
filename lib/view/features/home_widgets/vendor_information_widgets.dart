import 'package:flutter/material.dart';
import '../../../view_model/utils/export_utls.dart';

class VendorInformationWidget extends StatelessWidget {
  final String vendorName;
  final String vendorLocation;
  final String vendorPhone;

  const VendorInformationWidget({
    super.key,
    required this.vendorName,
    required this.vendorLocation,
    required this.vendorPhone,
  });

  @override
  Widget build(BuildContext context) {
    final containerWidth = sizewidth(context) * 0.9;
    final containerHeight = sizeHeight(context) * 0.12;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Vendor Information",
          style: TextStyle(
            fontSize: 14,
            fontWeight: AppFontWeight.semiBold,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: sizeHeight(context) * 0.01,
          ),
          child: Container(
            width: containerWidth,
            height: containerHeight,
            decoration: BoxDecoration(
              color: AppColor.darkGray.withOpacity(.3),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: sizewidth(context) * 0.03,
                vertical: sizeHeight(context) * 0.01,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sold By",
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          vendorName,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: AppFontWeight.semiBold,
                          ),
                        ),
                        Text(
                          vendorLocation,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          vendorPhone,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: sizewidth(context) * 0.02),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.message,
                      color: AppColor.white,
                      size: 16,
                    ),
                    label: Text(
                      "Message",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColor.white,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: AppColor.primary,
                      padding: EdgeInsets.symmetric(
                        horizontal: sizewidth(context) * 0.03,
                        vertical: sizeHeight(context) * 0.01,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
