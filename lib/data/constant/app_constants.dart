class AppConstant{

  static const String baseUrlDev = 'https://apidev-kka.cmsmaju.co.id/';

  //auth
  static const String auth = 'api/auth/login';
  static const String logOut = 'api/auth/logout';

  //main schedule
  static const String addMainSchedules = 'api/main-schedule';
  static const String editMainSchedule = 'api/main-schedule/';
  static const String deleteMainSchedule = 'api/main-schedule/';
  static const String detailMainSchedule = 'api/main-schedule/';
  static const String getMainSchedule = 'api/main-schedule';
  
  //special schedule
  static const String getSpecialSchedule = 'api/special-schedule';
  static const String addSpecialSchedule = 'api/special-schedule';
  static const String editSpecialSchedule = 'api/special-schedule/';
  static const String detailSpecialSchedule = 'api/special-schedule/';
  static const String deleteSpecialSchedule = 'api/special-schedule/';

  //reschedule
  static const String getReschedule = 'api/reschedule';
  static const String requestReschedule = 'api/reschedule/request';
  static const String detailReschedule = 'api/reschedule/';

  //master
  static const String getDropdownArea = 'api/dropdown/area';
  static const String getDropdownUsers = 'api/dropdown/users';
  static const String getDropdownBranch = 'api/dropdown/branch';
  static const String getsDropdownCase = 'api/dropdown/case';
  static const String getDropdownCaseCategory = 'api/dropdown/case-category';
  static const String getDropdownPenalty = 'api/dropdown/penalty';
  static const String getDropdownPriorityFindingClarification = 'api/dropdown/priority';

  //lha
  static const String detailCasesLha = 'api/lha-detail/';
  static const String deleteCaseLha = 'api/lha-detail/';
  static const String inputCaseLha = 'api/lha-detail';
  static const String sendCaseLha = 'api/lha-detail/send/';
  static const String listRevisionLha = 'api/lha-revision';
  static const String lhaRevision = 'api/lha-revision';
  static const String detailLhaRevision = 'api/lha-revision/';
  static const String getListLha = 'api/lha';
  static const String detailLha = 'api/lha/';
  static const String inputLha = 'api/lha';
  
  //clarification
  static const String generateClarification = 'api/clarification/generate';
  static const String getClarification = 'api/clarification';
  static const String detailClarification = 'api/clarification/';
  static const String downloadClarification = '${baseUrlDev}api/clarification/download/';
  static const String documentClarification = '${baseUrlDev}api/clarification/file/';
  static const String inputClarification = 'api/clarification';
  static const String uploadClarification = 'api/clarification/upload';
  static const String inputIdentificationClarification = 'api/clarification/identification';

  //follow up
  static const String getFollowUp = 'api/followup';
  static const String inputFollowUp = 'api/followup';
  static const String followUpDocument = '${baseUrlDev}api/followup/file/';
  static const String detailFollowUp = 'api/followup/';
  static const String downloadFollowUp = '${baseUrlDev}api/followup/download/';
  static const String uploadFollowUp = 'api/followup/file';

  //kka
  static const String uploadKka = 'api/kka/upload';
  static const String getListKka = 'api/kka';
  static const String detailKka = 'api/kka/';
  static const String downloadKKa = '${baseUrlDev}api/kka/download/';

  //bap
  static const String getBap = 'api/bap';
  static const String detailBap = 'api/bap/';
  static const String fileBap = '${baseUrlDev}api/bap/file/';
  static const String uploadBap = 'api/bap/upload';

  //report
  static const String downloadReportClarification = '${baseUrlDev}api/report/clarification';
  static const String downloadReportLha = '${baseUrlDev}api/report/lha';

  //user profile
  static const String detailUser = 'api/profile';
  static const String editProfileUser = 'api/profile/change-profile';
  static const String changePassword = 'api/profile/change-password';

  //dashboard
  static const String followUpDashboard = 'api/dashboard-followup';
  static const String findingDashboard = 'api/dashboard-found';
  static const String nominalDashboard = 'api/dashboard-nominal';
  static const String totalDashboard = 'api/dashboard-total';
  static const String divisionDashboard = 'api/dashboard-divisi';
  static const String downloadDashboardClarification = '${baseUrlDev}api/dashboard-clarification';
  static const String dashboardSop = 'api/dashboard-sop';
  
}