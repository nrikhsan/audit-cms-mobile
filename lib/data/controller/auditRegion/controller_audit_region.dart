import 'package:audit_cms/data/core/repositories/repositories.dart';
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
import 'package:audit_cms/data/core/response/auditRegion/schedules/response_detail_reschedule_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/schedules/response_detail_schedule_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/schedules/response_reschedule_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/schedules/response_special_schedule_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/userProfile/response_detail_user_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/lha/model_body_input_lha_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/kka/response_kka_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/report/response_report_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/schedules/response_main_schedule_audit_region.dart';
import 'package:audit_cms/helper/prefs/token_manager.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decode/jwt_decode.dart';

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

  //bap
  final PagingController<int, ContentListBapAuditRegion> pagingControllerBap = PagingController(firstPageKey: 0);
  var detailBapAuditRegion = Rxn<DataDetailBapAuditRegion>();
  var startDateBap = ''.obs;
  var endDateBap = ''.obs;

  //report
  var reportAuditRegion = Rxn<ModelReportAuditRegion>();

  //user
  var detailUserAuditRegion = Rxn<DataProfile>();

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
    loadcaseAuditRegion();
    loadPriorityFindingAuditRegion();
    loadBranchAuditRegion();
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

   void getDetailLhaAuditRegion(int id)async{
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
  final tokenBranch = await TokenManager.getToken();
  try {
    Map<String, dynamic> decodedToken = Jwt.parseJwt(tokenBranch.toString());

    int? userId = decodedToken['user']['id'];

    if (userId != null) {
      final branch = await repositories.getBranchAuditRegion(userId);
      branchAuditRegion.assignAll(branch.data ?? []);
    }
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

  var clarficationId = RxnInt();

  void inputClarificationAuditRegion(int clarificationId, String evaluationLimitation, String location, String auditee, String auditeeLeader,
  String description, String priority)async {
    try {
      final inputClarificationAuditRegion = await repositories.inputClarificationAuditRegion(clarificationId, evaluationLimitation, location, auditee, auditeeLeader,
       description, priority);
       dataInputClarification.value = inputClarificationAuditRegion.data;
       pagingControllerClarification.refresh();
    } catch (error) {
      throw Exception(error);
    }
  }

  void uploadClarificationAuditRegion(String filePath, int id)async{
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

  void inputIdentificatinClarificationAuditRegion(int clarificationId, int evaluationClarification, num loss, String description, int followUp)async{
    try {
      final response = await repositories.inputIdentificationClarificationAuditRegion(clarificationId, evaluationClarification, loss, description, followUp);
      dataInputIdentification.value = response.data;
      pagingControllerClarification.refresh();
      pagingControllerBap.refresh();
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
}
