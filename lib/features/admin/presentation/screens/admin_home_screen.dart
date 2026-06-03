import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/core/constants/app_text_styles.dart';
import 'package:job_finder/core/shared/custom_snack_bar.dart';
import 'package:job_finder/features/admin/domain/entitis/admin_statistics_entity.dart';
import 'package:job_finder/features/admin/presentation/cubit/admin_cubit.dart';
import 'package:job_finder/features/admin/presentation/cubit/admin_state.dart';
import 'package:job_finder/features/admin/presentation/widgets/admin_custom_linearrogress_row.dart';
import 'package:job_finder/features/admin/presentation/widgets/custom_admin_suggested_jobs_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final adminCubit = context.read<AdminCubit>();
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {
        if (state is AdminGetStatisticsFailuer) {
          ScaffoldMessenger.of(context).showSnackBar(customSnackBar(state.errorMessage));
        }
      },
      buildWhen: (previous, current) =>
          current is AdminGetStatisticsLoading || current is AdminGetStatisticsSuccess || current is AdminGetStatisticsFailuer,
      builder: (context, state) {
        final bool isLoading = state is AdminGetStatisticsLoading;
        return Skeletonizer(
          enabled: state is AdminGetStatisticsLoading,
          child: Scaffold(
            body: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                child: Icon(Icons.person, color: AppColor.primary),
                              ),
                              title: Text(AppStrings.welcomeBack, style: AppTextStyles.lable1),
                              subtitle: Text("Admin👋", style: AppTextStyles.lable1),
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
                    // BODY
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: CustomScrollView(
                          slivers: [
                            // TITLE
                            SliverToBoxAdapter(child: Text(AppStrings.jobsByTypes, style: AppTextStyles.hidding1)),
                            SliverToBoxAdapter(child: Gap(10)),

                            // ANALYTECS
                            SliverToBoxAdapter(
                              child: Container(
                                width: double.infinity,
                                height: 140,
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColor.grey1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(AppStrings.distribution, style: AppTextStyles.lable12),
                                      Gap(15),
                                      CustomLinearProgressRow(
                                        adminCubit: adminCubit,
                                        value: adminCubit.totalJobs.total == 0
                                            ? 0.0
                                            : adminCubit.totalJobs.fullTime / adminCubit.totalJobs.total,
                                        tilte: AppStrings.fullTime,
                                        score: adminCubit.totalJobs.fullTime,
                                      ),
                                      Gap(5),
                                      CustomLinearProgressRow(
                                        adminCubit: adminCubit,
                                        value: adminCubit.totalJobs.total == 0
                                            ? 0.0
                                            : adminCubit.totalJobs.partTime / adminCubit.totalJobs.total,
                                        tilte: AppStrings.partTime,
                                        score: adminCubit.totalJobs.partTime,
                                      ),
                                      Gap(5),
                                      CustomLinearProgressRow(
                                        adminCubit: adminCubit,
                                        value: adminCubit.totalJobs.total == 0
                                            ? 0.0
                                            : adminCubit.totalJobs.freelance / adminCubit.totalJobs.total,
                                        tilte: AppStrings.freelancer,
                                        score: adminCubit.totalJobs.freelance,
                                      ),
                                      Gap(5),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            SliverToBoxAdapter(child: Gap(10)),

                            // SUGGESTED jOBS
                            SliverToBoxAdapter(child: Text(AppStrings.suggestedJobs, style: AppTextStyles.hidding1)),

                            SliverToBoxAdapter(child: Gap(10)),

                            SliverList.separated(
                              itemCount: isLoading ? 5 : adminCubit.statisticsList.length,
                              separatorBuilder: (context, index) => Gap(15),
                              itemBuilder: ((context, index) {
                                final dummyList = List.generate(5, (index) => AdminSuggestedJobsEntity.empty());
                                final jobItemData = isLoading ? dummyList[index] : adminCubit.statisticsList[index];
                                return CustomAdminSuggestedCard(jobdata: jobItemData);
                              }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // ABOVE SECTION
                Positioned(
                  top: 120,
                  left: 10,
                  right: 10,
                  child: BlocBuilder<AdminCubit, AdminState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // FULL TIME
                          Container(
                            width: 115,
                            height: 80,
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              border: Border.all(color: AppColor.grey1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${adminCubit.totalJobs.fullTime}", style: AppTextStyles.hidding2Span),
                                Text(AppStrings.fullTime, style: AppTextStyles.lable12),
                              ],
                            ),
                          ),
                          Container(
                            width: 115,
                            height: 80,
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              border: Border.all(color: AppColor.grey1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${adminCubit.totalJobs.partTime}", style: AppTextStyles.hidding2Span),
                                Text(AppStrings.partTime, style: AppTextStyles.lable12),
                              ],
                            ),
                          ),
                          Container(
                            width: 115,
                            height: 80,
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              border: Border.all(color: AppColor.grey1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${adminCubit.totalJobs.freelance}", style: AppTextStyles.hidding2Span),
                                Text(AppStrings.freelancer, style: AppTextStyles.lable12),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
