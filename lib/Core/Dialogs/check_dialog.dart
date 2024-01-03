import 'package:flutter/material.dart';
import 'package:healthapp/Core/Constants/app_colors.dart';
import 'package:healthapp/Widgets/custom_button.dart';

import 'package:sizer/sizer.dart';

checkDialog(BuildContext context, {required Function onPressed}) {
  AlertDialog alertDialog = AlertDialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.w),
        side: const BorderSide(width: 2, color: AppColors.primaryColor)),
    actionsPadding: EdgeInsets.only(bottom: 3.h, right: 4.w, left: 4.w),
    actionsAlignment: MainAxisAlignment.center,
    actions: [
      SizedBox(
        width: double.infinity,
        child: CustomButton(
            onPressed: () {
              Navigator.of(context).pop();
              onPressed();
            },
            buttonText: "OK"),
      )
    ],
    content: SingleChildScrollView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "You must approve the permission to access the application",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
  showDialog(
    barrierDismissible: false,
    useSafeArea: true,
    context: context,
    builder: (BuildContext context) {
      return alertDialog;
    },
  );
}
