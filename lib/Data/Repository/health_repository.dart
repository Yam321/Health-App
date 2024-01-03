import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

class HealthRepository {
  static List<HealthDataType> types = [
    HealthDataType.MOVE_MINUTES,
    HealthDataType.HEIGHT,
    HealthDataType.WEIGHT,
    HealthDataType.ACTIVE_ENERGY_BURNED,
    HealthDataType.BLOOD_OXYGEN,
    HealthDataType.STEPS,
    HealthDataType.NUTRITION,
    HealthDataType.WATER
  ];

  final permissions = types.map((e) => HealthDataAccess.READ_WRITE).toList();

  // create a HealthFactory for use in the app
  HealthFactory health = HealthFactory(useHealthConnectIfAvailable: true);
  Future<bool> authorize() async {
    await Permission.activityRecognition.request();

    await Permission.location.request();

    bool? hasPermissions =
        await health.hasPermissions(types, permissions: permissions);

    hasPermissions = false;
    bool authorized = false;
    if (!hasPermissions) {
      try {
        authorized =
            await health.requestAuthorization(types, permissions: permissions);
      } catch (error) {
        authorize();
        debugPrint("Exception in authorize: $error");
      }
    }
    debugPrint("what is the Permissions   $authorized");
    return authorized;
  }

  Future<List<HealthDataPoint>> fetchHealthData() async {
    List<HealthDataPoint> healthDataList = [];
    // get data within the last 24 hours

    DateTime now = DateTime.now();

    // Get the start of the current day
    // DateTime startOfDay = DateTime(now.year, now.month, now.day);
    // final midNight = DateTime(now.year, now.month, now.day);

    // Get the end of the current day (add 1 day and subtract 1 second)
    // DateTime endOfDay = DateTime(now.year, now.month, now.day + 1).subtract(Duration(seconds: 1));

    final yesterday = now.subtract(const Duration(hours: 24));

    // Clear old data points
    healthDataList.clear();

    try {
      // fetch health data
      List<HealthDataPoint> healthData =
          await health.getHealthDataFromTypes(yesterday, now, types);

      // save all the new data points (only the first 100)
      healthDataList.addAll(healthData);
    } catch (error) {
      debugPrint("Exception in getHealthDataFromTypes: $error");
    }

    // filter out duplicates
    healthDataList = HealthFactory.removeDuplicates(healthDataList);

    // print the results
    for (var x in healthDataList) {
      debugPrint("what is the x :${x.type.name}");
    }
    return healthDataList;
    // update the UI to display the results
  }

 
  Future<int> fetchStepData() async {
    int? steps;

    // get steps for today (i.e., since midnight)
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);

    bool requested =
        await health.requestAuthorization(types, permissions: permissions);

    if (requested) {
      try {
        steps = await health.getTotalStepsInInterval(midnight, now);
      } catch (error) {
        debugPrint("Caught exception in getTotalStepsInInterval: $error");
      }

      debugPrint('Total number of steps: $steps');
    } else {
      debugPrint("Authorization not granted - error in authorization");
      fetchStepData();
    }
    return steps!;
  }
}
