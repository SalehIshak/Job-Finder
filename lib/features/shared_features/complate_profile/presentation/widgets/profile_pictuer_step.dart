import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_images.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/core/constants/app_text_styles.dart';
import 'package:job_finder/features/shared_features/complate_profile/presentation/cubit/complete_profile_cubit.dart';
import 'package:job_finder/features/shared_features/complate_profile/presentation/cubit/complete_profile_state.dart';
import 'package:job_finder/features/shared_features/complate_profile/presentation/widgets/custom_container.dart';
import 'package:job_finder/features/shared_features/complate_profile/presentation/widgets/custom_upload_photo_bottom_sheet.dart';

class ProfilePictuerStep extends StatelessWidget {
  const ProfilePictuerStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // PROFILE IMAGE
          BlocBuilder<CompleteProfileCubit, CompleteProfileState>(
            builder: (context, state) {
              return CircleAvatar(
                radius: 70,
                backgroundColor: AppColor.grey2,
                backgroundImage: state is CompleteProfileLoaded && state.profileImage != null
                    ? FileImage(File(state.profileImage!))
                    : null,
                child: state is CompleteProfileLoaded && state.profileImage == null
                    ? Image.asset(AppImage.imagesIconesVictors, width: 36, height: 33)
                    : state is CompleteProfileLoading
                    ? CupertinoActivityIndicator()
                    : null,
              );
            },
          ),
          Gap(15),
          Text(AppStrings.complateProfilemainTitle, style: AppTextStyles.hidding1),
          Gap(5),
          Text(AppStrings.complateProfilePictuerDescription, style: AppTextStyles.description1, textAlign: TextAlign.center),
          Gap(10),
          // PICK IMAGW
          CustomContainer(
            onTap: () {
              final cubit = context.read<CompleteProfileCubit>();
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
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.camera_fill),
                Gap(10),
                Text(AppStrings.complateProfileUploadPhoto, style: AppTextStyles.hidding1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
