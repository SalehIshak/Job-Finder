import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/core/constants/app_text_styles.dart';
import 'package:job_finder/core/di/injection_container.dart';
import 'package:job_finder/core/shared/costom_appbar.dart';
import 'package:job_finder/core/shared/custom_botton.dart';
import 'package:job_finder/core/shared/custom_snack_bar.dart';
import 'package:job_finder/core/utils/validators.dart';
import 'package:job_finder/features/recruiter/presentation/cubit/recruiter_cubit.dart';
import 'package:job_finder/features/recruiter/presentation/cubit/recruiter_state.dart';
import 'package:job_finder/features/recruiter/presentation/widgets/custom_recruiter_build_list_card.dart';
import 'package:job_finder/features/recruiter/presentation/widgets/custom_recruiter_drop_down.dart';
import 'package:job_finder/features/recruiter/presentation/widgets/custom_recruiter_skills_section.dart';
import 'package:job_finder/core/shared/custom_text_filed.dart';

class RecruiterCreateNewJobScreen extends StatefulWidget {
  const RecruiterCreateNewJobScreen({super.key});

  @override
  State<RecruiterCreateNewJobScreen> createState() => _RecruiterCreateNewJobScreenState();
}

class _RecruiterCreateNewJobScreenState extends State<RecruiterCreateNewJobScreen> {
  final TextEditingController _jobTitleController = TextEditingController();
  final TextEditingController _jobDescController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _salaryRangeController = TextEditingController();
  final TextEditingController _experianceController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _jobTitleController.dispose();
    _locationController.dispose();
    _salaryRangeController.dispose();
    _experianceController.dispose();
    _jobDescController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RecruiterCubit>(),
      child: Form(
        key: _formKey,
        child: Scaffold(
          backgroundColor: AppColor.grey3,
          appBar: CustomAppBar(title: AppStrings.postNewJob),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Gap(20),
                    // BASIC INFO
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        border: Border.all(color: AppColor.grey1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // BASIC INFO
                            Text(AppStrings.basicInfo, style: AppTextStyles.hidding1),
                            Gap(10),

                            // JOB TILTE
                            Text(AppStrings.jobTitle, style: AppTextStyles.lable2),
                            Gap(5),
                            CustomTextFiled(
                              controller: _jobTitleController,
                              isSecuredFiled: false,
                              hintText: AppStrings.jobTitle,
                              fillColor: AppColor.white,
                              borderColor: AppColor.grey2,
                              validator: (value) => AppValidator.validateInput(value, type: InputType.text, isRequired: true),
                            ),

                            // LOCATION
                            Text(AppStrings.location, style: AppTextStyles.lable5),
                            Gap(5),

                            CustomTextFiled(
                              controller: _locationController,
                              isSecuredFiled: false,
                              hintText: AppStrings.location,
                              fillColor: AppColor.white,
                              borderColor: AppColor.grey2,
                              validator: (value) => AppValidator.validateInput(value, type: InputType.text, isRequired: true),
                            ),
                            Gap(10),

                            // SALARY RANGE
                            Text(AppStrings.salaryRange, style: AppTextStyles.lable5),
                            Gap(5),
                            CustomTextFiled(
                              controller: _salaryRangeController,
                              isSecuredFiled: false,
                              hintText: AppStrings.salaryRange,
                              fillColor: AppColor.white,
                              borderColor: AppColor.grey2,
                              validator: (value) => AppValidator.validateInput(value, type: InputType.text, isRequired: true),
                            ),
                            Gap(10),

                            // EXPERIANCE
                            Text(AppStrings.experiance, style: AppTextStyles.lable5),
                            Gap(5),
                            CustomTextFiled(
                              controller: _experianceController,
                              isSecuredFiled: false,
                              hintText: AppStrings.experiance,
                              fillColor: AppColor.white,
                              borderColor: AppColor.grey2,
                              validator: (value) => AppValidator.validateInput(value, type: InputType.text, isRequired: true),
                            ),
                            Gap(10),

                            // jOB TYPE & LEVEL
                            Text(AppStrings.jobTypeAndLevel, style: AppTextStyles.lable5),
                            Gap(5),
                            CustomAdminSellecrJobTypeAndJobLevelDropDown(),
                          ],
                        ),
                      ),
                    ),
                    Gap(20),

                    // DESCRIPTION
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        border: Border.all(color: AppColor.grey1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(AppStrings.description, style: AppTextStyles.hidding1),
                            Gap(10),

                            Text(AppStrings.jobDescription, style: AppTextStyles.lable2),
                            Gap(5),
                            CustomTextFiled(
                              controller: _jobDescController,
                              isSecuredFiled: false,
                              hintText: AppStrings.jobDescriptionHint,
                              fillColor: AppColor.white,
                              borderColor: AppColor.grey2,
                              validator: (value) => AppValidator.validateInput(value, type: InputType.text, isRequired: true),
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap(15),

                    // SKILLS
                    CustomRecruiterSkillsSection(),
                    Gap(20),

                    BlocConsumer<RecruiterCubit, RecruiterState>(
                      listener: (context, state) {
                        if (state is RecruiterFailuer) {
                          ScaffoldMessenger.of(context).showSnackBar(customSnackBar(state.errorMessage));
                        }

                        if (state is RecruiterSuccess) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(customSnackBar("job aded successfuly", backgroundColor: AppColor.success));
                        }
                      },
                      builder: (context, state) {
                        final cubit = context.read<RecruiterCubit>();
                        return Column(
                          children: [
                            // REPONSIPILITIES
                            CustomReecruiterBuildListCard(
                              title: AppStrings.respinsipilities,
                              addLabel: AppStrings.addRespinsipility,
                              hintText: AppStrings.addRespinsipility,
                              items: cubit.responsipilitiesList,
                            ),
                            Gap(20),

                            // REQUIREMENTS
                            CustomReecruiterBuildListCard(
                              title: AppStrings.requirements,
                              addLabel: AppStrings.addRequirement,
                              hintText: AppStrings.addRequirement,
                              items: cubit.requireMentsList,
                            ),
                            Gap(20),

                            // PENEFITS
                            CustomReecruiterBuildListCard(
                              title: AppStrings.penefits,
                              addLabel: AppStrings.addPenefit,
                              hintText: AppStrings.addPenefit,
                              items: cubit.penefitsList,
                            ),

                            Gap(20),

                            CustomBotton(
                              isLoading: state is RecruiterLoading,
                              text: AppStrings.postJob,
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  cubit.creatJob(
                                    _jobTitleController.text,
                                    _jobDescController.text,
                                    _locationController.text,
                                    _experianceController.text,
                                    cubit.selectedJobType,
                                    cubit.selectedLevel,
                                    _salaryRangeController.text,
                                    cubit.skillsList,
                                    cubit.responsipilitiesList,
                                    cubit.requireMentsList,
                                    cubit.penefitsList,
                                  );
                                }
                              },
                            ),
                            Gap(30),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
