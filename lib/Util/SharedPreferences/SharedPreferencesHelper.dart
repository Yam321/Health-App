


import 'SharedPreferencesProvider.dart';

class AppSharedPreferences {
  static SharedPreferencesProvider? sharedPreferencesProvider;
  static init() async {
    sharedPreferencesProvider = await SharedPreferencesProvider.getInstance();
  }

  //token
  static String get getToken =>
      sharedPreferencesProvider!.read('token') ?? '';
  static saveToken(String value) =>
      sharedPreferencesProvider!.save('token', value);
  static bool get hasToken =>
      sharedPreferencesProvider!.contains('token');
  static removeToken() => sharedPreferencesProvider!.remove('token');


    //UserId
  static int get getUserId =>
      sharedPreferencesProvider!.read('userId') ?? -1;
  static saveUserId (int value) =>
      sharedPreferencesProvider!.save('userId', value);
  static bool get hasUserId  =>
      sharedPreferencesProvider!.contains('userId');
  static removeUserId () => sharedPreferencesProvider!.remove('userId');









  //lang
  static String get getArLang =>
      sharedPreferencesProvider!.read('lang') ?? "en";
  static saveArLang(String value) =>
      sharedPreferencesProvider!.save('lang', value);
  static bool get hasArLang =>
      sharedPreferencesProvider!.contains('lang');
  static removeArLang() =>
      sharedPreferencesProvider!.remove('lang');
  //theme
  // static bool get getDarkTheme => sharedPreferencesProvider!.read(AppStrings.darkTheme) ??  false ;
  // static saveDarkTheme(bool value) => sharedPreferencesProvider!.save(AppStrings.darkTheme, value);
  // static bool get hasDarkTheme => sharedPreferencesProvider!.contains(AppStrings.darkTheme);
  // static removeDarkTheme() => sharedPreferencesProvider!.remove(AppStrings.darkTheme);
}
