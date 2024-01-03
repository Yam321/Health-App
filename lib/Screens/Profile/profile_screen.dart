import 'package:flutter/material.dart';
import 'package:healthapp/App/app.dart';
import 'package:healthapp/Screens/Profile/Widgets/profile_card_widget.dart';
import 'package:healthapp/Screens/Splash/splash_screen.dart';
import 'package:healthapp/Util/SharedPreferences/SharedPreferencesHelper.dart';
import 'package:healthapp/Widgets/card_item_button.dart';
import 'package:sizer/sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
           const  ProfileCardWidget(),
            CardItemButton(
                title: "Edit profile",
                onPressed: () {
                  // Navigator.of(context).push(
                  //   PageTransition(
                  //       child: SecandScreen(),
                  //       type: PageTransitionType.leftToRight,
                  //       duration: const Duration(milliseconds: 400)),
                  // );
                },
                icon: Icons.person),
            CardItemButton(
                title: "Last week activity",
                onPressed: () {},
                icon: Icons.sports_gymnastics_outlined),
            CardItemButton(
                title: "Last month's activity",
                onPressed: () {},
                icon: Icons.sports_gymnastics_outlined),
            SizedBox(
              height: 10.h,
            ),
            CardItemButton(
                title: "Log out",
                onPressed: () async {
                  await AppSharedPreferences.removeToken();

                  navigatorKey.currentState!.pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const SplashScreen(),
                      ),
                      (route) => false);
                },
                icon: Icons.logout)
          ],
        ),
      ),
    );
  }
}
