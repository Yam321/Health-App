import 'package:flutter/material.dart';
import 'package:healthapp/Core/Constants/app_colors.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String buttonText;
  final FontWeight? fontWeight;
  final double fontSize;
  final Color textColor;
  final double? buttonHight;
  final Color buttonColor;

  const CustomButton(
      {required this.onPressed,
      required this.buttonText,
      this.buttonColor = AppColors.primaryColor,
      this.buttonHight,
      this.fontWeight = FontWeight.bold,
      this.textColor = AppColors.whiteColor,
      this.fontSize = 16,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(4.w),
      ),
      child: MaterialButton(
        height: buttonHight,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.w)),
        // color: buttonColor,
        onPressed: () {
          onPressed();
        },
        child: Text(
          buttonText,
          style: TextStyle(
              color: textColor, fontSize: fontSize, fontWeight: fontWeight),
        ),
      ),
    );
  }
}
