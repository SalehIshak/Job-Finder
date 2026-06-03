import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/features/admin/presentation/cubit/admin_cubit.dart';
import 'package:job_finder/features/admin/presentation/cubit/admin_state.dart';

class CustomAdminSellecrJobTypeAndJobLevelDropDown extends StatelessWidget {
  const CustomAdminSellecrJobTypeAndJobLevelDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminCubit, AdminState>(
      builder: (context, state) {
        final adminCubit = context.read<AdminCubit>();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // SELLECT JOB TYPE
            _buildDropdown(
              context: context,
              label: adminCubit.sellectedJobType,
              items: adminCubit.jobTypesMap,
              selectedItem: adminCubit.sellectedJobType,
              onSelect: (element) => adminCubit.sellectJobTybe(element),
              title: AppStrings.jobType,
            ),

            const SizedBox(width: 12),

            // SELLECT LEVEL
            _buildDropdown(
              context: context,
              label: adminCubit.sellectedJobLevel,
              items: adminCubit.levelsMap,
              selectedItem: adminCubit.sellectedJobLevel,
              onSelect: (element) => adminCubit.sellectLevel(element),
              title: AppStrings.jobLevel,
            ),
          ],
        );
      },
    );
  }
}

Widget _buildDropdown({
  required BuildContext context,
  required String label,
  required Map<String, String> items,
  required String? selectedItem,
  required void Function(String) onSelect,
  required String title,
}) {
  return GestureDetector(
    onTap: () => showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Divider(),

              ...items.entries.map((element) {
                final isSelected = selectedItem == element.key;
                return ListTile(
                  title: Text(element.key),
                  trailing: isSelected ? Icon(Icons.check, color: AppColor.primary) : null,
                  tileColor: isSelected ? AppColor.grey2 : null,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  onTap: () {
                    onSelect(element.value);
                    Navigator.pop(context);
                  },
                );
              }),
            ],
          ),
        );
      },
    ),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFF2E7D5E), width: 1.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 14), overflow: TextOverflow.ellipsis, maxLines: 1),
          Icon(Icons.keyboard_arrow_down, color: Color(0xFF2E7D5E)),
        ],
      ),
    ),
  );
}
