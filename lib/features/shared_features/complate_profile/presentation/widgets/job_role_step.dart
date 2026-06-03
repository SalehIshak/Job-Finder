import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/features/shared_features/complate_profile/presentation/cubit/complete_profile_cubit.dart';
import 'package:job_finder/features/shared_features/complate_profile/presentation/cubit/complete_profile_state.dart';
import 'package:job_finder/features/shared_features/complate_profile/presentation/widgets/complate_profile_sellect_options.dart';

class JobRoleStep extends StatelessWidget {
  const JobRoleStep({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompleteProfileCubit, CompleteProfileState>(
      builder: (context, state) {
        if (state is CompleteProfileLoading) {
          CupertinoActivityIndicator(color: AppColor.primary);
        }
        if (state is CompleteProfileLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView.separated(
              separatorBuilder: (context, index) => Gap(15),
              itemCount: state.jobRoles.length,
              itemBuilder: (context, index) {
                final item = state.jobRoles[index];
                bool isSellected = state.jobRolesSellectedList.contains(item);
                return ComplateProfileSellectOptions(
                  isSellected: isSellected,
                  title: item.lable,
                  onTap: () => context.read<CompleteProfileCubit>().onSellectedJobRole(item),
                );
              },
            ),
          );
        }
        return SizedBox.shrink();
      },
    );
  }
}
