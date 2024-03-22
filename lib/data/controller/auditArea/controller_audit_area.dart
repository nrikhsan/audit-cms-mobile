import 'package:audit_cms/data/core/response/auditArea/reponse_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_attachment_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_bap_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_clarification_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_detail_bap_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_detail_clarification_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_detail_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_detail_kka_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_detail_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_detail_schedule_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_detail_user_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_dropdown_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_input_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_kka_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_report_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_schedules_audit_area.dart';
import 'package:get/get.dart';
import '../../core/repositories/repositories.dart';

class ControllerAuditArea extends GetxController{

  final Repositories repository;
  ControllerAuditArea(this.repository);

  final RxList<ModelListSchedulesAuditArea> mainSchedulesAuditArea = <ModelListSchedulesAuditArea>[].obs;
  final RxList<ModelListSchedulesAuditArea> specialSchedulesAuditArea = <ModelListSchedulesAuditArea>[].obs;
  final RxList<ModelListSchedulesAuditArea> resSchedulesAuditArea = <ModelListSchedulesAuditArea>[].obs;
  final RxList<ModelListAuditorAuditArea> auditorAuditArea = <ModelListAuditorAuditArea>[].obs;
  final RxList<ModelListAreaAuditArea> areaAuditArea = <ModelListAreaAuditArea>[].obs;
  final RxList<ModelListBranchAuditArea> branchAuditArea = <ModelListBranchAuditArea>[].obs;
  final RxList<ModelListStatusAuditArea> statusAuditArea = <ModelListStatusAuditArea>[].obs;
  final RxList<ModelListLhaAuditArea>lhaAuditArea = <ModelListLhaAuditArea>[].obs;
  final RxList<ModelListClarificationAuditArea> clarificationAuitArea = <ModelListClarificationAuditArea>[].obs;
  final RxList<ModelListKkaAuditArea> kkaAuditArea = <ModelListKkaAuditArea>[].obs;
  final RxList<ModelListBapAuditArea> bapAuditArea = <ModelListBapAuditArea>[].obs;
  final RxList<ModelListFollowUpAuditArea> followUpArea = <ModelListFollowUpAuditArea>[].obs;
  final RxList<ModelListAttachmentAuditArea> attachmentAuditArea = <ModelListAttachmentAuditArea>[].obs;
  final RxList<ModelListReportAuditArea> reportAuditArea = <ModelListReportAuditArea>[].obs;

  var detailScheduleAuditArea =  Rxn<ResponseDetailScheduleAuditArea>();
  var detailLhaAuditArea = Rxn<ResponseDetailLhaAuditArea>();
  var detailClarificationAuditArea = Rxn<ResponseDetailClarificationAuditArea>();
  var dataListLocalSchedulesAuditArea = <ModelListSchedulesAuditArea>[].obs;
  var detailKkaAuditArea = Rxn<ResponseDetailKkaAuditArea>();
  var detailBapAuditArea = Rxn<ResponseDetailBapAuditArea>();
  var detailFollowUpAuditArea = Rxn<ResponseDetailFollowUpAuditArea>();
  var detailUserAuditArea = Rxn<ResponseDetailUserAuditArea>();
  var documentFollowUpAuditArea = Rxn<ResponseDocumentFollowUpAuditArea>();
  var isLoading = true.obs;
  var message = ''.obs;

  @override
  void onInit(){
    loadMainSchedulesAuditArea();
    loadSpecialSchedulesAuditArea();
    loadReschedulesAuditArea();
    loadAuditorAuditArea();
    loadAreaAuditArea();
    loadBranchAuditArea();
    loadStatusAuditArea();
    loadLhaAuditArea();
    loadClarificationAuditArea();
    loadKkaAuditArea();
    loadBapAuditArea();
    loadFollowUpAuditArea();
    loadAttachmentAuditArea();
    loadReportAuditArea();
    super.onInit();

  }

  void addLocalDataSchedule(ModelListAuditorAuditArea auditor, ModelListAreaAuditArea area, ModelListBranchAuditArea branch, ModelListStatusAuditArea status, String startDate, String endDate, String desc)async {
    final newData = ModelListSchedulesAuditArea(
      auditor: auditor.auditorName, 
      area: area.areaName,
      branch: branch.branchName, 
      status: status.statusName, 
      startDate: startDate, 
      endDate: endDate, 
      scheduleDescription: desc
      );
    dataListLocalSchedulesAuditArea.add(newData);
  }

  void addSchedules(int auditorId, int areaId, int branchId, int statusId, String startDate, String endDat, String desc)async{
    try{     
      final addSchedules = await repository.addSchedulesAuditArea(auditorId, areaId, branchId, statusId, startDate, endDat, desc);
      message(addSchedules.toString());
      dataListLocalSchedulesAuditArea.clear();
    }catch(error){
      throw Exception(error);
    }
  }

  void deleteLocalDataSchedule(String auditor)async{
    final index = dataListLocalSchedulesAuditArea.indexWhere((items) => items.auditor == auditor);
    if(index != -1){
      dataListLocalSchedulesAuditArea.removeAt(index);
    }
  }

