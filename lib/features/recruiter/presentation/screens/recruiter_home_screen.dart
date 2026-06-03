import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/core/constants/app_text_styles.dart';
import 'package:job_finder/core/router/app_route_strings.dart';
import 'package:job_finder/core/shared/custom_botton.dart';
import 'package:job_finder/features/recruiter/presentation/widgets/custom_head_container.dart';
import 'package:job_finder/features/recruiter/presentation/widgets/custom_job_card.dart';

class RecruiterHomeScreen extends StatefulWidget {
  const RecruiterHomeScreen({super.key});

  @override
  State<RecruiterHomeScreen> createState() => _RecruiterHomeScreenState();
}

class _RecruiterHomeScreenState extends State<RecruiterHomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              // HEAD PRIMARY SECTION
              Container(
                height: 150,
                width: double.infinity,
                color: AppColor.primary,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      Gap(50),
                      ListTile(
                        contentPadding: EdgeInsets.all(0),
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: AppColor.secondary,
                          child: Icon(Icons.person, color: AppColor.white),
                        ),
                        title: Text(AppStrings.welcomeBack, style: AppTextStyles.lable1),
                        subtitle: Text("Laith Mahdi 👋", style: AppTextStyles.hidding3),
                        trailing: Container(
                          width: 38,
                          height: 40,
                          decoration: BoxDecoration(color: AppColor.secondary, borderRadius: BorderRadius.circular(5)),
                          child: Icon(Icons.notifications_active, color: AppColor.primary),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Gap(60),

              // POST A NEW JOB
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomBotton(
                  text: AppStrings.postNewJob,
                  onTap: () => context.push(AppRoute.recruitercreateNewJob),
                  icon: Icons.add,
                  iconColor: AppColor.white,
                ),
              ),
              Gap(20),

              // SLIVET LIST
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomScrollView(
                    slivers: [
                      // SEE ALL
                      SliverToBoxAdapter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(AppStrings.myJobs, style: AppTextStyles.lable2),
                            Text(AppStrings.seeAll, style: AppTextStyles.lable3),
                          ],
                        ),
                      ),
                      SliverToBoxAdapter(child: Gap(20)),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(childCount: 20, (context, index) {
                          return Padding(padding: const EdgeInsets.only(bottom: 15), child: CustomJobCardTest());
                        }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Positioned(
            top: 120,
            left: 10,
            right: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomHeadContainer(
                  number: Text(AppStrings.activeJobsNumber, style: AppTextStyles.hidding2Span),
                  title: Text(AppStrings.activeJob, style: AppTextStyles.lable2),
                ),
                CustomHeadContainer(
                  number: Text(AppStrings.aoplicatiosNumber, style: AppTextStyles.hidding2Span),
                  title: Text(AppStrings.aoplicatios, style: AppTextStyles.lable2),
                ),
                CustomHeadContainer(
                  number: Text(AppStrings.acceptedNumber, style: AppTextStyles.hidding2Span),
                  title: Text(AppStrings.accepted, style: AppTextStyles.lable2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
