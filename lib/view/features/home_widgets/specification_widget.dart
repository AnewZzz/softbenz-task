import 'package:flutter/material.dart';

import '../../../view_model/utils/export_utls.dart';

class SpecificationWidgets extends StatelessWidget {
  final String type;
  final String value;
  const SpecificationWidgets({
    super.key,
    required this.type,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: sizeHeight(context) * .007),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            type,
            style: TextStyle(fontWeight: AppFontWeight.semiBold, fontSize: 12),
          ),
          SizedBox(
            width: sizeHeight(context) * .1,
          ),
          Center(
            child: Text(
              value,
              style: TextStyle(fontWeight: AppFontWeight.regular, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
