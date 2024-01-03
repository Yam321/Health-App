// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LogInEvent extends AuthEvent {
  final String userName;
  final String password;
  LogInEvent({
    required this.userName,
    required this.password,
  });
}

class SignUpEvent extends AuthEvent {
  final String firstName;
  final String userName;
  final String password;
  final int height;
  final int weight;
  final int gender;
  final int age;

  SignUpEvent(
      {required this.firstName,
      required this.userName,
      required this.password,
      required this.height,
      required this.weight,
      required this.gender,
      required this.age});
}

class SendFcmToken extends AuthEvent {}

class LogoutEvent extends AuthEvent {}
