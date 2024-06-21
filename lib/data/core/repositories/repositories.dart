import 'package:audit_cms/data/core/response/auditArea/clarification/response_detail_clarification_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/followUp/response_input_follow_up.dart';
import 'package:audit_cms/data/core/response/auditArea/lha/model_body_input_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/lha/response_detail_cases_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/lha/response_detail_revision_lha.dart';
import 'package:audit_cms/data/core/response/auditArea/lha/response_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/followUp/reponse_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/bap/response_bap_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/clarification/response_clarification_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/bap/response_detail_bap_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/followUp/response_detail_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/kka/response_detail_kka_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/lha/response_detail_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/lha/response_revisi_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_penalty_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_branch_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_case_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_case_category_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_users.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/model_body_add_schedules.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_detail_reschedule_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/userPorfile/response_detail_user_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/kka/response_kka_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_detail_schedule_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_main_schedules_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_reschedule_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_special_schedules_audit_area.dart';
import 'package:audit_cms/data/core/response/auditRegion/bap/response_bap_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/clarification/response_clarification_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/clarification/response_input_clarification.dart';
import 'package:audit_cms/data/core/response/auditRegion/clarification/response_input_identification.dart';
import 'package:audit_cms/data/core/response/auditRegion/lha/model_body_input_lha_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/lha/response_detail_lha_cases.dart';
import 'package:audit_cms/data/core/response/auditRegion/lha/response_lha_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/master/response_branch_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/master/response_case_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/master/response_case_category_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/bap/response_detail_bap_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/clarification/response_detail_clarification_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/kka/response_detail_kka_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/lha/response_detail_lha_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/master/response_recommendation.dart';
import 'package:audit_cms/data/core/response/auditRegion/schedules/response_detail_reschedule_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/schedules/response_detail_schedule_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/schedules/response_reschedule_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/userProfile/response_detail_user_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/kka/response_kka_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/master/response_priority_finding_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/report/response_report_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/schedules/response_main_schedule_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/schedules/response_special_schedule_audit_region.dart';
import 'package:audit_cms/data/core/response/dashboard/response_dashboard_sop.dart';
import 'package:audit_cms/data/core/response/dashboard/response_division_dashboard.dart';
import 'package:audit_cms/data/core/response/dashboard/response_finding_dashboard.dart';
import 'package:audit_cms/data/core/response/dashboard/response_follow_up_dashboard.dart';
import 'package:audit_cms/data/core/response/dashboard/response_nominal_dashboard.dart';
import 'package:audit_cms/data/core/response/dashboard/response_total_dashboard.dart';
import 'package:audit_cms/data/core/response/responseMessage/response_message.dart';
import '../response/auth/response_auth.dart';



abstract class Repositories {

  //Auth
  Future<ResponseAuth> login(String username, String password);
  Future<ResponseMessage> logOut();

  //audit area
  //main schedule
  Future<ResponseMessage> addMainSchedules(List<ModelBodySchedulesAuditArea>schedule);
  Future<ResponseMainScheduleAuditArea> getMainSchedulesAuditArea(int page, String name, int? branchId, String startDate, String endDate);
  Future<ResponseMessage>editMainSchedule(int id, int userId, int branchId, String startDate, String endDate, String description);
  Future<ResponseMessage>deleteMainSchedule(int id);
  Future<ResponseDetailScheduleAuditArea> getDetailMainScheduleAuditArea(int id);

  //special schedule
  Future<ResponseSpecialScheduleAuditArea> getSpecialSchedulesAuditArea(int page, String name, int? branchId, String startDate, String endDate);
  Future<ResponseMessage> addSpecialSchedules(List<ModelBodySchedulesAuditArea>schedule);
  Future<ResponseMessage>editSpecialSchedule(int id, int userId, int branchId, String startDate, String endDate, String description);
  Future<ResponseMessage>deleteSpecialSchedule(int id);
  Future<ResponseDetailScheduleAuditArea> getDetailSpecialScheduleAuditArea(int id);

