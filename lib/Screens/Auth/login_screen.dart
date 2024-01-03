import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthapp/Bloc/auth_bloc/auth_bloc.dart';
import 'package:healthapp/Core/Constants/app_colors.dart';
import 'package:healthapp/Screens/Auth/sign_up_screen.dart';
import 'package:healthapp/Screens/Main/main_screen.dart';
import 'package:healthapp/Widgets/custom_button.dart';
import 'package:healthapp/Widgets/custom_text_falid.dart';
import 'package:healthapp/Widgets/health_logo.dart';
import 'package:page_transition/page_transition.dart';

import 'package:sizer/sizer.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();
  final AuthBloc authBloc = AuthBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => authBloc,
      child: Scaffold(
        backgroundColor: AppColors.seconedaryColor,
        body: SafeArea(
          child: Form(
            key: formKey,
            child: Center(
              child: ListView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                shrinkWrap: true,
                children: [
                  const HealthLogo(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Log In",
                          style: TextStyle(
                              color: AppColors.blueLightColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: CustomTextField(
                      controller: emailController,
                      textInputType: TextInputType.emailAddress,
                      isValidator: true,
                      fillColor: AppColors.blueLightColor,
                      hintText: "Enter Your Email",
                      validatorMessage: "Please Enter Your Email",
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: CustomTextField(
                      controller: passwordController,
                      textInputType: TextInputType.visiblePassword,
                      isValidator: true,
                      isPassword: true,
                      fillColor: AppColors.blueLightColor,
                      hintText: "Enter Your Password",
                      validatorMessage: "Please Enter Your Password",
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Row(
                      children: [
                        Text(
                          "New Here ? ",
                          style: TextStyle(
                              color: AppColors.blueLightColor, fontSize: 12.sp),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                PageTransition(
                                    child: const SignUpScreen(),
                                    type: PageTransitionType.rightToLeft,
                                    duration:
                                        const Duration(milliseconds: 400)),
                              );
                            },
                            child: Text(
                              "Create account",
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  color: AppColors.primaryColor),
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  BlocConsumer<AuthBloc, AuthStates>(
                    listener: (context, state) {
                      if (state is AuthSuccesfulState) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 5),
                          content: Text(
                            "LogIn Succesful",
                          ),
                        ));
                        Navigator.of(context).pushAndRemoveUntil(
                          PageTransition(
                              child: const MainScreen(),
                              type: PageTransitionType.leftToRight,
                              duration: const Duration(milliseconds: 400)),
                          (route) => false,
                        );
                      }
                      if (state is AuthErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red,
                          duration: const Duration(seconds: 5),
                          content: Text(
                            state.message,
                          ),
                        ));
                      }
                    },
                    builder: (context, state) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: state is! AuthLoadingState
                            ? CustomButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                   authBloc.add(LogInEvent(
                                      userName: emailController.text,
                                      password: passwordController.text,
                                    ));
                                  }
                                },
                                textColor: AppColors.blueLightColor,
                                buttonText: "Log In",
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    strokeWidth: 2.w,
                                    color: AppColors.blueLightColor,
                                  ),
                                ],
                              ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
