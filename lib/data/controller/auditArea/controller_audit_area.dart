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
import 'package:audit_cms/data/core/response/auditArea/master/response_branch_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_users.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/model_body_add_schedules.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_main_schedules_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_special_schedules_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/userPorfile/response_detail_user_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/followUp/model_body_input_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/kka/response_kka_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/report/response_report_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_detail_schedule_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_reschedule_audit_area.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import '../../core/repositories/repositories.dart';

class ControllerAuditArea extends GetxController{

  final Repositories repository;
  ControllerAuditArea(this.repository);

  //main schedule
  final PagingController<int, ContentMainScheduleAuditArea> pagingControllerMainSchedule = PagingController(firstPageKey: 0);
  final RxList<ModelBodySchedulesAuditArea> dataListLocalMainSchedulesAuditArea = RxList<ModelBodySchedulesAuditArea>();

  //special schedule
  final PagingController<int, ContentSpecialScheduleAuditArea> pagingControllerSpecialSchedule = PagingController(firstPageKey: 0);
  final RxList<ModelBodySchedulesAuditArea> dataListLocalSpecialSchedulesAuditArea = RxList<ModelBodySchedulesAuditArea>();


  final RxList<ModelReschedulesAuditArea> resSchedulesAuditArea = <ModelReschedulesAuditArea>[].obs;
  final RxList<ModelBodySchedulesAuditArea> dataListLocalReschedulesAuditArea = RxList<ModelBodySchedulesAuditArea>();
  var detailScheduleAuditArea =  Rxn<ModelDetailSchedulesAuditArea>();

  //master
  final RxList<DataUsers> usersAuditArea = <DataUsers>[].obs;
  final RxList<DataListBranch> branchAuditArea = <DataListBranch>[].obs;
  final RxList<ModelListAttachmentAuditArea> attachmentAuditArea = <ModelListAttachmentAuditArea>[].obs;

  //lha
  final RxList<ModelListLhaAuditArea>lhaAuditArea = <ModelListLhaAuditArea>[].obs;
  var detailLhaAuditArea = Rxn<ModelDetailLhaAuditArea>();

  //kka
  final RxList<ModelListKkaAuditArea> kkaAuditArea = <ModelListKkaAuditArea>[].obs;
  var detailKkaAuditArea = Rxn<ModelDetailKkaAuditArea>();

  //clarification
  final RxList<ModelListClarificationAuditArea> clarificationAuitArea = <ModelListClarificationAuditArea>[].obs;
  var detailClarificationAuditArea = Rxn<ModelDetailClarificationAuditArea>();

  //follow up
  final RxList<ModelListFollowUpAuditArea> followUpArea = <ModelListFollowUpAuditArea>[].obs;
  var detailFollowUpAuditArea = Rxn<ModelDetailFollowUpAuditArea>();
  var documentFollowUpAuditArea = Rxn<ModelDocFollowUpAuditArea>();

  //bap
  final RxList<ModelListBapAuditArea> bapAuditArea = <ModelListBapAuditArea>[].obs;
  var detailBapAuditArea = Rxn<ModelDetailBapAuditArea>();

  //report
  var reportAuditArea = Rxn<ModelReportAuditArea>();

  //profile
  var detailUserAuditArea = Rxn<ModelDetailProfileAuditArea>();

  var isLoading = true.obs;
  var message = ''.obs;

  @override
  void onInit(){
    pagingControllerMainSchedule.addPageRequestListener(loadMainSchedule);
    pagingControllerSpecialSchedule.addPageRequestListener(loadSpecialSchedule);
    loadReschedulesAuditArea();
    loadUsersAuditArea();
    loadBranchAuditArea();
    loadLhaAuditArea();
    loadClarificationAuditArea();
    loadKkaAuditArea();
    loadBapAuditArea();
    loadFollowUpAuditArea();
    loadAttachmentAuditArea();
    super.onInit();
  }

  //main shedule
  void addLocalDataMainSchedule(int auditor, int branch, String userName, String branchName, String startDate, String endDate, String desc)async {
    final newData = ModelBodySchedulesAuditArea(
      userId: auditor,
      branchId: branch, 
      startDate: startDate, 
      endDate: endDate,
      description: desc,
      userName: DataUsers(id: auditor, fullname: userName),
      branchName: DataListBranch(id: branch, name: branchName)
      );
    dataListLocalMainSchedulesAuditArea.add(newData);
  }

