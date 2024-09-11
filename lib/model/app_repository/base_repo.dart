import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:softbenz/model/app_models/user_model.dart';
import 'package:softbenz/model/app_requests/base_request.dart';
import '../../view/conponents/export_components.dart';

import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';

import '../controller/api_base.dart';

class BaseRepo {
  final BaseRequest _baseRequest = BaseRequest();

  EitherFunction<Data> getHomeDatas() async {
    loading();
    try {
      final response = await _baseRequest.getHomeDatas();
      BotToast.closeAllLoading();
      return right(Data.fromJson(response.data["data"]));
    } on DioException catch (e) {
      BotToast.closeAllLoading();
      return Left(e.response?.data["message"]);
    } catch (e) {
      BotToast.closeAllLoading();
      return left(e.toString());
    }
  }
}
