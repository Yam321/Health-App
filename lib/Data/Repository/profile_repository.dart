
import 'package:dio/dio.dart';
import 'package:healthapp/Services/Helper/api_result.dart';
import 'package:healthapp/Services/Helper/error_api_handler.dart';
import 'package:healthapp/Services/Network/dio_api_service.dart';
import 'package:healthapp/Services/Network/urls_api.dart';
import 'package:healthapp/Util/SharedPreferences/SharedPreferencesHelper.dart';

class ProfileRepository {
  DioApiService dioApiService = DioApiService();

  Future<ApiResult> getMyProfile() async {
    try {
      Response response = await dioApiService.getData(
        UrlsApi.profileApi,
        options: Options(headers: {
          "Authorization": "Bearer ${AppSharedPreferences.getToken}"
        }),
      );
      return ApiResult.withSuccess(response);
    } catch (error) {
      return ApiResult.withError(ErrorApiHandler.getErrorMessage(error));
    }
  }

  Future<ApiResult> editProfile() async {
    // final Map<String, dynamic> editProfile = <String, dynamic>{};
    // editProfile['fullName'] = player.fullName;
    // editProfile['phoneNumber'] = player.phoneNumber;
    // editProfile['email'] = player.email;

    // editProfile['nationality'] = player.nationality;
    // editProfile['age'] = player.age;
    // if (player.playerNumber != null) {
    //   editProfile['playerNumber'] = player.playerNumber;
    // }
    // if (player.placeOfPlayer != null) {
    //   editProfile['placeOfPlayer'] = player.placeOfPlayer;
    // }
    // if (player.fileImage != null) {
    //   editProfile['image'] = await MultipartFile.fromFile(
    //     player.fileImage!.path,
    //     filename: player.fileImage!.path,
    //   );
    // }
    // FormData editProfileFormData = FormData.fromMap(editProfile);
    try {
      Response response = await dioApiService.postData(
        UrlsApi.editProfileApi,
        // data: editProfileFormData,
        options: Options(headers: {
          "Authorization": "Bearer ${AppSharedPreferences.getToken}"
        }),
      );
      return ApiResult.withSuccess(response);
    } catch (error) {
      return ApiResult.withError(ErrorApiHandler.getErrorMessage(error));
    }
  }
}
