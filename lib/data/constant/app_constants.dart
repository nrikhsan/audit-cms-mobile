class AppConstant{

  static const String baseUrl = 'https://3b9f24f3-a0ef-40b6-b4c5-b4de60765f95.mock.pstmn.io/';

  //auth
  static const String auth = 'api/auth/login';

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
  static const String requestReschedule = 'api/reschedule';
  static const String detailReschedule = 'api/reschedule/';

  //master
  static const String usersAuditArea = 'api/dropdown/users';
  static const String branchAuditArea = 'api/dropdown/branch';
  static const String caseAuditArea = 'api/dropdown/case';
  static const String caseCategoryAuditArea = 'api/dropdown/case-category';
  static const String penlatyAuditArea = 'api/dropdown/penalty';

  //lha
  static const String listRevisiLha = 'api/lha-detail';
  static const String lhaRevision = 'api/lha-revision';
  static const String revisionlhaDetail = 'api/lha-detail';
  static const String lhaAuditArea = 'api/lha';
  static const String detaillhaAuditArea = 'api/lha/';
  
  //clarification
  static const String clarificationAuditArea = 'api/clarification';
  static const String detailClarificationAuditArea = 'api/detail-clarification/';

  //follow up
  static const String followUpAuditArea = 'api/followup';
  static const String inputFollowUpAuditArea = 'api/followup';
  static const String followUpDocumentAuditArea = 'api/follow-up-doc';
  static const String detailFollowUpAuditArea = 'api/followup/';

  //kka
  static const String kkaAuditArea = 'api/kka';
  static const String detailKkaAuditArea = 'api/kka/';

  //bap
  static const String bapAuditArea = 'api/bap';
  static const String detailBapAuditArea = 'api/detail-bap/';

  //report
  static const String reportAuditArea = 'api/report';

  //user profile
  static const String detailUserAuditArea = 'api/profile';
  static const String editProfileUserAuditArea = 'api/edit-profile/';
  static const String changePasswordAuditArea = 'api/change-password/';



  //audit region
  //schedule
  static const String mainScheduleAuditRegion = 'api/main-schedule';
  static const String specialScheduleAuditRegion = 'api/special-schedule';
  static const String reScheduleAuditRegion = 'api/reschedule';
  static const String detailScheduleAuditRegion = 'api/schedule-audit-region/';

  //user profile
  static const String detailUserAuditRegion = 'api/profile';
  static const String editProfileAuditRegion = 'api/edit-profile/';
  static const String changePasswordAuditRegion = 'api/change-password/';

  //report
  static const String reportAuditRegion = 'api/report';

  //lha
  static const String inputLhaAuditRegion = 'api/input-lha';
  static const String lhaAuditRegion = 'api/lha';
  static const String detailLhaAuditRegion = 'api/detail-lha/';

  //master
  static const String divisionAuditRegion = 'api/division';
  static const String sopAuditRegion = 'api/sop';
  static const String uploadKkaAuditRegion = 'api/upload-kka';
  static const String priorityFindingClarificationAuditRegion = 'api/priority-finding';
  static const String clarificationCategoryAuditRegion = 'api/clarification-category';

  //clarification
  static const String clarificationAuditRegion = 'api/clarification-audit-region';
  static const String inputClarificationAuditRegion = 'api/input-clarification';
  static const String documentClarificationAuditRegion = 'api/clarification-doc/';
  static const String uploadClarificationAuditRegion = 'api/upload-clarification';
  static const String inputIdentificationClarification = 'api/input-identification-clarification';
  static const String detailClarificationAuditRegion = 'api/detail-clarification/';

  //bap
  static const String detailBapAuditRegion = 'api/detail-bap/';
  static const String uploadBapAuditRegion = 'api/upload-bap';
  static const String bapAuditRegion = 'api/bap';

  //kka
  static const String kkaAuditRegion = 'api/kka';
  static const String detailKkaAuditRegion = 'api/detail-kka/';
}