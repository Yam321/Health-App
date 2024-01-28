import 'package:flutter/material.dart';
import 'package:healthapp/Core/Constants/app_colors.dart';
import 'package:healthapp/Widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

class ChatMessageWidget extends StatelessWidget {
  final bool myMessage;
  final String message;
  const ChatMessageWidget(
      {super.key, required this.myMessage, required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:myMessage? MainAxisAlignment.end:MainAxisAlignment.start ,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
          decoration: BoxDecoration(
              color: AppColors.blueLightColor,
              borderRadius: BorderRadius.only(
                topRight: myMessage ? Radius.zero : Radius.circular(5.w),
                bottomRight: Radius.circular(5.w),
                bottomLeft: Radius.circular(5.w),
                topLeft: !myMessage ? Radius.zero : Radius.circular(5.w),
              )),
          child: CustomText(
            textData: message,
            textColor: AppColors.blueColor,
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
