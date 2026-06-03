import 'package:flutter/material.dart';
import 'package:job_finder/core/constants/app_images.dart';
import 'package:job_finder/core/constants/app_strings.dart';

class OnboardingModel {
  final Image image;
  final String title;
  final String discription;

  OnboardingModel({required this.image, required this.title, required this.discription});
}

final onBoardingList = [
  OnboardingModel(
    image: Image.asset(AppImage.imagesOnboard1),
    title: AppStrings.onBoardingTitle1,
    discription: AppStrings.onBoardingDescription1,
  ),
  OnboardingModel(
    image: Image.asset(AppImage.imagesOnboard2),
    title: AppStrings.onBoardingTitle2,
    discription: AppStrings.onBoardingDescription2,
  ),
  OnboardingModel(
    image: Image.asset(AppImage.imagesOnboard3),
    title: AppStrings.onBoardingTitle3,
    discription: AppStrings.onBoardingDescription3,
  ),
];
