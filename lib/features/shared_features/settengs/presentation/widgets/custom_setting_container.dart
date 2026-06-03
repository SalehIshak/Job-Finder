import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_text_styles.dart';

class CustomSettingContainer extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onTap;
  const CustomSettingContainer({required this.image, required this.title, super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Gap(20),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.grey1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Gap(5),
                  Image.asset(image, width: 40, height: 40),
                  Gap(15),
                  Text(title, style: AppTextStyles.hidding1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
