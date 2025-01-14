import 'package:audit_cms/data/core/response/auditArea/clarification/response_detail_clarification_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/followUp/reponse_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/lha/model_body_input_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/lha/response_detail_cases_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/lha/response_detail_revision_lha.dart';
import 'package:audit_cms/data/core/response/auditArea/lha/response_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/bap/response_bap_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/clarification/response_clarification_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/bap/response_detail_bap_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/followUp/response_detail_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/kka/response_detail_kka_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/lha/response_detail_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/lha/response_list_case_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/lha/response_revisi_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_penalty_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_branch_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_case_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_case_category_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_users.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/model_body_add_schedules.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_detail_reschedule_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_detail_schedule_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_main_schedules_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_special_schedules_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/userPorfile/response_detail_user_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/kka/response_kka_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_reschedule_audit_area.dart';
import 'package:audit_cms/data/core/response/auditRegion/clarification/response_input_identification.dart';
import 'package:audit_cms/data/core/response/dashboard/response_dashboard_sop.dart';
import 'package:audit_cms/data/core/response/dashboard/response_division_dashboard.dart';
import 'package:audit_cms/data/core/response/dashboard/response_finding_dashboard.dart';
import 'package:audit_cms/data/core/response/dashboard/response_follow_up_dashboard.dart';
import 'package:audit_cms/data/core/response/dashboard/response_nominal_dashboard.dart';
import 'package:audit_cms/data/core/response/dashboard/response_total_dashboard.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:file_picker/file_picker.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import '../../core/repositories/repositories.dart';

class ControllerAuditArea extends GetxController{

  final Repositories repository;
  ControllerAuditArea(this.repository);

  //main schedule
  final PagingController<int, ContentMainScheduleAuditArea> pagingControllerMainSchedule = PagingController(firstPageKey: 0);
  final RxList<ModelBodySchedulesAuditArea> dataListLocalMainSchedulesAuditArea = RxList<ModelBodySchedulesAuditArea>();
  var detailMainScheduleAuditArea =  Rxn<DataDetailScheduleAuditArea>();
  var nameMainSchedule = ''.obs;
  var branchIdMainSchedule = RxnInt();
  var startDateMainSchedule = ''.obs;
  var endDateMainSchedule = ''.obs;

  //special schedule
  final PagingController<int, ContentSpecialScheduleAuditArea> pagingControllerSpecialSchedule = PagingController(firstPageKey: 0);
  final RxList<ModelBodySchedulesAuditArea> dataListLocalSpecialSchedulesAuditArea = RxList<ModelBodySchedulesAuditArea>();
  var detailSpecialScheduleAuditArea =  Rxn<DataDetailScheduleAuditArea>();
  var nameSpecialSchedule = ''.obs;
  var branchSpecialSchedule = RxnInt();
  var startDateSpecialSchedule = ''.obs;
  var endDateSpecialSchedule = ''.obs;

  //reschedule
  final PagingController<int, ContentListRescheduleAuditArea> pagingControllerReschedule = PagingController(firstPageKey: 0);
  final RxList<ModelBodySchedulesAuditArea> dataListLocalReschedulesAuditArea = RxList<ModelBodySchedulesAuditArea>();
  var detailRescheduleAuditArea = Rxn<DataDetailRescheduleAuditArea>();
  var nameReschedule = ''.obs;
  var branchReschedule = RxnInt();
  var startDateReschedule = ''.obs;
  var endDateReschedule = ''.obs;

  //lha
  var lhaId = Rxn<int>();
  var scheduleIdLha = Rxn<int>();
  final PagingController<int, ContentListLhaAuditArea> pagingControllerLhaAuditArea = PagingController(firstPageKey: 0);
  final PagingController<int, LhaDetails>pagingControllerListCase = PagingController(firstPageKey: 0);
  final RxList<DataRevisiLha> lhaRevision = <DataRevisiLha>[].obs;
  final RxList<LhaDetailArea> dataListLocalLhaAuditArea = RxList<LhaDetailArea>();
  var detailCase = Rxn<DataDetailCasesLha>();
  var detailRevisionLha = Rxn<DataDetailRevision>();
  var detailLhaAuditArea = Rxn<DataDetailLhaAuditArea>();
  var nameLha = ''.obs;
  var branchLha = RxnInt();
  var startDateLha = ''.obs;
  var endDateLha = ''.obs;

  //master
  final RxList<DataUsers> usersAuditArea = <DataUsers>[].obs;
  final RxList<DataListBranch> branchAuditArea = <DataListBranch>[].obs;
  final RxList<DataListBranch> branchForFilterAuditArea = <DataListBranch>[].obs;
  final RxList<DataCaseAuditArea> caseAuditArea = <DataCaseAuditArea>[].obs;
  final RxList<DataCaseCategory>caseCategory = <DataCaseCategory>[].obs;
  final RxList<DataListPenaltyAuditArea> penaltyAuditArea = <DataListPenaltyAuditArea>[].obs;
  final RxList<DataListPenaltyAuditArea> recommendationListAuditArea = <DataListPenaltyAuditArea>[].obs;

