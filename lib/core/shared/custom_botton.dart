import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_text_styles.dart';

class CustomBotton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final Color? bottomColor;
  final TextStyle? textStyle;
  final double? width;
  final Function() onTap;
  final IconData? icon;
  final Color? iconColor;
  const CustomBotton({
    super.key,
    required this.text,
    this.isLoading = false,
    this.bottomColor,
    this.textStyle,
    this.width,
    required this.onTap,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 45,
          width: width,
          decoration: BoxDecoration(color: bottomColor ?? AppColor.primary, borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: iconColor),
              Gap(10),
              isLoading
                  ? Center(child: CupertinoActivityIndicator(color: AppColor.white, radius: 15))
                  : Center(child: Text(text, style: textStyle ?? AppTextStyles.bottonW)),
            ],
          ),
        ),
      ),
    );
  }
}
