import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_images.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/core/router/app_route_strings.dart';
import 'package:job_finder/features/shared_features/auth/presentation/cubit/auth_cubit.dart';
import 'package:job_finder/features/shared_features/auth/presentation/cubit/auth_state.dart';
import 'package:job_finder/features/shared_features/settengs/presentation/widgets/custom_setting_container.dart';

class AdminSettingsScreen extends StatelessWidget {
  const AdminSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(
        children: [
          Column(
            children: [
              Container(height: 150, color: AppColor.primary),
              Gap(100),
              CustomSettingContainer(
                onTap: () => context.push(AppRoute.myProfile),
                image: AppImage.profileIcon,
                title: AppStrings.myProfile,
              ),
              CustomSettingContainer(
                onTap: () => context.push(AppRoute.myApplications),
                image: AppImage.folderIcon,
                title: AppStrings.myApplications,
              ),
              CustomSettingContainer(
                onTap: () => context.push(AppRoute.privicyPolicy),
                image: AppImage.privacyPolicyIcon,
                title: AppStrings.pravicyPolicy,
              ),
              CustomSettingContainer(
                onTap: () => context.push(AppRoute.termsAndConditions),
                image: AppImage.termsAndConditnIcon,
                title: AppStrings.termsAndConditions,
              ),
              Gap(70),
              CustomSettingContainer(
                onTap: () => context.read<AuthCubit>().logOut(),
                image: AppImage.logOut,
                title: AppStrings.logOut,
              ),
            ],
          ),

          Positioned(
            top: 80,
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
                      Text("Saleh Ishaq"),
                      Text("saleh@gmail.com"),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
