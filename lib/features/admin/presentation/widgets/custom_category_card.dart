import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_text_styles.dart';

class CustomCategoryCard extends StatelessWidget {
  const CustomCategoryCard({super.key});

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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(radius: 25, child: Text("SL")),
                Gap(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Flutter Devoloper FullStack", style: AppTextStyles.lable12),
                      Text(
                        "Company Description Company Description Company Description Company Description",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Container(
                  width: 80,
                  height: 30,
                  decoration: BoxDecoration(color: AppColor.secondary, borderRadius: BorderRadius.circular(15)),
                  child: Center(child: Text("Active", style: AppTextStyles.lable2)),
                ),

                Row(
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.primary),
                        color: AppColor.secondary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.edit_outlined, color: AppColor.primary),
                    ),
                    Gap(10),
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColor.red),
                        color: AppColor.red.withAlpha(40),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(Icons.delete_outline, color: AppColor.red),
                    ),
                  ],
                ),
              ],
            ),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(CupertinoIcons.calendar, size: 20),
                    Gap(5),
                    Text("30 may 2026", overflow: TextOverflow.ellipsis, maxLines: 1),
                  ],
                ),
                Row(
                  children: [
                    Icon(CupertinoIcons.calendar_badge_plus, size: 20),
                    Gap(5),
                    Text("30 may 2026", overflow: TextOverflow.ellipsis, maxLines: 1),
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
