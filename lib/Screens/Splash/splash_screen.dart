import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthapp/Bloc/health_bloc/health_bloc.dart';
import 'package:healthapp/Core/Constants/app_colors.dart';
import 'package:healthapp/Core/Dialogs/check_dialog.dart';
import 'package:healthapp/Screens/Auth/login_screen.dart';
import 'package:healthapp/Screens/Main/main_screen.dart';
import 'package:healthapp/Util/SharedPreferences/SharedPreferencesHelper.dart';
import 'package:healthapp/Widgets/health_logo.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<HealthBloc>().add(AuthorizeEvent());

    super.initState();
  }

  checkAuthorize() {
    print("check value is ${context.read<HealthBloc>().checked}");

    // if (context.read<HealthBloc>().checked) {
    //   Navigator.of(context).pushAndRemoveUntil(
    //     PageTransition(
    //         child: LogInScreen(),
    //         type: PageTransitionType.leftToRight,
    //         duration: const Duration(milliseconds: 400)),
    //     (route) => false,
    //   );
    // } else {
    //   checkDialog(context, onPressed: () {
    //     context.read<HealthBloc>().add(AuthorizeEvent());
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.seconedaryColor,
      body: MultiBlocListener(
        listeners: [
          // BlocListener<ConnectivityBloc, ConnectedState>(
          //   listener: (context, state) {
          //     if (state.message == "Connecting To Wifi") {
          //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //         backgroundColor: Colors.green,
          //         duration: const Duration(seconds: 5),
          //         content: Text(
          //           state.message,
          //         ),
          //       ));
          //     }
          //     if (state.message == "Connecting To Mobile Data") {
          //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //         backgroundColor: Colors.green,
          //         duration: const Duration(seconds: 5),
          //         content: Text(
          //           state.message,
          //         ),
          //       ));
          //     }
          //     if (state.message == "Lost Internet Connection") {
          //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //         backgroundColor: Colors.red,
          //         duration: const Duration(seconds: 5),
          //         content: Text(
          //           state.message,
          //         ),
          //       ));
          //     }
          //   },
          // ),
          BlocListener<HealthBloc, HealthState>(
            listener: (context, state) {
              if (state is HealthAuthorizeState) {
                if (AppSharedPreferences.hasToken) {
                  Navigator.of(context).pushAndRemoveUntil(
                    PageTransition(
                        child:const  MainScreen(),
                        type: PageTransitionType.leftToRight,
                        duration: const Duration(milliseconds: 400)),
                    (route) => false,
                  );
                } else {
                  Navigator.of(context).pushAndRemoveUntil(
                    PageTransition(
                        child: LogInScreen(),
                        type: PageTransitionType.leftToRight,
                        duration: const Duration(milliseconds: 400)),
                    (route) => false,
                  );
                }
              }
              if (state is HealthErrorAuthorizeState) {
                checkDialog(context, onPressed: () {
                  context.read<HealthBloc>().add(AuthorizeEvent());
                });
              }
            },
          ),
        ],
        child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [HealthLogo()]),
      ),
    );
  }
}
