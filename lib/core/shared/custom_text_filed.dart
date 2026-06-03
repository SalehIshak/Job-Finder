import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_text_styles.dart';
import 'package:job_finder/features/shared_features/auth/presentation/cubit/auth_cubit.dart';
import 'package:job_finder/features/shared_features/auth/presentation/cubit/auth_state.dart';

class CustomTextFiled extends StatefulWidget {
  final String hintText;
  final TextStyle? hintTextStyle;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? maxLenth;
  final int? cursorHeight;
  final int? cursorWidth;
  final bool isSecuredFiled;
  final Color? fillColor;
  final Color? borderColor;
  final TextEditingController controller;
  final FormFieldValidator? validator;
  const CustomTextFiled({
    super.key,
    required this.hintText,
    this.hintTextStyle,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
    this.maxLenth,
    this.cursorHeight,
    this.cursorWidth,
    required this.isSecuredFiled,
    this.fillColor,
    this.borderColor,
    required this.controller,
    this.validator,
  });

  @override
  State<CustomTextFiled> createState() => _CustomTextFiledState();
}

class _CustomTextFiledState extends State<CustomTextFiled> {
  bool isObsecure = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return TextFormField(
          controller: widget.controller,
          cursorColor: AppColor.primary,
          cursorHeight: 20,
          cursorWidth: 1.5,
          obscureText: isObsecure,
          validator: widget.validator,
          maxLines: widget.maxLines,
          maxLength: widget.maxLenth,

          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: widget.hintTextStyle,
            labelText: widget.labelText,
            labelStyle: AppTextStyles.lable4,
            isDense: true,
            fillColor: widget.fillColor,
            filled: true,
            suffixIcon: widget.isSecuredFiled
                ? GestureDetector(
                    onTap: () {
                      setState(() => isObsecure = !isObsecure);
                    },
                    child: isObsecure ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                  )
                : null,

            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColor.red, width: 1),
              borderRadius: BorderRadius.circular(7),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor ?? AppColor.primary, width: 1),
              borderRadius: BorderRadius.circular(7),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor ?? AppColor.primary, width: 1),
              borderRadius: BorderRadius.circular(7),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor ?? AppColor.primary, width: 1),
              borderRadius: BorderRadius.circular(7),
            ),
            enabled: true,
          ),
        );
      },
    );
  }
}
