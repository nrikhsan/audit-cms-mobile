import 'package:audit_cms/data/core/repositories/repositories.dart';
import 'package:audit_cms/data/core/response/auditRegion/bap/response_bap_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/clarification/response_clarification_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/clarification/response_input_clarification.dart';
import 'package:audit_cms/data/core/response/auditRegion/lha/response_detail_lha_cases.dart';
import 'package:audit_cms/data/core/response/auditRegion/lha/response_lha_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/master/response_branch_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/master/response_case_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/master/response_case_category_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/master/response_case_category_by_id_audit_region.dart';
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
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/widget/widget_snackbar_message_and_alert.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

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
  final RxList<DataCaseCategory>caseCatgeory = <DataCaseCategory>[].obs;
  final RxList<DataCaseCategoryByIdAuditRegion>caseCategoryById = <DataCaseCategoryByIdAuditRegion>[].obs;
  final RxList<String> priorityFindingClarificationAuditRegion = <String>[].obs;

  //lha
  var detailLhaAuditRegion = Rxn<DataDetailLhaAuditRegion>();
  var detailCasesLhaAuditRegion = Rxn<DataDetailCasesLha>();
  final RxList<LhaDetail> dataListLocalLhaAuditRegion = RxList<LhaDetail>();
  final PagingController<int, ContentListLhaAuditRegion> pagingControllerLha = PagingController(firstPageKey: 0);
  var startDatelha = ''.obs;
  var endDatelha = ''.obs;
  var scheduleId = RxnInt();

  //kka
  final PagingController<int, ContentListKkaAuditRegion>pagingControllerKka = PagingController(firstPageKey: 0);
  var detailKkaAuditRegion = Rxn<DataDetailKkaAuditRegion>();
  var startDatekka = ''.obs;
  var endDateKka = ''.obs;
  var scheduleIdKka = RxnInt();

  //clarification
  final PagingController<int, ContentListClarificationAuditRegion> pagingControllerClarification = PagingController(firstPageKey: 0);
  var detailClarificationAuditRegion = Rxn<DataDetailClarificationAuditRegion>();
  var dataInputClarification = Rxn<DataInputClarification>();
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
    loadBranchAuditRegion();
    loadcaseAuditRegion();
    loadPriorityFindingAuditRegion();
    
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
      pagingControllerMainSchedule.error = e;
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
      pagingControllerSpecialSchedule.error = e;
      throw Exception(e);
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
      pagingControllerReschedule.error = e;
      throw Exception(e);
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
  String permanentRecommendation, int research)async{

    final newDataLha = LhaDetail(
      caseId: caseId,
      caseCategoryId: caseCategoryId,
      description: description,
      suggestion: suggestion,
      temporaryRecommendation: temporaryRecommendation,
      permanentRecommendation: permanentRecommendation,
      research: research,
      
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
      final response = await repositories.inputLhaAuditRegion(scheduleId, dataListLocalLhaAuditRegion.toList());
      message.value = response.message.toString();
      snakcBarMessageGreen('Berhasil', 'Lha berhasil dibuat');
      dataListLocalLhaAuditRegion.clear();
    } catch (error) {
      snakcBarMessageRed('Gagal menginput data', 'Tidak bisa upload LHA lagi untuk hari ini');
      dataListLocalLhaAuditRegion.clear();
      throw Exception(error);
    }
  }

   void loadLhaAuditRegion(int page)async {
    try {
      final lhaAuditRegion = await repositories.getListLhaAuditRegion(scheduleId.value, page, startDatelha.value, endDatelha.value);
      final lha = lhaAuditRegion.data!.content;
      final isLastPage = lha!.length < 10;
      if (isLastPage) {
        pagingControllerLha.appendLastPage(lha);
      } else {
        final nextPage = page +1;
        pagingControllerLha.appendPage(lha, nextPage);
      }
    } catch (e) {
      pagingControllerLha.error = e;
      throw Exception(e);
    }
   }

   void filterLha(String startDate, String endDate)async{
    startDatelha.value = startDate;
    endDatelha.value = endDate;
    pagingControllerLha.refresh();
  }

  void resetFilterLha()async{
    startDatelha.value = '';
    endDatelha.value = '';
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
      final kkaAuditRegion = await repositories.getKkaAuditRegion(page, scheduleIdKka.value, startDatekka.value, endDateKka.value);
      final kka = kkaAuditRegion.data!.content;
      final isLastPage = kka!.length < 10;
      if (isLastPage) {
        pagingControllerKka.appendLastPage(kka);
      } else {
        final nextPage = page +1;
        pagingControllerKka.appendPage(kka, nextPage);
      }
    } catch (e) {
      pagingControllerKka.error = e;
      throw Exception(e);
    }
  }

  void filterKka(String startDate, String endDate)async{
    startDatekka.value = startDate;
    endDateKka.value = endDate;
    pagingControllerKka.refresh();
  }

  void resetFilterKka()async{
    startDatekka.value = '';
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
      final response = await repositories.uploadKkaAuditRegion(filePath, id);
      Get.snackbar('Berhasil', 'KKA audit berhasil di unggah', colorText: CustomColors.white, backgroundColor: CustomColors.green);
      message.value = response.message.toString();
      pagingControllerKka.refresh();
      selectedFileName.value = '';
    } catch (error) {
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

//master
void loadBranchAuditRegion()async {
  try {
    final branch = await repositories.getBranchAuditRegion();
    branchAuditRegion.assignAll(branch.data ?? []);
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
      final cases = await repositories.getCaseCategoryAuditRegion(caseId.value);
      caseCatgeory.assignAll(cases.data ?? []);
    } catch (e) {
      throw Exception(e);
  }
}

void selectCaseCategory(int? value)async{
  caseCategoryId.value = value;
}

void getCaseCategoryById(int casesId)async{
  try {
      final cases = await repositories.getCaseCategoryByIdAuditRegion(casesId);
      caseCategoryById.assignAll(cases.data ?? []);
    } catch (e) {
      throw Exception(e);
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

  void editProfileUserAuditRegion(String email, String username) async {
    try {
      final response =
          await repositories.editUserAuditRegion(email, username);
           Get.snackbar('Berhasil', 'Profil berhasil di edit',
                              snackPosition: SnackPosition.TOP, colorText: CustomColors.white, backgroundColor: CustomColors.green);
      message(response.message);
    } catch (error) {
      throw Exception(error);
    }
  }

  void changePasswordAuditRegions(
      int id, String oldPassword, String newPassword, String confirmPassword) async {
    try {
      final response = await repositories.changePasswordAuditRegion(
          oldPassword, newPassword);
          Get.snackbar('Gagal', 'Kata sandi berhasil dirubah', colorText: CustomColors.white, backgroundColor: CustomColors.green);
      message(response.message);
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
      pagingControllerClarification.error = e;
      throw Exception(e);
    }
  }

  void generateClarification()async{
    try {
      final generate = await repositories.generateClarification(caseId.value, caseCategoryId.value, branchId.value);
      message.value = generate.message.toString();
      pagingControllerClarification.refresh();
      snakcBarMessageGreen('Berhasil', 'Berhasil generate klarifikasi');
      print('generate value = ${branchId.value}, ${caseId.value}, ${caseCategoryId.value}');
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
       Get.snackbar('Berhasil', 'Klarifikasi berhasil dibuat', snackPosition: SnackPosition.TOP, colorText: CustomColors.white, backgroundColor: CustomColors.green);
      message.value = inputClarificationAuditRegion.message.toString();
    } catch (error) {
      throw Exception(error);
    }
  }

  void uploadClarificationAuditRegion(String filePath, int id)async{
    try {
      final response = await repositories.uploadClarificationAuditRegion(filePath, id);
      pagingControllerClarification.refresh();
      message(response.toString());
      Get.snackbar('Berhasil', 'Klarifikasi audit berhasil di unggah', colorText: CustomColors.white, backgroundColor: CustomColors.green);
      selectedFileName.value = '';
    } catch (error) {
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

  void inputIdentificatinClarificationAuditRegion(int clarificationId, int evaluationClarification, String loss, String description, int followUp)async{
    try {
      final response = await repositories.inputIdentificationClarificationAuditRegion(clarificationId, evaluationClarification, loss, description, followUp);
      pagingControllerClarification.refresh();
      Get.snackbar('Berhasil', 'Identifikasi klarifikasi berhasil dibuat', colorText: CustomColors.white, backgroundColor: CustomColors.green);
      message(response.message);
    } catch (error) {
      throw Exception(error);
    }
  }

  var bapId = RxnInt();
  void uploadBapAuditRegion(String filePath)async{
    try {
      final response = await repositories.uploadBapAuditRegion(filePath, bapId.value);
      message(response.toString());
      Get.snackbar('Berhasil', 'BAP audit berhasil di unggah', colorText: CustomColors.white, backgroundColor: CustomColors.green);
      selectedFileName.value = '';
    } catch (error) {
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
      pagingControllerBap.error = e;
      throw Exception(e);
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

  void getDetailBapAuditRegion(int id)async{
    try {
      final response = await repositories.getDetailBapAuditRegion(id);
      detailBapAuditRegion.value = response.data;
    } catch (error) {
      throw Exception(error);
    }
  }
}
