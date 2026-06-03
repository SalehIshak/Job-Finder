import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:job_finder/core/di/injection_container.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> configuerDependences() => getIt.init();

// Future<void> stupLocator() async {
//   final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   locator.registerSingleton<DioClinet>(DioClinet(AuthInterceptor(PrefHelper(sharedPreferences))));
//   locator.registerSingleton<AuthInterceptor>(AuthInterceptor(PrefHelper(sharedPreferences)));
//   locator.registerSingleton<PrefHelper>(PrefHelper(sharedPreferences));
//   locator.registerSingleton<OnboardingCubit>(OnboardingCubit(PrefHelper(sharedPreferences)));
//   locator.registerSingleton<AuthRemoteDatasourceImp>(
//     AuthRemoteDatasourceImp(ApiServices(DioClinet(AuthInterceptor(PrefHelper(sharedPreferences))))),
//   );
//   locator.registerSingleton<AuthRepositoryImp>(AuthRepositoryImp(locator.get<AuthRemoteDatasourceImp>()));
// }
