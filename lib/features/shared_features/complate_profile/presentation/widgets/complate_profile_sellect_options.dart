import 'package:flutter/material.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_text_styles.dart';

class ComplateProfileSellectOptions extends StatelessWidget {
  final bool isSellected;
  final String title;
  final String? trailing;
  final Function() onTap;
  const ComplateProfileSellectOptions({
    super.key,
    this.trailing,
    required this.isSellected,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minTileHeight: 10,
      title: Text(title, style: AppTextStyles.lable2),

      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      tileColor: isSellected ? AppColor.grey2 : AppColor.white,
      trailing: trailing != null
          ? Container(
              width: 40,
              height: 27,
              decoration: BoxDecoration(
                color: isSellected ? AppColor.grey1 : AppColor.grey3,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text("$trailing", style: isSellected ? AppTextStyles.description2 : AppTextStyles.description1),
              ),
            )
          : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
        side: BorderSide(color: AppColor.grey2),
      ),
      onTap: onTap,
    );
  }
}
