import 'package:audit_cms/data/core/response/auditArea/reponse_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_add_schedules_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_attachment_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_bap_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_change_password_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_clarification_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_detail_bap_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_detail_clarification_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_detail_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_detail_kka_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_detail_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_detail_schedule_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_detail_user_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_dropdown_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_edit_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_edit_user_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_input_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_kka_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_report_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_schedules_audit_area.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_bap_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_change_password_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_clarification_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_clarification_category_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_detail_bap_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_detail_clarification_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_detail_kka_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_detail_lha_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_detail_schedule_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_detail_user_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_division_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_edit_user_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_input_clarification_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_input_indentifcation_clarification_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_input_lha_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_kka_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_lha_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_priority_finding_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_report_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_schedule_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_sop_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_upload_bap_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_upload_clarification_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_upload_kka_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_upload_report_audit_region.dart';
import 'package:audit_cms/data/core/service/api_service.dart';
import '../response/auth/response_auth.dart';



abstract class Repositories {

  Future<ResponseAuth> login(String email, String password);

  //audit area
  Future<ResponseAddSchedulesAuditArea> addSchedulesAuditArea(int auditorId, int areaId, int branchId, int statusId, String startDate, String endDat, String desc);
  Future<ResponseSchedulesAuditArea> getMainSchedulesAuditArea();
  Future<ResponseSchedulesAuditArea> filterMainSchedulesAuditArea(String startDate, String endDate, String branch, String auditor);
  Future<ResponseSchedulesAuditArea> getSpecialSchedulesAuditArea();
  Future<ResponseSchedulesAuditArea> filterSpecialSchedulesAuditArea(String startDate, String endDate, String branch, String auditor);
  Future<ResponseSchedulesAuditArea> getReschedulesAuditArea();
  Future<ResponseAuditorAuditArea> getAuditorAuditArea();
  Future<ResponseAreaAuditArea> getAreaAuditArea();
  Future<ResponseBranchAuditArea> getBranchAuditArea();
  Future<ResponseStatusScheduleAuditArea> getStatusAuditArea();
  Future<ResponseSchedulesAuditArea> filterResScheduleAuditArea(String startDate, String endDate, String branch, String auditor);
  Future<ResponseDetailScheduleAuditArea> getDetailScheduleAuditArea(int id);
  Future<ResponseLhaAuditArea> getLhaAuditArea();
  Future<ResponseDetailLhaAuditArea> getDetailLhaAuditArea(int id);
  Future<ResponseEditLhaAuditArea> editLhaAuditArea(int id, String lhaDescription);
  Future<ResponseLhaAuditArea> filterLhaAuditArea(String startDate, String endDate, String branch, String auditor);
  Future<ResponseClarificationAuditArea> getClarificationAuditArea();
  Future<ResponseDetailClarificationAuditArea> getDetailClarificationAuditArea(int id);
  Future<ResponseClarificationAuditArea> filterClarificationAuditArea(String startDate, String endDate, String branch, String auditor);
  Future<ResponseKkaAuditArea> getKkaAuditArea();
  Future<ResponseKkaAuditArea> getFilterKkaAuditArea(String startDate, String endDate, String branch, String auditor);
  Future<ResponseDetailKkaAuditArea> getDetailKkaAuditArea(int id);
  Future<ResponseBapAuditArea> getBapAuditArea();
  Future<ResponseBapAuditArea> getFilterBapAuditArea(String startDate, String endDate, String branch, String auditor);
  Future<ResponseDetailBapAuditArea>getDetailBapAuditArea(int id);
  Future<ResponseFollowUpAuditArea> getFollowUpAuditArea();
  Future<ResponseFollowUpAuditArea> filterDataFollowUpAuditArea(String startDate, String endDate, String auditor, String branch);
  Future<ResponseInputFollowUpAuditArea> inputFollowUpAuditArea(int penalty, String realization, String explanationPenalty, int attachment);
  Future<ResponseAttachmentAuditArea> getAttachmentAuditArea();
  Future<ResponseDocumentFollowUpAuditArea> getDocumentFollowUpAuditArea();
  Future<ResponseDetailFollowUpAuditArea> getDetailFollowUpAuditArea(int id);
  Future<ResponseReportAuditArea> getLisReportAuditArea();
  Future<ResponseReportAuditArea> filterReportAuditArea(String startDate, String endDate, String auditor, String branch);
  Future<ResponseDetailUserAuditArea> getDetailUserAuditArea();
  Future<ResponseEditUserAuditArea>editUserAuditArea(int id, String email, String username);
  Future<ResponseChangePasswordAuditArea>changePasswordAuditArea(int id, String oldPassword, String newPassword);

