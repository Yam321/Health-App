import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthapp/Bloc/health_bloc/health_bloc.dart';
import 'package:healthapp/Core/Constants/app_colors.dart';

import 'package:healthapp/Screens/Home/Widgets/health_widget.dart';
import 'package:healthapp/Screens/Home/helth_history_screen.dart';
import 'package:healthapp/Widgets/progress_indicator_widget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<HealthBloc>().add(FetchHealthDataEvent());
    // context.read<HealthBloc>().add(FetchStepsDataEvent());
    super.initState();
  }

  dynamic ele;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HealthBloc, HealthState>(
      builder: (context, state) {
        if (state is HealthLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              strokeWidth: 2.w,
              color: AppColors.blueLightColor,
            ),
          );
        }
        if (state is HealthErrorState) {
          return const SizedBox();
        }
        if (state is HealthSuccesfulState) {
          return ListView(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            children: [
              Column(
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        PageTransition(
                            child: HelthHistoryScreen(
                              healthDataPoint:
                                  context.read<HealthBloc>().stepDataList,
                            ),
                            type: PageTransitionType.rightToLeft,
                            duration: const Duration(milliseconds: 400)),
                      );
                    },
                    shape: const CircleBorder(),
                    child: ProgressIndicatorWidget(
                      type: "Steps",
                      number: context.read<HealthBloc>().numberOfSteps,
                    ),
                  ),
                  HealthWidget(
                    type: "Active energy burned",
                    unit: "CALORIES",
                    percent: 0.8,
                    iconData: Icons.fireplace,
                    onPressed: () {
                      Navigator.of(context).push(
                        PageTransition(
                            child: HelthHistoryScreen(
                              healthDataPoint: context
                                  .read<HealthBloc>()
                                  .activeEnargyBurnedDataList,
                            ),
                            type: PageTransitionType.rightToLeft,
                            duration: const Duration(milliseconds: 400)),
                      );
                    },
                  ),
                  HealthWidget(
                    type: "Move minutes",
                    unit: "MINUTES",
                    percent: 0.1,
                    iconData: Icons.directions_walk_outlined,
                    onPressed: () {
                      Navigator.of(context).push(
                        PageTransition(
                            child: HelthHistoryScreen(
                              healthDataPoint:
                                  context.read<HealthBloc>().moveDataList,
                            ),
                            type: PageTransitionType.rightToLeft,
                            duration: const Duration(milliseconds: 400)),
                      );
                    },
                  ),
                  HealthWidget(
                    type: "Blood oxygen",
                    unit: "PERCENTAGE",
                    iconData: Icons.percent_outlined,
                    percent: 0.0,
                    onPressed: () {
                      Navigator.of(context).push(
                        PageTransition(
                            child: HelthHistoryScreen(
                              healthDataPoint: context
                                  .read<HealthBloc>()
                                  .bloodOxygenDataList,
                            ),
                            type: PageTransitionType.rightToLeft,
                            duration: const Duration(milliseconds: 400)),
                      );
                    },
                  ),
                  HealthWidget(
                    type: "Nutrition",
                    unit: "NO UNIT",
                    percent: 0.0,
                    iconData: Icons.fastfood,
                    onPressed: () {
                      Navigator.of(context).push(
                        PageTransition(
                            child: HelthHistoryScreen(
                              healthDataPoint:
                                  context.read<HealthBloc>().nutritionDataList,
                            ),
                            type: PageTransitionType.rightToLeft,
                            duration: const Duration(milliseconds: 400)),
                      );
                    },
                  ),
                  HealthWidget(
                    type: "Water",
                    unit: "LITER",
                    percent: 0.0,
                    iconData: Icons.water,
                    onPressed: () {
                      Navigator.of(context).push(
                        PageTransition(
                            child: HelthHistoryScreen(
                              healthDataPoint:
                                  context.read<HealthBloc>().waterDataList,
                            ),
                            type: PageTransitionType.rightToLeft,
                            duration: const Duration(milliseconds: 400)),
                      );
                    },
                  ),
                      HealthWidget(
                    type: "Weight",
                    unit: "KILOGRAMS",
                    percent: 0.5,
                    iconData: Icons.person_add_alt_rounded,
                    onPressed: () {
                      Navigator.of(context).push(
                        PageTransition(
                            child: HelthHistoryScreen(
                              healthDataPoint:
                                  context.read<HealthBloc>().weightDataList,
                            ),
                            type: PageTransitionType.rightToLeft,
                            duration: const Duration(milliseconds: 400)),
                      );
                    },
                  )
                ],
              ),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
