import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/core/router/app_route_strings.dart';
import 'package:job_finder/core/shared/costom_appbar.dart';
import 'package:job_finder/core/shared/custom_snack_bar.dart';
import 'package:job_finder/features/admin/domain/entitis/admin_get_jobs_list_entitys.dart';
import 'package:job_finder/features/admin/presentation/cubit/admin_cubit.dart';
import 'package:job_finder/features/admin/presentation/cubit/admin_state.dart';
import 'package:job_finder/features/admin/presentation/widgets/custom_admin_job_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AdminJobsScreen extends StatefulWidget {
  const AdminJobsScreen({super.key});

  @override
  State<AdminJobsScreen> createState() => _AdminJobsScreenState();
}

class _AdminJobsScreenState extends State<AdminJobsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AdminCubit>().getJobsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: CustomAppBar(
        title: AppStrings.myJobs,
        showBackButton: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () => context.push(AppRoute.admincreateNewJob),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(color: AppColor.primary, borderRadius: BorderRadius.circular(10)),
                child: Icon(Icons.add, color: AppColor.white),
              ),
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  BlocConsumer<AdminCubit, AdminState>(
                    listener: (context, state) {
                      if (state is AdminDeleteJobSuccess) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(customSnackBar("Job Deleted Successfuly", backgroundColor: AppColor.success));
                      }
                      if (state is AdminDeleteJobFailuer) {
                        ScaffoldMessenger.of(context).showSnackBar(customSnackBar(state.errorMessage));
                      }
                    },
                    builder: (context, state) {
                      final cubit = context.read<AdminCubit>();
                      final dummyList = List.generate(5, (index) => AdminGetJobsListEntity.empty());
                      if (state is AdminGetJobsListLoading) {
                        return SliverToBoxAdapter(child: CupertinoActivityIndicator(radius: 15, color: AppColor.primary));
                      }
                      return SliverSkeletonizer(
                        enabled: state is AdminGetJobsListLoading,
                        child: SliverList.separated(
                          itemCount: state is AdminGetJobsListLoading ? dummyList.length : cubit.jobsList.length,
                          separatorBuilder: (context, index) => Gap(15),
                          itemBuilder: ((context, index) {
                            final jobItemData = state is AdminGetJobsListLoading ? dummyList[index] : cubit.jobsList[index];
                            return CustomAdminJobCard(jobdata: jobItemData);
                          }),
                        ),
                      );
                    },
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
