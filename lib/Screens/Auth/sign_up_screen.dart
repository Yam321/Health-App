import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthapp/Bloc/auth_bloc/auth_bloc.dart';
import 'package:healthapp/Core/Constants/app_colors.dart';
import 'package:healthapp/Screens/Auth/Widgets/select_age_widget.dart';
import 'package:healthapp/Screens/Auth/Widgets/toggle_card_widget.dart';
import 'package:healthapp/Widgets/custom_button.dart';
import 'package:healthapp/Widgets/custom_text_falid.dart';
import 'package:healthapp/Widgets/health_logo.dart';

import 'package:sizer/sizer.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey();

  final List<bool> selected = [true, false];

  final List<Map<String, dynamic>> ginder = [
    {"ginder": "Male", "ginderId": 0},
    {"ginder": "Female", "ginderId": 1}
  ];

  int? age;

  Map<String, dynamic>? selectedGinder;

  int? height;

  int? weight;
  AuthBloc authBloc = AuthBloc();

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
                          "Sign Up",
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
                      controller: nameController,
                      textInputType: TextInputType.name,
                      isValidator: true,
                      fillColor: AppColors.blueLightColor,
                      hintText: "Enter Your Name",
                      validatorMessage: "Please Enter Your Name",
                    ),
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
                  SelectNumberWidget(
                      initValue: 10,
                      maxValue: 120,
                      title: "Age",
                      minValue: 8,
                      getSelectedNumber: (newNumber) {
                        age = newNumber;
                      }),
                  SizedBox(
                    height: 2.h,
                  ),
                  SelectNumberWidget(
                      maxValue: 250,
                      title: "Height",
                      initValue: 160,
                      minValue: 120,
                      getSelectedNumber: (newNumber) {
                        height = newNumber;
                      }),
                  SizedBox(
                    height: 2.h,
                  ),
                  SelectNumberWidget(
                      maxValue: 200,
                      initValue: 60,
                      title: "Weight",
                      minValue: 40,
                      getSelectedNumber: (newNumber) {
                        weight = newNumber;
                      }),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: ToggleCardsWidget(
                        isSelected: selected,
                        onTap: (newGinder) {
                          selectedGinder = newGinder;
                        },
                        selectedItem: ginder),
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
                  // SizedBox(
                  //   height: 2.h,
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 3.w),
                  //   child: CustomTextField(
                  //     controller: confirmPasswordController,
                  //     textInputType: TextInputType.visiblePassword,
                  //     isValidator: true,
                  //     isPassword: true,
                  //     fillColor: AppColors.blueLightColor,
                  //     hintText: "Enter Your Confirm Password",
                  //     validatorMessage: "Please Enter Your Confirm Password",
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Row(
                      children: [
                        Text(
                          "Already have an account ? ",
                          style: TextStyle(
                              color: AppColors.blueLightColor, fontSize: 12.sp),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Log In",
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
                            "SignUp Succesful",
                          ),
                        ));
                        Navigator.of(context).pop();
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
                      return state is! AuthLoadingState
                          ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.w),
                              child: CustomButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    authBloc.add(
                                        SignUpEvent(
                                            firstName: nameController.text,
                                            userName: emailController.text,
                                            password: passwordController.text,
                                            height: height ?? 160,
                                            weight: weight ?? 60,
                                            age: age ?? 10,
                                            gender: selectedGinder != null
                                                ? selectedGinder!['ginderId']
                                                : 0));
                                  }
                                },
                                textColor: AppColors.blueLightColor,
                                buttonText: "Sign Up",
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(
                                  strokeWidth: 2.w,
                                  color: AppColors.blueLightColor,
                                ),
                              ],
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