  //kka
  var scheduleIdKka = Rxn<int>();
  final PagingController<int, ContentListKkaAuditArea> pagingControllerKkaAuditArea = PagingController(firstPageKey: 0);
  var detailKkaAuditArea = Rxn<DataDetailKkaAuditArea>();
  var nameKka = ''.obs;
  var branchKka = RxnInt();
  var startDateKka = ''.obs;
  var endDateKka = ''.obs;

  //clarification
  final PagingController<int, ContentListClarificationAuditArea> pagingControllerClarificationAuditArea = PagingController(firstPageKey: 0);
  var detailClarificationAuditArea = Rxn<DataDetailClarificationAuditArea>();
  var nameCla = ''.obs;
  var branchCla = RxnInt();
  var startDateCla = ''.obs;
  var endDateCla = ''.obs;

  //follow up
  final PagingController<int, ContentListFollowUp> pagingControllerFollowUp = PagingController(firstPageKey: 0);
  var detailFollowUpAuditArea = Rxn<DataDetailFollowUp>();
  var nameFollowUp = ''.obs;
  var branchFollowUp = RxnInt();
  var startDateFollowUp = ''.obs;
  var endDateFollowUp= ''.obs;

  //bap
  final PagingController<int, ContentListBapAuditArea> pagingControllerBapAuditArea = PagingController(firstPageKey: 0);
  var detailBapAuditArea = Rxn<DataDetailBapAuditArea>();
  var nameBap = ''.obs;
  var branchBap = RxnInt();
  var startDateBap = ''.obs;
  var endDateBap = ''.obs;

  //report
  var branchIdReport = RxnInt();

  //profile
  var detailUserAuditArea = Rxn<DataProfile>();

  var isLoading = true.obs;
  var message = ''.obs;

  //dashboard
  final RxList<ChartFollowUp>followUpDashboard = <ChartFollowUp>[].obs;
  final RxList<ChartFindings>findingsDashboard = <ChartFindings>[].obs;
  final RxList<ChartNominal>nominalDashboard = <ChartNominal>[].obs;
  final RxList<ChartDivision>divisionDashboard = <ChartDivision>[].obs;
  final RxList<ChartSop>chartSop = <ChartSop>[].obs;
  var summary = Rxn<Summary>();
  var rangkings = Rxn<Rankings>();

  @override
  void onInit(){
    pagingControllerMainSchedule.addPageRequestListener(loadMainSchedule);
    pagingControllerSpecialSchedule.addPageRequestListener(loadSpecialSchedule);
    pagingControllerReschedule.addPageRequestListener(loadReschedulesAuditArea);
    pagingControllerLhaAuditArea.addPageRequestListener(loadLhaAuditArea);
    pagingControllerKkaAuditArea.addPageRequestListener(loadKkaAuditArea);
    pagingControllerClarificationAuditArea.addPageRequestListener(loadClarificationAuditArea);
    pagingControllerFollowUp.addPageRequestListener(loadFollowUpAuditArea);
    pagingControllerBapAuditArea.addPageRequestListener(loadBapAuditArea);
    loadUsersAuditArea();
    loadCaseAuditArea();
    loadPenalty();
    loadBranchForFilterDataAuditArea();
    loadRecommendation();
    getFollowUpDashboard();
    getFindingDashboard();
    getNominalDashboard();
    getDivisionDashboard();
    getSummary();
    getRangking();
    getDashboardSop();
    super.onInit();
  }

  @override
  void dispose() {
    pagingControllerMainSchedule.dispose();
    pagingControllerSpecialSchedule.dispose();
    pagingControllerReschedule.dispose();
    pagingControllerLhaAuditArea.dispose();
    pagingControllerKkaAuditArea.dispose();
    pagingControllerClarificationAuditArea.dispose();
    pagingControllerFollowUp.dispose();
    pagingControllerBapAuditArea.dispose();
    super.dispose();
  }

  //main shedule
  void addLocalDataMainSchedule(int? auditor, int? branch, String startDate, String endDate, String desc, String? branchName, String? userName)async {
    final newData = ModelBodySchedulesAuditArea(
      userId: auditor,
      branchId: branch, 
      startDate: startDate, 
      endDate: endDate,
      description: desc,
      branch: DataListBranch(name: branchName),
      user: DataUsers(fullname: userName)
      );
    dataListLocalMainSchedulesAuditArea.add(newData);
  }

