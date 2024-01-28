import 'package:flutter/material.dart';
import 'package:healthapp/Core/Constants/app_colors.dart';
import 'package:healthapp/Widgets/custom_text.dart';
import 'package:sizer/sizer.dart';

class HealthAdviceCardWidget extends StatelessWidget {
  const HealthAdviceCardWidget({super.key});

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
            child: Column(
              children: [
                Row(
                  children: [
                    CustomText(
                        textData: "Adviser : ",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        textColor: AppColors.blueColor),
                    Expanded(
                      child: CustomText(
                          textData: "Ahmad",
                          textAlign: TextAlign.start,
                          fontSize: 14.sp,
                          textColor: AppColors.blueLightColor),
                    )
                  ],
                ),
                const ExpandableText(
                  text: "Take care ",
                )
              ],
            )));
  }
}

class ExpandableText extends StatefulWidget {
  final String text;

  const ExpandableText({
    super.key,
    required this.text,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Row(
          children: [
            Expanded(
              child: CustomText( 
                  textData: widget.text,
                  textAlign: TextAlign.start,
                  maxLines: isExpanded ? null : 3,
                  textOverflow: widget.text.length < 100
                      ? isExpanded
                          ? TextOverflow.clip
                          : TextOverflow.ellipsis
                      : null,
                  fontSize: 12.sp,
                  textColor: AppColors.blueLightColor),
            ),
          ],
        ),
        widget.text.length > 100
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: CustomText(
                  textData: isExpanded ? 'See Less' : 'See More',
                  underLine: true,
                  textColor: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
