import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_text_styles.dart';
import 'package:job_finder/features/recruiter/presentation/cubit/recruiter_cubit.dart';
import 'package:job_finder/features/recruiter/presentation/cubit/recruiter_state.dart';
import 'package:job_finder/features/recruiter/presentation/widgets/custom_recruiter_alert_dialog.dart';

class CustomReecruiterBuildListCard extends StatefulWidget {
  final String title;
  final String addLabel;
  final String hintText;
  final List<String> items;
  const CustomReecruiterBuildListCard({
    super.key,
    required this.title,
    required this.addLabel,
    required this.hintText,
    required this.items,
  });

  @override
  State<CustomReecruiterBuildListCard> createState() => _CustomReecruiterBuildListCardState();
}

class _CustomReecruiterBuildListCardState extends State<CustomReecruiterBuildListCard> {
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
            Text(widget.title, style: AppTextStyles.hidding1),
            Gap(10),

            BlocBuilder<RecruiterCubit, RecruiterState>(
              builder: (context, state) {
                return Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    ...widget.items.map((elemne) {
                      return Row(
                        children: [
                          Icon(Icons.circle, size: 8, color: AppColor.primary),
                          Gap(10),
                          Expanded(child: Text(elemne, overflow: TextOverflow.ellipsis, maxLines: 2)),
                        ],
                      );
                    }),
                    GestureDetector(
                      onTap: () => showDialog(
                        context: context,
                        builder: (context) {
                          return CustomRecruiterAlertDialog(
                            title: widget.title,
                            hintText: widget.hintText,
                            onChangeSaveValueInVar: (value) => cubit.selectedValue = value,
                            onPressedAddText: () {
                              cubit.addsellectedItemToList(widget.items);
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.add, color: AppColor.primary, size: 20),
                          Gap(5),
                          Text(widget.title, style: AppTextStyles.lable3),
                        ],
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
