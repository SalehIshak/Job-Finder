import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/core/constants/app_text_styles.dart';
import 'package:job_finder/core/shared/costom_appbar.dart';
import 'package:job_finder/core/shared/custom_botton.dart';
import 'package:job_finder/core/shared/custom_snack_bar.dart';
import 'package:job_finder/core/utils/validators.dart';
import 'package:job_finder/features/admin/domain/entitis/admin_get_jobs_list_entitys.dart';
import 'package:job_finder/features/admin/presentation/cubit/admin_cubit.dart';
import 'package:job_finder/features/admin/presentation/cubit/admin_state.dart';
import 'package:job_finder/features/admin/presentation/widgets/custom_admin_build_list_card.dart';
import 'package:job_finder/features/admin/presentation/widgets/custom_admin_skills_section.dart';
import 'package:job_finder/core/shared/custom_text_filed.dart';
import 'package:job_finder/features/recruiter/presentation/widgets/custom_recruiter_drop_down.dart';

class AdminCreateNewJobScreen extends StatefulWidget {
  final AdminGetJobsListEntity? jobItemData;
  const AdminCreateNewJobScreen({super.key, this.jobItemData});

  @override
  State<AdminCreateNewJobScreen> createState() => _AdminCreateNewJobScreenState();
}

class _AdminCreateNewJobScreenState extends State<AdminCreateNewJobScreen> {
  final TextEditingController _jobTitleController = TextEditingController();
  final TextEditingController _jobDescController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _salaryRangeController = TextEditingController();
  final TextEditingController _experianceController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    final jobItemData = widget.jobItemData;
    if (jobItemData != null) {
      _jobTitleController.text = jobItemData.title;
      _jobDescController.text = jobItemData.description;
      _locationController.text = jobItemData.location;
      _salaryRangeController.text = jobItemData.salaryRange;
      _experianceController.text = jobItemData.experience;

      final adminCubit = context.read<AdminCubit>();

      // adminCubit.sellectedJobType = jobItemData.jobType;
      // adminCubit.sellectedJobLevel = jobItemData.jobLevel;
      adminCubit.sellectJobTybe(jobItemData.jobType);
      adminCubit.sellectLevel(jobItemData.jobLevel);

      adminCubit.skillsList.addAll(jobItemData.skills);
      adminCubit.responsipilitiesList.addAll(jobItemData.responsibilities);
      adminCubit.requireMentsList.addAll(jobItemData.requirements);
      adminCubit.benefitsList.addAll(jobItemData.benefits);
    }
  }

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
    return Form(
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
                          // BASIC INFO TEXT
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

                          Gap(10),

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
                  CustomAdminSkillsSection(),
                  Gap(20),

                  BlocConsumer<AdminCubit, AdminState>(
                    listener: (context, state) {
                      // CREATE JOB STATES
                      if (state is AdminCreateNewJobFailuer) {
                        ScaffoldMessenger.of(context).showSnackBar(customSnackBar(state.errorMessage));
                      }

                      if (state is AdminCreateNewJobSuccess) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(customSnackBar("Job Aded successfuly", backgroundColor: AppColor.success));
                      }

                      // UPDATE JOB STATES
                      if (state is AdminUpdatedJobFailuer) {
                        ScaffoldMessenger.of(context).showSnackBar(customSnackBar(state.errorMessage));
                      }

                      if (state is AdminUpdatedJobSuccess) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(customSnackBar("Job Updated Successfuly", backgroundColor: AppColor.success));
                      }
                    },
                    builder: (context, state) {
                      final cubit = context.read<AdminCubit>();
                      return Column(
                        children: [
                          // REPONSIPILITIES
                          CustomAdminBuildCreateNewJobComponant(
                            title: AppStrings.respinsipilities,
                            hintText: AppStrings.addRespinsipility,
                            items: cubit.responsipilitiesList,
                            onRemoveItem: (element) => cubit.deleteElementFromrRsponsipilitiesList(element),
                          ),
                          Gap(20),

                          // REQUIREMENTS
                          CustomAdminBuildCreateNewJobComponant(
                            title: AppStrings.requirements,
                            hintText: AppStrings.addRequirement,
                            items: cubit.requireMentsList,
                            onRemoveItem: (element) => cubit.deleteElementFromRequireMentsList(element),
                          ),
                          Gap(20),

                          // PENEFITS
                          CustomAdminBuildCreateNewJobComponant(
                            title: AppStrings.penefits,
                            hintText: AppStrings.addPenefit,
                            items: cubit.benefitsList,
                            onRemoveItem: (element) => cubit.deleteElementFromBenefitsList(element),
                          ),

                          Gap(20),

                          // BOTTON
                          widget.jobItemData != null
                              ? CustomBotton(
                                  isLoading: state is AdminUpdatedJobLoading,
                                  text: AppStrings.updateJob,
                                  onTap: () {
                                    final updatedFields = <String, dynamic>{};

                                    if (_jobTitleController.text != widget.jobItemData!.title) {
                                      updatedFields['title'] = _jobTitleController.text;
                                    }
                                    if (_locationController.text != widget.jobItemData!.location) {
                                      updatedFields['location'] = _locationController.text;
                                    }
                                    if (_salaryRangeController.text != widget.jobItemData!.salaryRange) {
                                      updatedFields['salaryRange'] = _salaryRangeController.text;
                                    }
                                    if (_experianceController.text != widget.jobItemData!.salaryRange) {
                                      updatedFields['experience'] = _experianceController.text;
                                    }
                                    if (_jobDescController.text != widget.jobItemData!.description) {
                                      updatedFields['description'] = _jobDescController.text;
                                    }

                                    if (_jobDescController.text != widget.jobItemData!.description) {
                                      updatedFields['description'] = _jobDescController.text;
                                    }

                                    if (cubit.skillsList != widget.jobItemData!.skills) {
                                      updatedFields['skills'] = cubit.skillsList;
                                    }
                                    if (cubit.responsipilitiesList != widget.jobItemData!.responsibilities) {
                                      updatedFields['responsibilities'] = cubit.responsipilitiesList;
                                    }
                                    if (cubit.requireMentsList != widget.jobItemData!.responsibilities) {
                                      updatedFields['requirements'] = cubit.requireMentsList;
                                    }
                                    if (cubit.benefitsList != widget.jobItemData!.benefits) {
                                      updatedFields['benefits'] = cubit.benefitsList;
                                    }

                                    if (_formKey.currentState!.validate() && updatedFields.isNotEmpty) {
                                      cubit.updateJob(widget.jobItemData!.id, updatedFields);
                                    }

                                    /// STPPED HEERE
                                  },
                                )
                              : CustomBotton(
                                  isLoading: state is AdminCreateNewJobLoading,
                                  text: AppStrings.postJob,
                                  onTap: () {
                                    if (_formKey.currentState!.validate()) {
                                      cubit.creatJob(
                                        _jobTitleController.text,
                                        _jobDescController.text,
                                        _locationController.text,
                                        _experianceController.text,
                                        cubit.sellectedJobType,
                                        cubit.sellectedJobLevel,
                                        _salaryRangeController.text,
                                        cubit.skillsList,
                                        cubit.responsipilitiesList,
                                        cubit.requireMentsList,
                                        cubit.benefitsList,
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
    );
  }
}