  void addMainSchedules()async{
    try{     
      final addSchedules = await repository.addMainSchedules(dataListLocalMainSchedulesAuditArea.toList());
      message(addSchedules.toString());
      dataListLocalMainSchedulesAuditArea.clear();
    }catch(error){
      throw Exception(error);
    }
  }

  void editMainSchedule(int id, int userId, int branchId, String startDate, String endDate, String description)async{
    try {
      final editMainSchedule = await repository.editMainSchedule(id, userId, branchId, startDate, endDate, description);
      message.value = editMainSchedule.message.toString();
    } catch (e) {
      throw Exception(e);
    }
  }
  
  void deleteMainSchedule(int id)async{
    try {
      final delete = await repository.deleteMainSchedule(id);
      message.value = delete.message.toString();
      pagingControllerMainSchedule.refresh();
    } catch (e) {
      throw Exception(e);
    }
  }

  void deleteLocalDataMainSchedule(int auditor)async{
    final index = dataListLocalMainSchedulesAuditArea.indexWhere((items) => items.userId == auditor);
    if(index != -1){
      dataListLocalMainSchedulesAuditArea.removeAt(index);
    }
  }

  void loadMainSchedule(int page)async{
    try {
      final mainSchedule = await repository.getMainSchedulesAuditArea(page);
      final schedule = mainSchedule.data!.content;
      final isLastPage = schedule!.length < 10;
      if (isLastPage) {
        pagingControllerMainSchedule.appendLastPage(schedule);
      } else {
        final nextPage = page + 1;
        pagingControllerMainSchedule.appendPage(schedule, nextPage);
      }
    } catch (e) {
      pagingControllerMainSchedule.error = e;
      throw Exception(e);
    }
  }

  //special schedule
  void addLocalDataSpecialSchedule(int auditor, int branch, String userName, String branchName, String startDate, String endDate, String desc)async {
    final newData = ModelBodySchedulesAuditArea(
      userId: auditor,
      branchId: branch, 
      startDate: startDate, 
      endDate: endDate,
      description: desc,
      userName: DataUsers(id: auditor, fullname: userName),
      branchName: DataListBranch(id: branch, name: branchName)
      );
    dataListLocalSpecialSchedulesAuditArea.add(newData);
  }

  void addSpecialSchedules()async{
    try{     
      final addSchedules = await repository.addSpecialSchedules(dataListLocalSpecialSchedulesAuditArea.toList());
      message(addSchedules.toString());
      dataListLocalSpecialSchedulesAuditArea.clear();
    }catch(error){
      throw Exception(error);
    }
  }

  void deleteLocalDataSpecialSchedule(int auditor)async{
    final index = dataListLocalSpecialSchedulesAuditArea.indexWhere((items) => items.userId == auditor);
    if(index != -1){
      dataListLocalSpecialSchedulesAuditArea.removeAt(index);
    }
  }

  void loadSpecialSchedule(int page)async{
    try {
      final specialSchedule = await repository.getSpecialSchedulesAuditArea(page);
      final schedule = specialSchedule.data!.content;
      final lastPage = schedule!.length < 10;
      if (lastPage) {
        pagingControllerSpecialSchedule.appendLastPage(schedule);
      } else {
        final nextPage = page + 1;
        pagingControllerSpecialSchedule.appendPage(schedule, nextPage);
      }
    } catch (e) {
      pagingControllerSpecialSchedule.error = e;
      throw Exception(e);
    }
  }

  void editSpecialSchedule(int id, int userId, int branchId, String startDate, String endDate, String description)async{
    try {
      final editMainSchedule = await repository.editSpecialSchedule(id, userId, branchId, startDate, endDate, description);
      message.value = editMainSchedule.message.toString();
    } catch (e) {
      throw Exception(e);
    }
  }


