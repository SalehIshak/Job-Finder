import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:job_finder/features/user_featuers/domain/entitis/user_entitys.dart';
import 'package:job_finder/features/user_featuers/domain/entitis/user_get_all_jobs_entitys.dart';
import 'package:job_finder/features/user_featuers/domain/entitis/user_suggested_entity.dart';
import 'package:job_finder/features/user_featuers/domain/usecases/user_usecases.dart';
import 'package:job_finder/features/user_featuers/presentation/cubit/user_state.dart';

@injectable
class UserCubit extends Cubit<UserState> {
  final UserGetJobsListUseCase _getJobsListUseCase;
  final UserGetSuggestedListUseCase _getSuggestedListUseCase;
  final UserGetAllJobsListUseCase _userGetAllJobsListUseCase;
  UserCubit(this._getJobsListUseCase, this._getSuggestedListUseCase, this._userGetAllJobsListUseCase) : super(UserInitial());

  List<GetJobsListEntity> jobsList = [];

  // USER ROOT
  void changeItemIndex(int index) {
    emit(UserItemSellected(currentItem: index));
  }

  ////////////////////////////////////////////////////////////// HOME SCREEN  ///////////////////////////////////////

  //  GET MY JOBS LIST
  Future<void> getJobsList() async {
    // print("****************** Get Jos List Started");
    emit(UserGetJobsListLoading());
    final jobsListResponse = await _getJobsListUseCase.call();
    jobsListResponse.fold(
      (failure) {
        // print("****************** Get Jos List Failuer");
        emit(UserGetJobsListFailuer(failure.message));
      },
      (right) {
        // print("****************** Get Jos List Success Jobs Lenth  is ${right.length}");
        jobsList = right;
        emit(UserGetJobsListSuccess(jobsList));
      },
    );
  }

  //  SUGGESTED JOBS LIST
  List<UserSuggestedJobsEntity> statisticsList = [];
  Future<void> getStatistics() async {
    // print("****************** Statistics Start");

    emit(UserGetSuggestedJobsLoading());
    // print("****************** Statistics Loading");

    final response = await _getSuggestedListUseCase.call();
    // print("****************** Statistics Loaded");

    response.fold(
      (failuer) {
        // print("****************** Statistics Failuer is ${failuer.message}");

        emit(UserGetSuggestedJobsFailuer(errorMessage: failuer.message));
      },
      (data) {
        statisticsList = data.suggestedJobs;
        emit(UserGetSuggestedJobsSuccess(statisticsList: statisticsList));
      },
    );
  }

  // GET ALL JOBS
  List<UserJobDataEntity> allJobsList = [];
  Future<void> getAllJobs({String? jobType, String? jobLevel, String? location, String? search}) async {
    emit(UserGetAllJobsLoading());
    final response = await _userGetAllJobsListUseCase.call(
      jobType: jobType,
      jobLevel: jobLevel,
      location: location,
      search: search,
    );
    response.fold((failuer) => emit(UserGetAllJobsFailuer(errorMessage: failuer.message)), (data) {
      allJobsList = data;
      emit(UserGetAllJobsSuccess(alJobsList: data));
    });
  }

  // BOTTOM SHEET FOR SEARCH
  //   String? jobTypeSellected = "FULL_TIME";
  //   String? jobLevelSellected = "ENTRY_LEVEL ";

  //   final Map<String, String> _jobTypesMap = {
  //     "Full Time": "FULL_TIME",
  //     "Part Time": "PART_TIME",
  //     "Contract": "CONTRACT",
  //     "Internship": "INTERNSHIP",
  //     "Freelance": "FREELANCE",
  //   };
  //   final Map<String, String> _levelsMap = {
  //     "Entry Level": "ENTRY_LEVEL",
  //     "Mid Level": "MID_LEVEL",
  //     "Senior Level": "SENIOR_LEVEL",
  //     "Management": "MANAGEMENT",
  //     "Executive": "EXECUTIVE",
  //   };

  //   void getSearchValue(String? jobTypeValue, String? jobLevelValue) {
  //     jobTypeSellected = jobTypeValue;
  //     jobLevelSellected = jobTypeValue;
  //   }

  //   String? jobTypeSelected;
  // String? jobLevelSelected;

  // void setJobType(String? value) {
  //   jobTypeSelected = value;
  //   filterJobs();
  // }

  // void setJobLevel(String? value) {
  //   jobLevelSelected = value;
  //   filterJobs();
  // }
}
