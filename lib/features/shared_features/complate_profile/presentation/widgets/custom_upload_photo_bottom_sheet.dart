import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/core/constants/app_text_styles.dart';
import 'package:job_finder/features/shared_features/auth/presentation/cubit/auth_cubit.dart';
import 'package:job_finder/features/shared_features/complate_profile/presentation/widgets/custom_container.dart';
import 'package:job_finder/features/shared_features/complate_profile/presentation/widgets/custom_list_tile.dart';

class UploadPhotoBottomSheet extends StatelessWidget {
  const UploadPhotoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AuthCubit>();
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppStrings.complateProfileUploadPhoto, style: AppTextStyles.hidding2),
              IconButton(onPressed: () => context.pop(), icon: Icon(Icons.close)),
            ],
          ),
          Gap(25),
          CusomListTile(
            title: AppStrings.complateProfileTakePhoto,
            supTitle: AppStrings.complateProfileUseYoureCamira,
            icon: Icon(CupertinoIcons.camera_fill, color: Colors.black, size: 20),
            onTap: () {
              cubit.pickImageFromCamira();
              context.pop();
            },
          ),
          Gap(10),
          CusomListTile(
            title: AppStrings.complateProfileChoseFromGalary,
            supTitle: AppStrings.complateProfilesellectEx,
            icon: Icon(CupertinoIcons.photo_fill, color: Colors.black, size: 20),
            onTap: () {
              cubit.pickImageFromGalary();
              context.pop();
            },
          ),
          Gap(20),
          CustomContainer(
            onTap: () => context.pop(),
            widget: Center(child: Text(AppStrings.complateProfileCancel, style: AppTextStyles.hidding1)),
          ),
        ],
      ),
    );
  }
}
