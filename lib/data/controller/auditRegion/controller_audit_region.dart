import 'package:audit_cms/data/core/repositories/repositories.dart';
import 'package:audit_cms/data/core/response/auditArea/followUp/reponse_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/followUp/response_detail_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/auditRegion/bap/response_bap_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/clarification/response_clarification_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/clarification/response_input_clarification.dart';
import 'package:audit_cms/data/core/response/auditRegion/clarification/response_input_identification.dart';
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
import 'package:audit_cms/data/core/response/auditRegion/schedules/response_special_schedule_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/userProfile/response_detail_user_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/lha/model_body_input_lha_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/kka/response_kka_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/report/response_report_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/schedules/response_main_schedule_audit_region.dart';
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

class ControllerAuditRegion extends GetxController {
  final Repositories repositories;
  var isLoading = false.obs;
  var message = ''.obs;
  var selectedFileName = ''.obs;
  var uploadStatus = ''.obs;

  //main schedules
  final PagingController<int, ContentMainScheduleAuditRegion> pagingControllerMainSchedule = PagingController(firstPageKey: 0);
  var detailMainSchedule = Rxn<DataDetailScheduleAuditRegion>();
  var startDateMainSchedule = ''.obs;
  var endDateMainSchedule = ''.obs;

  //special schedule
  final PagingController<int, ContentListSpecialScheduleAuditRegion> pagingControllerSpecialSchedule = PagingController(firstPageKey: 0);
  var detailSpecialSchedule = Rxn<DataDetailScheduleAuditRegion>();
  var startDateSpecialSchedule = ''.obs;
  var endDateSpecialSchedule = ''.obs;

  //reschedule
  final PagingController<int, ContentListRescheduleAuditRegion> pagingControllerReschedule = PagingController(firstPageKey: 0);
  var detailReschedule = Rxn<DataDetailRescheduleAuditRegion>();
  var startDateReschedule = ''.obs;
  var endDateReschedule = ''.obs;

  //master
  var branchId = RxnInt();
  var caseId = RxnInt();
  var caseCategoryId = RxnInt();
  final RxList<DataListBranch> branchAuditRegion = <DataListBranch>[].obs;
  final RxList<DataCaseAuditRegion> caseAuditRegion = <DataCaseAuditRegion>[].obs;
  final RxList<DataCaseCategoryAuditRegion>caseCategory = <DataCaseCategoryAuditRegion>[].obs;
  final RxList<String> priorityFindingClarificationAuditRegion = <String>[].obs;
  final RxList<DataListRecommendation> recommendationListAudit = <DataListRecommendation>[].obs;

  //lha
  var detailLhaAuditRegion = Rxn<DataDetailLhaAuditRegion>();
  var detailCasesLhaAuditRegion = Rxn<DataDetailCasesLha>();
  final RxList<LhaDetail> dataListLocalLhaAuditRegion = RxList<LhaDetail>();
  final PagingController<int, ContentListLhaAuditRegion> pagingControllerLha = PagingController(firstPageKey: 0);
  var startDateLha = ''.obs;
  var endDateLha = ''.obs;
  var scheduleId = RxnInt();

  //kka
  final PagingController<int, ContentListKkaAuditRegion>pagingControllerKka = PagingController(firstPageKey: 0);
  var detailKkaAuditRegion = Rxn<DataDetailKkaAuditRegion>();
  var startDateKka = ''.obs;
  var endDateKka = ''.obs;
  var scheduleIdKka = RxnInt();

  //clarification
  final PagingController<int, ContentListClarificationAuditRegion> pagingControllerClarification = PagingController(firstPageKey: 0);
  var detailClarificationAuditRegion = Rxn<DataDetailClarificationAuditRegion>();
  var dataInputClarification = Rxn<DataInputClarification>();
  var dataInputIdentification = Rxn<DataIdentification>();
  var startDateCla = ''.obs;
  var endDateCla = ''.obs;

  //follow up
  final PagingController<int, ContentListFollowUp> pagingControllerFollowUp = PagingController(firstPageKey: 0);

  //bap
  final PagingController<int, ContentListBapAuditRegion> pagingControllerBap = PagingController(firstPageKey: 0);
  var detailBapAuditRegion = Rxn<DataDetailBapAuditRegion>();
  var startDateBap = ''.obs;
  var endDateBap = ''.obs;

  //report
  var reportAuditRegion = Rxn<ModelReportAuditRegion>();

