import 'package:flutter/material.dart';
import 'package:softbenz/view_model/utils/export_utls.dart';

class VariantsWidgets extends StatelessWidget {
  final String typeName;
  final List<String> valueNames;

  const VariantsWidgets({
    super.key,
    required this.typeName,
    required this.valueNames,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: sizeHeight(context) * 0.008),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            typeName.toUpperCase(),
            style: TextStyle(fontSize: 16, fontWeight: AppFontWeight.semiBold),
          ),
          SizedBox(width: 8),
          Row(
            children: valueNames.map((valueName) {
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.primary.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: sizewidth(context) * 0.04,
                        vertical: sizeHeight(context) * 0.001),
                    child: Center(
                      child: Text(
                        valueName,
                        style: TextStyle(
                            color: AppColor.primary,
                            fontSize: 14,
                            fontWeight: AppFontWeight.semiBold),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
