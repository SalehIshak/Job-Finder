import 'package:flutter/material.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/core/constants/app_text_styles.dart';

class CustomRecruiterAlertDialog extends StatelessWidget {
  final String title;
  final String hintText;
  final ValueChanged onChangeSaveValueInVar;
  final VoidCallback onPressedAddText;

  const CustomRecruiterAlertDialog({
    super.key,
    required this.title,
    required this.hintText,
    required this.onChangeSaveValueInVar,
    required this.onPressedAddText,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: AppTextStyles.hidding1),
      content: TextField(
        autofocus: true,
        cursorColor: AppColor.primary,
        decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: AppColor.primary)),
        ),
        onChanged: onChangeSaveValueInVar,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(AppStrings.cancel, style: AppTextStyles.lable3),
        ),
        TextButton(
          onPressed: onPressedAddText,
          child: Text(AppStrings.add, style: AppTextStyles.lable3),
        ),
      ],
    );
  }
}