  //user
  var detailUserAuditRegion = Rxn<DataProfile>();

  //dashboard
  final RxList<ChartFollowUp>followUpDashboard = <ChartFollowUp>[].obs;
  final RxList<ChartFindings>findingsDashboard = <ChartFindings>[].obs;
  final RxList<ChartNominal>nominalDashboard = <ChartNominal>[].obs;
  final RxList<ChartDivision>divisionDashboard = <ChartDivision>[].obs;
  final RxList<ChartSop>chartSop = <ChartSop>[].obs;
  var summary = Rxn<Summary>();
  var rangkings = Rxn<Rankings>();

  ControllerAuditRegion(this.repositories);

  @override
  void onInit() {
    pagingControllerMainSchedule.addPageRequestListener(loadMainScheduleAuditRegion);
    pagingControllerSpecialSchedule.addPageRequestListener(loadSpecialScheduleAuditRegion);
    pagingControllerReschedule.addPageRequestListener(loadRescheduleAuditRegion);
    pagingControllerLha.addPageRequestListener(loadLhaAuditRegion);
    pagingControllerKka.addPageRequestListener(loadKkaAuditRegion);
    pagingControllerClarification.addPageRequestListener(loadClarificationAuditRegion);
    pagingControllerBap.addPageRequestListener(loadBapAuditRegion);
    pagingControllerFollowUp.addPageRequestListener(loadFollowUpAuditRegion);
    loadcaseAuditRegion();
    loadPriorityFindingAuditRegion();
    loadBranchAuditRegion();
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

  //main schedule
  void loadMainScheduleAuditRegion(int page) async {
    try {
      final mainSchedule = await repositories.getMainSchedulesAuditRegion(page, startDateMainSchedule.value, endDateMainSchedule.value);
      final schedule = mainSchedule.data!.content;
      final isLastPage = schedule!.length < 20;
      if (isLastPage) {
        pagingControllerMainSchedule.appendLastPage(schedule);
      } else {
        final nextPage = page + 1;
        pagingControllerMainSchedule.appendPage(schedule, nextPage);
      }
    } catch (e) {
      if (e is Error) {
        pagingControllerMainSchedule.appendPage([], null);
      } else {
        pagingControllerMainSchedule.error = e;
        throw Exception(e);
      }
    }
  }

  void getDetailMainScheduleAuditRegion(int id)async{
    try {
      final schedule = await repositories.getDetailMainScheduleAuditRegion(id);
      detailMainSchedule.value = schedule.data;
    } catch (error) {
      throw Exception(error);
    }
  }

  void filterMainSchedule(String startDate, String endDate)async{
    startDateMainSchedule.value = startDate;
    endDateMainSchedule.value = endDate;
    pagingControllerMainSchedule.refresh();
  }

  void resetfilterMainSchedule()async{
    startDateMainSchedule.value = '';
    endDateMainSchedule.value = '';
    pagingControllerMainSchedule.refresh();
  }

  //special schedule
  void loadSpecialScheduleAuditRegion(int page)async{
    try {
      final specialSchedule = await repositories.getSpecialSchedulesAuditRegion(page, startDateSpecialSchedule.value, endDateSpecialSchedule.value);
      final schedule = specialSchedule.data!.content;
      final isLastPage = schedule!.length < 10;
      if (isLastPage) {
        pagingControllerSpecialSchedule.appendLastPage(schedule);
      }else{
        final nextPage = page +1;
        pagingControllerSpecialSchedule.appendPage(schedule, nextPage);
      }
    } catch (e) {
      if (e is Error) {
        pagingControllerSpecialSchedule.appendPage([], null);
      } else {
        pagingControllerSpecialSchedule.error = e;
        throw Exception(e);
      }
    }
  }

  void getDetailSpecialScheduleAuditRegion(int id)async{
    try {
      final schedule = await repositories.getDetailSpecialScheduleAuditRegion(id);
      detailSpecialSchedule.value = schedule.data;
    } catch (e) {
      throw Exception(e);
    }
  }

  void filterSpecialSchedule(String startDate, String endDate)async{
    startDateSpecialSchedule.value = startDate;
    endDateSpecialSchedule.value = endDate;
    pagingControllerSpecialSchedule.refresh();
  }

  void resetfilterSpecialSchedule()async{
    startDateSpecialSchedule.value = '';
    endDateSpecialSchedule.value = '';
    pagingControllerSpecialSchedule.refresh();
  }


  //reschedule
  void loadRescheduleAuditRegion(int page) async {
    try {
      final reschedule = await repositories.getRescheduleAuditRegion(page, startDateReschedule.value, endDateReschedule.value);
      final schedule = reschedule.data!.content;
      final isLastPage = schedule!.length < 10;
      if (isLastPage) {
        pagingControllerReschedule.appendLastPage(schedule);
      }else{
        final nextPage = page +1;
        pagingControllerReschedule.appendPage(schedule, nextPage);
      }
    } catch (e) {
      if (e is Error) {
        pagingControllerReschedule.appendPage([], null);
      } else {
        pagingControllerReschedule.error = e;
        throw Exception(e);
      }
    }
  }

  void getDetailRescheduleAuditRegion(int id)async{
    try {
      final reschedule = await repositories.getDetailRescheduleAuditRegion(id);
      detailReschedule.value = reschedule.data;
    } catch (error) {
      throw Exception(error);
    }
  }

  void filterReschedule(String startDate, String endDate)async{
    startDateReschedule.value = startDate;
    endDateReschedule.value = endDate;
    pagingControllerReschedule.refresh();
  }

  void resetFilterReschedule()async{
    startDateReschedule.value = '';
    endDateReschedule.value = '';
    pagingControllerReschedule.refresh();
  }

  //LHA
  void addToLocalLhaAuditRegion(int? caseId, int? caseCategoryId, String description, String suggestion, String temporaryRecommendation, 
  String permanentRecommendation, int research, String? caseName, String? caseCategoryName)async{

    final newDataLha = LhaDetail(
      caseId: caseId,
      caseCategoryId: caseCategoryId,
      description: description,
      suggestion: suggestion,
      temporaryRecommendation: temporaryRecommendation,
      permanentRecommendation: permanentRecommendation,
      research: research,
      caseName: DataCaseAuditRegion(name: caseName),
      caseCategoryName: DataCaseCategoryAuditRegion(name: caseCategoryName)
      
    );
    dataListLocalLhaAuditRegion.add(newDataLha);
  }

   void deleteLocalLha(int caseId)async{
    final index = dataListLocalLhaAuditRegion.indexWhere((items) => items.caseId == caseId);
    if(index != -1){
      dataListLocalLhaAuditRegion.removeAt(index);
    }
  }

  void inputLhaAuditRegion(int scheduleId)async{
    try {
      await repositories.inputLhaAuditRegion(scheduleId, dataListLocalLhaAuditRegion.toList());
      pagingControllerClarification.refresh();
      dataListLocalLhaAuditRegion.clear();
      getDetailMainScheduleAuditRegion(scheduleId);
      getDetailSpecialScheduleAuditRegion(scheduleId);
    } catch (error) {
      dataListLocalLhaAuditRegion.clear();
      throw Exception(error);
    }
  }

  void inputCaseLhaAuditRegion(int lhaDetailId, int? caseId, int? caseCategory, String desc,
    String suggestion, String tempRec, String perRec, int isResearch)async{
    try {
      await repositories.inputCaseLhaAuditRegion(lhaDetailId, caseId, caseCategory, desc, suggestion, tempRec, perRec, isResearch);
      getDetailLhaAuditRegion(lhaDetailId);
      pagingControllerClarification.refresh();
    } catch (error) {
      throw Exception(error);
    }
  }

  var lhaId = RxnInt();
  void deletCaseLha(int? lhaDetailId)async{
    try {
      await repositories.deletCaseLha(lhaDetailId);
      getDetailLhaAuditRegion(lhaId.value);
    } catch (e) {
      throw Exception(e);
    }
  }

  void revisiLha(int lhaId, String desc, String suggest, String tempRec, String perRec)async{
    try {
      await repositories.revisiLha(lhaId, desc, suggest, tempRec, perRec);
      getDetailCasesLhaAuditRegion(lhaId);
    } catch (e) {
      throw Exception(e);
    }
  }

   void loadLhaAuditRegion(int page)async {
    try {
      final now = DateTime.now();
      final formatter = DateFormat('yyyy-MM-dd');
      final today = formatter.format(now);
      if(startDateLha.value.isEmpty && endDateLha.value.isEmpty){
        final lhaAuditRegion = await repositories.getListLhaAuditRegion(page, today, today);
        final lha = lhaAuditRegion.data!.content;
        final isLastPage = lha!.length < 10;
        if (isLastPage) {
          pagingControllerLha.appendLastPage(lha);
        } else {
          final nextPage = page +1;
          pagingControllerLha.appendPage(lha, nextPage);
        }
      }else{
        final lhaAuditRegion = await repositories.getListLhaAuditRegion(page, startDateLha.value, startDateLha.value);
        final lha = lhaAuditRegion.data!.content;
        final isLastPage = lha!.length < 10;
        if (isLastPage) {
          pagingControllerLha.appendLastPage(lha);
        } else {
          final nextPage = page +1;
          pagingControllerLha.appendPage(lha, nextPage);
        }
      }
    } catch (e){
      if (e is Error) {
        pagingControllerLha.appendPage([], null);
      } else {
        pagingControllerLha.error = e;
        throw Exception(e);
      }
    }
   }

   void filterLha(String startDate, String endDate)async{
    startDateLha.value = startDate;
    endDateLha.value = endDate;
    pagingControllerLha.refresh();
  }

  void resetFilterLha()async{
    startDateLha.value = '';
    endDateLha.value = '';
    pagingControllerLha.refresh();
  }

   void getDetailLhaAuditRegion(int? id)async{
    try {
      final detailLha = await repositories.getDetailLhaAuditRegion(id);
      detailLhaAuditRegion.value = detailLha.data;
    } catch (error) {
      throw Exception(error);
    }
  }

  void getDetailCasesLhaAuditRegion(int id)async{
    try {
      final detailCases = await repositories.getDetailCasesLha(id);
      detailCasesLhaAuditRegion.value = detailCases.data;
    } catch (error) {
      throw Exception(error);
    }
  }

//KKA
  void loadKkaAuditRegion(int page)async {
    try {
      final kkaAuditRegion = await repositories.getKkaAuditRegion(page, scheduleIdKka.value, startDateKka.value, endDateKka.value);
      final kka = kkaAuditRegion.data!.content;
      final isLastPage = kka!.length < 10;
      if (isLastPage) {
        pagingControllerKka.appendLastPage(kka);
      } else {
        final nextPage = page +1;
        pagingControllerKka.appendPage(kka, nextPage);
      }
    } catch (e) {
      if (e is Error) {
        pagingControllerKka.appendPage([], null);
      } else {
        pagingControllerKka.error = e;
        throw Exception(e);
      }
    }
  }

  void filterKka(String startDate, String endDate)async{
    startDateKka.value = startDate;
    endDateKka.value = endDate;
    pagingControllerKka.refresh();
  }

  void resetFilterKka()async{
    startDateKka.value = '';
    endDateKka.value = '';
    pagingControllerKka.refresh();
  }

  void getDetailKkaAuditRegion(int id)async{
    try {
      final response = await repositories.getDetailKkaAuditRegion(id);
      detailKkaAuditRegion.value = response.data;
    } catch (error) {
      throw Exception(error);
    }
  }

void uploadKkaAuditRegion(String filePath, int id) async {
    try {
      await repositories.uploadKkaAuditRegion(filePath, id);
      pagingControllerKka.refresh();
      pagingControllerMainSchedule.refresh();
      pagingControllerSpecialSchedule.refresh();
      getDetailMainScheduleAuditRegion(id);
      getDetailSpecialScheduleAuditRegion(id);
      selectedFileName.value = '';
    } catch (error) {
      selectedFileName.value = '';
      throw Exception(error);
    }
  }

  void pickFileKkaAuditRegion() async {
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

 void loadBranchAuditRegion() async {
  // final tokenBranch = await TokenManager.getToken();
  try {
    // Map<String, dynamic> decodedToken = Jwt.parseJwt(tokenBranch.toString());

    // int? userId = decodedToken['user']['id'];

      final branch = await repositories.getBranchAuditRegion();
      branchAuditRegion.assignAll(branch.data ?? []);
    // if (userId != null) {
    // }
  } catch (e) {
    throw Exception(e);
  }
}

 void selectBranch(int? value)async{
  branchId.value = value;
 }

 void loadcaseAuditRegion()async {
  try {
    final cases = await repositories.getCasesAuditRegion();
    caseAuditRegion.assignAll(cases.data ?? []);
  } catch (e) {
    throw Exception(e);
  }
 }

void selectCase(int? value)async{
  caseId.value = value;
}

void loadCaseCategoryAuditRegion(int? id) async{
  try {
      final cases = await repositories.getCaseCategoryAuditRegion(id);
      caseCategory.assignAll(cases.data ?? []);
    } catch (e) {
      throw Exception(e);
  }
}

void selectCaseCategory(int? value)async{
  caseCategoryId.value = value;
}

  //report
  void getReportAuditRegion(String startDate, String endDate)async {
    isLoading(true);
    try {
      final response = await repositories.getReportAuditRegion(startDate, endDate);
      reportAuditRegion.value = response.detailReport;
    } catch (error) {
      throw Exception(error);
    }finally{
      isLoading(false);
    }
  }

  //follow up
  var startDateFollowUp = ''.obs;
  var endDateFollowUp= ''.obs;
  void loadFollowUpAuditRegion(int page)async {
    try {
      final followUpAuditRegion = await repositories.getFollowUpAuditRegion(page, startDateFollowUp.value, endDateFollowUp.value);
      final followUp = followUpAuditRegion.data!.content;
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

   void filterDataFollowUpAuditRegion(String startDate, String endDate)async{
    startDateFollowUp.value = startDate;
    endDateFollowUp.value = endDate;
    pagingControllerFollowUp.refresh();
  }

  void resetFilterFollowUpAuditRegion()async{
    startDateFollowUp.value = '';
    endDateFollowUp.value = '';
    pagingControllerFollowUp.refresh();
  }

  var detailFollowUpAuditRegion = Rxn<DataDetailFollowUp>();
  void getDetailFollowUpAuditRegion(int? id)async{
    try {
      final followUp = await repositories.getDetailFollowUpAuditRegion(id);
      detailFollowUpAuditRegion.value = followUp.data;
    } catch (error) {
      throw Exception(error);
    }
  }

  //clarificaion
  void loadClarificationAuditRegion(int page) async{
    try {
      final clarificationAuditRegion = await repositories.getClarificationAuditRegion(page, startDateCla.value, endDateCla.value);
      final cla = clarificationAuditRegion.data!.content;
      final isLastPage = cla!.length < 10;
      if (isLastPage) {
        pagingControllerClarification.appendLastPage(cla);
      } else {
        final nextPage = page +1;
        pagingControllerClarification.appendPage(cla, nextPage);
      }
    } catch (e) {
      if (e is Error) {
        pagingControllerClarification.appendPage([], null);
      } else {
        pagingControllerClarification.error = e;
        throw Exception(e);
      }
    }
  }

  void generateClarification()async{
    try {
      await repositories.generateClarification(caseId.value, caseCategoryId.value, branchId.value);
      pagingControllerClarification.refresh();
    } catch (e) {
      throw Exception(e);
    }
  }

  void filterClarification(String startDate, String endDate)async{
    startDateCla.value = startDate;
    endDateCla.value = endDate;
    pagingControllerClarification.refresh();
  }

  void resetFilterClarification()async{
    startDateCla.value = '';
    endDateCla.value = '';
    pagingControllerClarification.refresh();
  }
  
  void loadPriorityFindingAuditRegion()async {
    try {
      final priorityFinding = await repositories.getPriorityFindingAuditRegion();
      priorityFindingClarificationAuditRegion.assignAll(priorityFinding.data ?? []);
    } catch (error) {
      throw Exception(error);
    }
  }

  var fileName = RxnString();
  var claId = RxnInt();
  void inputClarificationAuditRegion(int clarificationId, String evaluationLimitation, String location, String auditee, String auditeeLeader,
  String description, String priority)async {
    try {
      final inputClarificationAuditRegion = await repositories.inputClarificationAuditRegion(clarificationId, evaluationLimitation, location, auditee, auditeeLeader,
       description, priority);
       final clarification = dataInputClarification.value = inputClarificationAuditRegion.data;
       fileName.value = clarification?.clarification?.fileName;
       claId.value = clarification?.clarification?.id;
       pagingControllerClarification.refresh();
    } catch (error) {
      throw Exception(error);
    }
  }

  void uploadClarificationAuditRegion(String filePath, int? id)async{
    try {
      await repositories.uploadClarificationAuditRegion(filePath, id);
      pagingControllerClarification.refresh();
      selectedFileName.value = '';
    } catch (error) {
      selectedFileName.value = '';
      throw Exception(error);
    }
  }

  void pickFileClarificationAuditRegion() async {
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

  RxList<int> recommendation = RxList<int>();
  var bapId = RxnInt();
  void inputIdentificatinClarificationAuditRegion(int? clarificationId, int evaluationClarification, num loss, int followUp)async{
    try {
      final response = await repositories.inputIdentificationClarificationAuditRegion(clarificationId, evaluationClarification, loss, recommendation, followUp);
      dataInputIdentification.value = response.data;
      bapId.value = dataInputIdentification.value?.bap?.id;
      getDetailBapAuditRegion(bapId.value);
      pagingControllerClarification.refresh();
      pagingControllerBap.refresh();
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
      final recommendation = await repositories.getRecommendation();
      recommendationListAudit.assignAll(recommendation.data ?? []);
    } catch (error) {
      throw Exception(error);
    }
  }

  void uploadBapAuditRegion(String filePath, int? bapId)async{
    try {
      await repositories.uploadBapAuditRegion(filePath, bapId);
      pagingControllerBap.refresh();
      getDetailBapAuditRegion(bapId);
      selectedFileName.value = '';
    } catch (error) {
      selectedFileName.value = '';
      throw Exception(error);
    }
  }

  void pickFileBapAuditRegion() async {
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

  void getDetailClarificationAuditRegion(int id)async{
    try {
      final cla = await repositories.getDetailClarificationAuditRegion(id);
      detailClarificationAuditRegion.value = cla.data;
    } catch (error) {
      throw Exception(error);
    }
  }
  
  void loadBapAuditRegion(int page)async{
    try {
      final bapAuditRegion = await repositories.getBapAuditRegion(page, startDateBap.value, endDateBap.value);
      final bap = bapAuditRegion.data!.content;
      final isLastPage = bap!.length < 10;
      if (isLastPage) {
        pagingControllerBap.appendLastPage(bap);
      } else {
        final nextaPage = page +1;
        pagingControllerBap.appendPage(bap, nextaPage);
      }
    } catch (e) {
      if (e is Error) {
        pagingControllerBap.appendPage([], null);
      } else {
        pagingControllerBap.error = e;
        throw Exception(e);
      }
    }
  }

  void filterBap(String startDate, String endDate)async{
    startDateBap.value = startDate;
    endDateBap.value = endDate;
    pagingControllerBap.refresh();
  }

  void resetFilterBap()async{
    startDateBap.value = '';
    endDateBap.value = '';
    pagingControllerBap.refresh();
  }
  
  void getDetailBapAuditRegion(int? id)async{
    try {
      final response = await repositories.getDetailBapAuditRegion(id);
      detailBapAuditRegion.value = response.data;
    } catch (error) {
      throw Exception(error);
    }
  }

  //profile
void getDetailUserAuditRegion() async {
    try {
      final response = await repositories.getDetailUserAuditRegion();
      detailUserAuditRegion.value = response.data;
    } catch (error) {
      throw Exception(error);
    }
  }

  void editProfileUserAuditRegion(String? email, String? fullName) async {
    try {
      await repositories.editUserAuditRegion(email, fullName);
      getDetailUserAuditRegion();
    } catch (error) {
      throw Exception(error);
    }
  }

  void changePasswordAuditRegions(String oldPassword, String newPassword) async {
    try {
      await repositories.changePasswordAuditRegion(
          oldPassword, newPassword);
          getDetailUserAuditRegion();
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
      final followUp = await repositories.getFollowUpDashboard(selectedMonthFollowUp.value, selectedYearFollowUp.value);
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
      final findings = await repositories.getfindingsDashboard(selectedYearFindings.value);
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
      final nominal = await repositories.getNominalsDashboard(selectedYearNominal.value);
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
      final totalDashboard = await repositories.getTotalDashboard(selectedMonthTotal.value, selectedYearTotal.value);
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
      final ranking = await repositories.getTotalDashboard(selectedMonthTotal.value, selectedYearTotal.value);
      rangkings.value = ranking.data?.rankings;
    } catch (e) {
      throw Exception(e);
    }
  }

  var selectedMonthDivision = DateTime.now().month.obs;
  var selectedYearDivision = DateTime.now().year.obs;
  void getDivisionDashboard()async {
    try {
      final division = await repositories.getDivisionDashboard(selectedMonthDivision.value, selectedYearDivision.value);
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
      final sop = await repositories.getDashboardSop(selectedMonthSop.value, selectedYearSop.value);
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
