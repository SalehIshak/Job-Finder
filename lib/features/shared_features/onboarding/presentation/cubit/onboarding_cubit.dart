import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/core/local/local_keys.dart';
import 'package:job_finder/core/local/pref_helper.dart';
import 'package:job_finder/features/shared_features/onboarding/presentation/cubit/onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final PrefHelper _prefHelper;
  OnboardingCubit(this._prefHelper) : super(OnBoardingInitial());

  final PageController pageController = PageController();

  int currentIndex = 0;
  bool islastPage = false;

  void chandePageIndex(int index) {
    currentIndex = index;
    islastPage = currentIndex == 2;
    emit(OnBoardingChange());
  }

  void setOnBoargingDoneStatuse(bool isOnBoardingDone) {
    _prefHelper.setBool(AppLocalKeys.isOnBoardingDone, isOnBoardingDone);
  }
}
