import 'package:flutter/material.dart';

import 'package:healthapp/Core/Constants/app_colors.dart';
import 'package:healthapp/Widgets/custom_text.dart';
import 'package:sizer/sizer.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HealthWidget extends StatelessWidget {
  final String? type;
  final double percent;
  final String unit;
  final IconData iconData;

  final Function onPressed;

  const HealthWidget({
    super.key,
    this.type,
    required this.onPressed,
    required this.iconData,
    required this.unit, required this.percent,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
            margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
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
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
                child: Row(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Icon(
                          iconData,
                          color: AppColors.blueColor,
                          size: 4.w,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        CustomText(
                          textData: type,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          textColor: AppColors.blueColor,
                        ),
                      ],
                    )),
                    Column(
                      children: [
                        LinearPercentIndicator(
                          width: 20.w,
                          lineHeight: 2.h,
                          restartAnimation: true,
                          animateFromLastPercent: true,
                          animation: true,
                          barRadius: Radius.circular(5.w),
                          percent: percent,
                          progressColor: AppColors.blueColor,
                        ),
                        CustomText(
                          textData: unit,
                          fontSize: 6.sp,
                          fontWeight: FontWeight.bold,
                          textColor: AppColors.blueColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