  //reschedule
  Future<ResponseMessage>requestReschedule(int? userId, int scheduleId, int? branchId, String startDate, String endDate, String desc);
  Future<ResponseRescheduleAuditArea> getReschedulesAuditArea(int page, String name, int? branchId, String startDate, String endDate);
  Future<ResponseDetailRescheduleAuditArea> getDetailRescheduleAuditArea(int id);

  //master
  Future<ResponseUsers> getUsersAuditArea();
  Future<ResponseBranchAuditArea> getBranchByUserIdAuditArea(int? userId);
  Future<ResponseBranchAuditArea> getBranchForFilterDataAuditArea();
  Future<ResponseCaseAuditArea> getCaseAuditArea();
  Future<ResponseCaseCategoryAuditArea> getCaseCategoryAuditArea(int? caseId);
  Future<ResponsePenaltyAuditArea> getPenaltyAuditArea();
  

  //LHA
  Future<ResponseRevisionLhaAuditArea>getRevisiLhaAuditArea(int? lhaDetailId);
  Future<ResponseMessage>inputLhaAuditArea(int scheduleId, List<LhaDetailArea>lhaDetail);
  Future<ResponseMessage>sendCaseLha(int? lhaDEtailId);
  Future<ResponseMessage> revisiLha(int? lhaId, String desc, String suggest, String tempRec, String perRec);
  Future<ResponseDetailLhaCasesLhaAuditArea>getDetailCaseLhaAuditArea(int? caseId);
  Future<ResponseDetailRevision>getDetailRevisionLhaAuditArea(int caseId);
  Future<ResponseLhaAuditArea> getLhaAuditArea(int page, String name, int? branchId, String startDate, String endDate);
  Future<ResponseDetailLhaAuditArea> getDetailLhaAuditArea(int? id);

  //clarification
  Future<ResponseClarificationAuditArea> getClarificationAuditArea(int page, String name, int? branchId, String startDate, String endDate);
  Future<ResponseDetailClarificationAuditArea> getDetailClarificationAuditArea(int id);

  //KKA
  Future<ResponseKkaAuditArea> getKkaAuditArea(int page, int? scheduleId, String name, int? branchId, String startDate, String endDate);
  Future<ResponseMessage>uploadKkaAuditArea(String filePath, int id);
  Future<ResponseDetailKkaAuditArea> getDetailKkaAuditArea(int id);

  //BAP
  Future<ResponseBapAuditArea>getBapAuditArea(int page, String name, int? branchId, String startDate, String endDate);
  Future<ResponseDetailBapAuditArea>getDetailBapAuditArea(int? id);

  //follow up
  Future<ResponseFollowUp> getFollowUpAuditArea(int page, String name, int? branchId, String startDate, String endDate);
  Future<ResponseInputFollowUp>inputFollowUpAuditArea(int followUpId, List<int>? penaltyId, num charCoss, String desc);
  Future<ResponseMessage>uploadFollowUpAuditArea(String filePath, int? followupId);
  Future<ResponseDetailFollowUp> getDetailFollowUpAuditArea(int? id);

  //user profile
  Future<ResponseProfileAuditArea> getDetailUserAuditArea();
  Future<ResponseMessage>editUserAuditArea(String email, String fullName);
  Future<ResponseMessage>changePasswordAuditArea(String oldPassword, String newPassword);


  //audit region
  //main schedules
  Future<ResponseMainScheduleAuditRegion>getMainSchedulesAuditRegion(int page, String startDate, String endDate);
  Future<ResponseDetailScheduleAuditRegion> getDetailMainScheduleAuditRegion(int id);

  //special schedule
  Future<ResponseSpecialScheduleAuditRegion>getSpecialSchedulesAuditRegion(int page, String startDate, String endDate);
  Future<ResponseDetailScheduleAuditRegion>getDetailSpecialScheduleAuditRegion(int id);

