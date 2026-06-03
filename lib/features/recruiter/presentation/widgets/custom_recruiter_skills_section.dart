import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:job_finder/core/constants/app_color.dart' show AppColor;
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/core/constants/app_text_styles.dart';
import 'package:job_finder/features/recruiter/presentation/cubit/recruiter_cubit.dart';
import 'package:job_finder/features/recruiter/presentation/cubit/recruiter_state.dart';
import 'package:job_finder/features/recruiter/presentation/widgets/custom_recruiter_alert_dialog.dart';

class CustomRecruiterSkillsSection extends StatelessWidget {
  const CustomRecruiterSkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RecruiterCubit>();
    return Container(
      width: double.infinity,
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
            Text(AppStrings.skils, style: AppTextStyles.hidding1),
            Gap(10),

            BlocBuilder<RecruiterCubit, RecruiterState>(
              builder: (context, state) {
                return Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    ...cubit.skillsList.map((skill) {
                      return Chip(
                        label: Text(skill),
                        labelStyle: TextStyle(color: AppColor.primary),
                        backgroundColor: AppColor.secondary,
                        deleteIcon: Icon(Icons.close, size: 16, color: Color(0xFF2E7D5E)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        onDeleted: () => cubit.deleteSkilFromSkilsList(skill),
                      );
                    }),
                    GestureDetector(
                      onTap: () => showDialog(
                        context: context,
                        builder: (context) {
                          return CustomRecruiterAlertDialog(
                            title: AppStrings.addSkils,
                            hintText: AppStrings.addSkils,
                            onChangeSaveValueInVar: (value) => cubit.selectedValue = value,
                            onPressedAddText: () {
                              cubit.addsellectedItemToList(cubit.skillsList);
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),

                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xFF2E7D5E),
                            width: 1.5,
                            style: BorderStyle.solid, // للـ dashed تحتاج package
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.add, size: 16, color: Color(0xFF2E7D5E)),
                            SizedBox(width: 4),
                            Text(AppStrings.addSkils, style: TextStyle(color: Color(0xFF2E7D5E))),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
