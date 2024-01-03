import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:healthapp/Core/Constants/app_colors.dart';
import 'package:healthapp/Widgets/custom_text.dart';
import 'package:healthapp/Widgets/empty_widget.dart';
import 'package:sizer/sizer.dart';

class HelthHistoryScreen extends StatelessWidget {
  final List<HealthDataPoint> healthDataPoint;
  const HelthHistoryScreen({super.key, required this.healthDataPoint});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: healthDataPoint.isNotEmpty
          ? ListView.builder(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              itemCount: healthDataPoint.length,
              itemBuilder: (_, index) {
                HealthDataPoint p = healthDataPoint[index];
                if (p.value is AudiogramHealthValue) {
                  return Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                      color: AppColors.seconedaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8.w),
                              bottomLeft: Radius.circular(8.w))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 2.w),
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                textData: "${p.typeString}: ",
                                textColor: AppColors.blueColor,
                                fontSize: 14.sp,
                              ),
                              CustomText(
                                textData: "${p.value}",
                                textColor: AppColors.blueColor,
                                fontSize: 14.sp,
                              ),
                            ],
                          ),
                          trailing: CustomText(
                            textData: p.unitString,
                            textColor: AppColors.blueLightColor,
                            fontSize: 8.sp,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                textData:
                                    'Date : ${p.dateFrom.year}/${p.dateFrom.month}/${p.dateTo.day}',
                                textColor: AppColors.blueLightColor,
                                maxLines: 2,
                                fontSize: 10.sp,
                              ),
                              CustomText(
                                textData:
                                    'Time : ${p.dateFrom.hour} : ${p.dateFrom.minute} - ${p.dateTo.hour} : ${p.dateTo.minute}',
                                textColor: AppColors.blueLightColor,
                                maxLines: 2,
                                fontSize: 10.sp,
                              ),
                            ],
                          ),
                        ),
                      ));
                }
                if (p.value is WorkoutHealthValue) {
                  return Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                      color: AppColors.seconedaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8.w),
                              bottomLeft: Radius.circular(8.w))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 2.w),
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                textData: "${p.typeString}: ",
                                textColor: AppColors.blueColor,
                                fontSize: 12.sp,
                              ),
                              CustomText(
                                textData:
                                    "${(p.value as WorkoutHealthValue).totalEnergyBurned}",
                                textColor: AppColors.blueColor,
                                fontSize: 12.sp,
                              ),
                              CustomText(
                                textData:
                                    "${(p.value as WorkoutHealthValue).totalEnergyBurnedUnit?.name}",
                                textColor: AppColors.blueColor,
                                fontSize: 12.sp,
                              ),
                            ],
                          ),
                          trailing: CustomText(
                            textData: (p.value as WorkoutHealthValue)
                                .workoutActivityType
                                .name,
                            textColor: AppColors.blueLightColor,
                            fontSize: 8.sp,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                textData:
                                    'Date : ${p.dateFrom.year}/${p.dateFrom.month}/${p.dateTo.day}',
                                textColor: AppColors.blueLightColor,
                                maxLines: 2,
                                fontSize: 10.sp,
                              ),
                              CustomText(
                                textData:
                                    'Time : ${p.dateFrom.hour} : ${p.dateFrom.minute} - ${p.dateTo.hour} : ${p.dateTo.minute}',
                                textColor: AppColors.blueLightColor,
                                maxLines: 2,
                                fontSize: 10.sp,
                              ),
                            ],
                          ),
                        ),
                      ));
                }
                if (p.value is NutritionHealthValue) {
                  return Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                      color: AppColors.seconedaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8.w),
                              bottomLeft: Radius.circular(8.w))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 2.w),
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                textData: "${p.typeString} ",
                                textColor: AppColors.blueColor,
                                fontSize: 12.sp,
                              ),
                              CustomText(
                                textData:
                                    "${(p.value as NutritionHealthValue).mealType}: ${(p.value as NutritionHealthValue).name}",
                                textColor: AppColors.blueColor,
                                fontSize: 12.sp,
                              ),
                            ],
                          ),
                          trailing: CustomText(
                            textData:
                                '${(p.value as NutritionHealthValue).calories} kcal',
                            textColor: AppColors.blueLightColor,
                            fontSize: 8.sp,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                textData:
                                    'Date : ${p.dateFrom.year}/${p.dateFrom.month}/${p.dateTo.day}',
                                textColor: AppColors.blueLightColor,
                                maxLines: 2,
                                fontSize: 10.sp,
                              ),
                              CustomText(
                                textData:
                                    'Time : ${p.dateFrom.hour} : ${p.dateFrom.minute} - ${p.dateTo.hour} : ${p.dateTo.minute}',
                                textColor: AppColors.blueLightColor,
                                maxLines: 2,
                                fontSize: 10.sp,
                              ),
                            ],
                          ),
                        ),
                      ));
                }

                return Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                    color: AppColors.seconedaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8.w),
                            bottomLeft: Radius.circular(8.w))),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              textData: "${p.typeString}: ",
                              textColor: AppColors.blueColor,
                              fontSize: 12.sp,
                            ),
                            CustomText(
                              textData: "${p.value}",
                              textColor: AppColors.blueColor,
                              fontSize: 12.sp,
                            ),
                          ],
                        ),
                        trailing: CustomText(
                          textData: p.unitString,
                          textColor: AppColors.blueLightColor,
                          fontSize: 8.sp,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              textData:
                                  'Date : ${p.dateFrom.year}/${p.dateFrom.month}/${p.dateTo.day}',
                              textColor: AppColors.blueLightColor,
                              maxLines: 2,
                              fontSize: 10.sp,
                            ),
                            CustomText(
                              textData:
                                  'Time : ${p.dateFrom.hour} : ${p.dateFrom.minute} - ${p.dateTo.hour} : ${p.dateTo.minute}',
                              textColor: AppColors.blueLightColor,
                              maxLines: 2,
                              fontSize: 10.sp,
                            ),
                          ],
                        ),
                      ),
                    ));
              })
          : const Center(child: EmptyWidget(message: "No Data Yet")),
    );
  }
}
