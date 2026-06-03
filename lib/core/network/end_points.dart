// أسماء الـ Endpoints
class AppEndPoints {
  static const baseUrl = 'https://next-step-api.onrender.com/api/v2/';
  static const register = 'auth/register';
  static const login = 'auth/login';
  static const userProfile = '/auth/me';
  static const authApdate = '/auth/update';

  static const jobCreate = '/job/create';
  static const products = 'products';
  static const jobs = '/job/me';
  static const getStatistics = '/stats';
  static const getAllJobs = 'job/all';

  //WITH ID OR PARAMS
  static String updateJobPatch(String jobId) => "/job/patch/$jobId";
  static String deleteJob(String jobId) => "/job/delete/$jobId";
}

class AppApiKeys {
  // LOGIN AND REGESTER
  static String status = "status";
  static String errorMessage = "ErrorMessage";
  static String token = "token";
  static String confirmPassword = "confirmPassword";
  static String profilePic = "profilePic";

  // PROFILE DATA
  static String id = "id";
  static String phoneNumber = "phoneNumber";
  static String address = "address";
  static String gender = "gender";
  static String jobRoles = "jobRoles";
  static String role = "role";
  static String countries = "countries";
  static String imageUrl = "imageUrl";
  static String isCompleted = "isCompleted";
  static String timestamp = "timestamp";

  //COMMOND
  static String success = "success";
  static String data = "data";
  static String message = "message";
  static String fullName = "fullName";
  static String name = "name";
  static String email = "email";
  static String password = "password";
  static String phone = "phone";
  static String title = "title";
  static String description = "description";
  static String location = "location";
  static String experience = "experience";
  static String jobType = "jobType";
  static String jobLevel = "jobLevel";
  static String salaryRange = "salaryRange";
  static String skills = "skills";
  static String responsibilities = "responsibilities";
  static String requirements = "requirements";
  static String benefits = "benefits";
}
