// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:job_finder/core/di/register_module.dart' as _i61;
import 'package:job_finder/core/local/pref_helper.dart' as _i1016;
import 'package:job_finder/core/network/api_services.dart' as _i619;
import 'package:job_finder/core/network/auth_interceptor.dart' as _i885;
import 'package:job_finder/core/network/dio_clinet.dart' as _i345;
import 'package:job_finder/features/admin/data/datasurse/admin_remote_datasurse.dart'
    as _i876;
import 'package:job_finder/features/admin/data/datasurse/admin_remote_datasurseimp.dart'
    as _i58;
import 'package:job_finder/features/admin/data/repositories/admin_reposiotyimp.dart'
    as _i494;
import 'package:job_finder/features/admin/domain/repositories/admin_repository.dart'
    as _i489;
import 'package:job_finder/features/admin/domain/usecases/admin_usecases.dart'
    as _i837;
import 'package:job_finder/features/admin/presentation/cubit/admin_cubit.dart'
    as _i284;
import 'package:job_finder/features/recruiter/data/datasurse/recruiter_remote_datasurse.dart'
    as _i183;
import 'package:job_finder/features/recruiter/data/datasurse/recruiter_remote_datasurseimp.dart'
    as _i651;
import 'package:job_finder/features/recruiter/data/repositories/recruiter_repositoryimp.dart'
    as _i1048;
import 'package:job_finder/features/recruiter/domain/repositories/recruiter_repository.dart'
    as _i732;
import 'package:job_finder/features/recruiter/domain/usecases/recruiter_usecases.dart'
    as _i120;
import 'package:job_finder/features/recruiter/presentation/cubit/recruiter_cubit.dart'
    as _i99;
import 'package:job_finder/features/shared_features/auth/data/datasurce/auth_remote_datasource.dart'
    as _i319;
import 'package:job_finder/features/shared_features/auth/data/datasurce/auth_remote_datasource_impl.dart'
    as _i325;
import 'package:job_finder/features/shared_features/auth/data/repositories/auth_repository_impl.dart'
    as _i113;
import 'package:job_finder/features/shared_features/auth/domain/repositories/auth_repository.dart'
    as _i266;
import 'package:job_finder/features/shared_features/auth/domain/usecases/auth_usecases.dart'
    as _i141;
import 'package:job_finder/features/shared_features/auth/presentation/cubit/auth_cubit.dart'
    as _i264;
import 'package:job_finder/features/shared_features/complate_profile/data/datasurse/complete_profile_local_datasource.dart'
    as _i201;
import 'package:job_finder/features/shared_features/complate_profile/data/datasurse/complete_profile_local_datasource_impl.dart'
    as _i377;
import 'package:job_finder/features/shared_features/complate_profile/data/repository/complete_profile_repository_impl.dart'
    as _i606;
import 'package:job_finder/features/shared_features/complate_profile/domain/repository/complete_profile_repository.dart'
    as _i323;
import 'package:job_finder/features/shared_features/complate_profile/domain/usecases/complet_profile_usecases.dart'
    as _i93;
import 'package:job_finder/features/user_featuers/data/datasurse/user_remote_datasurse.dart'
    as _i127;
import 'package:job_finder/features/user_featuers/data/datasurse/user_remote_datasurse_imp.dart'
    as _i628;
import 'package:job_finder/features/user_featuers/data/repository/user_repositoryimp.dart'
    as _i14;
import 'package:job_finder/features/user_featuers/domain/repository/user_repsitory.dart'
    as _i572;
import 'package:job_finder/features/user_featuers/domain/usecases/user_usecases.dart'
    as _i334;
