// core/shared/custom_app_bar.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;
  final VoidCallback? onBackTap;
  final Color? backgroundColor;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showBackButton = true,
    this.onBackTap,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColor.white,
      toolbarHeight: 80,
      centerTitle: true,
      leading: showBackButton
          ? GestureDetector(onTap: onBackTap ?? () => context.pop(), child: const Icon(Icons.arrow_back, size: 30))
          : null,
      title: Text(title, style: AppTextStyles.hidding1),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80); // ✅ مطلوب لـ PreferredSizeWidget
}
