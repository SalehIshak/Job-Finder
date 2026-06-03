import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:job_finder/core/constants/app_color.dart';
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
import 'package:job_finder/features/shared_features/complate_profile/presentation/widgets/custom_upload_photo_bottom_sheet.dart';

class RegesterScreen extends StatefulWidget {
  const RegesterScreen({super.key});

  @override
  State<RegesterScreen> createState() => _RegesterScreenState();
}

class _RegesterScreenState extends State<RegesterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController.text = "saleh4@gmail.com";
    _nameController.text = " saleh";
    _phoneController.text = " 01234567891";
    _addressController.text = " Cairo";
    _passwordController.text = " S21saleh";
    _confirmPasswordController.text = " S21saleh";

    // context.read<AuthCubit>().pickImageFromCamira();
    // context.read<AuthCubit>().pickImageFromGalary();
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
                    Gap(20),
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        final profileImage = context.read<AuthCubit>().profileImage;
                        return Stack(
                          children: [
                            Center(
                              child: CircleAvatar(
                                backgroundColor: AppColor.grey1,
                                radius: 70,
                                backgroundImage: profileImage != null ? FileImage(File(profileImage)) : null,
                              ),
                            ),
                            Positioned(
                              top: 105,
                              right: 50,
                              left: 140,
                              child: GestureDetector(
                                onTap: () {
                                  final cubit = context.read<AuthCubit>();
                                  showModalBottomSheet(
                                    backgroundColor: AppColor.white,
                                    context: context,
                                    constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.45),
                                    builder: (context) {
                                      // instade of make blocProvider above the showModalBottomSheet i maked BlocProvider.value
                                      return BlocProvider.value(value: cubit, child: UploadPhotoBottomSheet());
                                    },
                                  );
                                },
                                child: Center(
                                  child: Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color: AppColor.white,
                                      border: Border.all(color: AppColor.black),
                                      borderRadius: BorderRadius.circular(50),
                                    ),

                                    child: Icon(CupertinoIcons.camera_fill, size: 23, color: AppColor.black),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),

                    // Center(child: Image.asset(AppImage.imagesLogoLogoNext, width: 116, height: 57)),

                    // Welcome Text
                    Gap(10),
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: AppStrings.createYour, style: AppTextStyles.hidding2),
                            TextSpan(text: " "),
                            TextSpan(text: AppStrings.next, style: AppTextStyles.hidding2Span),
                            TextSpan(text: " "),
                            TextSpan(text: AppStrings.account, style: AppTextStyles.hidding2),
                          ],
                        ),
                      ),
                    ),

                    Gap(10),

                    Text(AppStrings.regesterDiscription, style: AppTextStyles.description1, textAlign: TextAlign.center),
                    Gap(10),

                    // EMAIL
                    CustomTextFiled(
                      controller: _emailController,
                      isSecuredFiled: false,
                      hintText: AppStrings.email,
                      labelText: AppStrings.email,
                      validator: (value) => AppValidator.validateInput(value, type: InputType.email, isRequired: true),
                    ),
                    Gap(20),
                    // NAME
                    CustomTextFiled(
                      controller: _nameController,
                      isSecuredFiled: false,
                      hintText: AppStrings.name,
                      labelText: AppStrings.name,
                      validator: (value) => AppValidator.validateInput(value, min: 2, type: InputType.text, isRequired: true),
                    ),
                    Gap(20),
                    // MOBILE NUMBER
                    CustomTextFiled(
                      controller: _phoneController,
                      isSecuredFiled: false,
                      hintText: AppStrings.number,
                      labelText: AppStrings.mobileNumber,
                      validator: (value) =>
                          AppValidator.validateInput(value, min: 11, max: 11, type: InputType.number, isRequired: true),
                    ),
                    Gap(20),
                    // ADDRESS
                    CustomTextFiled(
                      controller: _addressController,
                      isSecuredFiled: false,
                      hintText: AppStrings.address,
                      labelText: AppStrings.address,
                      validator: (value) => AppValidator.validateInput(value, min: 2, type: InputType.text, isRequired: true),
                    ),
                    Gap(20),
                    // PASSWORD
                    CustomTextFiled(
                      controller: _passwordController,
                      isSecuredFiled: true,
                      hintText: AppStrings.secuercharacter,
                      labelText: AppStrings.password,
                      validator: (value) => AppValidator.validateInput(value, min: 6, type: InputType.password, isRequired: true),
                    ),
                    Gap(20),
                    // CONFIRM PASSWORD
                    CustomTextFiled(
                      controller: _confirmPasswordController,
                      isSecuredFiled: true,
                      hintText: AppStrings.secuercharacter,
                      labelText: AppStrings.confirmPassword,
                      validator: (value) => AppValidator.confirmPasswordValidator(value, _passwordController.text),
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

                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMAessage)));
                        }
                        if (state is AuthSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            customSnackBar("تم تسجيل الدخول بنجاح", backgroundColor: AppColor.success, icon: Icons.check_circle),
                          );

                          context.go(AppRoute.userHome);
                        }
                      },

                      builder: (context, state) {
                        return CustomBotton(
                          isLoading: state is AuthLoading?,
                          text: AppStrings.signUp,
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthCubit>().regester(
                                _emailController.text,
                                _passwordController.text,
                                _nameController.text,
                                _phoneController.text,
                                _addressController.text,
                              );
                            }
                          },
                        );
                      },
                    ),

                    Gap(20),
                    // SPAN
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: AppStrings.alreadyHaveAccount, style: AppTextStyles.description1),
                            TextSpan(text: " "),
                            TextSpan(
                              text: AppStrings.login,
                              style: AppTextStyles.lable3,
                              recognizer: TapGestureRecognizer()..onTap = () => context.go(AppRoute.login),
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
