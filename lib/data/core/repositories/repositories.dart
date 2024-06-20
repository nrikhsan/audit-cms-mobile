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
import 'package:audit_cms/data/core/response/dashboard/response_division_dashboard.dart';
import 'package:audit_cms/data/core/response/dashboard/response_finding_dashboard.dart';
import 'package:audit_cms/data/core/response/dashboard/response_follow_up_dashboard.dart';
import 'package:audit_cms/data/core/response/dashboard/response_nominal_dashboard.dart';
import 'package:audit_cms/data/core/response/dashboard/response_total_dashboard.dart';
import 'package:audit_cms/data/core/response/responseMessage/response_message.dart';
import 'package:audit_cms/data/core/service/api_service.dart';
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
}

class RepositoryImpl implements Repositories {
  final ApiService apiService;
  RepositoryImpl(this.apiService);


  //Auth
  @override
  Future<ResponseAuth> login(String username, String password){
    return apiService.login(username, password);
  }

  @override
  Future<ResponseMessage> logOut() {
    return apiService.logOut();
  }

  //audit area
  //main schedules
  @override
  Future<ResponseMessage> addMainSchedules(List<ModelBodySchedulesAuditArea>schedule){
    return apiService.addMainSchedules(schedule);
  }

  @override
  Future<ResponseMessage> editMainSchedule(int id, int userId, int branchId, String startDate, String endDate, String description){
    return apiService.editMainSchedule(id, userId, branchId, startDate, endDate, description);
  }

  @override
  Future<ResponseMainScheduleAuditArea> getMainSchedulesAuditArea(int page, String name, int? branchId, String startDate, String endDate){
    return apiService.getMainSchedulesAuditArea(page, name, branchId, startDate, endDate);
  }

  @override
  Future<ResponseMessage>deleteMainSchedule(int id){
    return apiService.deleteMainSchedule(id);
  }

   @override
  Future<ResponseDetailScheduleAuditArea> getDetailMainScheduleAuditArea(int id) {
    return apiService.getDetailMainScheduleAuditArea(id);
  }
  
  //special schedule
   @override
  Future<ResponseMessage> addSpecialSchedules(List<ModelBodySchedulesAuditArea>schedule){
    return apiService.addSpecialSchedule(schedule);
  }

  @override
  Future<ResponseSpecialScheduleAuditArea> getSpecialSchedulesAuditArea(int page, String name, int? branchId, String startDate, String endDate) {
    return apiService.getSpecialSchedulesAuditArea(page, name, branchId, startDate, endDate);
  }

  @override
  Future<ResponseMessage> editSpecialSchedule(int id, int userId, int branchId, String startDate, String endDate, String description){
    return apiService.editSpecialSchedule(id, userId, branchId, startDate, endDate, description);
  }

  @override
  Future<ResponseMessage>deleteSpecialSchedule(int id){
    return apiService.deleteSpecialSchedule(id);
  }

   @override
  Future<ResponseDetailScheduleAuditArea> getDetailSpecialScheduleAuditArea(int id) {
    return apiService.getDetailSpecialScheduleAuditArea(id);
  }

  //reschedule
  @override
  Future<ResponseMessage>requestReschedule(int? userId, int scheduleId, int? branchId, String startDate, String endDate, String desc){
    return apiService.requestReschedule(userId, scheduleId, branchId, startDate, endDate, desc);
  }

  @override
  Future<ResponseRescheduleAuditArea> getReschedulesAuditArea(int page, String name, int? branchId, String startDate, String endDate){
    return apiService.getReschedulesAuditArea(page, name, branchId, startDate, endDate);
  }

  @override
  Future<ResponseDetailRescheduleAuditArea> getDetailRescheduleAuditArea(int page){
    return apiService.getDetailRescheduleAuditArea(page);
  }

  //master
  @override
  Future<ResponseUsers> getUsersAuditArea() {
    return apiService.getUsersAuditArea();
  }

  @override
  Future<ResponseBranchAuditArea> getBranchByUserIdAuditArea(int? userId) {
    return apiService.getBranchByUserIdAuditArea(userId);
  }

  @override
  Future<ResponseBranchAuditArea> getBranchForFilterDataAuditArea() {
    return apiService.getBranchForFilterDataAuditArea();
  }

