import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:job_finder/features/recruiter/domain/usecases/recruiter_usecases.dart';
import 'package:job_finder/features/recruiter/presentation/cubit/recruiter_state.dart';
import 'package:job_finder/features/recruiter/presentation/screens/applicants_screen.dart';
import 'package:job_finder/features/recruiter/presentation/screens/recruiter_jobs_screen.dart';
import 'package:job_finder/features/recruiter/presentation/screens/recruiter_home_screen.dart';
import 'package:job_finder/features/recruiter/presentation/screens/settings_screen.dart';

@injectable
class RecruiterCubit extends Cubit<RecruiterState> {
  final CreateJobUseCase _createJobUseCase;
  // final GetJobsListUseCaseTest _getJobsListUseCaseTest;
  RecruiterCubit(this._createJobUseCase) : super(RecruiterInitial());

  // ROOT SCREEN
  final List<Widget> screens = [RecruiterHomeScreen(), RecruiterJobsScreen(), ApplicantsScreen(), SettingsScreen()];
  int currentScreen = 0;

  // CREATE JOB SCREEN
  String selectedJobType = "FULL_TIME";
  String selectedLevel = "SENIOR_LEVEL";

  // final List<String> jobTypesList = ["FULL_TIME", 'PART_TIME', 'CONTRACT', "INTERNSHIP", "FREELANCE"];
  // final List<String> levelsList = ["ENTRY_LEVEL", "MID_LEVEL", "SENIOR_LEVEL", "MANAGEMENT", "EXECUTIVE"];

  Map<String, String> jobTypesMap = {
    "Full Time": "FULL_TIME",
    "Part Time": "PART_TIME",
    "Contract": "CONTRACT",
    "Internship": "INTERNSHIP",
    "Freelance": "FREELANCE",
  };
  Map<String, String> levelsMap = {
    "Entry Level": "ENTRY_LEVEL",
    "Mid Level": "MID_LEVEL",
    "Senior Level": "SENIOR_LEVEL",
    "Management": "MANAGEMENT",
    "Executive": "EXECUTIVE",
  };

  final List<String> responsipilitiesList = [];
  final List<String> requireMentsList = [];
  final List<String> penefitsList = [];

  // CREATE JOB SCREEN => SKILLS SECTION
  final List<String> skillsList = [];
  String selectedValue = "";

  //////////////////////////////////////////// ROOT SCREEN  LOGIC ///////////////////////////////
  void changeScreen(int index) {
    currentScreen = index;
    emit(RecruiterNavigationState(currentIndex: index));
  }

  //////////////////////////////////////////// CREAT JOB ///////////////////////////////////////////

  // DELETE SKIL
  void deleteSkilFromSkilsList(String skil) {
    skillsList.remove(skil);
    emit(RecruiterSkilsListUpdate());
  }

  //  ADD SELLECTED TO IT'S  LIST
  void addsellectedItemToList(List<String> sellectedList) {
    if (selectedValue.trim().isNotEmpty) {
      sellectedList.add(selectedValue.trim());
      emit(RecruiterSkilsListUpdate());
    }
  }

  // CREATE JOB SCREEN
  void sellectJobTybe(String element) {
    selectedJobType = element;
    emit(RecruiterJobTybeSellected(sellectedJobType: element));
  }

  void sellectLevel(String element) {
    selectedLevel = element;
    emit(RecruiterLevelSellected(sellectedLevel: element));
  }

  //
  // CREATE JOB METHOD
  Future<void> creatJob(
    String title,
    String description,
    String location,
    String experience,
    String jobType,
    String jobLevel,
    String salaryRange,
    List<String> skills,
    List<String> responsibilities,
    List<String> requirements,
    List<String> benefits,
  ) async {
    emit(RecruiterLoading());
    final createdJob = await _createJobUseCase.call(
      title,
      description,
      location,
      experience,
      jobType,
      jobLevel,
      salaryRange,
      skills,
      responsibilities,
      requirements,
      benefits,
    );

    createdJob.fold(
      (failure) {
        emit(RecruiterFailuer(errorMessage: failure.message));
      },

      (createdjob) {
        emit(RecruiterSuccess(createJobEntity: createdjob));
      },
    );
  }

  // //  GET JOBS LIST
  // List<GetJobsListEntityTest> jobsList = [];

  // Future<void> getJobsListTest() async {
  //   print("****************** Get Jos List At Recruiter Started");
  //   emit(RecruiterGetJobsListLoadingTest());
  //   final jobsListResponse = await _getJobsListUseCaseTest.call();
  //   jobsListResponse.fold(
  //     (failure) {
  //       print("****************** Get Jos List Failuer");
  //       emit(RecruiterGetJobsListFailuerTest(failure.message));
  //     },
  //     (right) {
  //       print("****************** Get Jos List Success Jobs Lenth  is ${right.length}");
  //       jobsList = right;
  //       emit(RecruiterGetJobsListSuccessTest(jobsList));
  //     },
  //   );
  // }
}
