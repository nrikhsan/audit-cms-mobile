import 'package:audit_cms/data/core/response/auditArea/clarification/response_detail_clarification_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/lha/response_detail_lha_revision.dart';
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
import 'package:audit_cms/data/core/response/auditArea/master/response_case_category_by_id_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_users.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/model_body_add_schedules.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_detail_reschedule_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/userPorfile/response_detail_user_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/followUp/request_body_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/kka/response_kka_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/report/response_report_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_detail_schedule_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_main_schedules_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_reschedule_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_special_schedules_audit_area.dart';
import 'package:audit_cms/data/core/response/auditRegion/bap/response_bap_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/clarification/response_clarification_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/lha/model_body_input_lha_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/lha/response_lha_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/master/response_clarification_category_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/bap/response_detail_bap_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/clarification/response_detail_clarification_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/kka/response_detail_kka_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/lha/response_detail_lha_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/schedules/response_detail_schedule_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/userProfile/response_detail_user_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/master/response_division_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/clarification/response_document_clarification_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/kka/response_kka_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/master/response_priority_finding_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/report/response_report_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/schedules/response_main_schedule_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/schedules/response_reschedule_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/master/response_sop_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/schedules/response_special_schedule_audit_region.dart';
import 'package:audit_cms/data/core/response/responseMessage/response_message.dart';
import 'package:audit_cms/data/core/service/api_service.dart';
import '../response/auth/response_auth.dart';



abstract class Repositories {

  Future<ResponseAuth> login(String username, String password);

  //audit area
  //main schedule
  Future<ResponseMessage> addMainSchedules(List<ModelBodySchedulesAuditArea>schedule);
  Future<ResponseMainScheduleAuditArea> getMainSchedulesAuditArea(int page, String name, String branch, String startDate, String endDate);
  Future<ResponseMessage>editMainSchedule(int id, int userId, int branchId, String startDate, String endDate, String description);
  Future<ResponseMessage>deleteMainSchedule(int id);
  Future<ResponseDetailScheduleAuditArea> getDetailMainScheduleAuditArea(int id);

  //special schedule
  Future<ResponseSpecialScheduleAuditArea> getSpecialSchedulesAuditArea(int page, String name, String branch, String startDate, String endDate);
  Future<ResponseMessage> addSpecialSchedules(List<ModelBodySchedulesAuditArea>schedule);
  Future<ResponseMessage>editSpecialSchedule(int id, int userId, int branchId, String startDate, String endDate, String description);
  Future<ResponseMessage>deleteSpecialSchedule(int id);
  Future<ResponseDetailScheduleAuditArea> getDetailSpecialScheduleAuditArea(int id);

  //reschedule
  Future<ResponseMessage>requestReschedule(int userId, int scheduleId, int branchId, String startDate, String endDate, String desc);
  Future<ResponseReschedulesAuditArea> getReschedulesAuditArea(int page, String name, String branch, String startDate, String endDate);
  Future<ResponseDetailRescheduleAuditArea> getDetailRescheduleAuditArea(int id);

  //master
  Future<ResponseUsers> getUsersAuditArea();
  Future<ResponseBranchAuditArea> getBranchAuditArea();
  Future<ResponseCaseAuditArea> getCaseAuditArea();
  Future<ResponseCaseCategoryAuditArea> getCaseCategoryAuditArea();
  Future<ResponseCaseCategoryByIdAuditArea> getCaseCategoryByIdAuditArea(int caseId);
  Future<ResponsePenaltyAuditArea> getPenaltyAuditArea();

  //LHA
  Future<ResponseRevisiLhaAuditArea>getRevisiLhaAuditArea(int lhaId, int page);
  Future<ResponseMessage> revisiLha(int lhaId, int caseId, int caseCategoryId, String desc, String suggest, String tempRec, String perRec, int isResearch);
  Future<ResponseDetailLhaRevision>getDetailRevisionLha(int lhaId);
  Future<ResponseLhaAuditArea> getLhaAuditArea(int page, int scheduleId, String name, String branch, String startDate, String endDate);
  Future<ResponseDetailLhaAuditArea> getDetailLhaAuditArea(int id);

  //clarification
  Future<ResponseClarificationAuditArea> getClarificationAuditArea(int page, String name, String branch, String startDate, String endDate);
  Future<ResponseDetailClarificationAuditArea> getDetailClarificationAuditArea(int id);