  //audit region
  Future<ResponseScheduleAuditRegion>getMainSchedulesAuditRegion();
  Future<ResponseScheduleAuditRegion>filterMainSchedulesAuditRegion(String startDate, String endDate);
  Future<ResponseScheduleAuditRegion>getSpecialSchedulesAuditRegion();
  Future<ResponseScheduleAuditRegion>filterSpecialSchedulesAuditRegion(String startDate, String endDate);
  Future<ResponseScheduleAuditRegion>getRescheduleAuditRegion();
  Future<ResponseScheduleAuditRegion>filterReschedulesAuditRegion(String startDate, String endDate);
  Future<ResponseDetailUserAuditRegion> getDetailUserAuditRegion();
  Future<ResponseEditUserAuditRegion>editUserAuditRegion(int id, String email, String username);
  Future<ResponseChangePasswordAuditRegion>changePasswordAuditRegion(int id, String oldPassword, String newPassword);
  Future<ResponseUploadReportAuditRegion>uploadReportAuditRegion(String filePath);
  Future<ResponseReportAuditRegion>getListReportAuditRegion();
  Future<ResponseReportAuditRegion>filterReportAuditRegion(String startDate, String endDate);
  Future<ResponseDetailScheduleAuditRegion>getDetailScheduleAuditRegion(int id);
  Future<ResponseLhaAuditRegion>getLhaAuditRegion();
  Future<ResponseDivisionAuditRegion>getDivisionAuditRegion();
  Future<ResponseSopAuditRegion>getSopAuditRegion();
  Future<ResponseInputLhaAuditRegion>inputLhaAuditRegion(int divisionId, String findingDesc, int sopId, String temporaryRec, String permanentRec, int researchValue, String suggest);
  Future<ResponseClarificationAuditRegion>getClarificationAuditRegion();
  Future<ResponseClarificationAuditRegion>filterClarificationAuditRegion(String startDate, String endDate);
  Future<ResponseUploadKkaAuditRegion>uploadKkaAuditRegion(String filePath);
  Future<ResponseDetailLhaAuditRegion>getDetailLhaAuditRegion(int id);
  Future<ResponseClarificationCategoryAuditRegion>getClarificaCategoryAuditRegion();
  Future<ResponsePriorityFindingAuditRegion>getPriorityFindingAuditRegion();
  Future<ResponseInputClarificationAuditRegion>inputClarificationAuditRegion(int category, String limitEvaluation, 
  String location, String division, String supervisor, String dear, String findingDescription, int priorityFinding);
  Future<ModelDocClarificationAuditRegion>getDocumentClarification(int id);
  Future<ResponseUploadClarification>uploadClarificationAuditRegion(String filePath);
  Future<ResponseInputIdentificationClarificationAuditRegion>inputIdentificatinClarificationAuditRegion(int evaluationClarification, String loss, String description, int followUp);
  Future<ResponseUploadBapAuditRegion>uploadBapAuditRegion(String filePath);
  Future<ResponseDetailClarificationAuditRegion>getDetailClarificationAuditRegion(int id);
  Future<ResponseKkaAuditRegion>getKkaAuditRegion();
  Future<ResponseKkaAuditRegion>filterKkaAuditRegion(String startDate, String endDate);
  Future<ResponseDetailKkaAuditRegion>getDetailKkaAuditRegion(int id);
  Future<ResponseBapAuditRegion>getBapAuditRegion();
  Future<ResponseBapAuditRegion>filterBapAuditRegion(String startDate, String endDate);
  Future<ResponseDetailBapAuditRegion>getDetailBapAuditRegion(int id);
}

