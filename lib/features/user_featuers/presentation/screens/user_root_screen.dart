import 'package:flutter/material.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/features/user_featuers/presentation/screens/user_favorite_screen.dart';
import 'package:job_finder/features/user_featuers/presentation/screens/user_home_screen.dart';
import 'package:job_finder/features/user_featuers/presentation/screens/user_search_screen.dart';
import 'package:job_finder/features/shared_features/settengs/presentation/screens/settings_screen.dart';

class UserRootScreen extends StatefulWidget {
  const UserRootScreen({super.key});

  @override
  State<UserRootScreen> createState() => _UserRootScreenState();
}

class _UserRootScreenState extends State<UserRootScreen> {
  int currentScreen = 0;
  late List<Widget> screens;

  @override
  void initState() {
    super.initState();
    screens = [UserHomeScreen(), UserSearchScreen(), UserFavoriteScreen(), SettingsScreen()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentScreen, children: screens),

      bottomNavigationBar: BottomNavigationBar(
        iconSize: 20,
        backgroundColor: AppColor.white,
        selectedItemColor: AppColor.primary,
        unselectedItemColor: AppColor.black,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentScreen,
        onTap: (index) {
          setState(() {
            currentScreen = index;
          });
          // pageController.jumpToPage(currentScreen);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: AppStrings.home),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: AppStrings.search),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined), label: AppStrings.favorite),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: AppStrings.settings),
        ],
      ),
    );
  }
}
