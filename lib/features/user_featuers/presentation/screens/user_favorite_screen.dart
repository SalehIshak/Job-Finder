import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/core/constants/app_text_styles.dart';

class UserFavoriteScreen extends StatelessWidget {
  const UserFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        surfaceTintColor: AppColor.white,
        toolbarHeight: 80,
        title: Text(AppStrings.favoriteJobs, style: AppTextStyles.hidding1),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Text(AppStrings.deleteAll, style: AppTextStyles.lable8),
          ),
        ],
      ),

      body: CustomScrollView(
        slivers: [
          SliverList.separated(
            itemCount: 10,
            separatorBuilder: (context, index) => Gap(15),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),

                //  child: CustomUserJobCard()
              );
            },
          ),
        ],
      ),
    );
  }
}
