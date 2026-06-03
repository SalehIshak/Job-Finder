import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/core/shared/costom_appbar.dart';
import 'package:job_finder/features/recruiter/presentation/widgets/custom_applicant_card.dart';

class MyApplicationsScreen extends StatefulWidget {
  const MyApplicationsScreen({super.key});

  @override
  State<MyApplicationsScreen> createState() => _MyApplicationsScreenState();
}

class _MyApplicationsScreenState extends State<MyApplicationsScreen> {
  final List<String> applicationTypesList = ["All", "REJECTED (0)", "ACCEPTED (3)", "PENDING (1)"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: CustomAppBar(title: AppStrings.myApplications),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.trackAll),
              Gap(15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Wrap(
                      spacing: 8,
                      children: applicationTypesList.map((element) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.grey2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(padding: const EdgeInsets.all(8.0), child: Text(element)),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Gap(15),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverList.separated(
                      itemCount: 10,
                      separatorBuilder: (context, index) => Gap(10),
                      itemBuilder: (context, index) {
                        return CustomApplicantionCard();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
