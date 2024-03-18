import 'package:audit_cms/data/core/response/reponse_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/response_attachment_audit_area.dart';
import 'package:audit_cms/data/core/response/response_bap_audit_area.dart';
import 'package:audit_cms/data/core/response/response_detail_bap_audit_area.dart';
import 'package:audit_cms/data/core/response/response_detail_clarification_audit_area.dart';
import 'package:audit_cms/data/core/response/response_clarification_audit_area.dart';
import 'package:audit_cms/data/core/response/response_detail_kka_audit_area.dart';
import 'package:audit_cms/data/core/response/response_detail_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/response_detail_schedule_audit_area.dart';
import 'package:audit_cms/data/core/response/response_detail_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/response_detail_user_audit_area.dart';
import 'package:audit_cms/data/core/response/response_input_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/response_kka_audit_area.dart';
import 'package:audit_cms/data/core/response/response_report_audit_area.dart';
import 'package:get/get.dart';
import '../../core/repositories/repositories.dart';
import '../../core/response/response_dropdown.dart';
import '../../core/response/response_lha_audit_area.dart';
import '../../core/response/response_schedules_audit_area.dart';

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
  final RxList<ModelListBapAuditArea> bapAuditArea = RxList<ModelListBapAuditArea>();
  final RxList<ModelListFollowUpAuditArea> followUpArea = RxList<ModelListFollowUpAuditArea>();
  final RxList<ModelListAttachmentAuditArea> attachmentAuditArea = RxList<ModelListAttachmentAuditArea>();
  final RxList<ModelListReportAuditArea> reportAuditArea = RxList<ModelListReportAuditArea>();

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
  var filterIsActive = false.obs;



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
      
      final addSchedules = await repository.addSchedules(auditorId, areaId, branchId, statusId, startDate, endDat, desc);
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
      final responseSchedules = await repository.getMainSchedules();
      mainSchedulesAuditArea.assignAll(responseSchedules.schedules ?? []);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch schedules');
    } finally {
      isLoading(false);
    }
  }

  void filterMainSchedule(String startDate, String endDate, String branch, String auditor)async{
    isLoading(true);
    try{
      final responseFilter = await repository.filterMainSchedules(startDate, endDate, branch, auditor);
      mainSchedulesAuditArea.assignAll(responseFilter.schedules ?? []);
    }catch(error){
      throw Exception(error);
    }finally{
      isLoading(false);
    }
  }

  void filterSpecialSchedules(String startDate, String endDate, String branch, String auditor)async{
    isLoading(true);
    try{
      final response = await repository.filterSpecialSchedules(startDate, endDate, branch, auditor);
      specialSchedulesAuditArea.assignAll(response.schedules ?? []);
    }finally{
      isLoading(false);
    }
  }

  void filterReschedules(String startDate, String endDate, String branch, String auditor)async{
    isLoading(true);
    try{
      final response = await repository.filterResSChedules(startDate, endDate, branch, auditor);
      resSchedulesAuditArea.assignAll(response.schedules ?? []);
    }catch(error){
      throw Exception(error);
    }finally{
      isLoading(false);
    }
  }

  void getDetailSchedule(int id)async{
    try{
      final responseDetailSchedule = await repository.getDetailSchedule(id);
      detailScheduleAuditArea.value = responseDetailSchedule;
    }catch(error){
      throw Exception(error);
    }
  }

  void loadAuditorAuditArea()async{
    try{
      final responseAuditor = await repository.getAuditor();
      auditorAuditArea.assignAll(responseAuditor.auditor ?? []);
    }catch(error){
      throw Exception(error);
    }
  }

  void loadAreaAuditArea()async {
    try{
      final responseArea = await repository.getArea();
      areaAuditArea.assignAll(responseArea.area ?? []);
    }catch(error){
      throw Exception(error);
    }
  }

  void loadBranchAuditArea()async {
    try{
      final responseBranch = await repository.getBranch();
      branchAuditArea.assignAll(responseBranch.branch ?? []);
    }catch(error){
      throw Exception(error);
    }
  }

  void loadStatusAuditArea()async {
    try{
      final responseData = await repository.getStatus();
      statusAuditArea.assignAll(responseData.status ?? []);
    }catch(error){
      throw Exception(error);
    }
  }

  void loadSpecialSchedulesAuditArea()async {
    isLoading(true);
    try{
      final response = await repository.getSpecialSchedules();
      specialSchedulesAuditArea.assignAll(response.schedules ?? []);
    }catch(error){
      throw Exception(error);
    }
  }

  void loadReschedulesAuditArea()async{
    isLoading(true);
    try{
      final response = await repository.getReschedules();
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
    isLoading(true);
    try{
      final response = await repository.filterLhaAuditArea(startDate, endDate, branch, auditor);
      lhaAuditArea.assignAll(response.lha ?? []);
    }catch(error){
      throw Exception(error);
    }finally{
      isLoading(false);
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
    final response = await repository.editLha(id, lhaDescription);
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
    isLoading(true);
    try{
      final response = await repository.filterClarificationAuditArea(startDate, endDate, branch, auditor);
      clarificationAuitArea.assignAll(response.clarification ?? []);
    }catch(error){
      throw Exception(error);
    }finally{
      isLoading(false);
    }
  }
  
  void loadKkaAuditArea() async{
    isLoading(true);
    try {
      final responseKka = await repository.getKkaAuditArea();
      kkaAuditArea.assignAll(responseKka.kka ?? []);
    } catch (error) {
      throw Exception(error);
    }
  }

  void getFilterKkaAuditArea(String startDate, String endDate, String branch, String auditor)async{
    isLoading(true);
    try {
        final responseKka = await repository.getFilterKkaAuditArea(startDate, endDate, branch, auditor);
        kkaAuditArea.assignAll(responseKka.kka ??[]);
    } catch (error) {
      throw Exception(error);
    }finally{
      isLoading(false);
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
    isLoading(true);
    try {
      final responseFilterBap = await repository.getFilterBapAuditArea(startDate, endDate, branch, auditor);
      bapAuditArea.assignAll(responseFilterBap.bap ?? []);
    } catch (error) {
      throw Exception(error);
    }finally{
      isLoading(false);
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
    isLoading(true);
    try{
      final response = await repository.filterDataFollowUpAuditArea(startDate, endDate, auditor, branch);
      followUpArea.assignAll(response.followUp ?? []);
    }catch(error){
      throw Exception(error);
    }finally{
      isLoading(false);
    }
  }

  void inputFollowUp(int penalty, String realization, String explanationPenalty, int attachment)async{
    try{
      final responseInputFollowUp = await repository.inputFollowUp(penalty, realization, explanationPenalty, attachment);
      message(responseInputFollowUp.toString());
    }catch(error){
      throw Exception(error);
    }
  }
  
  void loadAttachmentAuditArea()async{
    try {
      final responseAttachment = await repository.getAttachment();
      attachmentAuditArea.assignAll(responseAttachment.attchment ?? []);
    } catch (error) {
      throw Exception(error);
    }
  }

  void loadFollowUpDocument()async{
    isLoading(true);
    try {
      final responseDocument = await repository.getDocumentFollowUp();
      documentFollowUpAuditArea.value = responseDocument;
    } catch (error) {
      throw Exception(error);
    }finally{
      isLoading(false);
    }
  }

  void getDetailFollowUp(int id)async{
    try {
      final response = await repository.getDetailFollowUp(id);
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
    isLoading(true);
    try {
      final response = await repository.filterReportAuditArea(startDate, endDate, auditor, branch);
      reportAuditArea.assignAll(response.report ?? []);
    } catch (error) {
      throw Exception(error);
    }finally{
      isLoading(false);
    }
  }

  void getDetailUser()async{
    try {
      final response = await repository.getDetailUser();
      detailUserAuditArea.value = response;
    } catch (error) {
      throw Exception(error);
    }
  }

  void editProfileUser(int id, String email, String username)async{
    try {
      final response = await repository.editUser(id, email, username);
      message(response.toString());
    } catch (error) {
      throw Exception(error);
    }
  }

  void resetFilter(String startDate, String endDate, String auditor, String branch) {
    startDate = '';
    endDate = '';
    auditor = '';
    branch = '';
    filterIsActive.value = false;
  }
}