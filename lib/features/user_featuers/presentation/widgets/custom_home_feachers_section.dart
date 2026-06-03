import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_images.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/core/constants/app_text_styles.dart';

class CustomHomeFeachersSection extends StatelessWidget {
  const CustomHomeFeachersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 325,
      height: 210,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 158,
            height: 210,
            decoration: BoxDecoration(border: BoxBorder.all(color: AppColor.grey2, width: 2)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImage.imagesIconesJob, width: 44, height: 44),
                Text(AppStrings.remoteJobCounter, style: AppTextStyles.hidding1),
                Text(AppStrings.remoteJob, style: AppTextStyles.lable2),
              ],
            ),
          ),

          Column(
            children: [
              Container(
                width: 157,
                height: 100,
                decoration: BoxDecoration(border: BoxBorder.all(color: AppColor.grey2, width: 2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImage.imagesIconesPartTime, width: 30, height: 30),
                    Gap(10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppStrings.partTimeCounter, style: AppTextStyles.hidding1),
                        Text(AppStrings.partTime, style: AppTextStyles.lable2),
                      ],
                    ),
                  ],
                ),
              ),
              Gap(10),
              Container(
                width: 157,
                height: 100,
                decoration: BoxDecoration(border: BoxBorder.all(color: AppColor.grey2, width: 2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImage.imagesIconesFullTime, width: 30, height: 30),
                    Gap(10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(AppStrings.fullTimeCounter, style: AppTextStyles.hidding1),
                        Text(AppStrings.fullTimeCounter, style: AppTextStyles.lable2),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
