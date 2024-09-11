import 'package:dio/dio.dart'; // Import from dio, not get_connect
import 'package:softbenz/model/controller/api_base.dart';
import 'package:softbenz/model/controller/api_endpoints.dart';

class BaseRequest extends ApiBase {
  Future<Response> getHomeDatas() async {
    final response = await getRequestWithoutToken(path: ApiEndpoints.home);
    print(response);
    return response;
  }
}
