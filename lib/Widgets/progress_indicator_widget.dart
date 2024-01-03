import 'package:flutter/material.dart';
import 'package:healthapp/Core/Constants/app_colors.dart';
import 'package:sizer/sizer.dart';

class ProgressIndicatorWidget extends StatefulWidget {
  final String? type;
  final int? number;
  final double height;
  final double width;

  const ProgressIndicatorWidget(
      {this.type, super.key, this.number, this.height = 20, this.width = 40});

  @override
  State<ProgressIndicatorWidget> createState() =>
      _ProgressIndicatorWidgetState();
}

class _ProgressIndicatorWidgetState extends State<ProgressIndicatorWidget> {
  int? number;
  double doubleNumber = 0;

  @override
  void initState() {
    number = widget.number;
    number ??= 0;
    super.initState();
  }

  double progressIndicator() {
    if (number! == 0) {
      return doubleNumber;
    }
    if (number! <= 100) {
      doubleNumber = 0.1;
      return doubleNumber;
    }
    if (number! <= 150) {
      doubleNumber = 0.15;
      return doubleNumber;
    }
    if (number! <= 200) {
      doubleNumber = 0.2;
      return doubleNumber;
    }
    if (number! <= 250) {
      doubleNumber = 0.25;
      return doubleNumber;
    }
    if (number! <= 300) {
      doubleNumber = 0.3;
      return doubleNumber;
    }
    if (number! <= 350) {
      doubleNumber = 0.35;
      return doubleNumber;
    }
    if (number! <= 400) {
      doubleNumber = 0.4;
      return doubleNumber;
    }
    if (number! <= 450) {
      doubleNumber = 0.45;
      return doubleNumber;
    }
    if (number! <= 500) {
      doubleNumber = 0.5;
      return doubleNumber;
    }
    if (number! <= 550) {
      doubleNumber = 0.55;
      return doubleNumber;
    }
    if (number! <= 600) {
      doubleNumber = 0.6;
      return doubleNumber;
    }
    if (number! <= 650) {
      doubleNumber = 0.65;
      return doubleNumber;
    }
    if (number! <= 700) {
      doubleNumber = 0.7;
      return doubleNumber;
    }
    if (number! <= 750) {
      doubleNumber = 0.75;
      return doubleNumber;
    }
    if (number! <= 800) {
      doubleNumber = 0.8;
      return doubleNumber;
    }
    if (number! <= 850) {
      doubleNumber = 0.85;
      return doubleNumber;
    }

    if (number! <= 900) {
      doubleNumber = 0.9;
      return doubleNumber;
    }
    if (number! <= 950) {
      doubleNumber = 0.95;
      return doubleNumber;
    } else {
      doubleNumber = 1.0;
      return doubleNumber;
    }
  }

  @override
  Widget build(BuildContext context) {
    // print("what is the number$number");
    // final size = 200.0;

    return Center(
      // This Tween Animation Builder is Just For Demonstration, Do not use this AS-IS in Projects
      // Create and Animation Controller and Control the animation that way.
      child: TweenAnimationBuilder(
        tween: Tween(begin: 0.0, end: progressIndicator()),
        duration: const Duration(seconds: 4),
        builder: (context, value, child) {
          return SizedBox(
            width: widget.width.w,
            height: widget.height.h,
            child: Stack(
              children: [
                ShaderMask(
                  shaderCallback: (rect) {
                    return SweepGradient(
                        startAngle: 0.0,
                        endAngle: 3.14 * 2,
                        stops: [value, value],
                        // 0.0 , 0.5 , 0.5 , 1.0
                        center: Alignment.center,
                        colors: [
                          AppColors.blueColor,
                          AppColors.blackColor.withOpacity(0.5)
                        ]).createShader(rect);
                  },
                  child: Container(
                    width: widget.width.w,
                    height: widget.height.h,
                    decoration: const BoxDecoration(
                      color: AppColors.blueLightColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    width: widget.width.w - 8.w,
                    height: widget.height.h - 4.h,
                    // width: 32.w,
                    // height: 16.h,
                    decoration: const BoxDecoration(
                        color: AppColors.primaryColor, shape: BoxShape.circle),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          number!.toString(),
                          style: TextStyle(
                              fontSize: 25.sp,
                              color: AppColors.blueLightColor,
                              fontWeight: FontWeight.bold),
                        ),
                        widget.type != null
                            ? Text(
                                widget.type!,
                                style: TextStyle(
                                    fontSize: 15.sp,
                                    color: AppColors.blueLightColor,
                                    fontWeight: FontWeight.bold),
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
