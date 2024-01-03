import 'package:flutter/material.dart';
import 'package:healthapp/Core/Constants/app_colors.dart';
import 'package:healthapp/Widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

class CardItemButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final IconData icon;
  const CardItemButton(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
        color: AppColors.seconedaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(8.w),
                bottomLeft: Radius.circular(8.w))),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8.w),
                  bottomLeft: Radius.circular(8.w))),
          onPressed: () {
            onPressed();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: AppColors.blueLightColor,
                  size: 16.sp,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Expanded(
                    child: CustomText(
                  textData: title,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  textColor: AppColors.blueColor,
                )),
                SizedBox(
                  width: 1.w,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.blueLightColor,
                  size: 14.sp,
                ),
              ],
            ),
          ),
        ));
  }
}