   void deleteLocalDataMainSchedule(int auditor)async{
    final index = dataListLocalMainSchedulesAuditArea.indexWhere((items) => items.userId == auditor);
    if(index != -1){
      dataListLocalMainSchedulesAuditArea.removeAt(index);
    }
  }

  void addMainSchedules()async{
    try{     
      await repository.addMainSchedules(dataListLocalMainSchedulesAuditArea.toList());
      pagingControllerMainSchedule.refresh();
      dataListLocalMainSchedulesAuditArea.clear();
    }catch(error){
      dataListLocalMainSchedulesAuditArea.clear();
      throw Exception(error);
    }
  }

  void editMainSchedule(int id, int userId, int branchId, String startDate, String endDate, String description)async{
    try {
      await repository.editMainSchedule(id, userId, branchId, startDate, endDate, description);
      pagingControllerMainSchedule.refresh();
    } catch (e) {
      throw Exception(e);
    }
  }
  
  void deleteMainSchedule(int id)async{
    try {
      await repository.deleteMainSchedule(id);
      pagingControllerMainSchedule.refresh();
    } catch (e) {
      throw Exception(e);
    }
  }

  void loadMainSchedule(int page)async{
    try {
      final mainSchedule = await repository.getMainSchedulesAuditArea(page, nameMainSchedule.value, branchIdMainSchedule.value, startDateMainSchedule.value, endDateMainSchedule.value);
      final schedule = mainSchedule.data!.content;
      final isLastPage = schedule!.length < 10;
      if (isLastPage) {
        pagingControllerMainSchedule.appendLastPage(schedule);
      } else {
        final nextPage = page + 1;
        pagingControllerMainSchedule.appendPage(schedule, nextPage);
      }
    } catch (e) {
      if (e is Error) {
        pagingControllerMainSchedule.appendPage([], null);
      }else {
        pagingControllerMainSchedule.error = e;
        throw Exception(e);
      }
    }
  }

  void filterMainSchedule(String name, int? branchId, String startDate, String endDate)async{
    nameMainSchedule.value = name;
    branchIdMainSchedule.value = branchId;
    startDateMainSchedule.value = startDate;
    endDateMainSchedule.value = endDate;
    pagingControllerMainSchedule.refresh();
  }