class RepositoryImpl implements Repositories {
  final ApiService apiService;
  RepositoryImpl(this.apiService);

  //audit area
  @override
  Future<ResponseAuth> login(String email, String password) async{
    return await apiService.login(email, password);
  }

  @override
  Future<ResponseSchedulesAuditArea> getMainSchedulesAuditArea() async{
    return await apiService.getMainSchedulesAuditArea();
  }

  @override
  Future<ResponseSchedulesAuditArea> filterMainSchedulesAuditArea(String startDate, String endDate, String branch, String auditor)async {
    return await apiService.filterMainScheduleAuditArea(startDate, endDate, branch, auditor);
  }

  @override
  Future<ResponseSchedulesAuditArea> filterSpecialSchedulesAuditArea(String startDate, String endDate, String branch, String auditor)async {
    return await apiService.filterSpecialSchedulesAuditArea(startDate, endDate, branch, auditor);
  }

  @override
  Future<ResponseSchedulesAuditArea>filterResScheduleAuditArea(String startDate, String endDate, String branch, String auditor)async {
    return await apiService.filterReschedulesAuditArea(startDate, endDate, branch, auditor);
  }

  @override
  Future<ResponseAuditorAuditArea> getAuditorAuditArea()async {
    return await apiService.getAuditorAuditArea();
  }

  @override
  Future<ResponseAreaAuditArea> getAreaAuditArea() async{
   return await apiService.getAreaAuditArea();
  }

  @override
  Future<ResponseBranchAuditArea> getBranchAuditArea()async {
    return await apiService.getBranchAuditArea();
  }

  @override
  Future<ResponseStatusScheduleAuditArea> getStatusAuditArea()async {
    return await apiService.getStatusAuditArea();
  }

  @override
  Future<ResponseAddSchedulesAuditArea> addSchedulesAuditArea(int auditorId, int areaId, int branchId, int statusId, String startDate, String endDat, String desc) async{
    return await apiService.addScheduleAuditArea(auditorId, areaId, branchId, statusId, startDate, endDat, desc);
  }

  @override
  Future<ResponseSchedulesAuditArea> getSpecialSchedulesAuditArea() async {
    return await apiService.getSpecialSchedulesAuditArea();
  }

  @override
  Future<ResponseSchedulesAuditArea> getReschedulesAuditArea() async{
    return await apiService.getReschedulesAuditArea();
  }
  
  @override
  Future<ResponseDetailScheduleAuditArea> getDetailScheduleAuditArea(int id)async {
    return await apiService.getDetailScheduleAuditArea(id);
  }
  
  @override
  Future<ResponseLhaAuditArea> getLhaAuditArea()async {
    return await apiService.getLhaAuditArea();
  }
  
  @override
  Future<ResponseDetailLhaAuditArea> getDetailLhaAuditArea(int id)async {
    return await apiService.getDetailLhaAuditArea(id);
  }
  
  @override
  Future<ResponseEditLhaAuditArea> editLhaAuditArea(int id, String lhaDescription)async {
    return await apiService.editLhaAuditArea(id, lhaDescription);
  }
  
  @override
  Future<ResponseLhaAuditArea> filterLhaAuditArea(String startDate, String endDate, String branch, String auditor) async{
    return await apiService.filterLhaAuditArea(startDate, endDate, branch, auditor);
  }
  
  @override
  Future<ResponseClarificationAuditArea> getClarificationAuditArea() async{
    return await apiService.getClarificationAuditArea();
  }
  
  @override
  Future<ResponseDetailClarificationAuditArea> getDetailClarificationAuditArea(int id) async {
    return await apiService.getDetailClarificationAuditArea(id);
  }
  
  @override
  Future<ResponseClarificationAuditArea> filterClarificationAuditArea(String startDate, String endDate, String branch, String auditor)async {
    return await apiService.filterClarificationAuditArea(startDate, endDate, branch, auditor);
  }
  
  @override
  Future<ResponseKkaAuditArea> getKkaAuditArea()async {
    return await apiService.getKkaAuditArea();
  }
  
  @override
  Future<ResponseKkaAuditArea> getFilterKkaAuditArea(String startDate, String endDate, String branch, String auditor) async{
    return await apiService.getFilterKkaAuditArea(startDate, endDate, branch, auditor);
  }
  
