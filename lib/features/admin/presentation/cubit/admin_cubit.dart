import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:job_finder/features/admin/domain/entitis/admin_get_jobs_list_entitys.dart';
import 'package:job_finder/features/admin/domain/entitis/admin_statistics_entity.dart';
import 'package:job_finder/features/admin/domain/usecases/admin_usecases.dart';
import 'package:job_finder/features/admin/presentation/cubit/admin_state.dart';
import 'package:job_finder/features/admin/presentation/screens/admin_categorys_screen.dart';
import 'package:job_finder/features/admin/presentation/screens/admin_home_screen.dart';
import 'package:job_finder/features/admin/presentation/screens/admin_my_jobs_screen.dart';
import 'package:job_finder/features/admin/presentation/screens/admin_settings.dart';
import 'package:job_finder/features/recruiter/domain/usecases/recruiter_usecases.dart';

@injectable
class AdminCubit extends Cubit<AdminState> {
  final AdminGetJobsListUseCase _getJobsListUseCaseTest;
  final CreateJobUseCase _createJobUseCase;
  final AdminUpdateJobUseCase _adminUpdateJobUseCase;
  final AdminDeleteJobUsecases _adminDeleteJobUsecases;
  final AdminGetStatisticsUsecases _adminGetStatisticsUsecases;

  AdminCubit(
    this._getJobsListUseCaseTest,
    this._createJobUseCase,
    this._adminUpdateJobUseCase,
    this._adminDeleteJobUsecases,
    this._adminGetStatisticsUsecases,
  ) : super(AdminInitaState());

  //////////////////////////////////////////// ROOT SCREEN   ///////////////////////////////
  int currentScreen = 0;
  final List<Widget> screens = [AdminHomeScreen(), AdminJobsScreen(), AdminCategorysScreen(), AdminSettingsScreen()];

  void changeScreen(int index) {
    currentScreen = index;
    emit(AdminNavigationState(currentIndex: index));
  }

  /////////////////////////////////////////////////// CREATE JOB SCREEN////////////////////////////////
  String _sellectedJobType = "FULL_TIME";
  String _sellectedJobLevel = "SENIOR_LEVEL";

  final Map<String, String> _jobTypesMap = {
    "Full Time": "FULL_TIME",
    "Part Time": "PART_TIME",
    "Contract": "CONTRACT",
    "Internship": "INTERNSHIP",
    "Freelance": "FREELANCE",
  };
  final Map<String, String> _levelsMap = {
    "Entry Level": "ENTRY_LEVEL",
    "Mid Level": "MID_LEVEL",
    "Senior Level": "SENIOR_LEVEL",
    "Management": "MANAGEMENT",
    "Executive": "EXECUTIVE",
  };

  // GETERS
  String get sellectedJobType => _sellectedJobType;
  String get sellectedJobLevel => _sellectedJobLevel;

  Map<String, String> get jobTypesMap => _jobTypesMap;
  Map<String, String> get levelsMap => _levelsMap;

  final List<String> _responsipilitiesList = [];
  final List<String> _requireMentsList = [];
  final List<String> _benefitsList = [];

  // GETERS
  List<String> get responsipilitiesList => _responsipilitiesList;
  List<String> get requireMentsList => _requireMentsList;
  List<String> get benefitsList => _benefitsList;

  // CREATE JOB SCREEN => SKILLS SECTION
  final List<String> _skillsList = [];
  String sellectedSkillValue = "";

  // GETTES
  List<String> get skillsList => _skillsList;

  // DELETE SKIL
  void deleteSkilFromSkilsList(String item) {
    _skillsList.remove(item);
    emit(AdminSkilsListUpdate());
  }

  // DELETE FROM responsipilitiesList
  void deleteElementFromrRsponsipilitiesList(String item) {
    _responsipilitiesList.remove(item);
    emit(AdminSkilsListUpdate());
  }

  // DELETE FROM requireMentsList
  void deleteElementFromRequireMentsList(String item) {
    _requireMentsList.remove(item);
    emit(AdminSkilsListUpdate());
  }

  // DELETE FROM benefitsList
  void deleteElementFromBenefitsList(String item) {
    _benefitsList.remove(item);
    emit(AdminSkilsListUpdate());
  }

