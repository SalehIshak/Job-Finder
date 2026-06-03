import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/core/constants/app_text_styles.dart';
import 'package:job_finder/core/shared/costom_appbar.dart';
import 'package:job_finder/core/shared/custom_botton.dart';
import 'package:job_finder/core/shared/custom_divider.dart';
import 'package:job_finder/core/shared/custom_snack_bar.dart';
import 'package:job_finder/core/utils/validators.dart';
import 'package:job_finder/features/shared_features/auth/presentation/cubit/auth_cubit.dart';
import 'package:job_finder/features/shared_features/auth/presentation/cubit/auth_state.dart';
import 'package:job_finder/core/shared/custom_text_filed.dart';
import 'package:job_finder/features/shared_features/complate_profile/presentation/widgets/custom_upload_photo_bottom_sheet.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    _genderController.dispose();
  }

  @override
  void initState() {
    final cubit = context.read<AuthCubit>();
    cubit.getProfileData();
    super.initState();
    _nameController.text = cubit.usrProfileEntity?.fullName ?? "name";
    _phoneNumberController.text = cubit.usrProfileEntity?.phoneNumber ?? " Phone";
    _addressController.text = cubit.usrProfileEntity?.address ?? " Address";
    _genderController.text = cubit.usrProfileEntity?.gender ?? " Gender";
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();

    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.myProfile, backgroundColor: AppColor.primary),
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(height: 70, color: AppColor.primary),

                Gap(120),
                // TEXT fILEDS
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Gap(40),
                        //   NAME
                        CustomTextFiled(
                          isSecuredFiled: false,
                          hintText: AppStrings.name,
                          labelText: AppStrings.name,
                          controller: _nameController,
                          validator: (value) => AppValidator.validateInput(value, type: InputType.email),
                        ),
                        Gap(15),

                        //   MOBILE NUMBER
                        CustomTextFiled(
                          isSecuredFiled: false,
                          hintText: AppStrings.mobileNumber,
                          labelText: AppStrings.mobileNumber,
                          controller: _phoneNumberController,
                          validator: (value) => AppValidator.validateInput(value, type: InputType.number),
                        ),
                        Gap(15),

                        //   ADDRESS
                        CustomTextFiled(
                          isSecuredFiled: false,
                          hintText: AppStrings.address,
                          labelText: AppStrings.address,
                          controller: _addressController,
                          validator: (value) => AppValidator.validateInput(value, type: InputType.text),
                        ),
                        Gap(15),

                        //   GENDER
                        CustomTextFiled(
                          isSecuredFiled: false,
                          hintText: AppStrings.gender,
                          labelText: AppStrings.gender,
                          controller: _genderController,
                          validator: (value) => AppValidator.validateInput(value, type: InputType.text),
                        ),
                        Gap(45),
                      ],
                    ),
                  ),
                ),
                Gap(80),

                // SAVE BOTTON
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(customSnackBar(state.errorMAessage));
                    }
                    if (state is ReplaceProfileDataSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        customSnackBar("تم تحديث البيانات بنجاح ", backgroundColor: AppColor.success, icon: Icons.check_circle),
                      );
                    }
                  },
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustomBotton(
                        isLoading: state is ReplaceProfileLoading,
                        text: "Save",
                        onTap: () => cubit.updateProfileData(
                          _nameController.text,
                          _phoneNumberController.text,
                          _addressController.text,
                          _genderController.text,
                        ),
                      ),
                    );
                  },
                ),
                Gap(10),
                CustomDivider(),
              ],
            ),

            // PROFILE IMAGE & USER NAME
            Positioned(
              left: 20,
              right: 20,
              child: BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  final profileImage = context.read<AuthCubit>().profileImage;
                  return SizedBox(
                    height: 250,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: AppColor.grey1,
                          backgroundImage: profileImage != null ? FileImage(File(profileImage)) : null,
                        ),
                        Gap(5),
                        Text(cubit.usrProfileEntity?.fullName ?? "Name", style: AppTextStyles.lable12),
                        Text(cubit.usrProfileEntity?.email ?? "Name"),
                      ],
                    ),
                  );
                },
              ),
            ),

            // CAMIRA ICON
            Positioned(
              top: 90,
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
        ),
      ),
    );
  }
}
