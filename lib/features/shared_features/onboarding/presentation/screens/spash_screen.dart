import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_images.dart';
import 'package:job_finder/core/router/app_route_strings.dart';
import 'package:job_finder/features/shared_features/auth/presentation/cubit/auth_cubit.dart';
import 'package:job_finder/features/shared_features/auth/presentation/cubit/auth_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Future<void> autoLogin() async => await context.read<AuthCubit>().autoLogin();
  Future<void> redirect() async {
    return await context.read<AuthCubit>().autoLogin();
  }

  @override
  void initState() {
    super.initState();
    // I SHULD TO PUT addPostFrameCallback BEQUSE SATAES CALED BEFORE autoLogin Caled so no states update => Spalsh only LOADIG
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthCubit>().autoLogin(); // ✅ ينتظر حتى يكون BlocListener جاهزاً
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is OnBoardingFailed) {
          context.go(AppRoute.onboarding);
        } else if (state is OnBoardingSuccess) {
          context.go(AppRoute.compeateProfile);
        } else if (state is ComplateProfileFailed) {
          context.go(AppRoute.compeateProfile);
        } else if (state is ComplateProfileSuccess) {
          context.go(AppRoute.login);
        } else if (state is AutoLoginFailure) {
          context.go(AppRoute.login);
        } else if (state is GetProfileDataSuccess) {
          context.go(AppRoute.userRoot);
        }
      },
      child: Scaffold(
        backgroundColor: AppColor.primary,
        body: Column(
          children: [
            Gap(300),
            Center(child: SvgPicture.asset(AppImage.imagesLogoLogoImage)),
            Gap(15),
            Center(child: SvgPicture.asset(AppImage.imagesLogoLogoText, width: 50, height: 50)),
            Gap(200),
            Image.asset(AppImage.wihteLoadingGIF),
          ],
        ),
      ),
    );
  }
}
