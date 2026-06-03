import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:job_finder/core/di/injection_container.dart';
import 'package:job_finder/core/router/app_route_strings.dart';
import 'package:job_finder/features/admin/domain/entitis/admin_get_jobs_list_entitys.dart';
import 'package:job_finder/features/admin/presentation/cubit/admin_cubit.dart';
import 'package:job_finder/features/admin/presentation/screens/admin_categorys_screen.dart';
import 'package:job_finder/features/admin/presentation/screens/admin_create_new_job_screen.dart';
import 'package:job_finder/features/admin/presentation/screens/admin_home_screen.dart';
import 'package:job_finder/features/admin/presentation/screens/admin_my_jobs_screen.dart';
import 'package:job_finder/features/admin/presentation/screens/admin_profile_screen.dart';
import 'package:job_finder/features/admin/presentation/screens/admin_root_screen.dart';
import 'package:job_finder/features/recruiter/presentation/cubit/recruiter_cubit.dart';
import 'package:job_finder/features/recruiter/presentation/screens/applicants_screen.dart';
import 'package:job_finder/features/recruiter/presentation/screens/recruiter_create_new_job_screen.dart';
import 'package:job_finder/features/recruiter/presentation/screens/recruiter_home_screen.dart';
import 'package:job_finder/features/recruiter/presentation/screens/recruiter_jobs_screen.dart';
import 'package:job_finder/features/recruiter/presentation/screens/recruiter_root_screen.dart';
import 'package:job_finder/features/recruiter/presentation/screens/settings_screen.dart';
import 'package:job_finder/features/shared_features/auth/presentation/screens/login_screen.dart';
import 'package:job_finder/features/shared_features/auth/presentation/screens/regester_screen.dart';
import 'package:job_finder/features/shared_features/complate_profile/presentation/screens/compleate_profile_screen.dart';
import 'package:job_finder/features/shared_features/settengs/presentation/screens/my_applications_screen.dart';
import 'package:job_finder/features/shared_features/settengs/presentation/screens/privicy_policy_screen.dart';
import 'package:job_finder/features/shared_features/settengs/presentation/screens/profile_screen.dart';
import 'package:job_finder/features/shared_features/settengs/presentation/screens/terms_and_conditions_screen.dart';
import 'package:job_finder/features/user_featuers/domain/entitis/user_suggested_entity.dart';
import 'package:job_finder/features/user_featuers/presentation/screens/apply_job_screen.dart';
import 'package:job_finder/features/user_featuers/presentation/screens/job_details_screen.dart';
import 'package:job_finder/features/user_featuers/presentation/screens/user_home_screen.dart';
import 'package:job_finder/features/shared_features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:job_finder/features/shared_features/onboarding/presentation/screens/spash_screen.dart';
import 'package:job_finder/features/user_featuers/presentation/screens/user_root_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoute.userRoot,

  routes: [
    // ONBOARDING
    GoRoute(path: AppRoute.splash, name: AppRoute.splash, builder: (context, state) => const SplashScreen()),
    GoRoute(path: AppRoute.onboarding, name: AppRoute.onboarding, builder: (context, state) => const OnboardingScreen()),
    GoRoute(
      path: AppRoute.compeateProfile,
      name: AppRoute.compeateProfile,
      builder: (context, state) => const CompleateProfileScreen(),
    ),

    // AUTH
    GoRoute(path: AppRoute.register, name: AppRoute.register, builder: (context, state) => const RegesterScreen()),
    GoRoute(path: AppRoute.login, name: AppRoute.login, builder: (context, state) => const LoginScreen()),

    // SETTINGS
    GoRoute(path: AppRoute.settings, name: AppRoute.settings, builder: (context, state) => const SettingsScreen()),
    GoRoute(path: AppRoute.myProfile, name: AppRoute.myProfile, builder: (context, state) => const MyProfileScreen()),
    GoRoute(
      path: AppRoute.myApplications,
      name: AppRoute.myApplications,
      builder: (context, state) => const MyApplicationsScreen(),
    ),
    GoRoute(path: AppRoute.privicyPolicy, name: AppRoute.privicyPolicy, builder: (context, state) => const PrivicyPolicyScreen()),
    GoRoute(
      path: AppRoute.termsAndConditions,
      name: AppRoute.termsAndConditions,
      builder: (context, state) => const TermsAndConditionsScreen(),
    ),

    // USER
    GoRoute(path: AppRoute.userRoot, name: AppRoute.userRoot, builder: (context, state) => const UserRootScreen()),
    GoRoute(path: AppRoute.userHome, name: AppRoute.userHome, builder: (context, state) => const UserHomeScreen()),
    GoRoute(
      path: AppRoute.jobDetails,
      name: AppRoute.jobDetails,
      builder: (context, state) {
        final jobData = state.extra as UserSuggestedJobsEntity;
        return JobDetailsScreen(jobData: jobData);
      },
    ),
    GoRoute(path: AppRoute.applyJob, name: AppRoute.applyJob, builder: (context, state) => const ApplyJobScreen()),

    // ADMIN
    GoRoute(
      path: AppRoute.adminRoot,
      name: AppRoute.adminRoot,
      builder: (context, state) =>
          BlocProvider(create: (context) => getIt<AdminCubit>()..getStatistics(), child: const AdminRootScreen()),
      routes: [],
    ),
    GoRoute(path: AppRoute.adminHome, name: AppRoute.adminHome, builder: (context, state) => const AdminHomeScreen()),
    GoRoute(path: AppRoute.categorys, name: AppRoute.categorys, builder: (context, state) => const AdminCategorysScreen()),
    GoRoute(path: AppRoute.adminJobs, name: AppRoute.adminJobs, builder: (context, state) => const AdminJobsScreen()),
    GoRoute(
      path: AppRoute.admincreateNewJob,
      name: AppRoute.admincreateNewJob,
      builder: (context, state) {
        // NEED TO UNDERSTANDING => RESEVED THIS DATA HERE TO THOROW IT TO EDDIT JOB SCREEN
        // مضر لاستقبال  القيم هنا لكي يقرأها gO ROUTE
        final jobItemData = state.extra as AdminGetJobsListEntity?;
        return BlocProvider(
          create: (context) => getIt<AdminCubit>(),
          child: AdminCreateNewJobScreen(jobItemData: jobItemData),
        );
      },
    ),
    GoRoute(path: AppRoute.adminProfile, name: AppRoute.adminProfile, builder: (context, state) => const AdminProfileScreen()),

    // RECRUITER
    GoRoute(
      path: AppRoute.recruiterRoot,
      name: AppRoute.recruiterRoot,
      builder: (context, state) => BlocProvider(create: (context) => getIt<RecruiterCubit>(), child: const RecruiterRootScreen()),
    ),
    GoRoute(path: AppRoute.recruiterHome, name: AppRoute.recruiterHome, builder: (context, state) => const RecruiterHomeScreen()),
    GoRoute(path: AppRoute.myJobs, name: AppRoute.myJobs, builder: (context, state) => const RecruiterJobsScreen()),
    GoRoute(path: AppRoute.applicants, name: AppRoute.applicants, builder: (context, state) => const ApplicantsScreen()),
    GoRoute(
      path: AppRoute.recruitercreateNewJob,
      name: AppRoute.recruitercreateNewJob,
      builder: (context, state) => const RecruiterCreateNewJobScreen(),
    ),
    // COMMON
  ],
);