  void loadMainSchedulesAuditArea()async {
    isLoading(true);
    try {
      final responseSchedules = await repository.getMainSchedulesAuditArea();
      mainSchedulesAuditArea.assignAll(responseSchedules.schedules ?? []);
    } catch (error) {
      throw Exception(error);
    } finally {
      isLoading(false);
    }
  }

  void filterMainSchedule(String startDate, String endDate, String branch, String auditor)async{
    try{
      final responseFilter = await repository.filterMainSchedulesAuditArea(startDate, endDate, branch, auditor);
      mainSchedulesAuditArea.assignAll(responseFilter.schedules ?? []);
    }catch(error){
      throw Exception(error);
    }
  }

  void filterSpecialSchedules(String startDate, String endDate, String branch, String auditor)async{
    try{
      final response = await repository.filterSpecialSchedulesAuditArea(startDate, endDate, branch, auditor);
      specialSchedulesAuditArea.assignAll(response.schedules ?? []);
    }catch(error){
      throw Exception(error);
    }
  }

  void filterReschedules(String startDate, String endDate, String branch, String auditor)async{
    try{
      final response = await repository.filterResScheduleAuditArea(startDate, endDate, branch, auditor);
      resSchedulesAuditArea.assignAll(response.schedules ?? []);
    }catch(error){
      throw Exception(error);
    }
  }

  void getDetailSchedule(int id)async{
    try{
      final responseDetailSchedule = await repository.getDetailScheduleAuditArea(id);
      detailScheduleAuditArea.value = responseDetailSchedule;
    }catch(error){
      throw Exception(error);
    }
  }

  void loadAuditorAuditArea()async{
    try{
      final responseAuditor = await repository.getAuditorAuditArea();
      auditorAuditArea.assignAll(responseAuditor.auditor ?? []);
    }catch(error){
      throw Exception(error);
    }
  }

  void loadAreaAuditArea()async {
    try{
      final responseArea = await repository.getAreaAuditArea();
      areaAuditArea.assignAll(responseArea.area ?? []);
    }catch(error){
      throw Exception(error);
    }
  }

  void loadBranchAuditArea()async {
    try{
      final responseBranch = await repository.getBranchAuditArea();
      branchAuditArea.assignAll(responseBranch.branch ?? []);
    }catch(error){
      throw Exception(error);
    }
  }

  void loadStatusAuditArea()async {
    try{
      final responseData = await repository.getStatusAuditArea();
      statusAuditArea.assignAll(responseData.status ?? []);
    }catch(error){
      throw Exception(error);
    }
  }

  void loadSpecialSchedulesAuditArea()async {
    isLoading(true);
    try{
      final response = await repository.getSpecialSchedulesAuditArea();
      specialSchedulesAuditArea.assignAll(response.schedules ?? []);
    }catch(error){
      throw Exception(error);
    }finally{
      isLoading(false);
    }
  }

  void loadReschedulesAuditArea()async{
    isLoading(true);
    try{
      final response = await repository.getReschedulesAuditArea();
      resSchedulesAuditArea.assignAll(response.schedules ?? []);
    }catch(error){
      throw Exception(error);
    }finally{
      isLoading(false);
    }
  }

  void loadLhaAuditArea()async{
    isLoading(true);
    try{
      final response = await repository.getLhaAuditArea();
      lhaAuditArea.assignAll(response.lha ?? []);
    }catch(error){
      throw Exception(error);
    }finally{
      isLoading(false);
    }
  }

  void filterLhaAuditArea(String startDate, String endDate, String branch, String auditor)async{
    try{
      final response = await repository.filterLhaAuditArea(startDate, endDate, branch, auditor);
      lhaAuditArea.assignAll(response.lha ?? []);
    }catch(error){
      throw Exception(error);
    }
  }

  void getDetailLhaAuditArea(int id)async{
    try{
      final response = await repository.getDetailLhaAuditArea(id);
      detailLhaAuditArea.value = response;
    }catch(error){
      throw Exception(error);
    }
  }

  void editLha(int id, String lhaDescription)async{
  try{
    final response = await repository.editLhaAuditArea(id, lhaDescription);
    message(response.toString());
    }catch(error){
      throw Exception(error);
    }
  }
  
  void loadClarificationAuditArea() async{
    isLoading(true);
    try {
      final response = await repository.getClarificationAuditArea();
      clarificationAuitArea.assignAll(response.clarification ?? []);
    } catch (error) {
      throw Exception(error);
    }finally{
      isLoading(false);
    }
  }

  void getDetailClarificationAuditArea(int id)async{
    try{
      final detail = await repository.getDetailClarificationAuditArea(id);
      detailClarificationAuditArea.value = detail;
    }catch(error){
      throw Exception(error);
    }
  }

