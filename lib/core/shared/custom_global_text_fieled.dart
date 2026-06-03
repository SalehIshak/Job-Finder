import 'package:flutter/material.dart';
import 'package:job_finder/core/constants/app_color.dart';

class CustomSearchFiled extends StatefulWidget {
  final String hintText;
  final TextStyle? hintTextStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? maxLenth;
  final TextEditingController controller;
  final FormFieldValidator? validator;
  const CustomSearchFiled({
    super.key,
    required this.hintText,
    this.hintTextStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
    this.maxLenth,
    required this.controller,
    this.validator,
  });

  @override
  State<CustomSearchFiled> createState() => _CustomSearchFiledState();
}

class _CustomSearchFiledState extends State<CustomSearchFiled> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      cursorColor: AppColor.primary,
      cursorHeight: 20,
      cursorWidth: 1.5,
      maxLength: widget.maxLenth,
      maxLines: widget.maxLines,

      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: widget.hintTextStyle,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,

        isDense: true,
        fillColor: AppColor.white,
        filled: true,

        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.red, width: 1),
          borderRadius: BorderRadius.circular(7),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.grey2, width: 1),
          borderRadius: BorderRadius.circular(7),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.grey2, width: 1),
          borderRadius: BorderRadius.circular(7),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.grey2, width: 1),
          borderRadius: BorderRadius.circular(7),
        ),
        enabled: true,
      ),
    );
  }
}