  void resetFilterMainSchedule()async{
    nameMainSchedule.value = '';
    branchIdMainSchedule.value = null;
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
  void addLocalDataSpecialSchedule(int? auditor, int? branch, String startDate, String endDate, String desc, String? nameBranch, String? name)async {
    final newData = ModelBodySchedulesAuditArea(
      userId: auditor,
      branchId: branch, 
      startDate: startDate, 
      endDate: endDate,
      description: desc,
      branch: DataListBranch(name: nameBranch),
      user: DataUsers(fullname: name)
      );
    dataListLocalSpecialSchedulesAuditArea.add(newData);
  }

   void deleteLocalDataSpecialSchedule(int auditor)async{
    final index = dataListLocalSpecialSchedulesAuditArea.indexWhere((items) => items.userId == auditor);
    if(index != -1){
      dataListLocalSpecialSchedulesAuditArea.removeAt(index);
    }
  }

  void addSpecialSchedules()async{
    try{     
      await repository.addSpecialSchedules(dataListLocalSpecialSchedulesAuditArea.toList());
      pagingControllerSpecialSchedule.refresh();
      pagingControllerReschedule.refresh();
      pagingControllerMainSchedule.refresh();
      dataListLocalSpecialSchedulesAuditArea.clear();
    }catch(error){
      dataListLocalSpecialSchedulesAuditArea.clear();
      throw Exception(error);
    }
  }

  void deleteSpecialSchedule(int id)async{
    try {
      await repository.deleteSpecialSchedule(id);
      pagingControllerSpecialSchedule.refresh();
    } catch (e) {
      throw Exception(e);
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
      if (e is Error) {
        pagingControllerSpecialSchedule.appendPage([], null);
      }else {
        pagingControllerSpecialSchedule.error = e;
        throw Exception(e);
      }
    }
  }

  void editSpecialSchedule(int id, int userId, int branchId, String startDate, String endDate, String description)async{
    try {
      await repository.editSpecialSchedule(id, userId, branchId, startDate, endDate, description);
      pagingControllerSpecialSchedule.refresh();
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

  void filterSpecialSchedule(String name, int? branch, String startDate, String endDate)async{
    nameSpecialSchedule.value = name;
    branchSpecialSchedule.value = branch;
    startDateSpecialSchedule.value = startDate;
    endDateSpecialSchedule.value = endDate;
    pagingControllerSpecialSchedule.refresh();
  }

  void resetFilterSpecialSchedule()async{
    nameSpecialSchedule.value = '';
    branchSpecialSchedule.value = null;
    startDateSpecialSchedule.value = '';
    endDateSpecialSchedule.value = '';
    pagingControllerSpecialSchedule.refresh();
  }

  //reschedules
  void requestReschedule(int? userId, int scheduleId, int? branchId, String startDate, String endDate, String desc)async{
    try{     
      await repository.requestReschedule(userId, scheduleId, branchId, startDate, endDate, desc);
      pagingControllerReschedule.refresh();
      pagingControllerMainSchedule.refresh();
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
     if (e is Error) {
        pagingControllerReschedule.appendPage([], null);
      }else {
        pagingControllerReschedule.error = e;
        throw Exception(e);
      }
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

  void filterReschedule(String name, int? branch, String startDate, String endDate)async{
    nameReschedule.value = name;
    branchReschedule.value = branch;
    startDateReschedule.value = startDate;
    endDateReschedule.value = endDate;
    pagingControllerReschedule.refresh();
  }

  void resetFilterReschedule()async{
    nameReschedule.value = '';
    branchReschedule.value = null;
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

  void loadBranchByUserIdAuditArea(int? userId)async {
    try{
      final responseBranch = await repository.getBranchByUserIdAuditArea(userId);
      branchAuditArea.assignAll(responseBranch.data ?? []);
    }catch(error){
      throw Exception(error);
    }
  }

  void loadBranchForFilterDataAuditArea()async{
    try{
      final responseBranch = await repository.getBranchForFilterDataAuditArea();
      branchForFilterAuditArea.assignAll(responseBranch.data ?? []);
    }catch(error){
      throw Exception(error);
    }
  }
  var branchId = RxnInt();
   void selectBranch(int? value)async{
    branchId.value = value;
  }

  void loadCaseAuditArea()async{
    try {
      final cases = await repository.getCaseAuditArea();
      caseAuditArea.assignAll(cases.data ?? []);
    } catch (e) {
      throw Exception(e);
    }
  }
   var caseId = RxnInt();
  void selectCase(int? value)async{
    caseId.value = value;
}

  var caseCategoryId = RxnInt();
  void loadCaseCategory(int? caseId)async{
    try {
      final cases = await repository.getCaseCategoryAuditArea(caseId);
      caseCategory.assignAll(cases.data ?? []);
    } catch (e) {
      throw Exception(e);
    }
  }

  void selectCaseCategory(int? value)async{
    caseCategoryId.value = value;
}

  //LHA
  void addToLocalLhaAuditArea(int? caseId, int? caseCategoryId, String description, String suggestion, String temporaryRecommendation, 
  String permanentRecommendation, int research, String? caseName, String? caseCategoryName)async{

    final newDataLha = LhaDetailArea(
      caseId: caseId,
      caseCategoryId: caseCategoryId,
      description: description,
      suggestion: suggestion,
      temporaryRecommendation: temporaryRecommendation,
      permanentRecommendation: permanentRecommendation,
      research: research,
      caseName: DataCaseAuditArea(name: caseName),
      caseCategoryName: DataCaseCategory(name: caseCategoryName)
      
    );
    dataListLocalLhaAuditArea.add(newDataLha);
  }

   void deleteLocalLha(int caseId)async{
    final index = dataListLocalLhaAuditArea.indexWhere((items) => items.caseId == caseId);
    if(index != -1){
      dataListLocalLhaAuditArea.removeAt(index);
    }
  }

  void inputLhaAuditArea(int scheduleId)async{
    try {
      await repository.inputLhaAuditArea(scheduleId, dataListLocalLhaAuditArea.toList());
      pagingControllerClarificationAuditArea.refresh();
      getDetailSpecialScheduleAuditArea(scheduleId);
      getDetailMainScheduleAuditArea(scheduleId);
      dataListLocalLhaAuditArea.clear();
    } catch (error) {
      dataListLocalLhaAuditArea.clear();
      throw Exception(error);
    }
  }

  void inputCaseLhaAuditRegion(int lhaDetailId, int? caseId, int? caseCategory, String desc,
    String suggestion, String tempRec, String perRec, int isResearch)async{
    try {
      await repository.inputCaseLhaAuditRegion(lhaDetailId, caseId, caseCategory, desc, suggestion, tempRec, perRec, isResearch);
      getDetailLhaAuditArea(lhaDetailId);
      pagingControllerClarificationAuditArea.refresh();
    } catch (error) {
      throw Exception(error);
    }
  }

  void loadRevisiLha(int? lhaDetailId)async{
    try {
      final revisiLha = await repository.getRevisiLhaAuditArea(lhaDetailId);
      lhaRevision.assignAll(revisiLha.data ?? []);
    } catch (e) {
      throw Exception(e);
    }
  }

  void deletCaseLha(int? lhaDetailId)async{
    try {
      await repository.deletCaseLha(lhaDetailId);
      getDetailLhaAuditArea(lhaId.value);
    } catch (e) {
      throw Exception(e);
    }
  }

  void revisiLha(int? lhaDetailId, String desc, String suggest, String tempRec, String perRec)async{
    try {
      await repository.revisiLha(lhaDetailId, desc, suggest, tempRec, perRec);
      loadRevisiLha(lhaDetailId);
      lhaRevision.refresh();
      getDetailCaseLhaAuditArea(lhaDetailId);
      getDetailLhaAuditArea(lhaId.value);
    } catch (e) {
      throw Exception(e);
    }
  }

  void sendCaseLha(int? lhaDetailId)async{
    try {
      await repository.sendCaseLha(lhaDetailId);
      getDetailCaseLhaAuditArea(lhaDetailId);
      getDetailLhaAuditArea(lhaId.value);
    } catch (e) {
      throw Exception(e);
    }
  }

  void getDetailRevision(int caseId)async{
    try {
      final detailRevision = await repository.getDetailRevisionLhaAuditArea(caseId);
      detailRevisionLha.value = detailRevision.data;
    } catch (e) {
      throw Exception(e);
    }
  }

  void getDetailCaseLhaAuditArea(int? caseId)async{
    try {
      final detailCases = await repository.getDetailCaseLhaAuditArea(caseId);
      detailCase.value = detailCases.data;
    } catch (e) {
      throw Exception(e);
    }
  }

  void getDetailLhaAuditArea(int? id)async{
    try{
      final lha = await repository.getDetailLhaAuditArea(id);
      detailLhaAuditArea.value = lha.data;
    }catch(error){
      throw Exception(error);
    }
  }

  void loadLhaAuditArea(int page)async{
    final now = DateTime.now();
    final formatter = DateFormat('yyyy-MM-dd');
    final today = formatter.format(now);
    try {
      if(startDateLha.value.isEmpty && endDateLha.value.isEmpty){
        final lhaAuditArea = await repository.getLhaAuditArea(page, nameLha.value, branchLha.value, today, today);
        final lha = lhaAuditArea.data!.content;
        final isLastPage = lha!.length < 10;
        if (isLastPage) {
          pagingControllerLhaAuditArea.appendLastPage(lha);
        }else{
          final nextPage = page + 1;
          pagingControllerLhaAuditArea.appendPage(lha, nextPage);
        }
      }else{
        final lhaAuditArea = await repository.getLhaAuditArea(page, nameLha.value, branchLha.value, startDateLha.value, endDateLha.value);
        final lha = lhaAuditArea.data!.content;
        final isLastPage = lha!.length < 10;
        if (isLastPage) {
          pagingControllerLhaAuditArea.appendLastPage(lha);
        }else{
          final nextPage = page + 1;
          pagingControllerLhaAuditArea.appendPage(lha, nextPage);
        }
      }
    } catch (e) {
      if (e is Error) {
        pagingControllerLhaAuditArea.appendPage([], null);
      } else {
        pagingControllerLhaAuditArea.error = e;
        throw Exception(e);
      }
    }
  }

  

  void filterLhaAuditArea(String name, int? branch, String startDate, String endDate)async{
    nameLha.value = name;
    branchLha.value = branch;
    startDateLha.value = startDate;
    endDateLha.value = endDate;
    pagingControllerLhaAuditArea.refresh();
  }

  void resetFilterLha()async{
    nameLha.value = '';
    branchLha.value = null;
    startDateLha.value = '';
    endDateLha.value = '';
    pagingControllerLhaAuditArea.refresh();
  }

  var selectedFileName = ''.obs;

  //clarification
  void generateClarification()async{
    try {
      await repository.generateClarification(caseId.value, caseCategoryId.value, branchId.value);
      pagingControllerClarificationAuditArea.refresh();
    } catch (e) {
      throw Exception(e);
    }
  }

  void uploadClarificationAuditArea(String filePath, int id)async{
    try {
      await repository.uploadClarificationAuditRegion(filePath, id);
      pagingControllerClarificationAuditArea.refresh();
      selectedFileName.value = '';
    } catch (error) {
      selectedFileName.value = '';
      throw Exception(error);
    }
  }

  void pickFileClarificationAuditArea() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      String filePath = result.files.single.path!;
      selectedFileName.value = result.files.single.name;
      selectedFileName.value = filePath;
      } else {
      selectedFileName.value = '';
    }
  }
  
  void inputClarificationAuditArea(int clarificationId, String evaluationLimitation, String location, String auditee, String auditeeLeader,
    String description, String priority)async {
    try {
      await repository.inputClarificationAuditRegion(clarificationId, evaluationLimitation, location, auditee, auditeeLeader,
       description, priority);
       pagingControllerClarificationAuditArea.refresh();
       
    } catch (error) {
      throw Exception(error);
    }
  }

  var dataInputIdentification = Rxn<DataIdentification>();
  var bapId = RxnInt();
  RxList<int>recommendation = RxList<int>();
   void inputIdentificatinClarificationAuditArea(int clarificationId, int evaluationClarification, num loss, int followUp)async{
    try {
      final response = await repository.inputIdentificationClarificationAuditRegion(clarificationId, evaluationClarification, loss, recommendation, followUp);
      dataInputIdentification.value = response.data;
      bapId.value = dataInputIdentification.value?.bap?.id;
      getDetailBapAuditArea(bapId.value);
      pagingControllerClarificationAuditArea.refresh();
      pagingControllerBapAuditArea.refresh();
      pagingControllerFollowUp.refresh();
      recommendation.clear();
    } catch (error) {
      recommendation.clear();
      throw Exception(error);
    }
  }

  void addRecommendation(int? recommendationId, String? name)async{
    recommendation.add(recommendationId!);
  }

  void loadRecommendation()async{
    try {
      final recommendation = await repository.getPenaltyAuditArea();
      recommendationListAuditArea.assignAll(recommendation.data ?? []);
    } catch (error) {
      throw Exception(error);
    }
  }

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
      if (e is Error) {
        pagingControllerClarificationAuditArea.appendPage([], null);
      }else{
        pagingControllerClarificationAuditArea.error = e;
        throw Exception(e);
      }
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

  void filterClarificationAuditArea(String name, int? branch, String startDate, String endDate)async{
    nameCla.value = name;
    branchCla.value = branch;
    startDateCla.value = startDate;
    endDateCla.value = endDate;
    pagingControllerClarificationAuditArea.refresh();
  }

  void resetFilterClarification()async{
    nameCla.value = '';
    branchCla.value = null;
    startDateCla.value = '';
    endDateCla.value = '';
    pagingControllerClarificationAuditArea.refresh();
  }

  //KKA
  void loadKkaAuditArea(int page)async{
    try {
      final kkaAuditArea = await repository.getKkaAuditArea(page, scheduleIdKka.value, nameKka.value, branchKka.value, startDateKka.value, endDateKka.value);
      final kka = kkaAuditArea.data!.content;
      final isLastPage = kka!.length < 10;
      if (isLastPage) {
        pagingControllerKkaAuditArea.appendLastPage(kka);
      } else {
        final nextPage = page + 1;
        pagingControllerKkaAuditArea.appendPage(kka, nextPage);
      }
    } catch (e) {
      if (e is Error) {
        pagingControllerKkaAuditArea.appendPage([], null);
      }else {
        pagingControllerKkaAuditArea.error = e;
        throw Exception(e);
      }
    }
  }

  void uploadKkaAuditArea(String filePath, int id) async {
    try {
      await repository.uploadKkaAuditArea(filePath, id);
      pagingControllerKkaAuditArea.refresh();
      pagingControllerMainSchedule.refresh();
      pagingControllerSpecialSchedule.refresh();
      getDetailMainScheduleAuditArea(id);
      getDetailSpecialScheduleAuditArea(id);
      selectedFileName.value = '';
    } catch (error) {
      selectedFileName.value = '';
      throw Exception(error);
    }
  }

  void pickFileKkaAuditArea() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls'],
    );

    if (result != null) {
      String filePath = result.files.single.path!;
      selectedFileName.value = result.files.single.name;
      selectedFileName.value = filePath;
      } else {
      selectedFileName.value = '';
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

  void filterkkaAuditArea(String name, int? branchId, String startDate, String endDate)async{
    nameKka.value = name;
    branchKka.value = branchId;
    startDateKka.value = startDate;
    endDateKka.value = endDate;
    pagingControllerKkaAuditArea.refresh();
  }

  void resetFilterKka()async{
    nameKka.value = '';
    branchKka.value = null;
    startDateKka.value = '';
    endDateKka.value = '';
    pagingControllerKkaAuditArea.refresh();
  }
  
  //BAP
  void uploadBapAuditArea(String filePath, int? bapId)async{
    try {
      await repository.uploadBapAuditRegion(filePath, bapId);
      pagingControllerBapAuditArea.refresh();
      getDetailBapAuditArea(bapId);
      selectedFileName.value = '';
    } catch (error) {
      selectedFileName.value = '';
      throw Exception(error);
    }
  }

  void pickFileBapAuditArea() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      String filePath = result.files.single.path!;
      selectedFileName.value = result.files.single.name;
      selectedFileName.value = filePath;
      } else {
      selectedFileName.value = '';
    }
  }

  void loadBapAuditArea(int page) async{
    try {
      final bapAuditArea = await repository.getBapAuditArea(page, nameBap.value, branchBap.value, startDateBap.value, endDateBap.value);
      final bap = bapAuditArea.data!.content;
      final isLastPage = bap!.length < 10;
      if (isLastPage) {
        pagingControllerBapAuditArea.appendLastPage(bap);
      } else {
        final nextPage = page + 1;
        pagingControllerBapAuditArea.appendPage(bap, nextPage);
      }
    } catch (e) {
      if (e is Error) {
        pagingControllerBapAuditArea.appendPage([], null);
      }else {
        pagingControllerBapAuditArea.error = e;
        throw Exception(e);
      }
    }
  }

  void getDetailBapAuditArea(int? id)async{
    try {
      final responseDetail = await repository.getDetailBapAuditArea(id);
      detailBapAuditArea.value = responseDetail.data;
    } catch (error) {
      throw Exception(error);
    }
  }

  void filterBapAuditArea(String name, int? branchId, String startDate, String endDate)async{
    nameBap.value = name;
    branchBap.value = branchId;
    startDateBap.value = startDate;
    endDateBap.value = endDate;
    pagingControllerBapAuditArea.refresh();
  }

  void resetFilterBap()async{
    nameBap.value = '';
    branchBap.value = null;
    startDateBap.value = '';
    endDateBap.value = '';
    pagingControllerBapAuditArea.refresh();
  }

  //follow up
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
      if (e is Error) {
        pagingControllerFollowUp.appendPage([], null);
      }else {
        pagingControllerFollowUp.error = e;
        throw Exception(e);
      }
    }
  }

