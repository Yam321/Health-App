part of 'auth_bloc.dart';

@immutable
abstract class AuthStates {}

class AuthInitial extends AuthStates {}
class AuthLoadingState extends AuthStates {}

class AuthSuccesfulState extends AuthStates {}

class AuthErrorState extends AuthStates {
  final String message;
  AuthErrorState({required this.message});
}
