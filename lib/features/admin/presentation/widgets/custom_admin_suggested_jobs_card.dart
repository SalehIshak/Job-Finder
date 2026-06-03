import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_text_styles.dart' show AppTextStyles;
import 'package:job_finder/core/helpers/date_helper.dart';
import 'package:job_finder/features/admin/domain/entitis/admin_statistics_entity.dart';

class CustomAdminSuggestedCard extends StatelessWidget {
  final AdminSuggestedJobsEntity jobdata;
  const CustomAdminSuggestedCard({required this.jobdata, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.grey1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            //LIST TILE
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(radius: 25, child: Text("SL")),
                Gap(5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(jobdata.title, style: AppTextStyles.lable2),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(jobdata.company.fullName, style: AppTextStyles.lable2),
                    ),
                  ],
                ),
                Gap(5),
                Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(color: AppColor.secondary, borderRadius: BorderRadius.circular(15)),
                  child: Center(child: Text(jobdata.jobType, style: AppTextStyles.lable2)),
                ),
              ],
            ),
            Gap(10),

            // LEVEL & PRICE
            Row(
              children: [
                Container(
                  width: 120,
                  height: 30,
                  decoration: BoxDecoration(color: AppColor.secondary, borderRadius: BorderRadius.circular(15)),
                  child: Center(child: AutoSizeText(jobdata.jobLevel, style: AppTextStyles.lable2)),
                ),
                Gap(10),
                Container(
                  width: 150,
                  height: 30,
                  decoration: BoxDecoration(color: AppColor.grey2, borderRadius: BorderRadius.circular(15)),
                  child: Center(child: Text(jobdata.salaryRange, style: AppTextStyles.lable2)),
                ),
              ],
            ),
            Gap(5),

            Divider(),
            Gap(5),

            // CITY & TIME
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //LAST
                Row(
                  children: [
                    Icon(CupertinoIcons.location_solid, size: 20),
                    Gap(5),
                    // LOCATIN
                    Text(jobdata.location, style: AppTextStyles.lable2, overflow: TextOverflow.ellipsis, maxLines: 1),
                  ],
                ),
                Row(
                  children: [
                    Icon(CupertinoIcons.clock, size: 20),
                    Gap(5),
                    Text(
                      DateHelper.formatDate(jobdata.createdAt),
                      style: AppTextStyles.lable2,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
