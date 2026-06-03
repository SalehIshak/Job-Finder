import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/core/constants/app_color.dart';

class CustomContainer extends StatelessWidget {
  final Widget widget;
  final VoidCallback onTap;
  const CustomContainer({super.key, required this.widget, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 325,
        height: 45,
        decoration: BoxDecoration(color: AppColor.grey3, borderRadius: BorderRadius.circular(10)),
        child: widget,
      ),
    );
  }
}