  void filterDataFollowUpAuditArea(String name, int? branch, String startDate, String endDate)async{
    nameFollowUp.value = name;
    branchFollowUp.value = branch;
    startDateFollowUp.value = startDate;
    endDateFollowUp.value = endDate;
    pagingControllerFollowUp.refresh();
  }

  void resetFilterFollowUp()async{
    nameFollowUp.value = '';
    branchFollowUp.value = null;
    startDateFollowUp.value = '';
    endDateFollowUp.value = '';
    pagingControllerFollowUp.refresh();
  }

  RxList<int>penaltyIdList = RxList<int>();

  void inputFollowUpAuditArea(int followUpId, String auditteeName, String auditeePosition, 
  String auditeeNip, String auditeeLeader, String auditeeLeader2, num charCoss, String desc)async{
    try{
      await repository.inputFollowUpAuditArea(followUpId, penaltyIdList, auditteeName, auditeePosition, auditeeNip, auditeeLeader, auditeeLeader2, charCoss, desc);
      pagingControllerFollowUp.refresh();
      penaltyIdList.clear();
    }catch(error){
      pagingControllerFollowUp.refresh();
      penaltyIdList.clear();
      throw Exception(error);
    }
  }

  void addPenalty(int? penaltyId, String? name)async{
    penaltyIdList.add(penaltyId!);
  }

