import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/core/constants/app_text_styles.dart' show AppTextStyles;
import 'package:job_finder/core/helpers/date_helper.dart';
import 'package:job_finder/core/router/app_route_strings.dart';
import 'package:job_finder/features/admin/domain/entitis/admin_get_jobs_list_entitys.dart';
import 'package:job_finder/features/admin/presentation/cubit/admin_cubit.dart';
import 'package:job_finder/features/admin/presentation/cubit/admin_state.dart';

class CustomAdminJobCard extends StatelessWidget {
  final AdminGetJobsListEntity jobdata;
  const CustomAdminJobCard({required this.jobdata, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      decoration: BoxDecoration(
        border: BoxBorder.all(color: AppColor.grey1),
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
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(jobdata.title, style: AppTextStyles.lable2),
                  ),
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
            Gap(10),

            // BOTTONS  EDDIT & DELETE
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // EDDIT
                GestureDetector(
                  onTap: () => context.push(AppRoute.admincreateNewJob, extra: jobdata),
                  child: Container(
                    width: 155,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.primary, width: 1.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.edit_document, size: 15),
                        Gap(5),
                        Text(AppStrings.eddit, style: AppTextStyles.lable3),
                      ],
                    ),
                  ),
                ),

                // DELETE
                BlocBuilder<AdminCubit, AdminState>(
                  builder: (context, state) {
                    // TO MAKE LOADING WITH DELETED JOB ONLY
                    bool isLoading = state is AdminDeleteJobLoading && state.jobId == jobdata.id;
                    return GestureDetector(
                      onTap: () => context.read<AdminCubit>().deleteJob(jobdata.id),
                      child: Container(
                        width: 155,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColor.error,
                          border: Border.all(color: AppColor.primary, width: 1.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: isLoading
                            ? CupertinoActivityIndicator(radius: 15, color: AppColor.primary)
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.delete, size: 25),
                                  Gap(5),
                                  Text(AppStrings.delete, style: AppTextStyles.lable1),
                                ],
                              ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