import 'package:job_finder/features/user_featuers/presentation/cubit/user_cubit.dart'
    as _i843;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i201.CompleteProfileLocalDatasource>(
      () => _i377.CompleteProfileLocalDatasourceImpl(),
    );
    gh.singleton<_i1016.PrefHelper>(
      () => _i1016.PrefHelper(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i323.CompleteProfileRepository>(
      () => _i606.CompleteProfileRepositoryImpl(
        gh<_i377.CompleteProfileLocalDatasourceImpl>(),
      ),
    );
    gh.factory<_i93.GetCountrysUsecases>(
      () => _i93.GetCountrysUsecases(gh<_i323.CompleteProfileRepository>()),
    );
    gh.factory<_i93.GetJobRolesUseCases>(
      () => _i93.GetJobRolesUseCases(gh<_i323.CompleteProfileRepository>()),
    );
    gh.singleton<_i885.AuthInterceptor>(
      () => _i885.AuthInterceptor(gh<_i1016.PrefHelper>()),
    );
    gh.singleton<_i345.DioClinet>(
      () => _i345.DioClinet(gh<_i885.AuthInterceptor>()),
    );
    gh.singleton<_i619.ApiServices>(
      () => _i619.ApiServices(gh<_i345.DioClinet>()),
    );
    gh.factory<_i876.AdminRemoteDatasurse>(
      () => _i58.AdminRemoteDatasurseimp(gh<_i619.ApiServices>()),
    );
    gh.factory<_i319.AuthRemoteDataSource>(
      () => _i325.AuthRemoteDatasourceImp(gh<_i619.ApiServices>()),
    );
    gh.factory<_i183.RecruiterRemoteDatasurse>(
      () => _i651.RecruiterRemoteDatasurseimp(gh<_i619.ApiServices>()),
    );
    gh.factory<_i127.UserRemoteDatasurse>(
      () => _i628.UserRemoteDatasurseImp(gh<_i619.ApiServices>()),
    );
    gh.factory<_i266.AuthRepository>(
      () => _i113.AuthRepositoryImp(gh<_i319.AuthRemoteDataSource>()),
    );
    gh.factory<_i141.LoginUseCase>(
      () => _i141.LoginUseCase(gh<_i266.AuthRepository>()),
    );
    gh.factory<_i141.RegisterUseCase>(
      () => _i141.RegisterUseCase(gh<_i266.AuthRepository>()),
    );
    gh.factory<_i141.GetProfileUseCase>(
      () => _i141.GetProfileUseCase(gh<_i266.AuthRepository>()),
    );
    gh.factory<_i141.ReplaceProfileUseCase>(
      () => _i141.ReplaceProfileUseCase(gh<_i266.AuthRepository>()),
    );
    gh.factory<_i572.UserRepsitory>(
      () => _i14.UserRepositoryimp(gh<_i127.UserRemoteDatasurse>()),
    );
    gh.factory<_i732.RecruiterRepository>(
      () => _i1048.RecruiterRepositoryimp(gh<_i183.RecruiterRemoteDatasurse>()),
    );
    gh.factory<_i120.CreateJobUseCase>(
      () => _i120.CreateJobUseCase(gh<_i732.RecruiterRepository>()),
    );
    gh.factory<_i334.UserGetJobsListUseCase>(
      () => _i334.UserGetJobsListUseCase(gh<_i572.UserRepsitory>()),
    );
    gh.factory<_i334.UserGetSuggestedListUseCase>(
      () => _i334.UserGetSuggestedListUseCase(gh<_i572.UserRepsitory>()),
    );
    gh.factory<_i334.UserGetAllJobsListUseCase>(
      () => _i334.UserGetAllJobsListUseCase(gh<_i572.UserRepsitory>()),
    );
    gh.factory<_i489.AdminRepository>(
      () => _i494.AdminReposiotyimp(gh<_i876.AdminRemoteDatasurse>()),
    );
    gh.factory<_i264.AuthCubit>(
      () => _i264.AuthCubit(
        gh<_i141.LoginUseCase>(),
        gh<_i141.RegisterUseCase>(),
        gh<_i141.GetProfileUseCase>(),
        gh<_i1016.PrefHelper>(),
        gh<_i141.ReplaceProfileUseCase>(),
      ),
    );
    gh.factory<_i99.RecruiterCubit>(
      () => _i99.RecruiterCubit(gh<_i120.CreateJobUseCase>()),
    );
    gh.factory<_i837.AdminGetJobsListUseCase>(
      () => _i837.AdminGetJobsListUseCase(gh<_i489.AdminRepository>()),
    );
    gh.factory<_i837.AdminUpdateJobUseCase>(
      () => _i837.AdminUpdateJobUseCase(gh<_i489.AdminRepository>()),
    );
    gh.factory<_i837.AdminDeleteJobUsecases>(
      () => _i837.AdminDeleteJobUsecases(gh<_i489.AdminRepository>()),
    );
    gh.factory<_i837.AdminGetStatisticsUsecases>(
      () => _i837.AdminGetStatisticsUsecases(gh<_i489.AdminRepository>()),
    );
    gh.factory<_i843.UserCubit>(
      () => _i843.UserCubit(
        gh<_i334.UserGetJobsListUseCase>(),
        gh<_i334.UserGetSuggestedListUseCase>(),
        gh<_i334.UserGetAllJobsListUseCase>(),
      ),
    );
    gh.factory<_i284.AdminCubit>(
      () => _i284.AdminCubit(
        gh<_i837.AdminGetJobsListUseCase>(),
        gh<_i120.CreateJobUseCase>(),
        gh<_i837.AdminUpdateJobUseCase>(),
        gh<_i837.AdminDeleteJobUsecases>(),
        gh<_i837.AdminGetStatisticsUsecases>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i61.RegisterModule {}
