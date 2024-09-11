import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:softbenz/view/conponents/custom_loader.dart';
import 'package:softbenz/view_model/utils/colors.dart';

loading() {
  BotToast.showCustomLoading(toastBuilder: (func) {
    return const CustomLoader();
  });
}

showBotToast({
  required String text,
  bool isError = false,
}) {
  return BotToast.showText(
      text: text,
      clickClose: true,
      contentColor: isError
          ? Colors.red.withOpacity(0.75)
          : Colors.green.withOpacity(0.75),
      textStyle: const TextStyle(
          fontWeight: FontWeight.w600, color: AppColor.white, fontSize: 14),
      duration: const Duration(seconds: 3));
}
