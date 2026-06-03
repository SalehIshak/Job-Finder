import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:job_finder/core/constants/app_color.dart';
import 'package:job_finder/core/constants/app_strings.dart';
import 'package:job_finder/core/constants/app_text_styles.dart';
import 'package:job_finder/features/admin/presentation/widgets/custom_add_new_category_bottom_sheet.dart';
import 'package:job_finder/features/admin/presentation/widgets/custom_category_card.dart';
import 'package:job_finder/core/shared/custom_text_filed.dart';

class AdminCategorysScreen extends StatefulWidget {
  const AdminCategorysScreen({super.key});

  @override
  State<AdminCategorysScreen> createState() => _AdminCategorysScreenState();
}

class _AdminCategorysScreenState extends State<AdminCategorysScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey3,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        titleSpacing: 0,
        toolbarHeight: 80,

        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Gap(10),
              Text(AppStrings.categorys, style: AppTextStyles.hidding1),
              Spacer(),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(color: AppColor.primary, borderRadius: BorderRadius.circular(10)),
                child: Builder(
                  // IF CREATE showBottomSheet WITHOUT Builder THARE ARE FLUTTER ERROR => NO sCAFOLRD FOUND SO WE SHWLD TO MAKE BUILDER TO PROVIDE INTERNAL CONTEST FOR showBottomSheet
                  builder: (innerContext) {
                    return GestureDetector(
                      onTap: () => showModalBottomSheet(
                        context: innerContext,
                        builder: (innerContext) {
                          return SafeArea(child: CustomAddNewCatrgoryBottomSheet());
                        },
                      ),
                      child: Icon(Icons.add, color: AppColor.white),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(color: Colors.grey.shade300, height: 1.5),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            CustomTextFiled(
              hintText: AppStrings.searchCategorys,
              isSecuredFiled: false,
              controller: _searchController,
              fillColor: AppColor.white,
              borderColor: AppColor.grey2,
            ),
            Gap(20),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverList.separated(
                    itemCount: 10,
                    separatorBuilder: (context, index) => Gap(15),
                    itemBuilder: (context, index) {
                      return CustomCategoryCard();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
