import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/core/constants/app_text_styles.dart';
import 'package:job_finder/features/recruiter/presentation/widgets/custom_job_card.dart';

class RecruiterJobsScreen extends StatelessWidget {
  const RecruiterJobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        titleSpacing: 0,
        toolbarHeight: 80,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(color: AppColor.grey2, borderRadius: BorderRadius.circular(10)),
                    child: Icon(Icons.arrow_back, color: AppColor.black),
                  ),
                  Gap(10),
                  Text(AppStrings.myJobs, style: AppTextStyles.hidding1),
                ],
              ),
              Spacer(),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(color: AppColor.primary, borderRadius: BorderRadius.circular(10)),
                child: Icon(Icons.add, color: AppColor.white),
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(color: Colors.grey.shade300, height: 1.5),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 110,
                  height: 35,
                  decoration: BoxDecoration(color: AppColor.primary, borderRadius: BorderRadius.circular(20)),
                  child: Center(child: Text("${AppStrings.all} (25)", style: AppTextStyles.lable12)),
                ),
                Gap(10),
                Container(
                  width: 110,
                  height: 35,
                  decoration: BoxDecoration(color: AppColor.primary, borderRadius: BorderRadius.circular(20)),
                  child: Center(child: Text("${AppStrings.active} (25)", style: AppTextStyles.lable1)),
                ),
                Gap(10),
                Container(
                  width: 110,
                  height: 35,
                  decoration: BoxDecoration(color: AppColor.primary, borderRadius: BorderRadius.circular(20)),
                  child: Center(child: Text("${AppStrings.closed} (3)", style: AppTextStyles.lable1)),
                ),
              ],
            ),
            Gap(25),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Padding(padding: const EdgeInsets.only(bottom: 15), child: CustomJobCardTest());
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
