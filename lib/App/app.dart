import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:healthapp/Bloc/auth_bloc/auth_bloc.dart';
import 'package:healthapp/Bloc/health_bloc/health_bloc.dart';
import 'package:healthapp/Bloc/main_bloc/main_bloc.dart';
import 'package:healthapp/Core/Constants/app_colors.dart';
import 'package:healthapp/Screens/Splash/splash_screen.dart';

import 'package:sizer/sizer.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MultiBlocProvider(
          providers: [
            // BlocProvider(
            //   create: (context) => AppLanguageBloc()..add(InitLanguage()),
            // ),

            // BlocProvider(
            //   create: (context) => ConnectivityBloc(),
            // ),
            // BlocProvider(
            //   create: (context) => AuthBloc(),
            // ),
            BlocProvider(
              create: (context) => MainBloc(),
            ),
            BlocProvider(
              create: (context) => HealthBloc(),
            ),
          ],
          child: MaterialApp(
              title: "",
              color: AppColors.primaryColor,
              debugShowCheckedModeBanner: false,
              navigatorKey: navigatorKey,
              home: const SplashScreen())),
    );
  }
}
