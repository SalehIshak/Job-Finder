import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/di/injection_container.dart';
import 'package:job_finder/core/router/app_route_strings.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/core/constants/app_text_styles.dart';
import 'package:job_finder/core/shared/custom_botton.dart';
import 'package:job_finder/core/shared/custom_divider.dart';
import 'package:job_finder/features/shared_features/complate_profile/presentation/cubit/complete_profile_cubit.dart';
import 'package:job_finder/features/shared_features/complate_profile/presentation/cubit/complete_profile_state.dart';

class CompleateProfileScreen extends StatelessWidget {
  const CompleateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CompleteProfileCubit>(
      create: (context) => getIt<CompleteProfileCubit>()..loadData(),

      child: Scaffold(
        backgroundColor: AppColor.white,
        appBar: AppBar(
          backgroundColor: AppColor.primary,
          toolbarHeight: 155,
          flexibleSpace: BlocBuilder<CompleteProfileCubit, CompleteProfileState>(
            builder: (context, state) {
              if (state is CompleteProfileLoading) {
                return CupertinoActivityIndicator();
              }
              if (state is CompleteProfileLoaded) {
                final cubit = context.read<CompleteProfileCubit>();
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(55),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(cubit.compleateProfileDataList.length, (index) {
                          return Container(
                            width: 105,
                            height: 6,
                            margin: EdgeInsets.only(right: index < 2 ? 5 : 0),
                            decoration: BoxDecoration(
                              color: index == state.currentScreen ? AppColor.white : AppColor.grey5,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          );
                        }),
                      ),
                      Gap(20),
                      Text(cubit.compleateProfileDataList[state.currentScreen].title, style: AppTextStyles.lable1),
                      Gap(5),
                      Text(cubit.compleateProfileDataList[state.currentScreen].description, style: AppTextStyles.description2),
                    ],
                  ),
                );
              }
              return SizedBox.shrink();
            },
          ),

          // actions: [  ],
        ),
        body: SafeArea(
          child: BlocBuilder<CompleteProfileCubit, CompleteProfileState>(
            builder: (context, state) {
              final cubit = context.read<CompleteProfileCubit>();

              if (state is CompleteProfileLoading) {
                return CupertinoActivityIndicator();
              }

              if (state is CompleteProfileLoaded) {
                return Column(
                  children: [
                    Expanded(
                      child: PageView(
                        controller: cubit.pageController,
                        children: cubit.compleateProfileDataList.map((element) => element.page).toList(),
                        onPageChanged: (index) => cubit.onPageChanged(index),
                      ),
                    ),

                    state.currentScreen == 2
                        ? Column(
                            children: [
                              CustomBotton(
                                text: AppStrings.next,
                                onTap: () {
                                  if (state.currentScreen == 2) {
                                    cubit.setComplateProfileStatuse(true);
                                    context.go(AppRoute.login);
                                  } else {
                                    cubit.nextPage();
                                  }
                                },
                              ),
                              Gap(5),
                              CustomDivider(),
                            ],
                          )
                        : Container(
                            height: 100,
                            color: AppColor.grey3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    state.currentScreen == 0
                                        ? "${cubit.jobRolesSellectedList.length} roles selected"
                                        : state.currentScreen == 1
                                        ? "${cubit.counterysSellectedList.length} locations selected"
                                        : "",
                                  ),
                                ),
                                Gap(10),
                                CustomBotton(
                                  text: AppStrings.next,
                                  onTap: () {
                                    if (state.currentScreen == 2) {
                                      cubit.setComplateProfileStatuse(true);
                                      context.go(AppRoute.login);
                                    } else {
                                      cubit.nextPage();
                                    }
                                  },
                                ),
                                Gap(5),
                                CustomDivider(),
                              ],
                            ),
                          ),
                  ],
                );
              }

              return SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