   //Reschedule
  // void addLocalDataReschedule(int auditor, int branch, String userName, String branchName, String startDate, String endDate, String desc)async {
  //   final newData = ModelBodySchedulesAuditArea(
  //     userId: auditor,
  //     branchId: branch, 
  //     startDate: startDate, 
  //     endDate: endDate,
  //     description: desc,
  //     userName: ModelListAuditorAuditArea(id: auditor, auditorName: userName),
  //     branchName: ModelListBranchAuditArea(id: branch, branchName: branchName)
  //     );
  //   dataListLocalReschedulesAuditArea.add(newData);
  // }

  // void addReschedules()async{
  //   try{     
  //     final addSchedules = await repository.addSchedulesAuditArea(dataListLocalReschedulesAuditArea.toList());
  //     message(addSchedules.toString());
  //     dataListLocalReschedulesAuditArea.clear();
  //   }catch(error){
  //     throw Exception(error);
  //   }
  // }

  // void deleteLocalDataReschedule(int auditor)async{
  //   final index = dataListLocalReschedulesAuditArea.indexWhere((items) => items.userId == auditor);
  //   if(index != -1){
  //     dataListLocalReschedulesAuditArea.removeAt(index);
  //   }
  // }


  void loadReschedulesAuditArea()async {
    isLoading(true);
    try {
      final responseSchedules = await repository.getReschedulesAuditArea();
      resSchedulesAuditArea.assignAll(responseSchedules.reschedules ?? []);
    } catch (error) {
      throw Exception(error);
    } finally {
      isLoading(false);
    }
  }

  void filterReschedulesAuditArea(String startDate, String endDate, String branch, String auditor)async{
    try{
      final response = await repository.filterResScheduleAuditArea(startDate, endDate, branch, auditor);
      resSchedulesAuditArea.assignAll(response.reschedules ?? []);
    }catch(error){
      throw Exception(error);
    }
  }


  void getDetailScheduleAuditArea(int id)async{
    try{
      final responseDetailSchedule = await repository.getDetailScheduleAuditArea(id);
      detailScheduleAuditArea.value = responseDetailSchedule.dataSchedules;
    }catch(error){
      throw Exception(error);
    }
  }

  void loadUsersAuditArea()async{
    try{
      final responseAuditor = await repository.getUsersAuditArea();
      usersAuditArea.assignAll(responseAuditor.data ?? []);
    }catch(error){
      throw Exception(error);
    }
  }

  void loadBranchAuditArea()async {
    try{
      final responseBranch = await repository.getBranchAuditArea();
      branchAuditArea.assignAll(responseBranch.data ?? []);
    }catch(error){
      throw Exception(error);
    }
  }

  void loadLhaAuditArea()async{
    isLoading(true);
    try{
      final response = await repository.getLhaAuditArea();
      lhaAuditArea.assignAll(response.dataLha ?? []);
    }catch(error){
      throw Exception(error);
    }finally{
      isLoading(false);
    }
  }

  void filterLhaAuditArea(String startDate, String endDate, String branch, String auditor)async{
    try{
      final response = await repository.filterLhaAuditArea(startDate, endDate, branch, auditor);
      lhaAuditArea.assignAll(response.dataLha ?? []);
    }catch(error){
      throw Exception(error);
    }
  }

  void getDetailLhaAuditArea(int id)async{
    try{
      final response = await repository.getDetailLhaAuditArea(id);
      detailLhaAuditArea.value = response.dataDetailLha;
    }catch(error){
      throw Exception(error);
    }
  }

  void editLhaAuditArea(int id, String lhaDescription)async{
  try{
    final response = await repository.editLhaAuditArea(id, lhaDescription);
    message(response.message);
    }catch(error){
      throw Exception(error);
    }
  }
  
  void loadClarificationAuditArea() async{
    isLoading(true);
    try {
      final response = await repository.getClarificationAuditArea();
      clarificationAuitArea.assignAll(response.dataClarification ?? []);
    } catch (error) {
      throw Exception(error);
    }finally{
      isLoading(false);
    }
  }


  void filterClarificationAuditArea(String startDate, String endDate, String branch, String auditor)async{
    try{
      final response = await repository.filterClarificationAuditArea(startDate, endDate, branch, auditor);
      clarificationAuitArea.assignAll(response.dataClarification ?? []);
    }catch(error){
      throw Exception(error);
    }
  }