  @override
  Future<ResponseCaseAuditArea> getCaseAuditArea(){
    return apiService.getCaseAuditArea();
  }

  @override
  Future<ResponseCaseCategoryAuditArea> getCaseCategoryAuditArea(int? caseId){
    return apiService.getCaseCategoryAuditArea(caseId);
  }

  @override
  Future<ResponsePenaltyAuditArea> getPenaltyAuditArea() {
    return apiService.getPenaltyAuditArea();
  }

  @override
  Future<ResponseMessage> inputLhaAuditArea(int scheduleId, List<LhaDetailArea>lhaDetail){
    return apiService.inputLhaAuditArea(scheduleId, lhaDetail);
  }

  @override
  Future<ResponseRevisionLhaAuditArea>getRevisiLhaAuditArea(int? lhaDetailId){
    return apiService.getRevisiLhaAuditArea(lhaDetailId);
  }

  @override
  Future<ResponseDetailRevision> getDetailRevisionLhaAuditArea(int caseId) {
    return apiService.getDetailRevisionLhaAuditArea(caseId);
  }

  @override
  Future<ResponseMessage> revisiLha(int? lhaId, String desc, String suggest, String tempRec, String perRec) {
    return apiService.revisiLhaAuditArea(lhaId, desc, suggest, tempRec, perRec);
  }

  @override
  Future<ResponseMessage> sendCaseLha(int? lhaDEtailId) {
    return apiService.sendCaseLha(lhaDEtailId);
  }

  @override
  Future<ResponseDetailLhaCasesLhaAuditArea>getDetailCaseLhaAuditArea(int? caseId){
    return apiService.getDetailCaseLhaAuditArea(caseId);
  }
  
  @override
  Future<ResponseLhaAuditArea> getLhaAuditArea(int page, String name, int? branchId, String startDate, String endDate) {
    return apiService.getLhaAuditArea(page, name, branchId, startDate, endDate);
  }
  
  @override
  Future<ResponseDetailLhaAuditArea> getDetailLhaAuditArea(int? id) {
    return apiService.getDetailLhaAuditArea(id);
  }
 
  //clarification
  @override
  Future<ResponseClarificationAuditArea> getClarificationAuditArea(int page, String name, int? branchId, String startDate, String endDate){
    return apiService.getClarificationAuditArea(page, name, branchId, startDate, endDate);
  }
  
  @override
  Future<ResponseDetailClarificationAuditArea> getDetailClarificationAuditArea(int id) {
    return apiService.getDetailClarificationAuditArea(id);
  }


  //KKA
  @override
  Future<ResponseMessage> uploadKkaAuditArea(String filePath, int id){
    return apiService.uploadKkaAuditArea(filePath, id);
  }


  @override
  Future<ResponseKkaAuditArea> getKkaAuditArea(int page, int? scheduleId, String name, int? branchId, String startDate, String endDate) {
    return apiService.getKkaAuditArea(page, scheduleId, name, branchId, startDate, endDate);
  }
  
  @override
  Future<ResponseDetailKkaAuditArea> getDetailKkaAuditArea(int id) {
    return apiService.getDetailKkaAuditArea(id);
  }


  //BAP
  @override
  Future<ResponseBapAuditArea>getBapAuditArea(int page, String name, int? branchId, String startDate, String endDate) {
    return apiService.getBapAuditArea(page, name, branchId, startDate, endDate);
  }
  
  @override
  Future<ResponseDetailBapAuditArea> getDetailBapAuditArea(int? id) {
    return apiService.getDetailBapAuditArea(id);
  }


  // follow up
  @override
  Future<ResponseFollowUp> getFollowUpAuditArea(int page, String name, int? branchId, String startDate, String endDate){
    return apiService.getFollowUpAuditArea(page, name, branchId, startDate, endDate);
  }
  
  @override
  Future<ResponseInputFollowUp>inputFollowUpAuditArea(int followUpId, List<int>? penaltyId, num charCoss, String desc){
    return apiService.inputFollowUpAuditArea(followUpId, penaltyId, charCoss, desc);
  }

  @override
  Future<ResponseMessage> uploadFollowUpAuditArea(String filePath, int?followupId) {
    return apiService.uploadFollowUp(filePath, followupId);
  }
  
  @override
  Future<ResponseDetailFollowUp> getDetailFollowUpAuditArea(int? id) {
    return apiService.getDetailFollowUpAuditArea(id);
  }

