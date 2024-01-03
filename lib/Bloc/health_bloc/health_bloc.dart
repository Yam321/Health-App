import 'package:bloc/bloc.dart';
import 'package:health/health.dart';
import 'package:healthapp/Data/Repository/health_repository.dart';
import 'package:meta/meta.dart';

part 'health_event.dart';
part 'health_state.dart';

class HealthBloc extends Bloc<HealthEvent, HealthState> {
  HealthRepository healthRepository = HealthRepository();
  int? numberOfSteps;
  List<HealthDataPoint> healthDataList = [];
  List<HealthDataPoint> activeEnargyBurnedDataList = [];
  List<HealthDataPoint> bloodOxygenDataList = [];
  List<HealthDataPoint> nutritionDataList = [];
  List<HealthDataPoint> waterDataList = [];
  List<HealthDataPoint> moveDataList = [];
  List<HealthDataPoint> stepDataList = [];
   List<HealthDataPoint> weightDataList = [];
  bool checked = false;
  HealthBloc() : super(HealthInitial()) {
    on<AuthorizeEvent>((event, emit) async {
      checked = await healthRepository.authorize();
      if (checked) {
        emit(HealthAuthorizeState());
      } else {
        emit(HealthErrorAuthorizeState());
      }
    });

    on<FetchHealthDataEvent>((event, emit) async {
      emit(HealthLoadingState());
      healthDataList = await healthRepository.fetchHealthData();
      numberOfSteps = await healthRepository.fetchStepData();

      numberOfSteps ??= 0;
      for (var element in healthDataList) {
        if (element.type == HealthDataType.ACTIVE_ENERGY_BURNED) {
          activeEnargyBurnedDataList.add(element);
        }
        if (element.type == HealthDataType.BLOOD_OXYGEN) {
          bloodOxygenDataList.add(element);
        }
        if (element.type == HealthDataType.NUTRITION) {
          nutritionDataList.add(element);
        }
        if (element.type == HealthDataType.WATER) {
          waterDataList.add(element);
        }
        if (element.type == HealthDataType.MOVE_MINUTES) {
          moveDataList.add(element);
        }
        if (element.type == HealthDataType.STEPS) {
          stepDataList.add(element);
        }
           if (element.type == HealthDataType.WEIGHT) {
          weightDataList.add(element);
        }
      }

      if (healthDataList.isNotEmpty) {
        emit(HealthSuccesfulState());
      } else {
        emit(HealthErrorState());
      }
    });

    // on<FetchStepsDataEvent>((event, emit) async {
    //   emit(HealthLoadingState());

    //   if (numberOfSteps != null) {
    //     emit(HealthSuccesfulState());
    //   } else {
    //     numberOfSteps = 0;
    //     emit(HealthErrorState());
    //   }
    // });
  }
}
