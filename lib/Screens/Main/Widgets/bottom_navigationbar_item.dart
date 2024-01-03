import 'package:flutter/material.dart';
import 'package:healthapp/Core/Constants/app_colors.dart';
import 'package:healthapp/Widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

BottomNavigationBarItem bottomNavigationBarItem(BuildContext context,
    {required int currentIndex, required String icon, required int index,required String navBarName}) {
  return BottomNavigationBarItem(
    icon: Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      padding: EdgeInsets.symmetric(vertical: 1.h),
      decoration: BoxDecoration(
          color: currentIndex == index
              ? AppColors.primaryColor.withOpacity(0.5)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(5.w)),
      child: Column(
        children: [
          ImageIcon(
            AssetImage(icon),
            size: 5.w,
            color: AppColors.blueColor,
          ),
          SizedBox(height: 1.h,),
          CustomText(
            textData: navBarName,
            fontSize: 10.sp,
            textColor:AppColors.blueColor ,
          )
        ],
      ),
    ),
    label: navBarName,
  );
}
