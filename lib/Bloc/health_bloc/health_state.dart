part of 'health_bloc.dart';

@immutable
abstract class HealthState {}

 class HealthInitial extends HealthState {}
  class HealthSuccesfulState extends HealthState {}
   class HealthErrorState extends HealthState {}
      class HealthLoadingState extends HealthState {}
         class HealthAuthorizeState extends HealthState {}
           class HealthErrorAuthorizeState extends HealthState {}