  //KKA
  Future<ResponseKkaAuditArea> getKkaAuditArea(int page, int scheduleId, String name, String branch, String startDate, String endDate);
  Future<ResponseDetailKkaAuditArea> getDetailKkaAuditArea(int id);

  //BAP
  Future<ResponseBapAuditArea> getBapAuditArea();
  Future<ResponseBapAuditArea> getFilterBapAuditArea(String startDate, String endDate, String branch, String auditor);
  Future<ResponseDetailBapAuditArea>getDetailBapAuditArea(int id);

  //follow up
  Future<ResponseFollowUp> getFollowUpAuditArea(int page, String name, String branch, String startDate, String endDate);
  Future<ResponseMessage>inputFollowUpAuditArea(int followUpId, int penaltyId, String desc, int isPenalty);
  Future<ResponseDetailFollowUp> getDetailFollowUpAuditArea(int id);

  //report
  Future<ResponseReportAuditArea> getReportAuditArea(String branch, String startDate, String endDate);

  //user profile
  Future<ResponseDetailUserAuditArea> getDetailUserAuditArea();
  Future<ResponseMessage>editUserAuditArea(int id, String email, String username);
  Future<ResponseMessage>changePasswordAuditArea(int id, String oldPassword, String newPassword, String confirmPassword);


  //audit region
  //schedules
  Future<ResponseMainScheduleAuditRegion>getMainSchedulesAuditRegion();
  Future<ResponseMainScheduleAuditRegion>filterMainSchedulesAuditRegion(String startDate, String endDate);
  Future<ResponseSpecialScheduleAuditRegion>getSpecialSchedulesAuditRegion();
  Future<ResponseSpecialScheduleAuditRegion>filterSpecialSchedulesAuditRegion(String startDate, String endDate);
  Future<ResponseRescheduleAuditRegion>getRescheduleAuditRegion();
  Future<ResponseRescheduleAuditRegion>filterReschedulesAuditRegion(String startDate, String endDate);
  Future<ResponseDetailScheduleAuditRegion>getDetailScheduleAuditRegion(int id);

  //user profile
  Future<ResponseDetailUserAuditRegion> getDetailUserAuditRegion();
  Future<ResponseMessage>editUserAuditRegion(int id, String email, String username);
  Future<ResponseMessage>changePasswordAuditRegion(int id, String oldPassword, String newPassword, String confirmPassword);

  //report
  Future<ResponseReportAuditRegion>getReportAuditRegion(String stratDate, String endDate);

  //master
  Future<ResponseDivisionAuditRegion>getDivisionAuditRegion();
  Future<ResponseSopAuditRegion>getSopAuditRegion();
  Future<ResponsePriorityFindingAuditRegion>getPriorityFindingAuditRegion();
  Future<ResponseClarificationCategoryAuditRegion>getClarificationCategoryAuditRegion();

  //LHA
  Future<ResponseMessage>inputLhaAuditRegion(int scheduleId, int branchId, List<LhaDetail>lhaDetail);
  Future<ResponseDetailLhaAuditRegion>getDetailLhaAuditRegion(int id);
  Future<ResponseLhaAuditRegion>getListLhaAuditRegion();

  //clarification
  Future<ResponseMessage>inputClarificationAuditRegion(int category, String limitEvaluation,
      String location, String division, String supervisor, String dear, String findingDescription, int priorityFinding);
  Future<ResponseClarificationAuditRegion>getClarificationAuditRegion();
  Future<ResponseDocumentClarificationAuditRegion>getDocumentClarification(int id);
  Future<ResponseMessage>uploadClarificationAuditRegion(String filePath);
  Future<ResponseMessage>inputIdentificationClarificationAuditRegion(int evaluationClarification, String loss, String description, int followUp);
  Future<ResponseClarificationAuditRegion>filterClarificationAuditRegion(String startDate, String endDate);
  Future<ResponseDetailClarificationAuditRegion>getDetailClarificationAuditRegion(int id);

  //KKA
  Future<ResponseMessage>uploadKkaAuditRegion(String filePath);
  Future<ResponseKkaAuditRegion>getKkaAuditRegion();
  Future<ResponseKkaAuditRegion>filterKkaAuditRegion(String startDate, String endDate);
  Future<ResponseDetailKkaAuditRegion>getDetailKkaAuditRegion(int id);

