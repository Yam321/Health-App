part of 'health_bloc.dart';

@immutable
abstract class HealthEvent {}
class AuthorizeEvent extends HealthEvent{}

class FetchHealthDataEvent extends HealthEvent{}


// class FetchStepsDataEvent extends HealthEvent{}
