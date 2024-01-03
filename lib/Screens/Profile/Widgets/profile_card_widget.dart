import 'package:flutter/material.dart';
import 'package:healthapp/Core/Constants/app_colors.dart';
import 'package:healthapp/Widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
      color: AppColors.seconedaryColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.w),
              bottomRight: Radius.circular(8.w))),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              radius: 8.w,
              child: Icon(
                Icons.person,
                size: 15.sp,
                color: AppColors.blueLightColor,
              ),
            ),
            SizedBox(
              width: 2.w,
            ),
            Expanded(
                child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: AppColors.blueColor,
                      size: 12.sp,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    CustomText(
                        textData: "Name : ",
                        fontSize: 12.sp,
                        textColor: AppColors.blueColor),
                    Expanded(
                      child: CustomText(
                          textData: "Your Name",
                          textAlign: TextAlign.center,
                          fontSize: 10.sp,
                          textColor: AppColors.blueLightColor),
                    )
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.mail,
                      color: AppColors.blueColor,
                      size: 12.sp,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    CustomText(
                        textData: "Email : ",
                        fontSize: 12.sp,
                        textColor: AppColors.blueColor),
                    Expanded(
                      child: CustomText(
                          textData: "Your Email",
                          textAlign: TextAlign.center,
                          fontSize: 10.sp,
                          textColor: AppColors.blueLightColor),
                    )
                  ],
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                  child: Row(
                    children: [
                      CustomText(
                          textData: "Age : ",
                          fontSize: 10.sp,
                          textColor: AppColors.blueColor),
                      Expanded(
                        child: CustomText(
                            textData: "20",
                            textAlign: TextAlign.start,
                            fontSize: 8.sp,
                            textColor: AppColors.blueLightColor),
                      ),
                      CustomText(
                          textData: "Height : ",
                          fontSize: 10.sp,
                          textColor: AppColors.blueColor),
                      Expanded(
                        child: CustomText( 
                            textData: "170",
                            textAlign: TextAlign.start,
                            fontSize: 8.sp,
                            textColor: AppColors.blueLightColor),
                      )
                    ],
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