  //  ADD SELLECTED TO IT'S  LIST
  void addsellectedItemToList(List<String> sellectedList) {
    if (sellectedSkillValue.trim().isNotEmpty) {
      sellectedList.add(sellectedSkillValue.trim());
      emit(AdminSkilsListUpdate());
    }
  }

  // SELLECT JOB TYPE  AND SAVE SELLECED VAL IN selectedJobType VAR
  void sellectJobTybe(String element) {
    _sellectedJobType = element;
    emit(AdminJobTybeSellected(sellectedJobType: element));
  }

  // SELLECT JOB LEVEL  AND SAVE SELLECED VAL IN selectedLevel VAR
  void sellectLevel(String element) {
    _sellectedJobLevel = element;
    emit(AdminLevelSellected(sellectedLevel: element));
  }

  //////////////////////////////////////////////////////// CREATE JOB METHOD //////////////////////////////////////
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
    print("********************* Create Job Method Started");
    emit(AdminCreateNewJobLoading());
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
        print("********************* Create Job Method Failuer");

        emit(AdminCreateNewJobFailuer(errorMessage: failure.message));
      },

      (createdjob) {
        print("********************* Create Job Method Success");

        emit(AdminCreateNewJobSuccess(jobs: createdjob));
      },
    );
  }

  ////////////////////////////////////////////////////////  GET JOBS LIST //////////////////////////////////////
  List<AdminGetJobsListEntity> jobsList = [];
  Future<void> getJobsList() async {
    emit(AdminGetJobsListLoading());
    final jobsListResponse = await _getJobsListUseCaseTest.call();
    jobsListResponse.fold(
      (failure) {
        emit(AdminGetJobsListFailuer(failure.message));
      },
      (right) {
        jobsList = right;
        emit(AdminGetJobsListSuccess(jobsList));
      },
    );
  }

  ////////////////////////////////////////////////////////  UPDATE JOBS //////////////////////////////////////
  Future<void> updateJob(String jobId, Map<String, dynamic> updatedFields) async {
    emit(AdminUpdatedJobLoading());
    final jobUpdated = await _adminUpdateJobUseCase.call(jobId, updatedFields);
    jobUpdated.fold(
      (failure) {
        emit(AdminUpdatedJobFailuer(failure.message));
      },
      (right) {
        final oldjobIndex = jobsList.indexWhere((element) => element.id == jobId);
        if (oldjobIndex != -1) {
          jobsList[oldjobIndex] = jobsList[oldjobIndex].copyWith(
            title: right.title,
            slug: right.slug,
            description: right.description,
            location: right.location,
            experience: right.experience,
            jobType: right.jobType,
            jobLevel: right.jobLevel,
            salaryRange: right.salaryRange,
            skills: right.skills,
            responsibilities: right.responsibilities,
            requirements: right.requirements,
            benefits: right.benefits,
            categoryId: right.categoryId,
            updatedAt: right.updatedAt,
          );
        }
        emit(AdminUpdatedJobSuccess(right));
      },
    );
  }

  ////////////////////////////////////////////////////////  DELETE JOBS //////////////////////////////////////
  Future<void> deleteJob(String jobId) async {
    emit(AdminDeleteJobLoading(jobId: jobId));
    final response = await _adminDeleteJobUsecases.call(jobId);
    response.fold(
      (failuer) {
        emit(AdminDeleteJobFailuer(errorMessage: failuer.message));
      },
      (right) {
        jobsList.removeWhere((element) => element.id == jobId);
        emit(AdminDeleteJobSuccess(deleteSuccefulyMessage: right.message));
      },
    );
  }

  ////////////////////////////////////////////////////////  GET STATISTICS AND SUGGESTED JOBS  //////////////////////////////////////
  List<AdminSuggestedJobsEntity> statisticsList = [];
  AdminTotalJobsEntity totalJobs = AdminTotalJobsEntity(fullTime: 0, partTime: 0, freelance: 0);
  Future<void> getStatistics() async {
    emit(AdminGetStatisticsLoading());
    final response = await _adminGetStatisticsUsecases.call();

    response.fold(
      (failuer) {
        emit(AdminGetStatisticsFailuer(errorMessage: failuer.message));
      },
      (data) {
        statisticsList = data.suggestedJobs;
        totalJobs = data.totalJobs;
        emit(AdminGetStatisticsSuccess(statisticsList: statisticsList, totalJobs: totalJobs));
      },
    );
  }
}
