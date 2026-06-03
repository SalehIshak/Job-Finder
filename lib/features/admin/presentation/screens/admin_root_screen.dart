import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/features/admin/presentation/cubit/admin_cubit.dart';
import 'package:job_finder/features/admin/presentation/cubit/admin_state.dart';

class AdminRootScreen extends StatelessWidget {
  const AdminRootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final adminCubit = context.read<AdminCubit>();
    return Scaffold(
      body: BlocBuilder<AdminCubit, AdminState>(
        builder: (context, state) {
          return IndexedStack(index: adminCubit.currentScreen, children: adminCubit.screens);
        },
      ),

      bottomNavigationBar: BlocBuilder<AdminCubit, AdminState>(
        builder: (context, state) {
          return BottomNavigationBar(
            iconSize: 25,
            backgroundColor: AppColor.white,
            selectedItemColor: AppColor.primary,
            unselectedItemColor: AppColor.black,
            type: BottomNavigationBarType.fixed,
            currentIndex: adminCubit.currentScreen,
            onTap: (index) => adminCubit.changeScreen(index),
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: AppStrings.home),
              BottomNavigationBarItem(icon: Icon(Icons.business_center_outlined), label: AppStrings.myJobs),
              BottomNavigationBarItem(icon: Icon(Icons.category_rounded), label: AppStrings.categorys),
              BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: AppStrings.settings),
            ],
          );
        },
      ),
    );
  }
}
