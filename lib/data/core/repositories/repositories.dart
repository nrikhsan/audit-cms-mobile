import 'package:audit_cms/data/core/response/auditArea/clarification/response_detail_clarification_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/lha/response_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/followUp/reponse_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/bap/response_bap_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/clarification/response_clarification_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/bap/response_detail_bap_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/followUp/response_detail_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/kka/response_detail_kka_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/lha/response_detail_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_attachment_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_auditor_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_branch_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/model_body_add_schedules.dart';
import 'package:audit_cms/data/core/response/auditArea/userPorfile/response_detail_user_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/followUp/model_body_input_follow_up_audit_area.dart';
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

  Future<ResponseAuth> login(String email, String password);

  //audit area
  //schedules
  Future<ResponseMessage> addSchedulesAuditArea(List<ModelBodySchedulesAuditArea>schedule);
  Future<ResponseMainScheduleAuditArea> getMainSchedulesAuditArea();
  Future<ResponseMainScheduleAuditArea> filterMainSchedulesAuditArea(String startDate, String endDate, String branch, String auditor);
  Future<ResponseSpecialSchedulesAuditArea> getSpecialSchedulesAuditArea();
  Future<ResponseSpecialSchedulesAuditArea> filterSpecialSchedulesAuditArea(String startDate, String endDate, String branch, String auditor);
  Future<ResponseReschedulesAuditArea> getReschedulesAuditArea();
  Future<ResponseReschedulesAuditArea> filterResScheduleAuditArea(String startDate, String endDate, String branch, String auditor);
  Future<ResponseDetailSchedulesAuditArea> getDetailScheduleAuditArea(int id);

  //master
  Future<ResponseAuditorAuditArea> getAuditorAuditArea();
  Future<ResponseBranchAuditArea> getBranchAuditArea();
  Future<ResponseAttachmentAuditArea> getAttachmentAuditArea();

  //LHA
  Future<ResponseLhaAuditArea> getLhaAuditArea();
  Future<ResponseDetailLhaAuditArea> getDetailLhaAuditArea(int id);
  Future<ResponseMessage> editLhaAuditArea(int id, String lhaDescription);
  Future<ResponseLhaAuditArea> filterLhaAuditArea(String startDate, String endDate, String branch, String auditor);

  //clarification
  Future<ResponseClarificationAuditArea> getClarificationAuditArea();
  Future<ResponseDetailClarificationAuditArea> getDetailClarificationAuditArea(int id);
  Future<ResponseClarificationAuditArea> filterClarificationAuditArea(String startDate, String endDate, String branch, String auditor);

  //KKA
  Future<ResponseKkaAuditArea> getKkaAuditArea();
  Future<ResponseKkaAuditArea> getFilterKkaAuditArea(String startDate, String endDate, String branch, String auditor);
  Future<ResponseDetailKkaAuditArea> getDetailKkaAuditArea(int id);

  //BAP
  Future<ResponseBapAuditArea> getBapAuditArea();
  Future<ResponseBapAuditArea> getFilterBapAuditArea(String startDate, String endDate, String branch, String auditor);
  Future<ResponseDetailBapAuditArea>getDetailBapAuditArea(int id);

  //follow up
  Future<ResponseFollowUpAuditArea> getFollowUpAuditArea();
  Future<ResponseFollowUpAuditArea> filterDataFollowUpAuditArea(String startDate, String endDate, String auditor, String branch);
  Future<ResponseMessage> inputFollowUpAuditArea(int penalty, String realization, String explanationPenalty, int attachment);
  Future<ResponseDocumentFollowUpAuditArea> getDocumentFollowUpAuditArea();
  Future<ResponseDetailFollowUpAuditArea> getDetailFollowUpAuditArea(int id);

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
  Future<ResponseAuth> login(String email, String password) async{
    return await apiService.login(email, password);
  }


  //audit area
  //schedules
  @override
  Future<ResponseMainScheduleAuditArea> getMainSchedulesAuditArea() async{
    return await apiService.getMainSchedulesAuditArea();
  }

  @override
  Future<ResponseMainScheduleAuditArea> filterMainSchedulesAuditArea(String startDate, String endDate, String branch, String auditor)async {
    return await apiService.filterMainScheduleAuditArea(startDate, endDate, branch, auditor);
  }

  @override
  Future<ResponseSpecialSchedulesAuditArea> getSpecialSchedulesAuditArea() async {
    return await apiService.getSpecialSchedulesAuditArea();
  }

  @override
  Future<ResponseSpecialSchedulesAuditArea> filterSpecialSchedulesAuditArea(String startDate, String endDate, String branch, String auditor)async {
    return await apiService.filterSpecialSchedulesAuditArea(startDate, endDate, branch, auditor);
  }

  @override
  Future<ResponseReschedulesAuditArea> getReschedulesAuditArea() async{
    return await apiService.getReschedulesAuditArea();
  }

  @override
  Future<ResponseReschedulesAuditArea>filterResScheduleAuditArea(String startDate, String endDate, String branch, String auditor)async {
    return await apiService.filterReschedulesAuditArea(startDate, endDate, branch, auditor);
  }

  @override
  Future<ResponseMessage> addSchedulesAuditArea(List<ModelBodySchedulesAuditArea>schedule) async{
    return await apiService.addScheduleAuditArea(schedule);
  }

  @override
  Future<ResponseDetailSchedulesAuditArea> getDetailScheduleAuditArea(int id)async {
    return await apiService.getDetailScheduleAuditArea(id);
  }


  //master
  @override
  Future<ResponseAuditorAuditArea> getAuditorAuditArea()async {
    return await apiService.getAuditorAuditArea();
  }

  @override
  Future<ResponseBranchAuditArea> getBranchAuditArea()async {
    return await apiService.getBranchAuditArea();
  }

  @override
  Future<ResponseAttachmentAuditArea> getAttachmentAuditArea()async {
    return await apiService.getAttachmentFollowUpAuditArea();
  }


  //LHA
  @override
  Future<ResponseLhaAuditArea> getLhaAuditArea()async {
    return await apiService.getLhaAuditArea();
  }
  
  @override
  Future<ResponseDetailLhaAuditArea> getDetailLhaAuditArea(int id)async {
    return await apiService.getDetailLhaAuditArea(id);
  }
  
  @override
  Future<ResponseMessage> editLhaAuditArea(int id, String lhaDescription)async {
    return await apiService.editLhaAuditArea(id, lhaDescription);
  }
  
  @override
  Future<ResponseLhaAuditArea> filterLhaAuditArea(String startDate, String endDate, String branch, String auditor) async{
    return await apiService.filterLhaAuditArea(startDate, endDate, branch, auditor);
  }


  //clarification
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


  //KKA
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
  Future<ResponseFollowUpAuditArea> getFollowUpAuditArea() async{
    return await apiService.getFollowUpAuditArea();
  }
  
  @override
  Future<ResponseMessage> inputFollowUpAuditArea(int penalty, String realization, String explanationPenalty, int attachment) async{
    return await apiService.inputFollowUpAuditArea(penalty, realization, explanationPenalty, attachment);
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