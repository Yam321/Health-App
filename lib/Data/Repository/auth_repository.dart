import 'package:dio/dio.dart';
import 'package:healthapp/Services/Helper/api_result.dart';
import 'package:healthapp/Services/Network/dio_api_service.dart';
import 'package:healthapp/Services/Helper/error_api_handler.dart';
import 'package:healthapp/Services/Network/urls_api.dart';

class AuthRepository {
  DioApiService dioApiService = DioApiService();
  Future<ApiResult> signUp(
      {required String firstName,
      required String username,
      required String password,
      required int height,
      required int weight,
      required int gender,
      required int age}) async {
    try {
      Response response = await dioApiService.postData(
        UrlsApi.signUpApi,
        data: {
          "first_name": firstName,
          "last_name": "127",
          "username": username,
          "password": password,
          "age": age,
          "height": height,
          "weight": weight,
          "gender": gender
        },
      );
      return ApiResult.withSuccess(response);
    } catch (error) {
      return ApiResult.withError(ErrorApiHandler.getErrorMessage(error));
    }
  }

  Future<ApiResult> logIn(
      {required String userName, required String password}) async {
    try {
      Response response = await dioApiService.postData(UrlsApi.logInApi,
          data: {"username": userName, "password": password});
      return ApiResult.withSuccess(response);
    } catch (error) {
      return ApiResult.withError(ErrorApiHandler.getErrorMessage(error));
    }
  }
}