  void filterClarificationAuditArea(String startDate, String endDate, String branch, String auditor)async{
    try{
      final response = await repository.filterClarificationAuditArea(startDate, endDate, branch, auditor);
      clarificationAuitArea.assignAll(response.clarification ?? []);
    }catch(error){
      throw Exception(error);
    }
  }
  
  void loadKkaAuditArea() async{
    isLoading(true);
    try {
      final responseKka = await repository.getKkaAuditArea();
      kkaAuditArea.assignAll(responseKka.kka ?? []);
    } catch (error) {
      throw Exception(error);
    }finally{
      isLoading(false);
    }
  }

  void getFilterKkaAuditArea(String startDate, String endDate, String branch, String auditor)async{
    try {
        final responseKka = await repository.getFilterKkaAuditArea(startDate, endDate, branch, auditor);
        kkaAuditArea.assignAll(responseKka.kka ??[]);
    } catch (error) {
      throw Exception(error);
    }
  }

  void getDetailKkaAuditArea(int id)async{
    try {
      final responseDetail = await repository.getDetailKkaAuditArea(id);
      detailKkaAuditArea.value = responseDetail;
    } catch (error) {
      throw Exception(error);
    }
  }
  
  void loadBapAuditArea() async{
    isLoading(true);
    try {
      final responseBap = await repository.getBapAuditArea();
      bapAuditArea.assignAll(responseBap.bap ?? []);
    } catch (error) {
      throw Exception(error);
    }finally{
      isLoading(false);
    }
  }

  void filterBapAuditArea(String startDate, String endDate, String branch, String auditor)async{
    try {
      final responseFilterBap = await repository.getFilterBapAuditArea(startDate, endDate, branch, auditor);
      bapAuditArea.assignAll(responseFilterBap.bap ?? []);
    } catch (error) {
      throw Exception(error);
    }
  }

  void getDetailBapAuditArea(int id)async{
    try {
      final responseDetail = await repository.getDetailBapAuditArea(id);
      detailBapAuditArea.value = responseDetail;
    } catch (error) {
      throw Exception(error);
    }
  }
  
  void loadFollowUpAuditArea()async {
    isLoading(true);
    try {
      final responseFollowUp = await repository.getFollowUpAuditArea();
      followUpArea.assignAll(responseFollowUp.followUp ?? []);
    } catch (error) {
      throw Exception(error);
    }
  }

  void filterDataFollowUpAuditArea(String startDate, String endDate, String auditor, String branch)async{
    try{
      final response = await repository.filterDataFollowUpAuditArea(startDate, endDate, auditor, branch);
      followUpArea.assignAll(response.followUp ?? []);
    }catch(error){
      throw Exception(error);
    }
  }

  void inputFollowUpAuditArea(int penalty, String realization, String explanationPenalty, int attachment)async{
    try{
      final responseInputFollowUp = await repository.inputFollowUpAuditArea(penalty, realization, explanationPenalty, attachment);
      message(responseInputFollowUp.toString());
    }catch(error){
      throw Exception(error);
    }
  }
  
  void loadAttachmentAuditArea()async{
    try {
      final responseAttachment = await repository.getAttachmentAuditArea();
      attachmentAuditArea.assignAll(responseAttachment.attchment ?? []);
    } catch (error) {
      throw Exception(error);
    }
  }

  void loadFollowUpDocumentAuditArea()async{
    try {
      final responseDocument = await repository.getDocumentFollowUpAuditArea();
      documentFollowUpAuditArea.value = responseDocument;
    } catch (error) {
      throw Exception(error);
    }
  }

  void getDetailFollowUpAuditArea(int id)async{
    try {
      final response = await repository.getDetailFollowUpAuditArea(id);
      detailFollowUpAuditArea.value = response;
    } catch (error) {
      throw Exception(error);
    }
  }
  
  void loadReportAuditArea() async{
    isLoading(true);
    try {
      final response = await repository.getLisReportAuditArea();
      reportAuditArea.assignAll(response.report ?? []);
    } catch (error) {
      throw Exception(error);
    }finally{
      isLoading(false);
    }
  }

  void filterReportAuditArea(String startDate, String endDate, String auditor, String branch)async{
    try {
      final response = await repository.filterReportAuditArea(startDate, endDate, auditor, branch);
      reportAuditArea.assignAll(response.report ?? []);
    } catch (error) {
      throw Exception(error);
    }
  }

  void getDetailUserAuditArea()async{
    try {
      final response = await repository.getDetailUserAuditArea();
      detailUserAuditArea.value = response;
    } catch (error) {
      throw Exception(error);
    }
  }

  void editProfileUserAuditArea(int id, String email, String username)async{
    try {
      final response = await repository.editUserAuditArea(id, email, username);
      message(response.toString());
    } catch (error) {
      throw Exception(error);
    }
  }

  void changePasswordAuditArea(int id, String oldPassword, String newPassword)async{
    try {
      final response = await repository.changePasswordAuditArea(id, oldPassword, newPassword);
      message(response.toString());
    } catch (error) {
      throw Exception(error);
    }
  }
}