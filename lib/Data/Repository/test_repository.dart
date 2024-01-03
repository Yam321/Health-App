import 'package:dio/dio.dart';
import 'package:healthapp/Services/Helper/api_result.dart';
import 'package:healthapp/Services/Network/dio_api_service.dart';
import 'package:healthapp/Services/Helper/error_api_handler.dart';

class TestRepo {
  DioApiService dioApiService = DioApiService();

  Future<ApiResult> getDataTest() async {
    try {
      Response response = await dioApiService.getData(
        "UrlsApi.api",
        queryParameters: {},
      );
      return ApiResult.withSuccess(response);
    } catch (error) {
      return ApiResult.withError(ErrorApiHandler.getErrorMessage(error));
    }
  }

  Future<ApiResult> postDataTest() async {
    try {
      Response response = await dioApiService.postData("UrlsApi.api",
          queryParameters: {}, data: {});
      return ApiResult.withSuccess(response);
    } catch (error) {
      return ApiResult.withError(ErrorApiHandler.getErrorMessage(error));
    }
  }
}
