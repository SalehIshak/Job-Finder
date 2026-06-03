import 'package:flutter/material.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_text_styles.dart';

class CusomListTile extends StatelessWidget {
  final String title;
  final String supTitle;
  final Icon icon;
  final VoidCallback onTap;
  const CusomListTile({super.key, required this.title, required this.supTitle, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColor.grey2),
        ),
        child: Row(
          children: [
            CircleAvatar(backgroundColor: AppColor.grey3, radius: 20, child: icon),
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.lable2),

                SizedBox(height: 2),
                Text(supTitle, style: AppTextStyles.description1),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
