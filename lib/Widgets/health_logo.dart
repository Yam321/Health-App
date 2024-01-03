import 'package:flutter/material.dart';
import 'package:healthapp/Core/Constants/app_colors.dart';
import 'package:healthapp/Widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

class HealthLogo extends StatelessWidget {
  const HealthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CustomText(
              textData: "Health",
              fontSize: 30.sp,
              fontWeight: FontWeight.bold,
              textColor: AppColors.primaryColor,
              textAlign: TextAlign.center,
            ),
            CustomText(
              textData: "App",
              fontSize: 10.sp,
              textColor: AppColors.blueLightColor,
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ],
    );
  }
}
