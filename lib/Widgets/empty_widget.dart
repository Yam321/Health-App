import 'package:flutter/material.dart';
import 'package:healthapp/Core/Constants/app_colors.dart';
import 'package:healthapp/Widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

class EmptyWidget extends StatelessWidget {
  final String message;
  const EmptyWidget({required this.message, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
        margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
        color: AppColors.seconedaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(8.w),
                bottomLeft: Radius.circular(8.w))),
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
          child: CustomText(
                    textData: message,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.blueColor,
                  ),
        )),
      ],
    );
  }
}