  //BAP
  Future<ResponseMessage>uploadBapAuditRegion(String filePath);
  Future<ResponseBapAuditRegion>getBapAuditRegion();
  Future<ResponseBapAuditRegion>filterBapAuditRegion(String startDate, String endDate);
  Future<ResponseDetailBapAuditRegion>getDetailBapAuditRegion(int id);
}

class RepositoryImpl implements Repositories {
  final ApiService apiService;
  RepositoryImpl(this.apiService);


  //login
  @override
  Future<ResponseAuth> login(String username, String password){
    return apiService.login(username, password);
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
  Future<ResponseMainScheduleAuditArea> getMainSchedulesAuditArea(int page, String name, String branch, String startDate, String endDate){
    return apiService.getMainSchedulesAuditArea(page, name, branch, startDate, endDate);
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
  Future<ResponseSpecialScheduleAuditArea> getSpecialSchedulesAuditArea(int page, String name, String branch, String startDate, String endDate) {
    return apiService.getSpecialSchedulesAuditArea(page, name, branch, startDate, endDate);
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
  Future<ResponseMessage>requestReschedule(int userId, int scheduleId, int branchId, String startDate, String endDate, String desc){
    return apiService.requestReschedule(userId, scheduleId, branchId, startDate, endDate, desc);
  }

  @override
  Future<ResponseReschedulesAuditArea> getReschedulesAuditArea(int page, String name, String branch, String startDate, String endDate){
    return apiService.getReschedulesAuditArea(page, name, branch, startDate, endDate);
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
  Future<ResponseBranchAuditArea> getBranchAuditArea() {
    return apiService.getBranchAuditArea();
  }

  @override
  Future<ResponseCaseAuditArea> getCaseAuditArea(){
    return apiService.getCaseAuditArea();
  }

  @override
  Future<ResponseCaseCategoryAuditArea> getCaseCategoryAuditArea(){
    return apiService.getCaseCategoryAuditArea();
  }

  @override
  Future<ResponseCaseCategoryByIdAuditArea> getCaseCategoryByIdAuditArea(int caseId){
    return apiService.getCaseCategoryByIdAuditArea(caseId);
  }

  @override
  Future<ResponsePenaltyAuditArea> getPenaltyAuditArea() {
    return apiService.getPenaltyAuditArea();
  }

  //LHA
  @override
  Future<ResponseRevisiLhaAuditArea>getRevisiLhaAuditArea(int lhaId, int page){
    return apiService.getRevisiLhaAuditArea(lhaId, page);
  }

  @override
  Future<ResponseMessage> revisiLha(int lhaId, int caseId, int caseCategoryId, String desc, String suggest, String tempRec, String perRec, int isResearch) {
    return apiService.revisiLhaAuditArea(lhaId, caseId, caseCategoryId, desc, suggest, tempRec, perRec, isResearch);
  }

  @override
  Future<ResponseDetailLhaRevision>getDetailRevisionLha(int lhaId){
    return apiService.getDetailRevisionLha(lhaId);
  }
  
  @override
  Future<ResponseLhaAuditArea> getLhaAuditArea(int page, int scheduleId, String name, String branch, String startDate, String endDate) {
    return apiService.getLhaAuditArea(page, scheduleId, name, branch, startDate, endDate);
  }
  
  @override
  Future<ResponseDetailLhaAuditArea> getDetailLhaAuditArea(int id) {
    return apiService.getDetailLhaAuditArea(id);
  }
 
  //clarification
  @override
  Future<ResponseClarificationAuditArea> getClarificationAuditArea(int page, String name, String branch, String startDate, String endDate){
    return apiService.getClarificationAuditArea(page, name, branch, startDate, endDate);
  }
  
  @override
  Future<ResponseDetailClarificationAuditArea> getDetailClarificationAuditArea(int id) async {
    return await apiService.getDetailClarificationAuditArea(id);
  }

  //KKA
  @override
  Future<ResponseKkaAuditArea> getKkaAuditArea(int page, int scheduleId, String name, String branch, String startDate, String endDate) {
    return apiService.getKkaAuditArea(page, scheduleId, name, branch, startDate, endDate);
  }
  
  @override
  Future<ResponseDetailKkaAuditArea> getDetailKkaAuditArea(int id) {
    return apiService.getDetailKkaAuditArea(id);
  }


  //BAP
  @override
  Future<ResponseBapAuditArea> getBapAuditArea()async {
    return await apiService.getBapAuditArea();
  }
  
  @override
  Future<ResponseBapAuditArea> getFilterBapAuditArea(String startDate, String endDate, String branch, String auditor)async {
    return await apiService.filterBapAuditArea(startDate, endDate, branch, auditor);
  }
  
  @override
  Future<ResponseDetailBapAuditArea> getDetailBapAuditArea(int id)async {
    return await apiService.getDetailBapAuditArea(id);
  }


  // follow up
  @override
  Future<ResponseFollowUp> getFollowUpAuditArea(int page, String name, String branch, String startDate, String endDate){
    return apiService.getFollowUpAuditArea(page, name, branch, startDate, endDate);
  }
  
  @override
  Future<ResponseMessage>inputFollowUpAuditArea(int followUpId, int penaltyId, String desc, int isPenalty){
    return apiService.inputFollowUpAuditArea(followUpId, penaltyId, desc, isPenalty);
  }
  
  @override
  Future<ResponseDetailFollowUp> getDetailFollowUpAuditArea(int id) {
    return apiService.getDetailFollowUpAuditArea(id);
  }


  //report
  @override
  Future<ResponseReportAuditArea> getReportAuditArea(String branch, String startDate, String endDate)async {
    return await apiService.getReportAuditArea(branch, startDate, endDate);
  }


  //user profile
  @override
  Future<ResponseDetailUserAuditArea> getDetailUserAuditArea()async {
    return await apiService.getDetailUserAuditArea();
  }
  
  @override
  Future<ResponseMessage> editUserAuditArea(int id, String email, String username) async{
    return await apiService.editProfileUserAuditArea(id, email, username);
  }
  
  @override
  Future<ResponseMessage> changePasswordAuditArea(int id, String oldPassword, String newPassword, String confirmPassword)async {
    return await apiService.changePasswordAuditArea(id, oldPassword, newPassword, confirmPassword);
  }
  

  //audit region
  //schedules
  @override
  Future<ResponseMainScheduleAuditRegion> getMainSchedulesAuditRegion()async {
    return await apiService.getMainSchedulesAuditRegion();
  }

  @override
  Future<ResponseMainScheduleAuditRegion> filterMainSchedulesAuditRegion(String startDate, String endDate)async {
    return await apiService.filterMainSchedulesAuditRegion(startDate, endDate);
  }
  
  @override
  Future<ResponseSpecialScheduleAuditRegion> getSpecialSchedulesAuditRegion()async {
    return await apiService.getSpecialSchedulesAuditRegion();
  }

  @override
  Future<ResponseSpecialScheduleAuditRegion> filterSpecialSchedulesAuditRegion(String startDate, String endDate)async {
    return await apiService.filterSpecialSchedulesAuditRegion(startDate, endDate);
  }
  
  @override
  Future<ResponseRescheduleAuditRegion> getRescheduleAuditRegion()async {
    return await apiService.getReschedulesAuditRegion();
  }
  
  @override
  Future<ResponseRescheduleAuditRegion> filterReschedulesAuditRegion(String startDate, String endDate)async {
    return await apiService.filterRescheduleAuditRegion(startDate, endDate);
  }

  @override
  Future<ResponseDetailScheduleAuditRegion> getDetailScheduleAuditRegion(int id)async {
    return await apiService.getDetailScheduleAuditRegion(id);
  }


  //user profile
  @override
  Future<ResponseDetailUserAuditRegion> getDetailUserAuditRegion() async{
    return await apiService.getDetailUserAuditRegion();
  }  

  @override
  Future<ResponseMessage> editUserAuditRegion(int id, String email, String username)async {
   return await apiService.editProfileUserAuditRegion(id, email, username);
  }
  
  @override
  Future<ResponseMessage> changePasswordAuditRegion(int id, String oldPassword, String newPassword, String confirmPassword)async {
   return await apiService.changePasswordAuditRegion(id, oldPassword, newPassword, confirmPassword);
  }


  //report
  @override
  Future<ResponseReportAuditRegion> getReportAuditRegion(String startDate, String endDate)async {
    return await apiService.getReportAuditRegion(startDate, endDate);
  }


  //master
  @override
  Future<ResponseDivisionAuditRegion> getDivisionAuditRegion()async {
    return await apiService.getDivisionAuditRegion();
  }
  
  @override
  Future<ResponseSopAuditRegion> getSopAuditRegion() async {
    return await apiService.getSopAuditRegion();
  }

  @override
  Future<ResponseClarificationCategoryAuditRegion> getClarificationCategoryAuditRegion()async {
    return await apiService.getClarificationCategoryAuditRegion();
  }

  @override
  Future<ResponsePriorityFindingAuditRegion> getPriorityFindingAuditRegion()async {
    return await apiService.getPriorityFindingAuditRegion();
  }


  //LHA
  @override
  Future<ResponseMessage> inputLhaAuditRegion(int scheduleId, int branchId, List<LhaDetail>lhaDetail) async{
    return await apiService.inputLhaAuditRegion(scheduleId, branchId, lhaDetail);
  }

  @override
  Future<ResponseDetailLhaAuditRegion> getDetailLhaAuditRegion(int id)async {
    return await apiService.getDetailLhaAuditRegion(id);
  }

  @override
  Future<ResponseLhaAuditRegion> getListLhaAuditRegion()async {
    return await apiService.getListLhaAuditRegion();
  }

  //clarification
  @override
  Future<ResponseClarificationAuditRegion> getClarificationAuditRegion()async {
    return await apiService.getClarificationAuditRegion();
  }
  
  @override
  Future<ResponseClarificationAuditRegion> filterClarificationAuditRegion(String startDate, String endDate) async{
    return await apiService.filterClarificationAuditRegion(startDate, endDate);
  }

  @override
  Future<ResponseMessage> inputClarificationAuditRegion(int category, String limitEvaluation,
      String location, String division, String supervisor, String dear, String findingDescription, int priorityFinding)async {
    return await apiService.inputClarificationAuditRegion(category, limitEvaluation, location, division, supervisor, dear, findingDescription, priorityFinding);
  }

  @override
  Future<ResponseDocumentClarificationAuditRegion> getDocumentClarification(int id)async {
    return await apiService.getDocumentClarification(id);
  }

  @override
  Future<ResponseMessage> inputIdentificationClarificationAuditRegion(int evaluationClarification, String loss, String description, int followUp)async {
    return await apiService.inputIdentificationClarificationAuditRegion(evaluationClarification, loss, description, followUp);
  }

  @override
  Future<ResponseMessage> uploadClarificationAuditRegion(String filePath)async {
    return await apiService.uploadClarificationAuditRegion(filePath);
  }

  @override
  Future<ResponseDetailClarificationAuditRegion> getDetailClarificationAuditRegion(int id) {
    return apiService.detailClarificationAuditRegion(id);
  }


  //KKA
  @override
  Future<ResponseMessage> uploadKkaAuditRegion(String filePath) async{
    return await apiService.uploadKkaAuditRegion(filePath);
  }

  @override
  Future<ResponseKkaAuditRegion> getKkaAuditRegion() {
    return apiService.getKkaAuditRegion();
  }

  @override
  Future<ResponseKkaAuditRegion> filterKkaAuditRegion(String startDate,String  endDate) {
    return apiService.filterKkaAuditRegion(startDate, endDate);
  }

  @override
  Future<ResponseDetailKkaAuditRegion> getDetailKkaAuditRegion(int id) {
    return apiService.getDetailKkaAuditRegion(id);
  }


  //BAP
  @override
  Future<ResponseMessage> uploadBapAuditRegion(String filePath) {
    return apiService.uploadBapAuditRegion(filePath);
  }

  @override
  Future<ResponseBapAuditRegion> getBapAuditRegion() {
    return apiService.getBapAuditRegion();
  }

  @override
  Future<ResponseBapAuditRegion> filterBapAuditRegion(String startDate, String endDate) {
    return apiService.filterBapAuditRegion(startDate, endDate);
  }
  
  @override
  Future<ResponseDetailBapAuditRegion> getDetailBapAuditRegion(int id) {
    return apiService.getDetailBapAuditRegion(id);
  }
}