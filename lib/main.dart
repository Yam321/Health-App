import 'package:flutter/material.dart';
import 'package:healthapp/App/app.dart';
import 'package:healthapp/Util/SharedPreferences/SharedPreferencesHelper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppSharedPreferences.init();
  // await DioApiService.init();

  debugPrint("token is ${AppSharedPreferences.getToken}");

  runApp(const MyApp());
}
