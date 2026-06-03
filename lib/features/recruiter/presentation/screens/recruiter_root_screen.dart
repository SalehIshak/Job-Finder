import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/features/recruiter/presentation/cubit/recruiter_cubit.dart';
import 'package:job_finder/features/recruiter/presentation/cubit/recruiter_state.dart';

class RecruiterRootScreen extends StatelessWidget {
  const RecruiterRootScreen({super.key});

  // late List<Widget> screens;
  @override
  Widget build(BuildContext context) {
    final recruiterCubit = context.read<RecruiterCubit>();
    return Scaffold(
      body: BlocBuilder<RecruiterCubit, RecruiterState>(
        builder: (context, state) {
          final index = state is RecruiterNavigationState ? state.currentIndex : 0;
          return IndexedStack(index: index, children: recruiterCubit.screens);
        },
      ),

      bottomNavigationBar: BlocBuilder<RecruiterCubit, RecruiterState>(
        builder: (context, state) {
          final index = state is RecruiterNavigationState ? state.currentIndex : 0;

          return BottomNavigationBar(
            iconSize: 20,
            backgroundColor: AppColor.white,
            selectedItemColor: AppColor.primary,
            unselectedItemColor: AppColor.black,
            type: BottomNavigationBarType.fixed,
            currentIndex: index,
            onTap: (index) => recruiterCubit.changeScreen(index),
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: AppStrings.home),
              BottomNavigationBarItem(icon: Icon(Icons.business_center_outlined), label: AppStrings.myJobs),
              BottomNavigationBarItem(icon: Icon(CupertinoIcons.person_2), label: AppStrings.applicants),
              BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: AppStrings.settings),
            ],
          );
        },
      ),
    );

    //  bottomNavigationBar:
  }
}
