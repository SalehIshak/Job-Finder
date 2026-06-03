import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:job_finder/core/constants/app_color.dart';

SnackBar customSnackBar(Object error, {Color? backgroundColor, IconData? icon}) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    backgroundColor: backgroundColor ?? AppColor.red,
    content: Row(
      children: [
        Icon(icon ?? Icons.error_outline, color: Colors.white),
        Gap(10),
        Expanded(
          child: Text(error.toString(), style: TextStyle(fontSize: 15, color: Colors.white)),
        ),
      ],
    ),
  );
}
