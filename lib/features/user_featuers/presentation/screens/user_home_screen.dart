import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_images.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/core/constants/app_text_styles.dart';
import 'package:job_finder/core/router/app_route_strings.dart';
import 'package:job_finder/core/shared/custom_global_text_fieled.dart';
import 'package:job_finder/core/shared/custom_snack_bar.dart';
import 'package:job_finder/features/user_featuers/data/models/brous_by_categorys_model.dart';
import 'package:job_finder/features/user_featuers/presentation/cubit/user_cubit.dart';
import 'package:job_finder/features/user_featuers/presentation/cubit/user_state.dart';
import 'package:job_finder/features/user_featuers/presentation/widgets/cuetom_search_bottom_sheet.dart';
import 'package:job_finder/features/user_featuers/presentation/widgets/custom_user_suggested_job_card.dart';
import 'package:job_finder/features/user_featuers/presentation/widgets/custom_home_feachers_section.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  final TextEditingController _homeSearchFieledController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().getStatistics();
  }

  @override
  void dispose() {
    super.dispose();
    _homeSearchFieledController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserGetSuggestedJobsFailuer) {
          ScaffoldMessenger.of(context).showSnackBar(customSnackBar(state.errorMessage));
        }
      },
      buildWhen: (previous, current) =>
          current is UserGetSuggestedJobsLoading ||
          current is UserGetSuggestedJobsSuccess ||
          current is UserGetSuggestedJobsFailuer,
      builder: (context, state) {
        return Skeletonizer(
          enabled: state is UserGetSuggestedJobsLoading,
          child: Scaffold(
            backgroundColor: AppColor.white,
            body: Padding(
              padding: const EdgeInsets.only(top: 30, right: 20, left: 20),
              child: SafeArea(
                child: Column(
                  children: [
                    // WELCOME SECTION
                    ListTile(
                      contentPadding: EdgeInsets.all(0),
                      leading: CircleAvatar(radius: 25, child: Icon(Icons.person)),
                      title: Text(AppStrings.welcomeBack),
                      subtitle: Text("Laith Mahdi 👋"),
                      trailing: Container(
                        width: 38,
                        height: 40,
                        decoration: BoxDecoration(color: AppColor.grey2, borderRadius: BorderRadius.circular(5)),
                        child: Icon(Icons.notifications_active),
                      ),
                    ),
                    Gap(10),

                    //SEARCH SECTION
                    CustomSearchFiled(
                      controller: _homeSearchFieledController,
                      hintText: AppStrings.enterJobLocation,
                      hintTextStyle: AppTextStyles.description1,
                      prefixIcon: Icon(CupertinoIcons.search, color: AppColor.primary, size: 25),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: AppColor.white,
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                height: MediaQuery.of(context).size.height * 0.75,
                                child: SafeArea(child: CustomSearchBottomSheet()),
                              );
                            },
                          );
                        },
                        child: Icon(Icons.tune, color: AppColor.primary, size: 30),
                      ),
                    ),
                    Gap(10),

                    // SCROLLABLE SECTON
                    Expanded(
                      child: CustomScrollView(
                        slivers: [
                          // CAROUSEL SLIDER IMAGE SECTION
                          SliverToBoxAdapter(
                            child: Padding(padding: const EdgeInsets.only(bottom: 10), child: Image.asset(AppImage.imagesCover)),
                          ),

                          //FINED YOUR JOB SECTION
                          SliverToBoxAdapter(
                            child: Align(
                              alignment: AlignmentGeometry.centerLeft,
                              child: Text(AppStrings.finedYourJob, style: AppTextStyles.hidding1),
                            ),
                          ),

                          SliverToBoxAdapter(child: Gap(10)),

                          // COLLECTIONS
                          SliverToBoxAdapter(child: CustomHomeFeachersSection()),

                          SliverToBoxAdapter(child: Gap(20)),

                          // BROUSE BY CATEGORYS TEXT
                          SliverToBoxAdapter(child: Text(AppStrings.brousebyCategorys, style: AppTextStyles.hidding1)),

                          SliverToBoxAdapter(child: Gap(20)),

                          // CATEGORYS ITEMS
                          SliverToBoxAdapter(
                            child: BlocBuilder<UserCubit, UserState>(
                              builder: (context, state) {
                                final int currentItem = state is UserItemSellected ? state.currentItem : 0;
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: List.generate(brouseByCategorysList.length, (index) {
                                    final item = brouseByCategorysList[index];
                                    return SizedBox(
                                      width: 67,
                                      height: 84,
                                      child: GestureDetector(
                                        onTap: () => context.read<UserCubit>().changeItemIndex(index),
                                        child: Column(
                                          children: [
                                            item.imag,
                                            Gap(5),
                                            Text(
                                              item.title,
                                              style: currentItem == index ? AppTextStyles.lable3 : AppTextStyles.lable2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                                );
                              },
                            ),
                          ),

                          // SUGGESTED JOBS TEXT
                          SliverToBoxAdapter(child: Text(AppStrings.suggestedJobs, style: AppTextStyles.hidding1)),

                          SliverToBoxAdapter(child: Gap(15)),

                          SliverList.separated(
                            itemCount: userCubit.statisticsList.length,
                            separatorBuilder: (context, index) => Gap(15),
                            itemBuilder: (context, index) {
                              final jobData = userCubit.statisticsList[index];
                              return GestureDetector(
                                onTap: () => context.push(AppRoute.jobDetails, extra: jobData),
                                child: BlocBuilder<UserCubit, UserState>(
                                  builder: (context, state) {
                                    return CustomUserSuggestedJobCard(jobData: jobData);
                                  },
                                ),
                              );
                            },
                          ),

                          //   CATEGORYS
                          SliverToBoxAdapter(child: Gap(20)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