  void getDetailClarificationAuditArea(int id)async{
    try{
      final detail = await repository.getDetailClarificationAuditArea(id);
      detailClarificationAuditArea.value = detail.detailClarification;
    }catch(error){
      throw Exception(error);
    }
  }
  
  void loadKkaAuditArea() async{
    isLoading(true);
    try {
      final responseKka = await repository.getKkaAuditArea();
      kkaAuditArea.assignAll(responseKka.dataKka ?? []);
    } catch (error) {
      throw Exception(error);
    }finally{
      isLoading(false);
    }
  }

  void getFilterKkaAuditArea(String startDate, String endDate, String branch, String auditor)async{
    try {
        final responseKka = await repository.getFilterKkaAuditArea(startDate, endDate, branch, auditor);
        kkaAuditArea.assignAll(responseKka.dataKka ??[]);
    } catch (error) {
      throw Exception(error);
    }
  }

  void getDetailKkaAuditArea(int id)async{
    try {
      final responseDetail = await repository.getDetailKkaAuditArea(id);
      detailKkaAuditArea.value = responseDetail.detailKka;
    } catch (error) {
      throw Exception(error);
    }
  }
  
  void loadBapAuditArea() async{
    isLoading(true);
    try {
      final responseBap = await repository.getBapAuditArea();
      bapAuditArea.assignAll(responseBap.dataBap ?? []);
    } catch (error) {
      throw Exception(error);
    }finally{
      isLoading(false);
    }
  }

  void filterBapAuditArea(String startDate, String endDate, String branch, String auditor)async{
    try {
      final responseFilterBap = await repository.getFilterBapAuditArea(startDate, endDate, branch, auditor);
      bapAuditArea.assignAll(responseFilterBap.dataBap ?? []);
    } catch (error) {
      throw Exception(error);
    }
  }

  void getDetailBapAuditArea(int id)async{
    try {
      final responseDetail = await repository.getDetailBapAuditArea(id);
      detailBapAuditArea.value = responseDetail.detailBap;
    } catch (error) {
      throw Exception(error);
    }
  }
  
  void loadFollowUpAuditArea()async {
    isLoading(true);
    try {
      final responseFollowUp = await repository.getFollowUpAuditArea();
      followUpArea.assignAll(responseFollowUp.dataFollowUp ?? []);
    } catch (error) {
      throw Exception(error);
    }
  }

  void filterDataFollowUpAuditArea(String startDate, String endDate, String auditor, String branch)async{
    try{
      final response = await repository.filterDataFollowUpAuditArea(startDate, endDate, auditor, branch);
      followUpArea.assignAll(response.dataFollowUp ?? []);
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
      attachmentAuditArea.assignAll(responseAttachment.dataAttachment ?? []);
    } catch (error) {
      throw Exception(error);
    }
  }

  void loadFollowUpDocumentAuditArea()async{
    try {
      final responseDocument = await repository.getDocumentFollowUpAuditArea();
      documentFollowUpAuditArea.value = responseDocument.dataDocFollowUp;
    } catch (error) {
      throw Exception(error);
    }
  }

  void getDetailFollowUpAuditArea(int id)async{
    try {
      final response = await repository.getDetailFollowUpAuditArea(id);
      detailFollowUpAuditArea.value = response.detailFollowUp;
    } catch (error) {
      throw Exception(error);
    }
  }
  
  void getReportAuditArea(String branch, String startDate, String endDate) async{
    isLoading(true);
    try {
      final response = await repository.getReportAuditArea(branch, startDate, endDate);
      reportAuditArea.value = response.detailReport;
    } catch (error) {
      throw Exception(error);
    }finally{
      isLoading(false);
    }
  }

  void getDetailUserAuditArea()async{
    try {
      final response = await repository.getDetailUserAuditArea();
      detailUserAuditArea.value = response.dataProfile;
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

  void changePasswordAuditArea(int id, String oldPassword, String newPassword, String confirmPassword)async{
    try {
      final response = await repository.changePasswordAuditArea(id, oldPassword, newPassword, confirmPassword);
      message(response.toString());
    } catch (error) {
      throw Exception(error);
    }
  }
}