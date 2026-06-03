import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_images.dart';
import 'package:job_finder/core/router/app_route_strings.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/core/constants/app_text_styles.dart';
import 'package:job_finder/core/shared/custom_snack_bar.dart';
import 'package:job_finder/core/utils/validators.dart';
import 'package:job_finder/features/shared_features/auth/presentation/cubit/auth_cubit.dart';
import 'package:job_finder/features/shared_features/auth/presentation/cubit/auth_state.dart';
import 'package:job_finder/core/shared/custom_text_filed.dart';
import 'package:job_finder/core/shared/custom_botton.dart';
import 'package:job_finder/core/shared/custom_divider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController.text = "saleh4@gmail.com";
    _passwordController.text = "password123S";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // HEAD
                    Gap(70),
                    Center(child: Image.asset(AppImage.imagesLogoLogoNext, width: 116, height: 57)),
                    Gap(20),
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: AppStrings.welcomeToBack, style: AppTextStyles.hidding2),
                            TextSpan(text: AppStrings.next, style: AppTextStyles.hidding2Span),
                          ],
                        ),
                      ),
                    ),
                    Gap(20),
                    Text(AppStrings.loginDiscription, style: AppTextStyles.description1, textAlign: TextAlign.center),
                    Gap(20),
                    // FILEDS

                    // EMAIL
                    CustomTextFiled(
                      controller: _emailController,
                      isSecuredFiled: false,
                      hintText: AppStrings.email,
                      labelText: AppStrings.email,
                      validator: (value) => AppValidator.validateInput(value, type: InputType.email, isRequired: true),
                    ),
                    Gap(20),

                    // PASSWORD
                    CustomTextFiled(
                      controller: _passwordController,
                      isSecuredFiled: true,
                      hintText: AppStrings.password,
                      labelText: AppStrings.password,
                      validator: (value) => AppValidator.validateInput(value, min: 6, type: InputType.password, isRequired: true),
                    ),
                    Gap(20),
                    Text(AppStrings.passwordCondition, style: AppTextStyles.description1),
                    Row(
                      children: [
                        Checkbox(
                          value: (true),
                          onChanged: (_) {},
                          shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(4)),
                          fillColor: WidgetStateColor.resolveWith((state) {
                            if (state.contains(WidgetState.selected)) {
                              return AppColor.primary;
                            }
                            return AppColor.secondary;
                          }),
                          side: WidgetStateBorderSide.resolveWith((state) {
                            if (state.contains(WidgetState.selected)) {
                              return BorderSide(color: AppColor.primary, width: 1.6);
                            }
                            return BorderSide(color: AppColor.primary, width: 1.6);
                          }),
                        ),

                        Text(AppStrings.rememberme, style: AppTextStyles.description1),
                        Gap(5),
                        Text(AppStrings.forgotPassowrd, style: AppTextStyles.lable3),
                      ],
                    ),
                    Gap(20),

                    BlocConsumer<AuthCubit, AuthState>(
                      listener: (context, state) {
                        if (state is AutoLoginFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(customSnackBar(state.errorMAessage));
                        }
                        if (state is AuthSuccess) {
                          context.go(AppRoute.userHome);
                        }
                      },
                      builder: (context, state) {
                        return CustomBotton(
                          isLoading: state is AuthLoading?,
                          text: AppStrings.login,
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthCubit>().logIn(_emailController.text, _passwordController.text);
                            }
                          },
                        );
                      },
                    ),

                    Gap(170),
                    Align(
                      alignment: AlignmentGeometry.center,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: AppStrings.dontHaveAccount, style: AppTextStyles.description1),
                            TextSpan(
                              text: AppStrings.signUp,
                              style: AppTextStyles.lable3,
                              recognizer: TapGestureRecognizer()..onTap = () => context.go(AppRoute.register),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(10),
                    CustomDivider(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
