// import 'package:flutter/material.dart';
// import 'package:healthapp/Core/Constants/app_colors.dart';

// import 'package:sizer/sizer.dart';

// class ErrorMessageWidget extends StatelessWidget {
//   final String message;
//   final Function onPressed;

//   const ErrorMessageWidget(
//       {required this.message, required this.onPressed, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           alignment: Alignment.center,
//           padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
//           margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(5.w),
       
//               boxShadow: const [
//                 BoxShadow(
//                     blurRadius: 2,
//                     blurStyle: BlurStyle.normal,
//                     offset: Offset(1, 2),
//                     color: AppColors.greyColor)
//               ]),
//           child: Column(
//             children: [
             
//               Row(
//                 children: [
//                   Expanded(
//                     child: Text(
//                       message,
//                       textAlign: TextAlign.center       ,
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 15.sp,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 2.h,
//               ),
//               CustomButton(
//                 buttonColor: Colors.white,
//                   onPressed: () {
//                     onPressed();
//                   },
//                   textColor: AppColor.myBlue,
//                   buttonText: "Try again")
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