  var followUpDetailId = RxnInt();
  void uploadFollowUp(String filePath, int? followUpId)async{
    try {
      await repository.uploadFollowUpAuditArea(filePath, followUpId);
      pagingControllerFollowUp.refresh();
      getDetailFollowUpAuditArea(followUpDetailId.value);
      selectedFileName.value = '';
    } catch (error) {
      selectedFileName.value = '';
      throw Exception(error);
    }
  }

  void pickFileFollowUpAuditArea() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      String filePath = result.files.single.path!;
      selectedFileName.value = result.files.single.name;
      selectedFileName.value = filePath;
      } else {
      selectedFileName.value = '';
    }
  }

  
  void loadPenalty()async{
    try {
      final penalty = await repository.getPenaltyAuditArea();
      penaltyAuditArea.assignAll(penalty.data ?? []);
    } catch (error) {
      throw Exception(error);
    }
  }

  void getDetailFollowUpAuditArea(int? id)async{
    try {
      final followUp = await repository.getDetailFollowUpAuditArea(id);
      detailFollowUpAuditArea.value = followUp.data;
    } catch (error) {
      throw Exception(error);
    }
  }

  //profile user
  void getDetailUserAuditArea()async{
    try {
      final profileArea = await repository.getDetailUserAuditArea();
      detailUserAuditArea.value = profileArea.data;
    } catch (error) {
      throw Exception(error);
    }
  }

  void editProfileUserAuditArea(String email, String fullName)async{
    try {
      await repository.editUserAuditArea(email, fullName);
      getDetailUserAuditArea();
    } catch (error) {
      throw Exception(error);
    }
  }

  void changePasswordAuditArea(String currentPassword, String newPassword)async{
    try {
      await repository.changePasswordAuditArea(currentPassword, newPassword);
      getDetailUserAuditArea();
    } catch (error) {
      throw Exception(error);
    }
  }

  //dashboard
  var months = List<int>.generate(12, (index) => index + 1);
  var years = List<int>.generate(20, (index) => DateTime.now().year - 10 + index);

  var selectedMonthDashboardClarification = DateTime.now().month.obs;
  var selectedYearDashboardClarification = DateTime.now().year.obs;

  void resetFilterDownloadDashboardClarification()async{
    selectedMonthDashboardClarification.value = DateTime.now().month;
    selectedYearDashboardClarification.value = DateTime.now().year;
  }

  var selectedMonthFollowUp = DateTime.now().month.obs;
  var selectedYearFollowUp = DateTime.now().year.obs;
  void getFollowUpDashboard()async{
    try {
      final followUp = await repository.getFollowUpDashboard(selectedMonthFollowUp.value, selectedYearFollowUp.value);
      followUpDashboard.assignAll(followUp.data?.chart ??[]);
    } catch (e) {
      throw Exception(e);
    }
  }

  List<PieChartSectionData> get followUpDataDashboard => followUpDashboard.map((item) {
    switch (item.status) {
          case 'OPEN':
            return PieChartSectionData(
              color: CustomColors.blue,
              value: item.total?.toDouble(),
              title: '${item.total} tdk lanjut',
              radius: 80,
              titleStyle: CustomStyles.textMediumWhite10Px
            );
          case 'CLOSE':
            return PieChartSectionData(
              color: CustomColors.red,
              value: item.total?.toDouble(),
              title: '${item.total} tdk lanjut',
              radius: 80,
              titleStyle: CustomStyles.textMediumWhite10Px
            );
          default:
            throw Error();
        }
  }).toList();

  void resetFilterDashboarFollowUp()async{
    selectedMonthFollowUp.value = DateTime.now().month;
    selectedYearFollowUp.value = DateTime.now().year;
  }
  
  var selectedYearFindings = DateTime.now().year.obs;
  void getFindingDashboard()async {
    try {
      final findings = await repository.getfindingsDashboard(selectedYearFindings.value);
      findingsDashboard.assignAll(findings.data?.chart ??[]);
    } catch (e) {
      throw Exception(e);
    }
  }

  void resetFilterDashboarFindings()async{
    selectedYearFindings.value = DateTime.now().year;
  }
  
  var selectedYearNominal = DateTime.now().year.obs;
  void getNominalDashboard()async {
    try {
      final nominal = await repository.getNominalsDashboard(selectedYearNominal.value);
      nominalDashboard.assignAll(nominal.data?.chart ??[]);
    } catch (e) {
      throw Exception(e);
    }
  }

  void resetFilterDashboarNominal()async{
    selectedYearNominal.value = DateTime.now().year;
  }
  
  var selectedMonthTotal = DateTime.now().month.obs;
  var selectedYearTotal = DateTime.now().year.obs;
  void getSummary()async{
    try {
      final totalDashboard = await repository.getTotalDashboard(selectedMonthTotal.value, selectedYearTotal.value);
      summary.value = totalDashboard.data?.summary;
    } catch (e) {
      throw Exception(e);
    }
  }

  void resetFilterDashboarTotal()async{
    selectedMonthTotal.value = DateTime.now().month;
    selectedYearTotal.value = DateTime.now().year;
  }

  void getRangking()async {
    try {
      final ranking = await repository.getTotalDashboard(selectedMonthTotal.value, selectedYearTotal.value);
      rangkings.value = ranking.data?.rankings;
    } catch (e) {
      throw Exception(e);
    }
  }
  
  var selectedMonthDivision = DateTime.now().month.obs;
  var selectedYearDivision = DateTime.now().year.obs;
  void getDivisionDashboard()async {
    try {
      final division = await repository.getDivisionDashboard(selectedMonthDivision.value, selectedYearDivision.value);
      divisionDashboard.assignAll(division.data?.chart ??[]);
    } catch (e) {
      throw Exception(e);
    }
  }

  void resetFilterDashboarDivision()async{
    selectedMonthDivision.value = DateTime.now().month;
    selectedYearDivision.value = DateTime.now().year;
  }

  var selectedMonthSop = DateTime.now().month.obs;
  var selectedYearSop = DateTime.now().year.obs;
  
  void getDashboardSop()async{
    try {
      final sop = await repository.getDashboardSop(selectedMonthSop.value, selectedYearSop.value);
      chartSop.assignAll(sop.data?.chart ?? []);
    } catch (e) {
      throw Exception(e);
    }
  }

  void resetFilterDashboarSop()async{
    selectedMonthSop.value = DateTime.now().month;
    selectedYearSop.value = DateTime.now().year;
  }
}