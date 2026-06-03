import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/di/injection_container.dart';
import 'package:job_finder/core/router/app_route_strings.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/core/constants/app_text_styles.dart';
import 'package:job_finder/features/shared_features/onboarding/data/model/onboarding_model.dart';
import 'package:job_finder/features/shared_features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:job_finder/features/shared_features/onboarding/presentation/cubit/onboarding_state.dart';
import 'package:job_finder/core/shared/custom_botton.dart';
import 'package:job_finder/core/shared/custom_divider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OnboardingCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<OnboardingCubit, OnboardingState>(
            builder: (context, state) {
              final cubitData = context.read<OnboardingCubit>();
              return Column(
                children: [
                  Gap(50),

                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: onBoardingList.length,
                      onPageChanged: (index) => cubitData.chandePageIndex(index),
                      itemBuilder: (context, index) {
                        final item = onBoardingList[index];
                        return Column(
                          children: [
                            item.image,
                            Text(item.title, style: AppTextStyles.hidding1, textAlign: TextAlign.center),
                            Gap(15),
                            Text(item.discription, style: AppTextStyles.description1, textAlign: TextAlign.center),
                          ],
                        );
                      },
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      final bool isCurrentPage = cubitData.currentIndex == index;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: AnimatedContainer(
                          duration: Duration(microseconds: 200),
                          width: isCurrentPage ? 35 : 20,
                          height: 5,
                          decoration: BoxDecoration(
                            color: isCurrentPage ? AppColor.primary : AppColor.grey2,

                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      );
                    }),
                  ),

                  Gap(50),

                  cubitData.islastPage
                      ? CustomBotton(
                          onTap: () {
                            cubitData.setOnBoargingDoneStatuse(true);
                            context.go(AppRoute.compeateProfile);
                          },
                          text: AppStrings.onBoardingComplateProfile,
                        )
                      : Column(
                          children: [
                            CustomBotton(
                              text: AppStrings.onBoardingNext,
                              onTap: () {
                                _pageController.nextPage(duration: Duration(milliseconds: 200), curve: Curves.bounceOut);
                              },
                            ),
                            Gap(15),
                            //SKIP BUTTON
                            CustomBotton(
                              onTap: () {
                                cubitData.setOnBoargingDoneStatuse(true);
                                context.go(AppRoute.compeateProfile);
                              },
                              text: AppStrings.onBoardingSkip,
                              bottomColor: AppColor.secondary,
                              textStyle: AppTextStyles.bottonp,
                            ),
                          ],
                        ),

                  Gap(15),
                  CustomDivider(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
