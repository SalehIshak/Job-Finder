import 'package:job_finder/features/recruiter/domain/entitis/create_job_entity.dart';

abstract class RecruiterState {}

class RecruiterInitial extends RecruiterState {}

class RecruiterLoading extends RecruiterState {}

class RecruiterSuccess extends RecruiterState {
  final CreateJobEntity createJobEntity;
  RecruiterSuccess({required this.createJobEntity});
}

class RecruiterFailuer extends RecruiterState {
  final String errorMessage;
  RecruiterFailuer({required this.errorMessage});
}

class RecruiterNavigationState extends RecruiterState {
  final int currentIndex;
  RecruiterNavigationState({required this.currentIndex});
}

class RecruiterJobTybeSellected extends RecruiterState {
  final String sellectedJobType;
  RecruiterJobTybeSellected({required this.sellectedJobType});
}

class RecruiterLevelSellected extends RecruiterState {
  final String sellectedLevel;
  RecruiterLevelSellected({required this.sellectedLevel});
}

class RecruiterSkilsListUpdate extends RecruiterState {}
