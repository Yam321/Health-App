import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:healthapp/Data/Repository/auth_repository.dart';
import 'package:healthapp/Util/SharedPreferences/SharedPreferencesHelper.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthStates> {
  AuthRepository authRepository = AuthRepository();
  AuthBloc() : super(AuthInitial()) {
    on<LogInEvent>((event, emit) async {
      emit(AuthLoadingState());
      final apiResult = await authRepository.logIn(
          userName: event.userName, password: event.password);

      if (apiResult.response != null && apiResult.response!.statusCode == 200) {
       AppSharedPreferences.saveToken(apiResult.response!.data['token']['access']);
        emit(AuthSuccesfulState());
      } else {
        emit(AuthErrorState(message: apiResult.error.toString()));
      }
    });

    on<SignUpEvent>((event, emit) async {
      emit(AuthLoadingState());
      final apiResult = await authRepository.signUp(
          firstName: event.firstName,
          username: event.userName,
          age: event.age,
          gender: event.gender,
          height: event.height,
          weight: event.weight,
          password: event.password);

      if (apiResult.response != null && apiResult.response!.statusCode == 200) {
        emit(AuthSuccesfulState());
      } else {
        emit(AuthErrorState(message: apiResult.error.toString()));
      }
    });

    on<LogoutEvent>((event, emit) async {});
  }
}