  //user profile
  @override
  Future<ResponseProfileAuditArea> getDetailUserAuditArea() {
    return apiService.getDetailUserAuditArea();
  }
  
  @override
  Future<ResponseMessage> editUserAuditArea(String email, String fullName){
    return apiService.editProfileUserAuditArea(email, fullName);
  }
  
  @override
  Future<ResponseMessage> changePasswordAuditArea(String currentPassword, String newPassword) {
    return apiService.changePasswordAuditArea(currentPassword, newPassword);
  }
  

  //audit region
  //main schedules
  @override
  Future<ResponseMainScheduleAuditRegion> getMainSchedulesAuditRegion(int page, String startDate, String endDate) {
    return apiService.getMainSchedulesAuditRegion(page, startDate, endDate);
  }

  @override
  Future<ResponseDetailScheduleAuditRegion> getDetailMainScheduleAuditRegion(int id){
    return apiService.getDetailMainScheduleAuditRegion(id);
  }
  
  //special schedule
  @override
  Future<ResponseSpecialScheduleAuditRegion>getSpecialSchedulesAuditRegion(int page, String startDate, String endDate) {
    return apiService.getSpecialSchedulesAuditRegion(page, startDate, endDate);
  }

  @override
  Future<ResponseDetailScheduleAuditRegion>getDetailSpecialScheduleAuditRegion(int id){
    return apiService.getDetailSpecialScheduleAuditRegion(id);
  }

  //reschedule
  @override
  Future<ResponseReschedulesAuditRegion> getRescheduleAuditRegion(int page, String startDate, String endDate){
    return apiService.getReschedulesAuditRegion(page, startDate, endDate);
  }
  
  @override
  Future<ResponseDetailRescheduleAuditRegion> getDetailRescheduleAuditRegion(int id) {
    return apiService.getDetailRescheduleAuditRegion(id);
  }

  //user profile
  @override
  Future<ResponseProfileAuditRegion> getDetailUserAuditRegion() async{
    return await apiService.getDetailUserAuditRegion();
  }  

  @override
  Future<ResponseMessage> editUserAuditRegion(String? email, String? fullName) {
   return apiService.editProfileUserAuditRegion(email, fullName);
  }
  
  @override
  Future<ResponseMessage> changePasswordAuditRegion(String oldPassword, String newPassword)async {
   return await apiService.changePasswordAuditRegion(oldPassword, newPassword);
  }


  //report
  @override
  Future<ResponseReportAuditRegion> getReportAuditRegion(String startDate, String endDate)async {
    return await apiService.getReportAuditRegion(startDate, endDate);
  }

  //master
  @override
  Future<ResponseRecommendationAuditRegion> getRecommendation() {
    return apiService.getRecommendation();
  }

  @override
  Future<ResponseBranchAuditRegion>getBranchAuditRegion(){
    return apiService.getBranchAuditRegion();
  }

  @override
  Future<ResponseCaseAuditRegion> getCasesAuditRegion() {
    return apiService.getCasesAuditRegion();
  }
  
   @override
  Future<ResponseCaseCategoryAuditRegion> getCaseCategoryAuditRegion(int? caseId) {
    return apiService.getCaseCategoryAuditRegion(caseId);
  }

  @override
  Future<ResponsePriorityFindingAuditRegion> getPriorityFindingAuditRegion() {
    return apiService.getPriorityFindingAuditRegion();
  }


  //LHA
  @override
  Future<ResponseMessage> inputLhaAuditRegion(int scheduleId, List<LhaDetail>lhaDetail){
    return apiService.inputLhaAuditRegion(scheduleId, lhaDetail);
  }

  @override
  Future<ResponseMessage>inputCaseLhaAuditRegion(int lhaDetailId, int? caseId, int? caseCategory, String desc,
    String suggestion, String tempRec, String perRec, int isResearch){
      return apiService.inputCaseLhaAuditRegion(lhaDetailId, caseId, caseCategory, desc, suggestion, tempRec, perRec, isResearch);
  }

  @override
  Future<ResponseDetailLhaCasesLhaAuditRegion>getDetailCasesLha(int lhaId){
    return apiService.getDetailCasesLha(lhaId);
  }

