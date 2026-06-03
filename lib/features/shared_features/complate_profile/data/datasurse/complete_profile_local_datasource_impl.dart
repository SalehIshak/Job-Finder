import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:job_finder/core/constants/paths.dart';
import 'package:job_finder/features/shared_features/complate_profile/data/datasurse/complete_profile_local_datasource.dart';
import 'package:job_finder/features/shared_features/complate_profile/data/models/country_model.dart';
import 'package:job_finder/features/shared_features/complate_profile/data/models/job_role_model.dart';

@Injectable(as: CompleteProfileLocalDatasource)
class CompleteProfileLocalDatasourceImpl implements CompleteProfileLocalDatasource {
  @override
  Future<List<CountryModel>> loadCountrys() async {
    String jsonString = await rootBundle.loadString(AppPaths.countrysFilePath);
    List<dynamic> rowList = jsonDecode(jsonString);
    return rowList.map((element) => CountryModel.fromJson(element)).toList();
  }

  @override
  Future<List<JobRoleModel>> loadJopRoles() async {
    String jsonString = await rootBundle.loadString(AppPaths.jobRolePath);
    List<dynamic> rowList = jsonDecode(jsonString);
    return rowList.map((element) => JobRoleModel.fromJson(element)).toList();
  }
}
