import 'package:job_finder/core/enums/app_enums.dart';

// JOB TYPE EXTENTION
extension JobTypeExt on JobType {
  // USE LOCALY
  String get label => switch (this) {
    JobType.fullTime => 'Full Time',
    JobType.partTime => 'Part Time',
    JobType.contract => 'Contract',
    JobType.internship => 'Internship',
  };

  // WHEN SENT TO API
  String get apiValue => switch (this) {
    JobType.fullTime => 'FULL_TIME',
    JobType.partTime => 'PART_TIME',
    JobType.contract => 'CONTRACT',
    JobType.internship => 'INTERNSHIP',
  };
}

// JOB LEVEL EXTENTION
extension JobLevelExt on JobLevel {
  // USE LOCALY
  String get label => switch (this) {
    JobLevel.entryLevel => "EntryLevel",
    JobLevel.midLevel => "MidLevel",
    JobLevel.seniorLevel => "SeniorLevel",
    JobLevel.executive => "Executive",
  };

  // WHEN SENT TO API
  String get apiValue => switch (this) {
    JobLevel.entryLevel => "ENTRY_LEVEL",
    JobLevel.midLevel => " MID_LEVEL",
    JobLevel.seniorLevel => "SENIOR_LEVEL",
    JobLevel.executive => "EXECUTIVE",
  };
}
