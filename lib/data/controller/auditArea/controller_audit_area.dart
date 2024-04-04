import 'package:audit_cms/data/core/response/auditArea/clarification/response_detail_clarification_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/followUp/reponse_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/lha/response_detail_lha_revision.dart';
import 'package:audit_cms/data/core/response/auditArea/lha/response_lha_audit_area.dart';
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
import 'package:audit_cms/data/core/response/auditArea/schedules/response_detail_schedule_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_main_schedules_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_special_schedules_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/userPorfile/response_detail_user_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/followUp/request_body_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/kka/response_kka_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/report/response_report_audit_area.dart';
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
  var detailMainScheduleAuditArea =  Rxn<DataDetailScheduleAuditArea>();
  var nameMainSchedule = ''.obs;
  var branchMainSchedule = ''.obs;
  var startDateMainSchedule = ''.obs;
  var endDateMainSchedule = ''.obs;

  //special schedule
  final PagingController<int, ContentSpecialScheduleAuditArea> pagingControllerSpecialSchedule = PagingController(firstPageKey: 0);
  final RxList<ModelBodySchedulesAuditArea> dataListLocalSpecialSchedulesAuditArea = RxList<ModelBodySchedulesAuditArea>();
  var detailSpecialScheduleAuditArea =  Rxn<DataDetailScheduleAuditArea>();
  var nameSpecialSchedule = ''.obs;
  var branchSpecialSchedule = ''.obs;
  var startDateSpecialSchedule = ''.obs;
  var endDateSpecialSchedule = ''.obs;

  //reschedule
  final PagingController<int, ContentListRescheduleAuditArea> pagingControllerReschedule = PagingController(firstPageKey: 0);
  final RxList<ModelBodySchedulesAuditArea> dataListLocalReschedulesAuditArea = RxList<ModelBodySchedulesAuditArea>();
  var detailRescheduleAuditArea = Rxn<DataDetailRescheduleAuditArea>();
  var nameReschedule = ''.obs;
  var branchReschedule = ''.obs;
  var startDateReschedule = ''.obs;
  var endDateReschedule = ''.obs;

  //lha
  var scheduleIdLha = Rxn<int>();
  final PagingController<int, ContentListLhaAuditArea> pagingControllerLhaAuditArea = PagingController(firstPageKey: 0);
  var lhaId = Rxn<int>();
  final PagingController<int, LhaDetails> pagingControllerLhaRevisi = PagingController(firstPageKey: 0);
  var detailRevisonLha = Rxn<DataDetailRevisionLha>();
  var detailLhaAuditArea = Rxn<DataDetailLhaAuditArea>();
  var nameLha = ''.obs;
  var branchLha = ''.obs;
  var startDateLha = ''.obs;
  var endDateLha = ''.obs;

  //master
  final RxList<DataUsers> usersAuditArea = <DataUsers>[].obs;
  final RxList<DataListBranch> branchAuditArea = <DataListBranch>[].obs;
  final RxList<DataCaseAuditArea> caseAuditArea = <DataCaseAuditArea>[].obs;
  final RxList<DataCaseCategory>caseCategory = <DataCaseCategory>[].obs;
  final RxList<DataCaseCategoryByIdAuditArea>caseCategoryById = <DataCaseCategoryByIdAuditArea>[].obs;
  final RxList<DataListPenaltyAuditArea> penaltyAuditArea = <DataListPenaltyAuditArea>[].obs;

  //kka
  var scheduleIdKka = Rxn<int>();
  final PagingController<int, ContentListKkaAuditArea> pagingControllerKkaAuditArea = PagingController(firstPageKey: 0);
  var detailKkaAuditArea = Rxn<DataDetailKkaAuditArea>();
  var nameKka = ''.obs;
  var branchKka = ''.obs;
  var startDateKka = ''.obs;
  var endDateKka = ''.obs;

  //clarification
  final PagingController<int, ContentListClarificationAuditArea> pagingControllerClarificationAuditArea = PagingController(firstPageKey: 0);
  var detailClarificationAuditArea = Rxn<DataDetailClarificationAuditArea>();
  var nameCla = ''.obs;
  var branchCla = ''.obs;
  var startDateCla = ''.obs;
  var endDateCla = ''.obs;

  //follow up
  final PagingController<int, ContentListFollowUp> pagingControllerFollowUp = PagingController(firstPageKey: 0);
  var detailFollowUpAuditArea = Rxn<DataDetailFollowUp>();
  var nameFollowUp = ''.obs;
  var branchFollowUp = ''.obs;
  var startDateFollowUp = ''.obs;
  var endDateFollowUp= ''.obs;

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
    pagingControllerReschedule.addPageRequestListener(loadReschedulesAuditArea);
    pagingControllerLhaRevisi.addPageRequestListener(loadRevisiLha);
    pagingControllerLhaAuditArea.addPageRequestListener(loadLhaAuditArea);
    pagingControllerKkaAuditArea.addPageRequestListener(loadKkaAuditArea);
    pagingControllerClarificationAuditArea.addPageRequestListener(loadClarificationAuditArea);
    pagingControllerFollowUp.addPageRequestListener(loadFollowUpAuditArea);
    loadUsersAuditArea();
    loadBranchAuditArea();
    loadCaseAuditArea();
    loadCaseCategory();
    loadBapAuditArea();
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
      final mainSchedule = await repository.getMainSchedulesAuditArea(page, nameMainSchedule.value, branchMainSchedule.value, startDateMainSchedule.value, endDateMainSchedule.value);
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

  void filterMainSchedule(String name, String branch, String startDate, String endDate)async{
    nameMainSchedule.value = name;
    branchMainSchedule.value = branch;
    startDateMainSchedule.value = startDate;
    endDateMainSchedule.value = endDate;
    pagingControllerMainSchedule.refresh();
  }

  void resetFilterMainSchedule()async{
    nameMainSchedule.value = '';
    branchMainSchedule.value = '';
    startDateMainSchedule.value = '';
    endDateMainSchedule.value = '';
    pagingControllerMainSchedule.refresh();
  }

  void getDetailMainScheduleAuditArea(int id)async{
    try {
      final detail = await repository.getDetailMainScheduleAuditArea(id);
      detailMainScheduleAuditArea.value = detail.data;
    } catch (e) {
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

  void deleteSpecialSchedule(int id)async{
    try {
      final delete = await repository.deleteSpecialSchedule(id);
      message.value = delete.message.toString();
      pagingControllerSpecialSchedule.refresh();
    } catch (e) {
      throw Exception(e);
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
      final specialSchedule = await repository.getSpecialSchedulesAuditArea(page, nameSpecialSchedule.value, branchSpecialSchedule.value, startDateSpecialSchedule.value, endDateSpecialSchedule.value);
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
      final editSpecialSchedule = await repository.editSpecialSchedule(id, userId, branchId, startDate, endDate, description);
      message.value = editSpecialSchedule.message.toString();
    } catch (e) {
      throw Exception(e);
    }
  }

  void getDetailSpecialScheduleAuditArea(int id)async{
    try {
      final detail = await repository.getDetailSpecialScheduleAuditArea(id);
      detailSpecialScheduleAuditArea.value = detail.data;
    } catch (e) {
      throw Exception(e);
    }
  }

  void filterSpecialSchedule(String name, String branch, String startDate, String endDate)async{
    nameSpecialSchedule.value = name;
    branchSpecialSchedule.value = branch;
    startDateSpecialSchedule.value = startDate;
    endDateSpecialSchedule.value = endDate;
    pagingControllerSpecialSchedule.refresh();
  }

  void resetFilterSpecialSchedule()async{
    nameSpecialSchedule.value = '';
    branchSpecialSchedule.value = '';
    startDateSpecialSchedule.value = '';
    endDateSpecialSchedule.value = '';
    pagingControllerSpecialSchedule.refresh();
  }

  //reschedule
  void requestReschedule(int userId, int scheduleId, int branchId, String startDate, String endDate, String desc)async{
    try{     
      final reschedule = await repository.requestReschedule(userId, scheduleId, branchId, startDate, endDate, desc);
      message.value = reschedule.message.toString();
    }catch(error){
      throw Exception(error);
    }
  }

  void loadReschedulesAuditArea(int page)async {
   try {
     final reschedule = await repository.getReschedulesAuditArea(page, nameReschedule.value, branchReschedule.value, startDateReschedule.value, endDateReschedule.value);
     final schedule = reschedule.data!.content;
     final isLastPage = schedule!.length < 10;
     if (isLastPage) {
       pagingControllerReschedule.appendLastPage(schedule);
     } else {
       final nextPage = page + 1;
       pagingControllerReschedule.appendPage(schedule, nextPage);
     }
   } catch (e) {
     pagingControllerReschedule.error = e;
     throw Exception(e);
   } 
}

void getDetailRescheduleAuditArea(int id)async{
    try {
      final detail = await repository.getDetailRescheduleAuditArea(id);
      detailRescheduleAuditArea.value = detail.data;
    } catch (e) {
      throw Exception(e);
    }
  }

  void filterReschedule(String name, String branch, String startDate, String endDate)async{
    nameReschedule.value = name;
    branchReschedule.value = branch;
    startDateReschedule.value = startDate;
    endDateReschedule.value = endDate;
    pagingControllerReschedule.refresh();
  }

  void resetFilterReschedule()async{
    nameReschedule.value = '';
    branchReschedule.value = '';
    startDateReschedule.value = '';
    endDateReschedule.value = '';
    pagingControllerReschedule.refresh();
  }

  //master
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

  void loadCaseAuditArea()async{
    try {
      final cases = await repository.getCaseAuditArea();
      caseAuditArea.assignAll(cases.data ?? []);
    } catch (e) {
      throw Exception(e);
    }
  }

  void loadCaseCategory()async{
    try {
      final cases = await repository.getCaseCategoryAuditArea();
      caseCategory.assignAll(cases.data ?? []);
    } catch (e) {
      throw Exception(e);
    }
  }

  void loadCaseCategoryById(int casesId)async{
    try {
      final cases = await repository.getCaseCategoryByIdAuditArea(casesId);
      caseCategoryById.assignAll(cases.data ?? []);
    } catch (e) {
      throw Exception(e);
    }
  }

  //LHA
  void loadRevisiLha(int page)async{
    try {
      final revisiLha = await repository.getRevisiLhaAuditArea(lhaId.value!, page);
      final lha = revisiLha.data!.lhaDetails;
      final isLastPage = lha!.length < 10;
      if (isLastPage) {
        pagingControllerLhaRevisi.appendLastPage(lha);
      } else {
        final nextPage = page + 1;
        pagingControllerLhaRevisi.appendPage(lha, nextPage);
      }
    } catch (e) {
      pagingControllerLhaRevisi.error = e;
      throw Exception(e);
    }
  }

  void revisiLha(int lhaId, int caseId, int caseCategoryId, String desc, String suggest, String tempRec, String perRec, int isResearch)async{
    try {
      final revisiLha = await repository.revisiLha(lhaId, caseId, caseCategoryId, desc, suggest, tempRec, perRec, isResearch);
      message.value = revisiLha.message.toString();
    } catch (e) {
      throw Exception(e);
    }
  }

  void loadDetailRevisionLha(int lhaId)async{
    try {
      final detailRevision = await repository.getDetailRevisionLha(lhaId);
      detailRevisonLha.value = detailRevision.data;
    } catch (e) {
      throw Exception(e);
    }
  }

  void loadLhaAuditArea(int page)async{
    try {
      final lhaAuditArea = await repository.getLhaAuditArea(page, scheduleIdLha.value!, nameLha.value, branchLha.value, startDateLha.value, endDateLha.value);
      final lha = lhaAuditArea.data!.content;
      final isLastPage = lha!.length < 20;
      if (isLastPage) {
        pagingControllerLhaAuditArea.appendLastPage(lha);
      }else{
        final nextPage = page + 1;
        pagingControllerLhaAuditArea.appendPage(lha, nextPage);
      }
    } catch (e) {
      pagingControllerLhaAuditArea.error = e;
      throw Exception(e);
    }
  }

  void getDetailLhaAuditArea(int id)async{
    try{
      final lha = await repository.getDetailLhaAuditArea(id);
      detailLhaAuditArea.value = lha.data;
    }catch(error){
      throw Exception(error);
    }
  }

  void filterLhaAuditArea(String name, String branch, String startDate, String endDate)async{
    nameLha.value = name;
    branchLha.value = branch;
    startDateLha.value = startDate;
    endDateLha.value = endDate;
    pagingControllerLhaAuditArea.refresh();
  }

  void resetFilterLha()async{
    nameLha.value = '';
    branchLha.value = '';
    startDateLha.value = '';
    endDateLha.value = '';
    pagingControllerLhaAuditArea.refresh();
  }

  //clarification
  void loadClarificationAuditArea(int page) async{
    try {
      final clarificationAuditArea = await repository.getClarificationAuditArea(page, nameCla.value, branchCla.value, startDateCla.value, endDateCla.value);
      final clarification = clarificationAuditArea.data!.content;
      final isLastPage = clarification!.length < 10;
      if (isLastPage) {
        pagingControllerClarificationAuditArea.appendLastPage(clarification);
      } else {
        final nextPage = page + 1;
        pagingControllerClarificationAuditArea.appendPage(clarification, nextPage);
      }
    } catch (e) {
      pagingControllerClarificationAuditArea.error = e;
      throw Exception(e);
    }
  }

  void getDetailClarificationAuditArea(int id)async{
    try{
      final detail = await repository.getDetailClarificationAuditArea(id);
      detailClarificationAuditArea.value = detail.data;
    }catch(error){
      throw Exception(error);
    }
  }

  void filterClarificationAuditArea(String name, String branch, String startDate, String endDate)async{
    nameCla.value = name;
    branchCla.value = branch;
    startDateCla.value = startDate;
    endDateCla.value = endDate;
    pagingControllerClarificationAuditArea.refresh();
  }

  void resetFilterClarification()async{
    nameCla.value = '';
    branchCla.value = '';
    startDateCla.value = '';
    endDateCla.value = '';
    pagingControllerClarificationAuditArea.refresh();
  }

  //KKA
  void loadKkaAuditArea(int page)async{
    try {
      final kkaAuditArea = await repository.getKkaAuditArea(page, scheduleIdKka.value!, nameKka.value, branchKka.value, startDateKka.value, endDateKka.value);
      final kka = kkaAuditArea.data!.content;
      final isLastPage = kka!.length < 10;
      if (isLastPage) {
        pagingControllerKkaAuditArea.appendLastPage(kka);
      } else {
        final nextPage = page + 1;
        pagingControllerKkaAuditArea.appendPage(kka, nextPage);
      }
    } catch (e) {
      pagingControllerKkaAuditArea.error = e;
      throw Exception(e);
    }
  }

  void getDetailKkaAuditArea(int id)async{
    try {
      final detailKka = await repository.getDetailKkaAuditArea(id);
      detailKkaAuditArea.value = detailKka.data;
    } catch (error) {
      throw Exception(error);
    }
  }

  void filterkkaAuditArea(String name, String branch, String startDate, String endDate)async{
    nameKka.value = name;
    branchKka.value = branch;
    startDateKka.value = startDate;
    endDateKka.value = endDate;
    pagingControllerKkaAuditArea.refresh();
  }

  void resetFilterKka()async{
    nameKka.value = '';
    branchKka.value = '';
    startDateKka.value = '';
    endDateKka.value = '';
    pagingControllerKkaAuditArea.refresh();
  }
  
  //BAP
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
  
  void loadFollowUpAuditArea(int page)async {
    try {
      final followUpAuditArea = await repository.getFollowUpAuditArea(page, nameFollowUp.value, 
      branchFollowUp.value, startDateFollowUp.value, endDateFollowUp.value);
      final followUp = followUpAuditArea.data!.content;
      final isLastPage = followUp!.length < 10;
      if (isLastPage) {
        pagingControllerFollowUp.appendLastPage(followUp);
      } else {
        final nextPage = page + 1;
        pagingControllerFollowUp.appendPage(followUp, nextPage);
      }
    } catch (e) {
      pagingControllerFollowUp.error = e;
      throw Exception(e);
    }
  }

  void filterDataFollowUpAuditArea(String name, String branch, String startDate, String endDate)async{
    nameFollowUp.value = name;
    branchFollowUp.value = branch;
    startDateFollowUp.value = startDate;
    endDateFollowUp.value = endDate;
    pagingControllerFollowUp.refresh();
  }

  void resetFilterFollowUp()async{
    nameFollowUp.value = '';
    branchFollowUp.value = '';
    startDateFollowUp.value = '';
    endDateFollowUp.value = '';
    pagingControllerFollowUp.refresh();
  }

  void inputFollowUpAuditArea(int followUpId, int penaltyId, String desc, int isPenalty)async{
    try{
      final inputFollowUp = await repository.inputFollowUpAuditArea(followUpId, penaltyId, desc, isPenalty);
      message.value = inputFollowUp.metadata.toString();
    }catch(error){
      throw Exception(error);
    }
  }
  
  void loadAttachmentAuditArea()async{
    try {
      final penalty = await repository.getPenaltyAuditArea();
      penaltyAuditArea.assignAll(penalty.data ?? []);
    } catch (error) {
      throw Exception(error);
    }
  }

  void getDetailFollowUpAuditArea(int id)async{
    try {
      final followUp = await repository.getDetailFollowUpAuditArea(id);
      detailFollowUpAuditArea.value = followUp.data;
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