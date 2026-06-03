import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_images.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/core/constants/app_text_styles.dart';
import 'package:job_finder/core/shared/costom_appbar.dart';
import 'package:job_finder/core/shared/custom_botton.dart';
import 'package:job_finder/core/shared/custom_divider.dart';
import 'package:job_finder/features/user_featuers/domain/entitis/user_suggested_entity.dart';

class JobDetailsScreen extends StatefulWidget {
  final UserSuggestedJobsEntity jobData;
  const JobDetailsScreen({super.key, required this.jobData});

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  final List<String> testSkillsList = [
    "User Research",
    "Usability Testing",
    "Data Analysis",
    "Interview Techniques",
    "Persona Development",
    "Journey Mapping",
  ];
  final List<String> responsipilitiesList = [
    "User Research",
    "Usability Testing",
    "Data Analysis",
    "Interview Techniques",
    "Persona Development",
    "Journey Mapping",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,

      appBar: CustomAppBar(
        title: AppStrings.details,
        backgroundColor: AppColor.white,
        showBackButton: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Icon(Icons.favorite_border_outlined, size: 30, color: AppColor.primary),
          ),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColor.grey2),
                    child: Padding(padding: const EdgeInsets.all(8.0), child: SvgPicture.asset(AppImage.imagesIconesGoogle)),
                  ),
                  title: Text(AppStrings.uiDesigner, style: AppTextStyles.hidding1),
                  subtitle: Text(AppStrings.google, style: AppTextStyles.description1),
                  // trailing: Icon(Icons.bookmark_outline, color: AppColor.primary, size: 25),
                ),
              ),

              SliverToBoxAdapter(child: Gap(5)),

              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Row(children: [Icon(Icons.location_on_outlined), Gap(10), Text("Country")]),
                    Gap(5),
                    Row(children: [Icon(Icons.smart_display_rounded), Gap(10), Text("1400")]),
                  ],
                ),
              ),

              SliverToBoxAdapter(child: Gap(10)),

              //  SECTION
              SliverToBoxAdapter(
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(AppStrings.experiance),
                          Text("4 - 6 yars", style: AppTextStyles.lable12),
                        ],
                      ),
                      VerticalDivider(color: Colors.grey),

                      Gap(20),
                      Column(
                        children: [
                          Text(AppStrings.jobTyps),
                          Text("4 - 6 yars", style: AppTextStyles.lable12),
                        ],
                      ),
                      VerticalDivider(color: Colors.grey),

                      Gap(20),
                      Column(
                        children: [
                          Text(AppStrings.experiance),
                          Text("4 - 6 yars", style: AppTextStyles.lable12),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(child: Gap(15)),
              SliverToBoxAdapter(child: Text("${AppStrings.updated} 3 years ago")),

              // SKILL SECTION
              SliverToBoxAdapter(child: Gap(20)),
              SliverToBoxAdapter(child: Text(AppStrings.skils, style: AppTextStyles.hidding1)),
              SliverToBoxAdapter(child: Gap(15)),
              SliverToBoxAdapter(
                child: Wrap(
                  spacing: 8,
                  children: [
                    ...testSkillsList.map((element) {
                      return Chip(
                        label: Text(element),
                        backgroundColor: AppColor.grey2,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      );
                    }),
                  ],
                ),
              ),

              //   JOB DESCRIPTION
              SliverToBoxAdapter(child: Gap(20)),
              SliverToBoxAdapter(child: Text(AppStrings.jobDescription, style: AppTextStyles.hidding1)),
              SliverToBoxAdapter(child: Gap(5)),
              SliverToBoxAdapter(child: Text(AppStrings.complateProfileDescription3, style: AppTextStyles.description1)),

              // RESPOSPILITYS
              SliverToBoxAdapter(child: Gap(20)),
              SliverToBoxAdapter(child: Text(AppStrings.respinsipilities, style: AppTextStyles.hidding1)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    children: responsipilitiesList.map((element) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            CircleAvatar(radius: 3, backgroundColor: AppColor.grey1),
                            Gap(10),
                            Text(element, style: AppTextStyles.description1),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),

              // REQUIREMENTS
              SliverToBoxAdapter(child: Gap(20)),
              SliverToBoxAdapter(child: Text(AppStrings.requirements, style: AppTextStyles.hidding1)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    children: responsipilitiesList.map((element) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            CircleAvatar(radius: 3, backgroundColor: AppColor.grey1),
                            Gap(10),
                            Text(element, style: AppTextStyles.description1),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),

              // PENIFITS
              SliverToBoxAdapter(child: Gap(20)),
              SliverToBoxAdapter(child: Text(AppStrings.penefits, style: AppTextStyles.hidding1)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    children: responsipilitiesList.map((element) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            CircleAvatar(radius: 3, backgroundColor: AppColor.grey1),
                            Gap(10),
                            Text(element, style: AppTextStyles.description1),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),

              SliverToBoxAdapter(child: Gap(20)),
              SliverToBoxAdapter(
                child: CustomBotton(text: AppStrings.applyNow, onTap: () {}),
              ),
              SliverToBoxAdapter(child: Gap(5)),
              SliverToBoxAdapter(child: CustomDivider()),
              // SliverToBoxAdapter(child: Gap(100)),
            ],
          ),
        ),
      ),
    );
  }
}
