import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/core/shared/custom_snack_bar.dart';
import 'package:job_finder/core/shared/custom_text_filed.dart';
import 'package:job_finder/core/utils/validators.dart';
import 'package:job_finder/features/user_featuers/domain/entitis/user_get_all_jobs_entitys.dart';
import 'package:job_finder/features/user_featuers/presentation/cubit/user_cubit.dart';
import 'package:job_finder/features/user_featuers/presentation/cubit/user_state.dart';
import 'package:job_finder/features/user_featuers/presentation/widgets/cuetom_search_bottom_sheet.dart';
import 'package:job_finder/features/user_featuers/presentation/widgets/custom_user_job_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserSearchScreen extends StatefulWidget {
  const UserSearchScreen({super.key});

  @override
  State<UserSearchScreen> createState() => _UserSearchScreenState();
}

class _UserSearchScreenState extends State<UserSearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Timer? debounce; // FOR MAKE SEARCH LATE

  @override
  void initState() {
    final userCubit = context.read<UserCubit>();
    super.initState();
    // FOR GET ALL JOBS WHEN APP OPEN
    userCubit.getAllJobs();
    // FOR SEARCH

    // I CAN USER ONLY THIS LINE PUT METHOD CALED EVRY LETTER CHANGE
    // userCubit.getAllJobs(search:  searchController.text.trim());

    // SO I USE THIS FOR WAITING SOME TIME AFTER ENT TYPING IN SEARCH FEILED
    _searchController.addListener(() {
      if (debounce?.isActive ?? false) debounce!.cancel();
      final text = _searchController.text.trim();
      debounce = Timer(Duration(milliseconds: 1000), () {
        userCubit.getAllJobs(search: text.isEmpty ? null : text);
      });
    });
  }

  @override
  void dispose() {
    debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();

    return BlocConsumer<UserCubit, UserState>(
      buildWhen: (previous, current) =>
          current is UserGetAllJobsFailuer || current is UserGetAllJobsLoading || current is UserGetAllJobsSuccess,
      listener: (context, state) {
        if (state is UserGetAllJobsFailuer) {
          ScaffoldMessenger.of(context).showSnackBar(customSnackBar(state.errorMessage));
        }
      },
      builder: (context, state) {
        final bool isLoading = state is UserGetAllJobsLoading;

        return Scaffold(
          backgroundColor: AppColor.white,

          body: Column(
            children: [
              Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                child: Row(
                  children: [
                    Expanded(
                      child: Form(
                        key: _formkey,
                        child: CustomTextFiled(
                          hintText: AppStrings.search,
                          isSecuredFiled: false,
                          controller: _searchController,
                          fillColor: AppColor.white,
                          borderColor: AppColor.grey2,
                          maxLines: 1,
                          validator: (value) => AppValidator.validateInput(value, min: 2),
                        ),
                      ),
                    ),

                    Gap(10),

                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: AppColor.white,
                          isScrollControlled: true,
                          context: context,
                          builder: (context) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height * 0.8,
                              child: SafeArea(child: CustomSearchBottomSheet()),
                            );
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.secondary,
                          border: Border.all(color: AppColor.primary),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Icon(Icons.tune, color: AppColor.primary, size: 30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverSkeletonizer(
                      enabled: isLoading,
                      child: SliverList.separated(
                        itemCount: isLoading ? 5 : userCubit.allJobsList.length,
                        separatorBuilder: (context, index) => Gap(15),
                        itemBuilder: (context, index) {
                          final dummyList = List.generate(5, (index) => UserJobDataEntity.empty);
                          final jobData = isLoading ? dummyList[index] : userCubit.allJobsList[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: CustomUserdJobCard(jobData: jobData),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
