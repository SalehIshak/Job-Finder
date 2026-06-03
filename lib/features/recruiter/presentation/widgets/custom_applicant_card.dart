import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/core/constants/app_text_styles.dart' show AppTextStyles;

class CustomApplicantionCard extends StatelessWidget {
  const CustomApplicantionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 324,
      height: 170,
      decoration: BoxDecoration(
        border: BoxBorder.all(color: AppColor.grey1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.all(0),
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: AppColor.secondary,
                child: Text("UN", style: AppTextStyles.lable3),
              ),
              title: Text(AppStrings.jobTitle, style: AppTextStyles.hidding1),
              subtitle: Text(AppStrings.testApplied, style: AppTextStyles.description1),
              trailing: Container(
                width: 90,
                height: 30,
                decoration: BoxDecoration(color: AppColor.secondary, borderRadius: BorderRadius.circular(40)),
                child: Center(child: Text(AppStrings.accepted)),
              ),
            ),
            Row(children: [Icon(Icons.calendar_month), Gap(10), Text(AppStrings.testApplied)]),
            Gap(10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 155,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.red, width: 1.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.close, size: 15, color: AppColor.red),
                      Gap(5),
                      Text(AppStrings.reject, style: AppTextStyles.lable8),
                    ],
                  ),
                ),
                Container(
                  width: 155,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    border: Border.all(color: AppColor.primary, width: 1.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.check, size: 15, color: AppColor.white),
                      Gap(5),
                      Text(AppStrings.accepted, style: AppTextStyles.lable1),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
