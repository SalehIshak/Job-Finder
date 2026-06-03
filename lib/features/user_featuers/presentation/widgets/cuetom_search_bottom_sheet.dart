import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/core/constants/app_text_styles.dart';
import 'package:job_finder/core/enums/app_enums.dart';
import 'package:job_finder/core/extentions/app_extentions.dart';
import 'package:job_finder/core/shared/custom_botton.dart';
import 'package:job_finder/core/shared/custom_divider.dart';
import 'package:job_finder/core/shared/custom_global_text_fieled.dart';

class CustomSearchBottomSheet extends StatefulWidget {
  final Set<JobType>? selectedJobTypes;

  const CustomSearchBottomSheet({this.selectedJobTypes, super.key});

  @override
  State<CustomSearchBottomSheet> createState() => _CustomSearchBottomSheetState();
}

class _CustomSearchBottomSheetState extends State<CustomSearchBottomSheet> {
  final TextEditingController _searchCountryController = TextEditingController();

  String? jobLevelSellected = "ENTRY_LEVEL ";
  String? jobTypeSellected = "FULL_TIME";

  final Map<String, String> _jobTypesMap = {
    "Full Time": "FULL_TIME",
    "Part Time": "PART_TIME",
    "Contract": "CONTRACT",
    "Internship": "INTERNSHIP",
    "Freelance": "FREELANCE",
  };
  final Map<String, String> _levelsMap = {
    "Entry Level": "ENTRY_LEVEL",
    "Mid Level": "MID_LEVEL",
    "Senior Level": "SENIOR_LEVEL",
    "Management": "MANAGEMENT",
    "Executive": "EXECUTIVE",
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 1),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // DIVIDER & TITLE
            Column(
              children: [
                CustomDivider(),
                Gap(5),
                Text(AppStrings.filter, style: AppTextStyles.hidding1),
              ],
            ),

            // LOCATION
            Gap(10),
            Text(AppStrings.location, style: AppTextStyles.lable12),
            Gap(20),

            CustomSearchFiled(
              hintText: "Country",
              controller: _searchCountryController,
              suffixIcon: Icon(CupertinoIcons.search, size: 30),
            ),

            // JOB TYPE
            Gap(20),
            Text(AppStrings.jobType, style: AppTextStyles.lable12),
            Gap(20),
            Wrap(
              children: _jobTypesMap.entries.map((element) {
                return RadioGroup(
                  groupValue: jobTypeSellected,
                  onChanged: (value) {
                    setState(() => jobTypeSellected = value);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Radio(value: element.value),
                      Text(element.key),
                    ],
                  ),
                );
              }).toList(),
            ),

            // JOB LEVEL
            Gap(20),
            Text(AppStrings.jobLevel, style: AppTextStyles.lable12),
            Gap(20),
            Wrap(
              children: _levelsMap.entries.map((element) {
                return RadioGroup(
                  groupValue: jobLevelSellected,
                  onChanged: (value) {
                    setState(() => jobLevelSellected = value);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Radio(value: element.value),
                      Text(element.key),
                    ],
                  ),
                );
              }).toList(),
            ),

            // BOTTONS ROW
            Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomBotton(width: 150, text: AppStrings.reset, onTap: () {}),
                CustomBotton(width: 150, text: AppStrings.applyNow, onTap: () {}),
              ],
            ),

            Gap(20),

            CustomDivider(),
            Gap(5),
          ],
        ),
      ),
    );
  }
}