  @override
  Future<ResponseDetailKkaAuditArea> getDetailKkaAuditArea(int id)async {
    return await apiService.getDetailKkaAuditArea(id);
  }
  
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
  
  @override
  Future<ResponseFollowUpAuditArea> getFollowUpAuditArea() async{
    return await apiService.getFollowUpAuditArea();
  }
  
  @override
  Future<ResponseInputFollowUpAuditArea> inputFollowUpAuditArea(int penalty, String realization, String explanationPenalty, int attachment) async{
    return await apiService.inputFollowUpAuditArea(penalty, realization, explanationPenalty, attachment);
  }
  
  @override
  Future<ResponseAttachmentAuditArea> getAttachmentAuditArea()async {
    return await apiService.getAttachmentFollowUpAuditArea();
  }
  
  @override
  Future<ResponseDocumentFollowUpAuditArea> getDocumentFollowUpAuditArea()async {
    return await apiService.getDocumentFollowUpAuditArea();
  }
  
  @override
  Future<ResponseFollowUpAuditArea> filterDataFollowUpAuditArea(String startDate, String endDate, String auditor, String branch)async {
    return await apiService.filterDataFollowUpAuditArea(startDate, endDate, auditor, branch);
  }
  
  @override
  Future<ResponseDetailFollowUpAuditArea> getDetailFollowUpAuditArea(int id)async {
    return await apiService.getDetailFollowUpAuditArea(id);
  }
  
  @override
  Future<ResponseReportAuditArea> getLisReportAuditArea()async {
    return await apiService.getReportAuditArea();
  }
  
  @override
  Future<ResponseReportAuditArea> filterReportAuditArea(String startDate, String endDate, String auditor, String branch)async {
    return await apiService.filterReportAuditArea(startDate, endDate, auditor, branch);
  }
  
  @override
  Future<ResponseDetailUserAuditArea> getDetailUserAuditArea()async {
    return await apiService.getDetailUserAuditArea();
  }
  
  @override
  Future<ResponseEditUserAuditArea> editUserAuditArea(int id, String email, String username) async{
    return await apiService.editProfileUserAuditArea(id, email, username);
  }
  
  @override
  Future<ResponseChangePasswordAuditArea> changePasswordAuditArea(int id, String oldPassword, String newPassword)async {
    return await apiService.changePasswordAuditArea(id, oldPassword, newPassword);
  }
  

  //audit region
  @override
  Future<ResponseScheduleAuditRegion> getMainSchedulesAuditRegion()async {
    return await apiService.getMainSchedulesAuditRegion();
  }
  
  @override
  Future<ResponseScheduleAuditRegion> getSpecialSchedulesAuditRegion()async {
    return await apiService.getSpecialSchedulesAuditRegion();
  }
  
  @override
  Future<ResponseScheduleAuditRegion> getRescheduleAuditRegion()async {
    return await apiService.getReschedulesAuditRegion();
  }
  
  @override
  Future<ResponseScheduleAuditRegion> filterMainSchedulesAuditRegion(String startDate, String endDate)async {
    return await apiService.filterMainSchedulesAuditRegion(startDate, endDate);
  }
  
   @override
  Future<ResponseScheduleAuditRegion> filterSpecialSchedulesAuditRegion(String startDate, String endDate)async {
    return await apiService.filterSpecialSchedulesAuditRegion(startDate, endDate);
  }
  
  @override
  Future<ResponseScheduleAuditRegion> filterReschedulesAuditRegion(String startDate, String endDate)async {
    return await apiService.filterRescheduleAuditRegion(startDate, endDate);
  }

  @override
  Future<ResponseDetailUserAuditRegion> getDetailUserAuditRegion() async{
    return await apiService.getDetailUserAuditRegion();
  }  

  @override
  Future<ResponseEditUserAuditRegion> editUserAuditRegion(int id, String email, String username)async {
   return await apiService.editProfileUserAuditRegion(id, email, username);
  }
  
