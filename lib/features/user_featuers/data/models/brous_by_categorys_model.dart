import 'package:flutter/material.dart';
import 'package:job_finder/core/constants/app_images.dart';
import 'package:job_finder/core/constants/app_strings.dart';

class BrouseByCategorysModel {
  final Widget imag;
  final String title;

  BrouseByCategorysModel({required this.imag, required this.title});
}

List<BrouseByCategorysModel> brouseByCategorysList = [
  BrouseByCategorysModel(
    imag: Image.asset(AppImage.imagesIconesOfficeBuilding, width: 30, height: 30),
    title: AppStrings.company,
  ),
  BrouseByCategorysModel(imag: Image.asset(AppImage.imagesIconesPartTime, width: 30, height: 30), title: AppStrings.partTime),
  BrouseByCategorysModel(imag: Image.asset(AppImage.imagesIconesFullTime, width: 30, height: 30), title: AppStrings.fullTime),
  BrouseByCategorysModel(imag: Image.asset(AppImage.imagesIconesFreelancer, width: 30, height: 30), title: AppStrings.freelancer),
];
