import 'package:audit_cms/data/core/response/reponse_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/response_attachment_audit_area.dart';
import 'package:audit_cms/data/core/response/response_bap_audit_area.dart';
import 'package:audit_cms/data/core/response/response_detail_bap_audit_area.dart';
import 'package:audit_cms/data/core/response/response_detail_clarification_audit_area.dart';
import 'package:audit_cms/data/core/response/response_add_schedules_audit_area.dart';
import 'package:audit_cms/data/core/response/response_clarification_audit_area.dart';
import 'package:audit_cms/data/core/response/response_detail_kka_audit_area.dart';
import 'package:audit_cms/data/core/response/response_detail_schedule_audit_area.dart';
import 'package:audit_cms/data/core/response/response_detail_user_audit_area.dart';
import 'package:audit_cms/data/core/response/response_edit_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/response_detail_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/response_edit_user_audit_area.dart';
import 'package:audit_cms/data/core/response/response_input_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/response_kka_audit_area.dart';
import 'package:audit_cms/data/core/response/response_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/response_report_audit_area.dart';
import 'package:audit_cms/data/core/service/api_service.dart';

import '../response/response_auth.dart';
import '../response/response_detail_lha_audit_area.dart';
import '../response/response_dropdown.dart';
import '../response/response_schedules_audit_area.dart';



abstract class Repositories {

  Future<ResponseAuth> login(String email, String password);

  //audit area
  Future<ResponseAddSchedulesAuditArea> addSchedules(int auditorId, int areaId, int branchId, int statusId, String startDate, String endDat, String desc);
  Future<ResponseSchedulesAuditArea> getMainSchedules();
  Future<ResponseSchedulesAuditArea> filterMainSchedules(String startDate, String endDate, String branch, String auditor);
  Future<ResponseSchedulesAuditArea> getSpecialSchedules();
  Future<ResponseSchedulesAuditArea> filterSpecialSchedules(String startDate, String endDate, String branch, String auditor);
  Future<ResponseSchedulesAuditArea> getReschedules();
  Future<ResponseAuditorAuditArea> getAuditor();
  Future<ResponseAreaAuditArea> getArea();
  Future<ResponseBranchAuditArea> getBranch();
  Future<ResponseStatusScheduleAuditArea> getStatus();
  Future<ResponseSchedulesAuditArea> filterResSChedules(String startDate, String endDate, String branch, String auditor);
  Future<ResponseDetailScheduleAuditArea> getDetailSchedule(int id);
  Future<ResponseLhaAuditArea> getLhaAuditArea();
  Future<ResponseDetailLhaAuditArea> getDetailLhaAuditArea(int id);
  Future<ResponseEditLhaAuditArea> editLha(int id, String lhaDescription);
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
  Future<ResponseInputFollowUpAuditArea> inputFollowUp(int penalty, String realization, String explanationPenalty, int attachment);
  Future<ResponseAttachmentAuditArea> getAttachment();
  Future<ResponseDocumentFollowUpAuditArea> getDocumentFollowUp();
  Future<ResponseDetailFollowUpAuditArea> getDetailFollowUp(int id);
  Future<ResponseReportAuditArea> getLisReportAuditArea();
  Future<ResponseReportAuditArea> filterReportAuditArea(String startDate, String endDate, String auditor, String branch);
  Future<ResponseDetailUserAuditArea> getDetailUser();
  Future<ResponseEditUserAuditArea>editUser(int id, String email, String username);
}



class RepositoryImpl implements Repositories {
  final ApiService apiService;
  RepositoryImpl(this.apiService);

  @override
  Future<ResponseAuth> login(String email, String password) async{
    return await apiService.login(email, password);
  }

  @override
  Future<ResponseSchedulesAuditArea> getMainSchedules() async{
    return await apiService.getMainSchedulesAuditArea();
  }

  @override
  Future<ResponseSchedulesAuditArea> filterMainSchedules(String startDate, String endDate, String branch, String auditor)async {
    return await apiService.filterMainScheduleAuditArea(startDate, endDate, branch, auditor);
  }

  @override
  Future<ResponseSchedulesAuditArea> filterSpecialSchedules(String startDate, String endDate, String branch, String auditor)async {
    return await apiService.filterSpecialSchedulesAuditArea(startDate, endDate, branch, auditor);
  }

  @override
  Future<ResponseSchedulesAuditArea>filterResSChedules(String startDate, String endDate, String branch, String auditor)async {
    return await apiService.filterReschedulesAuditArea(startDate, endDate, branch, auditor);
  }

  @override
  Future<ResponseAuditorAuditArea> getAuditor()async {
    return await apiService.getAuditorAuditArea();
  }

  @override
  Future<ResponseAreaAuditArea> getArea() async{
   return await apiService.getAreaAuditArea();
  }

  @override
  Future<ResponseBranchAuditArea> getBranch()async {
    return await apiService.getBranchAuditArea();
  }

  @override
  Future<ResponseStatusScheduleAuditArea> getStatus()async {
    return await apiService.getStatusAuditArea();
  }

  @override
  Future<ResponseAddSchedulesAuditArea> addSchedules(int auditorId, int areaId, int branchId, int statusId, String startDate, String endDat, String desc) async{
    return await apiService.addScheduleAuditArea(auditorId, areaId, branchId, statusId, startDate, endDat, desc);
  }

  @override
  Future<ResponseSchedulesAuditArea> getSpecialSchedules() async {
    return await apiService.getSpecialSchedulesAuditArea();
  }

  @override
  Future<ResponseSchedulesAuditArea> getReschedules() async{
    return await apiService.getReschedulesAuditArea();
  }
  
  @override
  Future<ResponseDetailScheduleAuditArea> getDetailSchedule(int id)async {
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
  Future<ResponseEditLhaAuditArea> editLha(int id, String lhaDescription)async {
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
  Future<ResponseInputFollowUpAuditArea> inputFollowUp(int penalty, String realization, String explanationPenalty, int attachment) async{
    return await apiService.inputFollowUpAuditArea(penalty, realization, explanationPenalty, attachment);
  }
  
  @override
  Future<ResponseAttachmentAuditArea> getAttachment()async {
    return await apiService.getAttachmentFollowUpAuditArea();
  }
  
  @override
  Future<ResponseDocumentFollowUpAuditArea> getDocumentFollowUp()async {
    return await apiService.getDocumentFollowUpAuditArea();
  }
  
  @override
  Future<ResponseFollowUpAuditArea> filterDataFollowUpAuditArea(String startDate, String endDate, String auditor, String branch)async {
    return await apiService.filterDataFollowUpAuditArea(startDate, endDate, auditor, branch);
  }
  
  @override
  Future<ResponseDetailFollowUpAuditArea> getDetailFollowUp(int id)async {
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
  Future<ResponseDetailUserAuditArea> getDetailUser()async {
    return await apiService.getDetailUserAuditArea();
  }
  
  @override
  Future<ResponseEditUserAuditArea> editUser(int id, String email, String username) async{
    return await apiService.editProfileUserAuditArea(id, email, username);
  }
  
}