  @override
  Future<ResponseDetailLhaAuditRegion> getDetailLhaAuditRegion(int? id) {
    return apiService.getDetailLhaAuditRegion(id);
  }

  @override
  Future<ResponseLhaAuditRegion> getListLhaAuditRegion(int page , String startDate, String endDate) {
    return apiService.getListLhaAuditRegion(page, startDate, endDate);
  }

  //KKA
  @override
  Future<ResponseMessage> uploadKkaAuditRegion(String filePath, int id){
    return apiService.uploadKkaAuditRegion(filePath, id);
  }

  @override
  Future<ResponseKkaAuditRegion> getKkaAuditRegion(int page, int? scheduleId, String startDate, String endDate) {
    return apiService.getKkaAuditRegion(page, scheduleId, startDate, endDate);
  }

  @override
  Future<ResponseDetailKkaAuditRegion> getDetailKkaAuditRegion(int id) {
    return apiService.getDetailKkaAuditRegion(id);
  }

  //follow up
  @override
  Future<ResponseFollowUp> getFollowUpAuditRegion(int page, String startDate, String endDate){
    return apiService.getFollowUpAuditRegion(page, startDate, endDate);
  }

  @override
  Future<ResponseDetailFollowUp> getDetailFollowUpAuditRegion(int? id) {
    return apiService.getDetailFollowUpAuditArea(id);
  }

  //clarification
  @override
  Future<ResponseClarificationAuditRegion> getClarificationAuditRegion(int page, String startDate, String endDate) {
    return apiService.getClarificationAuditRegion(page, startDate, endDate);
  }

  @override
  Future<ResponseMessage> generateClarification(int? caseId, int? caseCategoryId, int? branchId) {
    return apiService.generateClarification(caseId, caseCategoryId, branchId);
  }

  @override
  Future<ResponseInputClarification>inputClarificationAuditRegion(int? clarificationId, String evaluationLimitation, String location, String auditee, String auditeeLeader,
  String description, String priority) {
    return apiService.inputClarificationAuditRegion(clarificationId, evaluationLimitation, location, auditee, auditeeLeader, description, priority);
  }

  @override
  Future<ResponseIdentification> inputIdentificationClarificationAuditRegion(int? clarificationId, int evaluationClarification, num loss, List<int> recommendation, int followUp) {
    return apiService.inputIdentificationClarificationAuditRegion(clarificationId, evaluationClarification, loss, recommendation, followUp);
  }

  @override
  Future<ResponseMessage> uploadClarificationAuditRegion(String filePath, int? id) {
    return apiService.uploadClarificationAuditRegion(filePath, id);
  }

  @override
  Future<ResponseDetailClarificationAuditRegion> getDetailClarificationAuditRegion(int id) {
    return apiService.detailClarificationAuditRegion(id);
  }


  //BAP
  @override
  Future<ResponseMessage> uploadBapAuditRegion(String filePath, int? bapId) {
    return apiService.uploadBapAuditRegion(filePath, bapId);
  }

  @override
  Future<ResponseBapAuditRegion>getBapAuditRegion(int page, String startDate, String endDate) {
    return apiService.getBapAuditRegion(page, startDate, endDate);
  }
  
  @override
  Future<ResponseDetailBapAuditRegion> getDetailBapAuditRegion(int? id) {
    return apiService.getDetailBapAuditRegion(id);
  }
  
  @override
  Future<ResponseMessage> deletCaseLha(int? lhaDetailId) {
    return apiService.deleteCaseLha(lhaDetailId);
  }
  
  @override
  Future<ResponseFollowUpDashBoard>getFollowUpDashboard(int? month, int? year) {
    return apiService.getFollowUpDashboard(month, year);
  }
  
  @override
  Future<ResponseFindingsDashboard> getfindingsDashboard(int? year) {
    return apiService.getFindingsDashboard(year);
  }
  
  @override
  Future<ResponseNominalDashboard> getNominalsDashboard(int? year) {
    return apiService.getNominalDashboard(year);
  }
  
  @override
  Future<ResponseTotalDashboard> getTotalDashboard(int? month, int? year) {
    return apiService.getTotalDashboard(month, year);
  }
  
  @override
  Future<ResponseDivisionDashboard> getDivisionDashboard(int? month, int? year) {
    return apiService.getDivisionDashboard(month, year);
  }
}