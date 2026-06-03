import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_images.dart';
import 'package:job_finder/core/constants/app_strings.dart' show AppStrings;
import 'package:job_finder/core/constants/app_text_styles.dart' show AppTextStyles;

class CustomJobCardTest extends StatelessWidget {
  const CustomJobCardTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 324,
      height: 210,
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
                child: Padding(padding: const EdgeInsets.all(8.0), child: SvgPicture.asset(AppImage.imagesIconesGoogle)),
              ),
              title: Text(AppStrings.uiDesigner, style: AppTextStyles.hidding1),
              subtitle: Text(AppStrings.google, style: AppTextStyles.description1),
              trailing: Container(
                width: 60,
                height: 20,
                decoration: BoxDecoration(color: AppColor.secondary, borderRadius: BorderRadius.circular(40)),
                child: Center(child: Text("Active")),
              ),
            ),

            Row(
              children: [
                Container(
                  width: 90,
                  height: 30,
                  decoration: BoxDecoration(color: AppColor.secondary, borderRadius: BorderRadius.circular(40)),
                  child: Center(child: Text(AppStrings.design, style: AppTextStyles.lable3)),
                ),
                Gap(10),
                Container(
                  width: 90,
                  height: 30,
                  decoration: BoxDecoration(color: AppColor.secondary, borderRadius: BorderRadius.circular(40)),
                  child: Center(child: Text(AppStrings.fullTime, style: AppTextStyles.lable3)),
                ),
                Gap(10),
                Container(
                  width: 90,
                  height: 30,
                  decoration: BoxDecoration(color: AppColor.secondary, borderRadius: BorderRadius.circular(40)),
                  child: Center(child: Text(AppStrings.remote, style: AppTextStyles.lable3)),
                ),
              ],
            ),

            Gap(12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(CupertinoIcons.location_solid, size: 15),
                    Text(AppStrings.califorina, style: AppTextStyles.lable7),
                  ],
                ),

                Row(
                  children: [
                    Icon(Icons.people_alt_outlined, size: 15),
                    Text("14"),
                    Gap(5),
                    Text(AppStrings.aoplicatios, style: AppTextStyles.lable7),
                  ],
                ),

                Row(
                  children: [
                    Icon(Icons.check, size: 15),
                    Gap(3),
                    Text("3"),
                    Gap(5),
                    Text(AppStrings.accepted, style: AppTextStyles.lable7),
                  ],
                ),
              ],
            ),
            Divider(),
            Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 155,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.primary, width: 1.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.edit_document, size: 15),
                      Gap(5),
                      Text(AppStrings.eddit, style: AppTextStyles.lable3),
                    ],
                  ),
                ),
                Container(
                  width: 155,
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.primary, width: 1.5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.people_alt_outlined, size: 15),
                      Gap(5),
                      Text(AppStrings.viewAplications, style: AppTextStyles.lable3),
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