  @override
  Future<ResponseChangePasswordAuditRegion> changePasswordAuditRegion(int id, String oldPassword, String newPassword)async {
   return await apiService.changePasswordAuditRegion(id, oldPassword, newPassword);
  }
  
  @override
  Future<ResponseUploadReportAuditRegion> uploadReportAuditRegion(String filePath) async{
    return await apiService.uploadReportAuditRegion(filePath);
  }
  
  @override
  Future<ResponseReportAuditRegion> getListReportAuditRegion()async {
    return await apiService.getReportAuditRegion();
  }
  
  @override
  Future<ResponseReportAuditRegion> filterReportAuditRegion(String startDate, String endDate)async {
    return await apiService.filterReportAuditRegion(startDate, endDate);
  }
  
  @override
  Future<ResponseDetailScheduleAuditRegion> getDetailScheduleAuditRegion(int id)async {
    return await apiService.getDetailScheduleAuditRegion(id);
  }
  
  @override
  Future<ResponseLhaAuditRegion> getLhaAuditRegion()async {
    return await apiService.getLhaAuditRegion();
  }
  
  @override
  Future<ResponseDivisionAuditRegion> getDivisionAuditRegion()async {
    return await apiService.getDivisionAuditRegion();
  }
  
  @override
  Future<ResponseSopAuditRegion> getSopAuditRegion() async {
    return await apiService.getSopAuditRegion();
  }
  
  @override
  Future<ResponseInputLhaAuditRegion> inputLhaAuditRegion(int divisionId, String findingDesc, int sopId, String temporaryRec, String permanentRec, int researchValue, String suggest) async{
    return await apiService.inputLhaAuditRegion(divisionId, findingDesc, sopId, temporaryRec, permanentRec, researchValue, suggest);
  }
  
  @override
  Future<ResponseClarificationAuditRegion> getClarificationAuditRegion()async {
    return await apiService.getClarificationAuditRegion();
  }
  
  @override
  Future<ResponseClarificationAuditRegion> filterClarificationAuditRegion(String startDate, String endDate) async{
    return await apiService.filterClarificationAuditRegion(startDate, endDate);
  }
  
  @override
  Future<ResponseUploadKkaAuditRegion> uploadKkaAuditRegion(String filePath) async{
    return await apiService.uploadKkaAuditRegion(filePath);
  }
  
  @override
  Future<ResponseDetailLhaAuditRegion> getDetailLhaAuditRegion(int id)async {
    return await apiService.getDetailLhaAuditRegion(id);
  }
  
  @override
  Future<ResponseClarificationCategoryAuditRegion> getClarificaCategoryAuditRegion()async {
    return await apiService.getClarificaCategoryAuditRegion();
  }
  
  @override
  Future<ResponsePriorityFindingAuditRegion> getPriorityFindingAuditRegion()async {
    return await apiService.getPriorityFindingAuditRegion();
  }
  
  @override
  Future<ResponseInputClarificationAuditRegion> inputClarificationAuditRegion(int category, String limitEvaluation, 
  String location, String division, String supervisor, String dear, String findingDescription, int priorityFinding)async {
    return await apiService.inputClarificationAuditRegion(category, limitEvaluation, location, division, supervisor, dear, findingDescription, priorityFinding);
  }
  
  @override
  Future<ModelDocClarificationAuditRegion> getDocumentClarification(int id)async {
    return await apiService.getDocumentClarification(id);
  }
  
  @override
  Future<ResponseUploadClarification> uploadClarificationAuditRegion(String filePath)async {
    return await apiService.uploadClarificationAuditRegion(filePath);
  }
  
  @override
  Future<ResponseInputIdentificationClarificationAuditRegion> inputIdentificatinClarificationAuditRegion(int evaluationClarification, String loss, String description, int followUp)async {
    return await apiService.inputIdentificatinClarificationAuditRegion(evaluationClarification, loss, description, followUp);
  }
  
  @override
  Future<ResponseUploadBapAuditRegion> uploadBapAuditRegion(String filePath) {
    return apiService.uploadBapAuditRegion(filePath);
  }
  
  @override
  Future<ResponseDetailClarificationAuditRegion> getDetailClarificationAuditRegion(int id) {
    return apiService.detailClarificationAuditRegion(id);
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