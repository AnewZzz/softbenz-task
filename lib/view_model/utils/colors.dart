import 'package:flutter/material.dart';

class AppColor {
  static const Color primary = Color(0XFFFF6A04);
  static const Color primary1 = Color(0XFF1CAC90);
  static const Color white = Color(0XFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color red = Color(0xFFD70909);
  static const Color darkGray = Color(0XFFA9A9A9);
  static const Color darkCharcoal = Color(0XFF2F2E2E);
}

double sizeHeight(BuildContext context) {
  var sizeHeight = MediaQuery.of(context).size.height;
  return sizeHeight;
}

double sizewidth(BuildContext context) {
  var sizewidth = MediaQuery.of(context).size.width;
  return sizewidth;
}
