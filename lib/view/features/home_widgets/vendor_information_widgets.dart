import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
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
                    onPressed: () {
                      _showBottomSheet(context);
                    },
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

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(sizewidth(context) * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Contact Vendor",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColor.primary,
                  fontWeight: AppFontWeight.bold,
                ),
              ),
              SizedBox(height: sizeHeight(context) * 0.02),
              Text(
                "Send a message to the vendor",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: AppFontWeight.semiBold,
                ),
              ),
              SizedBox(height: sizeHeight(context) * 0.02),
              TextField(
                decoration: InputDecoration(
                  labelText: "write a message for vendor",
                  labelStyle: TextStyle(fontSize: 12, color: AppColor.darkGray),
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              SizedBox(height: sizeHeight(context) * 0.02),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Send",
                  style: TextStyle(color: AppColor.white),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: sizeHeight(context) * 0.015,
                    horizontal: sizewidth(context) * 0.1,
                  ),
                  backgroundColor: AppColor.primary,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
