import 'package:flutter/material.dart';
import 'package:job_finder/core/constants/app_color.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      child: Divider(thickness: 5, color: AppColor.black, radius: BorderRadiusGeometry.circular(15)),
    );
  }
}
