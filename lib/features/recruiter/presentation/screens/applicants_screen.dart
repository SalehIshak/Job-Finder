import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/core/constants/app_text_styles.dart';
import 'package:job_finder/features/recruiter/presentation/widgets/custom_applicant_card.dart';

class ApplicantsScreen extends StatefulWidget {
  const ApplicantsScreen({super.key});

  @override
  State<ApplicantsScreen> createState() => _ApplicantsScreenState();
}

class _ApplicantsScreenState extends State<ApplicantsScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<String> itemsList = [AppStrings.all, AppStrings.pinding, AppStrings.accepted, AppStrings.rejected];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey3,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: AppColor.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(color: Colors.grey.shade300, height: 1.5),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15, left: 12),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.grey2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.arrow_back),
          ),
        ),
        title: Column(
          children: [
            Text(AppStrings.postNewJob, style: AppTextStyles.hidding1),
            Text("12 ${AppStrings.totalApplicants}", style: AppTextStyles.description1),
          ],
        ),
      ),

      body: Column(
        children: [
          Gap(15),

          Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              child: Row(
                children: List.generate(itemsList.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      width: 120,
                      height: 45,
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColor.grey2),
                      ),
                      child: Center(child: Text("${itemsList[index]} (25)", style: AppTextStyles.lable12)),
                    ),
                  );
                }),
              ),
            ),
          ),

          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 10),
                      child: CustomApplicantionCard(),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
