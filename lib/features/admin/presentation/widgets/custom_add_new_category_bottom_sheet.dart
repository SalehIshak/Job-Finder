import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/core/constants/app_text_styles.dart';
import 'package:job_finder/core/utils/validators.dart';
import 'package:job_finder/core/shared/custom_text_filed.dart';

class CustomAddNewCatrgoryBottomSheet extends StatefulWidget {
  const CustomAddNewCatrgoryBottomSheet({super.key});

  @override
  State<CustomAddNewCatrgoryBottomSheet> createState() => _CustomAddNewCatrgoryBottomSheetState();
}

class _CustomAddNewCatrgoryBottomSheetState extends State<CustomAddNewCatrgoryBottomSheet> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  bool _isActive = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        color: AppColor.grey3,
        border: Border.all(color: AppColor.grey1, width: 2),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(color: const Color(0xFFE6F1FB), borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.label_outline_rounded, color: Color(0xFF185FA5), size: 20),
                  ),
                  Gap(12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.addNewategory,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF1A1A1A)),
                      ),
                      SizedBox(height: 2),
                      Text(AppStrings.categorySubTitle, style: TextStyle(fontSize: 12, color: Color(0xFF888780))),
                    ],
                  ),
                  Spacer(),
                  GestureDetector(onTap: () => context.pop(), child: Icon(Icons.close)),
                ],
              ),

              //NAME
              Gap(20),
              Text(AppStrings.name, style: AppTextStyles.lable12),
              Gap(5),
              CustomTextFiled(
                controller: _nameController,
                isSecuredFiled: false,
                hintText: AppStrings.categoryName,
                labelText: AppStrings.categoryName,
                validator: (value) => AppValidator.validateInput(value, type: InputType.text, isRequired: true),
                maxLenth: 60,
                fillColor: AppColor.white,
                borderColor: AppColor.grey2,
              ),

              // DESCRIPTION
              Gap(30),
              Text(AppStrings.description, style: AppTextStyles.lable12),
              Gap(5),

              CustomTextFiled(
                controller: _descController,
                isSecuredFiled: false,
                hintText: AppStrings.categoryDescription,
                validator: (value) => AppValidator.validateInput(value, type: InputType.text, isRequired: true),
                maxLines: 5,
                maxLenth: 200,
                fillColor: AppColor.white,
                borderColor: AppColor.grey2,
              ),
              Gap(20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColor.grey1, width: 0.5),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    Row(
                      children: [
                        // Text("Statuse"),
                        // Gap(15),
                        Container(
                          width: 140,
                          height: 30,
                          decoration: BoxDecoration(
                            color: _isActive ? AppColor.secondary : AppColor.red.withAlpha(50),
                            border: Border.all(color: _isActive ? AppColor.primary : AppColor.red),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(child: Text(_isActive ? AppStrings.activeForUser : AppStrings.inActiveForUser)),
                        ),
                      ],
                    ),
                    Spacer(),
                    Switch.adaptive(
                      value: _isActive,
                      onChanged: (v) => setState(() => _isActive = v),
                      activeThumbColor: AppColor.primary,
                      inactiveThumbColor: AppColor.red,
                    ),
                  ],
                ),
              ),

              Gap(50),
            ],
          ),
        ),
      ),
    );
  }
}