  //reschedule
  Future<ResponseReschedulesAuditRegion>getRescheduleAuditRegion(int page, String startDate, String endDate);
  Future<ResponseDetailRescheduleAuditRegion>getDetailRescheduleAuditRegion(int id);

  //LHA
  Future<ResponseMessage>inputLhaAuditRegion(int scheduleId, List<LhaDetail>lhaDetail);
  Future<ResponseMessage>deletCaseLha(int? lhaDetailId);
  Future<ResponseMessage>inputCaseLhaAuditRegion(int lhaDetailId, int? caseId, int? caseCategory, String desc,
    String suggestion, String tempRec, String perRec, int isResearch);
  Future<ResponseDetailLhaCasesLhaAuditRegion>getDetailCasesLha(int lhaId);
  Future<ResponseDetailLhaAuditRegion>getDetailLhaAuditRegion(int? id);
  Future<ResponseLhaAuditRegion>getListLhaAuditRegion(int page, String startDate, String endDate);

  //KKA
  Future<ResponseMessage>uploadKkaAuditRegion(String filePath, int id);
  Future<ResponseKkaAuditRegion>getKkaAuditRegion(int page, int? scheduleId, String startDate, String endDate);
  Future<ResponseDetailKkaAuditRegion>getDetailKkaAuditRegion(int id);

  //master
  Future<ResponseBranchAuditRegion>getBranchAuditRegion();
  Future<ResponseCaseAuditRegion>getCasesAuditRegion();
  Future<ResponseCaseCategoryAuditRegion>getCaseCategoryAuditRegion(int? caseId);
  Future<ResponsePriorityFindingAuditRegion>getPriorityFindingAuditRegion();
  Future<ResponseRecommendationAuditRegion> getRecommendation();

  //user profile
  Future<ResponseProfileAuditRegion> getDetailUserAuditRegion();
  Future<ResponseMessage>editUserAuditRegion(String? email, String? fullName);
  Future<ResponseMessage>changePasswordAuditRegion(String oldPassword, String newPassword);

  //report
  Future<ResponseReportAuditRegion>getReportAuditRegion(String stratDate, String endDate);

  //follow up
  Future<ResponseFollowUp> getFollowUpAuditRegion(int page, String startDate, String endDate);
  Future<ResponseDetailFollowUp> getDetailFollowUpAuditRegion(int? id);

  //clarification
  Future<ResponseMessage>generateClarification(int? caseId, int? caseCategoryId, int? branchId);
  Future<ResponseInputClarification>inputClarificationAuditRegion(int? clarificationId, String evaluationLimitation, String location, String auditee, String auditeeLeader,
  String description, String priority);
  Future<ResponseClarificationAuditRegion>getClarificationAuditRegion(int page, String startDate, String endDate);
  Future<ResponseMessage>uploadClarificationAuditRegion(String filePath, int? id);
  Future<ResponseIdentification>inputIdentificationClarificationAuditRegion(int? clarificationId, int evaluationClarification, num loss, List<int> recommendation, int followUp);
  Future<ResponseDetailClarificationAuditRegion>getDetailClarificationAuditRegion(int id);

  //BAP
  Future<ResponseMessage>uploadBapAuditRegion(String filePath, int? bapId);
  Future<ResponseBapAuditRegion>getBapAuditRegion(int page, String startDate, String endDate);
  Future<ResponseDetailBapAuditRegion>getDetailBapAuditRegion(int? id);

  //dashboard
  Future<ResponseFollowUpDashBoard>getFollowUpDashboard(int? month, int? year);
  Future<ResponseFindingsDashboard> getfindingsDashboard(int? year);
  Future<ResponseNominalDashboard> getNominalsDashboard(int? year);
  Future<ResponseTotalDashboard> getTotalDashboard(int? month, int? year);
  Future<ResponseDivisionDashboard>getDivisionDashboard(int? month, int? year);
  Future<ResponseDashboardSop>getDashboardSop(int? month, int? year);
}