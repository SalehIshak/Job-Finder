import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_strings.dart';

class PrivicyPolicyScreen extends StatelessWidget {
  const PrivicyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          AppStrings.privacyPolicyTitle,
          style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppStrings.privacyPolicyLastUpdated, style: TextStyle(fontSize: 13, color: Colors.grey.shade500)),
              const Gap(20),

              // Section 1
              _SectionTitle(text: AppStrings.privacySection1Title),
              const Gap(10),
              _BulletItem(boldText: AppStrings.privacySection1Item1Title, bodyText: AppStrings.privacySection1Item1Body),
              _BulletItem(boldText: AppStrings.privacySection1Item2Title, bodyText: AppStrings.privacySection1Item2Body),
              _BulletItem(boldText: AppStrings.privacySection1Item3Title, bodyText: AppStrings.privacySection1Item3Body),
              _BulletItem(boldText: AppStrings.privacySection1Item4Title, bodyText: AppStrings.privacySection1Item4Body),
              const Gap(20),

              // Section 2
              _SectionTitle(text: AppStrings.privacySection2Title),
              const Gap(10),
              _BulletItem(boldText: AppStrings.privacySection2Item1Title, bodyText: AppStrings.privacySection2Item1Body),
              _BulletItem(boldText: AppStrings.privacySection2Item2Title, bodyText: AppStrings.privacySection2Item2Body),
              _BulletItem(boldText: AppStrings.privacySection2Item3Title, bodyText: AppStrings.privacySection2Item3Body),
              const Gap(20),

              // Section 3
              _SectionTitle(text: AppStrings.privacySection3Title),
              const Gap(10),
              _BodyText(text: AppStrings.privacySection3Body),
              const Gap(20),

              // Section 4
              _SectionTitle(text: AppStrings.privacySection4Title),
              const Gap(10),
              _BodyText(text: AppStrings.privacySection4Body),
              const Gap(20),

              // Section 5
              _SectionTitle(text: AppStrings.privacySection5Title),
              const Gap(10),
              _BodyText(text: AppStrings.privacySection5Body),
              const Gap(20),

              // Section 6
              _SectionTitle(text: AppStrings.privacySection6Title),
              const Gap(10),
              _BodyText(text: AppStrings.privacySection6Body),
              const Gap(40),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Reusable Widgets ───────────────────────────────────────────

class _SectionTitle extends StatelessWidget {
  final String text;
  const _SectionTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}

class _BodyText extends StatelessWidget {
  final String text;
  const _BodyText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: 14, color: Colors.grey.shade700, height: 1.6));
  }
}

class _BulletItem extends StatelessWidget {
  final String boldText;
  final String bodyText;
  const _BulletItem({required this.boldText, required this.bodyText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontSize: 14, height: 1.6)),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: boldText,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black, height: 1.6),
                  ),
                  TextSpan(
                    text: bodyText,
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade700, height: 1.6),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
