import 'package:flutter/material.dart';
import 'package:healthapp/Core/Constants/app_colors.dart';
import 'package:healthapp/Widgets/health_logo.dart';


class AppBarWidgetScreens extends StatelessWidget {
 final bool buttonBack;
 const  AppBarWidgetScreens({
    this.buttonBack = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.seconedaryColor,
        title: const HealthLogo(),
        leading: buttonBack
            ? InkWell(
                onTap: (() {
                  Navigator.maybePop(context);
                }),
                child: const Icon(Icons.arrow_back_ios,
                    color: AppColors.primaryColor),
              )
            : null);
  }
}
