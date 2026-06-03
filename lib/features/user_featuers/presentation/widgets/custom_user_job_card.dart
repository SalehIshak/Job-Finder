import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:job_finder/core/constants/app_color.dart' show AppColor;
import 'package:job_finder/core/constants/app_images.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/core/constants/app_text_styles.dart';
import 'package:job_finder/core/helpers/date_helper.dart';
import 'package:job_finder/features/user_featuers/domain/entitis/user_get_all_jobs_entitys.dart';

class CustomUserdJobCard extends StatelessWidget {
  final UserJobDataEntity jobData;
  const CustomUserdJobCard({super.key, required this.jobData});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              title: Text(jobData.title, style: AppTextStyles.lable12),
              subtitle: Text("${jobData.postedBy.fullName} .${jobData.postedBy.role}", style: AppTextStyles.lable2),
              trailing: Icon(Icons.bookmark_outline, color: AppColor.primary, size: 25),
            ),

            Row(
              children: [
                Container(
                  width: 90,
                  height: 27,
                  decoration: BoxDecoration(color: AppColor.secondary, borderRadius: BorderRadius.circular(7)),
                  child: Center(child: Text(jobData.jobType, style: AppTextStyles.lable3)),
                ),
                Gap(10),
                Container(
                  width: 110,
                  height: 27,
                  decoration: BoxDecoration(color: AppColor.secondary, borderRadius: BorderRadius.circular(7)),
                  child: Center(child: Text(jobData.jobLevel, style: AppTextStyles.lable3)),
                ),
                Gap(10),
                Container(
                  width: 90,
                  height: 27,
                  decoration: BoxDecoration(color: AppColor.secondary, borderRadius: BorderRadius.circular(7)),
                  child: Center(child: Text(jobData.experience, style: AppTextStyles.lable3)),
                ),
              ],
            ),

            Gap(12),

            Row(
              children: [
                Icon(CupertinoIcons.location_solid),
                Gap(5),
                Text(jobData.location, style: AppTextStyles.lable2),
              ],
            ),
            Row(
              children: [
                Icon(CupertinoIcons.money_dollar),
                Gap(5),
                Text(jobData.salaryRange, style: AppTextStyles.lable2),
              ],
            ),
            Divider(),
            Row(
              children: [
                Icon(CupertinoIcons.clock, size: 15),
                Gap(5),
                Text(DateHelper.formatDate(jobData.createdAt), style: AppTextStyles.lable3),
                Spacer(),
                Container(
                  decoration: BoxDecoration(color: AppColor.secondary, borderRadius: BorderRadius.circular(10)),
                  child: GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(AppStrings.viewDetails, style: AppTextStyles.lable12),
                    ),
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
