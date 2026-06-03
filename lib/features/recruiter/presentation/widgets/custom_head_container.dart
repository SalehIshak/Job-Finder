import 'package:flutter/material.dart';
import 'package:job_finder/core/constants/app_color.dart';

class CustomHeadContainer extends StatelessWidget {
  final Text number;
  final Text title;

  const CustomHeadContainer({super.key, required this.number, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 75,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColor.grey2),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [number, title]),
    );
  }
}
