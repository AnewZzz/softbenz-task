import 'dart:developer';
import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:softbenz/model/controller/api_endpoints.dart';
import 'package:softbenz/view_model/config/storage.dart';
import '../../view/conponents/export_components.dart';
import '../../view_model/utils/export_utls.dart';

import 'package:fpdart/fpdart.dart';

typedef EitherFunction<T> = Future<Either<String, T>>;

class ApiBase {
  static final _dio = Dio(BaseOptions(baseUrl: ApiEndpoints.home));

  var headerRequests = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'APP-KEY': 'ABCDEFGH'
  };

  static Future<void> _dioInterceptor() async {
    debugPrint("dddd");
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          debugPrint("${options.uri}");
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) async {
          CustomLog.error(e.toString());

          try {
            if (e.response?.statusCode == 404 ||
                e.response?.statusCode == 401) {
              // GoRouteNavigation().goRouter.push(LoginScreen.routeName);
              showBotToast(text: "${e.response?.statusMessage}", isError: true);
            } else if (e.response?.statusCode == 417) {
              // GoRouteNavigation().goRouter.push(CustomErrorPage.routeName,
              //     extra: const FlutterErrorDetails(
              //         exception: "Forbidden !! \n Permission not given "));
            } else if (e.response?.statusCode == 500) {
              // GoRouteNavigation().goRouter.push(CustomErrorPage.routeName,
              //     extra: const FlutterErrorDetails(exception: "Server Error"));
            } else if (e.response?.statusCode == 422) {
              BotToast.closeAllLoading();

              showBotToast(
                  text: "${e.response?.data["message"].first}", isError: true);
              debugPrint("${e.response}");
            }
          } catch (ew) {
            CustomLog.error(e.toString());
            handler.reject(e);
          }
        },
      ),
    );
  }

  Future<Response> getRequest({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    debugPrint("geeettttttttt inside heree");

    await _dioInterceptor();

    print(headerRequests);

    var response = await _dio.get(
      path,
      options: Options(
        headers: headerRequests,
      ),
      queryParameters: queryParameters,
    );
    return response;
  }

  Future<Response> getRequestWithoutToken({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    debugPrint("geeettttttttt");

    var response = await _dio.get(path, queryParameters: queryParameters);
    return response;
  }

  Future<Response> postRequestWithToken({
    required String path,
    required dynamic data,
  }) async {
    await _dioInterceptor();
    debugPrint("after interpreting");
    var response = await _dio.post(
      path,
      data: data,
      options: Options(
        headers: headerRequests,
      ),
    );

    debugPrint("$response");
    return response;
  }

  Future<Response> deleteWithToken({
    required String path,
    required dynamic data,
  }) async {
    await _dioInterceptor();
    debugPrint("after interpreting");
    var response = await _dio.delete(
      path,
      data: data,
      options: Options(
        headers: headerRequests,
      ),
    );

    debugPrint("$response");
    return response;
  }

  Future<Response> postRequestWithoutToken({
    required String path,
    required dynamic data,
  }) async {
    var response = await _dio.post(
      path,
      data: data,
    );

    debugPrint("\n$response");
    return response;
  }

  Future<Response> patchRequest({
    required String path,
    required dynamic data,
  }) async {
    print("Patchhh");

    await _dioInterceptor();
    debugPrint("after interpreting");
    var response = await _dio.patch(
      path,
      data: data,
      options: Options(
        headers: headerRequests,
      ),
    );

    debugPrint("$response");
    return response;
  }
}
