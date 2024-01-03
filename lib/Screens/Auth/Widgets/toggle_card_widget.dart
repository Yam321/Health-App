// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:healthapp/Core/Constants/app_assets.dart';
import 'package:healthapp/Core/Constants/app_colors.dart';
import 'package:sizer/sizer.dart';

class ToggleCardsWidget extends StatefulWidget {
  final Function(Map<String,dynamic>) onTap;
  final List<bool> isSelected;
  final List<Map<String,dynamic>> selectedItem;

  const ToggleCardsWidget(
      {Key? key,
      required this.isSelected,
      required this.onTap,
      required this.selectedItem})
      : super(key: key);

  @override
  State<ToggleCardsWidget> createState() => _ToggleCardsWidgetState();
}

class _ToggleCardsWidgetState extends State<ToggleCardsWidget> {
  List<String> ganderList = [AppAssets.manImage, AppAssets.ladyImage];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(widget.isSelected.length, (index) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: InkWell(
                splashColor: const Color(0xFFD86A82),
                borderRadius: BorderRadius.circular(2.w),
                onTap: () {
                  //set the toggle logic
                  setState(() {
                    for (int indexBtn = 0;
                        indexBtn < widget.isSelected.length;
                        indexBtn++) {
                      if (indexBtn == index) {
                        widget.isSelected[indexBtn] = true;
                        widget.onTap(widget.selectedItem[indexBtn]);
                      } else {
                        widget.isSelected[indexBtn] = false;
                      }
                    }
                  });
                },
                child: Container(
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.3), blurRadius: 2)
                      ],
                      color: AppColors.blueLightColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(2.w),
                          bottomLeft: Radius.circular(2.w),
                          bottomRight: Radius.circular(4.w),
                          topLeft: Radius.circular(4.w)),
                      border: Border.all(
                          color: widget.isSelected[index]
                              ? AppColors.redColor
                              : Colors.transparent,
                          width: widget.isSelected[index] ? 3 : 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage(ganderList[index]),
                          color: AppColors.primaryColor,
                          height: 8.h,
                          width: 16.w,
                        ),
                        Text(
                          widget.selectedItem[index]['ginder'],
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ))),
          ),
        );
      }),
    );
  }
}
