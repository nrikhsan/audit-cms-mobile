class AppConstant{

  static const String baseUrl = 'https://api-kka.cmsmaju.co.id/';

  //auth
  static const String auth = 'api/auth/login';
  static const String logOut = 'api/auth/logout';

  //audit area
  //main schedule
  static const String addMainSchedulesAuditArea = 'api/main-schedule';
  static const String editMainSchedule = 'api/main-schedule/';
  static const String deleteMainSchedule = 'api/main-schedule/';
  static const String detailMainSchedule = 'api/main-schedule/';
  static const String mainScheduleAuditArea = 'api/main-schedule';
  
  //special schedule
  static const String specialScheduleAuditArea = 'api/special-schedule';
  static const String addSpecialSchedulesAuditArea = 'api/special-schedule';
  static const String editSpecialSchedule = 'api/special-schedule/';
  static const String detailSpecilaSchedule = 'api/special-schedule/';
  static const String deleteSpecialSchedule = 'api/special-schedule/';

  //reschedule
  static const String reschedulesAuditArea = 'api/reschedule';
  static const String requestReschedule = 'api/reschedule/request';
  static const String detailReschedule = 'api/reschedule/';

  //master
  static const String usersAuditArea = 'api/dropdown/users';
  static const String branchAuditArea = 'api/dropdown/branch';
  static const String caseAuditArea = 'api/dropdown/case';
  static const String caseCategoryAuditArea = 'api/dropdown/case-category';
  static const String penlatyAuditArea = 'api/dropdown/penalty';

  //lha
  // static const String listCaseLha = 'api/lha-detail';
  static const String detailCasesLhaAuditArea = 'api/lha-detail/';
  static const String listRevisiLha = 'api/lha-revision';
  static const String lhaRevision = 'api/lha-revision';
  static const String detailLhaRevision = 'api/lha-revision/';
  static const String lhaAuditArea = 'api/lha';
  static const String detaillhaAuditArea = 'api/lha/';
  
  //clarification
  static const String clarificationAuditArea = 'api/clarification';
  static const String detailClarificationAuditArea = 'api/clarification/';
  static const String downloadClarificationAuditArea = '${baseUrl}api/clarification/download/';
  static const String documentClarificationAuditArea = '${baseUrl}api/clarification/file/';

  //follow up
  static const String followUpAuditArea = 'api/followup';
  static const String inputFollowUpAuditArea = 'api/followup';
  static const String followUpDocumentAuditArea = 'api/followup/file/';
  static const String detailFollowUpAuditArea = 'api/followup/';
  static const String downloadFollowUp = 'api/followup/file/';

  //kka
  static const String kkaAuditArea = 'api/kka';
  static const String detailKkaAuditArea = 'api/kka/';
  static const String downloadKKaAuditArea = '${baseUrl}api/kka/download/';

  //bap
  static const String bapAuditArea = 'api/bap';
  static const String detailBapAuditArea = 'api/bap/';
  static const String downloadBap = 'api/bap/file/';

  //report
  static const String downloadReportClarificationAuditArea = '${baseUrl}api/report/clarification';

  //user profile
  static const String detailUserAuditArea = 'api/profile';
  static const String editProfileUserAuditArea = 'api/profile/change-profile';
  static const String changePasswordAuditArea = 'api/profile/change-password';


  //audit region
  //schedule
  //main schedule
  static const String mainScheduleAuditRegion = 'api/main-schedule';
  static const String detailMainScheduleAuditRegion = 'api/main-schedule/';

  //special schedule
  static const String specialScheduleAuditRegion = 'api/special-schedule';
  static const String detailSpecialScheduleAuditRegion = 'api/special-schedule/';

  //reschedule
  static const String reScheduleAuditRegion = 'api/reschedule';
  static const String detailRescheduleAuditRegion = 'api/reschedule/';

  //lha
  static const String inputLhaAuditRegion = 'api/lha';
  static const String lhaAuditRegion = 'api/lha';
  static const String detailLhaAuditRegion = 'api/lha/';
  static const String caselhaDetailAuditRegion = 'api/lha-detail/';

  //kka
  static const String kkaAuditRegion = 'api/kka';
  static const String detailKkaAuditRegion = 'api/kka/';
  static const String uploadKkaAuditRegion = 'api/kka/upload';
  static const String downloadKKaAuditRegion = '${baseUrl}api/kka/download/';

  //user profile
  static const String detailUserAuditRegion = 'api/profile';
  static const String editProfileUserAuditRegion = 'api/profile/change-profile';
  static const String changePasswordAuditRegion = 'api/profile/change-password';

  //report
  static const String downloadReportClarificationAuditRegion = '${baseUrl}api/report/clarification';

  //master
  static const String caseAuditRegion = 'api/dropdown/case';
  static const String caseCategoryAuditRegion = 'api/dropdown/case-category';
  static const String branchAuditRegion = 'api/dropdown/branch';
  static const String priorityFindingClarificationAuditRegion = 'api/dropdown/priority';

  //clarification
  static const String clarificationAuditRegion = 'api/clarification';
  static const String detailClarificationAuditRegion = 'api/clarification/';
  static const String generateClarification = 'api/clarification/generate';
  static const String inputClarificationAuditRegion = 'api/clarification';
  static const String documentClarificationAuditRegion = '${baseUrl}api/clarification/file/';
  static const String uploadClarificationAuditRegion = 'api/clarification/upload';
  static const String inputIdentificationClarification = 'api/clarification/identification';
  static const String downloadClarificationAuditRegion = '${baseUrl}api/clarification/download/';

  //bap
  static const String detailBapAuditRegion = 'api/bap/';
  static const String uploadBapAuditRegion = 'api/bap/upload';
  static const String bapAuditRegion = 'api/bap';
  static const String fileBap = '${baseUrl}api/bap/file/';

}