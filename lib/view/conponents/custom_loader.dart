import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:softbenz/view_model/utils/colors.dart';
import 'package:softbenz/view_model/utils/custome_image.dart';

import '../../view_model/utils/constant.dart';

class CustomLoader extends StatefulWidget {
  const CustomLoader({super.key});

  @override
  State<CustomLoader> createState() => _CustomLoaderState();
}

class _CustomLoaderState extends State<CustomLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            backgroundColor: AppColor.black,
            radius: 20.h,
            backgroundImage: const AssetImage(
              CustomImageGetter.logo,
            ),
          ),
          SizedBox(
            height: 50.h,
            width: 50.w,
            child: CircularProgressIndicator(
              valueColor: const AlwaysStoppedAnimation<Color>(AppColor.black),
              strokeWidth: 1.w,
            ),
          ),
        ],
      ),
      // ),
    );
  }
}
