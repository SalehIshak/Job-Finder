import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_text_styles.dart';
import 'package:job_finder/features/admin/presentation/cubit/admin_cubit.dart';

class CustomLinearProgressRow extends StatelessWidget {
  final double value;
  final String tilte;
  final int score;
  const CustomLinearProgressRow({
    super.key,
    required this.adminCubit,
    required this.value,
    required this.tilte,
    required this.score,
  });

  final AdminCubit adminCubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(tilte, style: AppTextStyles.lable2),
        Gap(10),
        SizedBox(
          width: 230,
          child: LinearProgressIndicator(
            value: value,
            backgroundColor: AppColor.grey2,
            color: AppColor.primary,
            minHeight: 8,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Gap(3),
        Text("$score", style: AppTextStyles.lable2),
      ],
    );
  }
}
