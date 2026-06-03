import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder/core/di/injection_container.dart';
import 'package:job_finder/core/router/app_route.dart';
import 'package:job_finder/features/shared_features/auth/presentation/cubit/auth_cubit.dart';
import 'package:job_finder/features/user_featuers/presentation/cubit/user_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configuerDependences(); // GIT IT FOR DI
  // await stupLocator();

  // await PrefHelper().clearAll();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AuthCubit>()),
        BlocProvider(create: (context) => getIt<UserCubit>()),
      ],

      child: MaterialApp.router(
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
      ),
    );
  }
}
