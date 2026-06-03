import 'package:job_finder/features/recruiter/data/models/create_job_request_model.dart';

abstract class RecruiterRemoteDatasurse {
  Future<CreateJobResponseModel> createJob(
    String title,
    String description,
    String location,
    String experience,
    String jobType,
    String jobLevel,
    String salaryRange,
    List<String> skills,
    List<String> responsibilities,
    List<String> requirements,
    List<String> benefits,
  );

  // Future<GetJobsListResponseModelTest> getJobs();
}
