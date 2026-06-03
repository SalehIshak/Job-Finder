import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/core/constants/app_text_styles.dart';
import 'package:job_finder/core/shared/custom_botton.dart';
import 'package:job_finder/core/shared/custom_divider.dart';
import 'package:job_finder/core/shared/custom_global_text_fieled.dart';

class ApplyJobScreen extends StatefulWidget {
  const ApplyJobScreen({super.key});

  @override
  State<ApplyJobScreen> createState() => _ApplyJobScreenState();
}

class _ApplyJobScreenState extends State<ApplyJobScreen> {
  final TextEditingController _coverLetterController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,

        toolbarHeight: 80,
        leading: GestureDetector(onTap: () => context.pop(), child: Icon(Icons.arrow_back, size: 30)),
        title: Text(AppStrings.applyJob, style: AppTextStyles.hidding1),
        centerTitle: true,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(20),
              Text(AppStrings.uploadCv, style: AppTextStyles.hidding1),
              Text(AppStrings.addYourCv, style: AppTextStyles.description1),
              Gap(20),
              Container(
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.grey2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.upload_file, color: AppColor.grey2, size: 35),
                    Gap(10),
                    Text(AppStrings.uploadCvResume, style: AppTextStyles.description1),
                  ],
                ),
              ),

              Gap(40),
              Text(AppStrings.coverLetter, style: AppTextStyles.hidding1),
              Gap(20),
              CustomSearchFiled(
                controller: _coverLetterController,
                hintText: "Explain why you are the right person for this job",
                hintTextStyle: AppTextStyles.description2,
                maxLines: 8,
              ),
              Spacer(),
              CustomBotton(text: AppStrings.applyNow, onTap: () {}),
              Gap(5),
              CustomDivider(),
            ],
          ),
        ),
      ),
    );
  }
}
