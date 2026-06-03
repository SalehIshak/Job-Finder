import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:job_finder/core/constants/app_color.dart' show AppColor;
import 'package:job_finder/core/constants/app_images.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/core/constants/app_text_styles.dart';

class CustomApplicationCard extends StatelessWidget {
  const CustomApplicationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 324,
      height: 160,
      decoration: BoxDecoration(
        border: BoxBorder.all(color: AppColor.grey2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColor.grey2),
                child: Padding(padding: const EdgeInsets.all(8.0), child: SvgPicture.asset(AppImage.imagesLogoLogoImage)),
              ),
              title: Text(AppStrings.uiDesigner, style: AppTextStyles.hidding1),
              subtitle: Text(AppStrings.google, style: AppTextStyles.description1),
              trailing: Icon(Icons.bookmark_outline, color: AppColor.primary, size: 25),
            ),

            Row(
              children: [
                Container(
                  width: 72,
                  height: 27,
                  decoration: BoxDecoration(color: AppColor.secondary, borderRadius: BorderRadius.circular(7)),
                  child: Center(child: Text(AppStrings.design, style: AppTextStyles.lable3)),
                ),
                Gap(10),
                Container(
                  width: 72,
                  height: 27,
                  decoration: BoxDecoration(color: AppColor.secondary, borderRadius: BorderRadius.circular(7)),
                  child: Center(child: Text(AppStrings.fullTime, style: AppTextStyles.lable3)),
                ),
              ],
            ),

            Gap(12),

            Row(
              children: [
                Row(
                  children: [
                    Icon(CupertinoIcons.paperplane),
                    Gap(15),
                    Text(AppStrings.califorina, style: AppTextStyles.lable2),
                  ],
                ),
                Spacer(),
                Text(AppStrings.pricePerMonth, style: AppTextStyles.hidding1),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
