import 'package:audit_cms/data/core/repositories/repositories.dart';
import 'package:audit_cms/data/core/response/auditRegion/bap/response_bap_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/clarification/response_clarification_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/lha/response_lha_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/master/response_clarification_category_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/bap/response_detail_bap_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/clarification/response_detail_clarification_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/kka/response_detail_kka_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/lha/response_detail_lha_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/schedules/response_detail_schedule_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/userProfile/response_detail_user_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/master/response_division_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/lha/model_body_input_lha_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/clarification/response_document_clarification_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/kka/response_kka_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/master/response_priority_finding_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/report/response_report_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/schedules/response_main_schedule_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/schedules/response_reschedule_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/master/response_sop_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/schedules/response_special_schedule_audit_region.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
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

  final RxList<ModelListSpecialSchedulesAuditRegion> specialScheduleAuditRegion = <ModelListSpecialSchedulesAuditRegion>[].obs;
  final RxList<ModelListReschedulesAuditRegion> rescheduleAuditRegion = <ModelListReschedulesAuditRegion>[].obs;

  //master
  final RxList<ModelListDivisionAuditRegion> divisionAuditRegion = <ModelListDivisionAuditRegion>[].obs;
  final RxList<ModelListSopAuditRegion>sopAuditRegion = <ModelListSopAuditRegion>[].obs;
  final RxList<ModelListClarificationCategoryAuditRegion> clarificationCategoryAuditRegion = <ModelListClarificationCategoryAuditRegion>[].obs;
  final RxList<ModelListPriorityFindingsAuditRegion> priorityFindingClarificationAuditRegion = <ModelListPriorityFindingsAuditRegion>[].obs;

  //lha
  var detailLhaAuditRegion = Rxn<ModelDetailLhaAuditRegion>();
  final RxList<LhaDetail> dataListLocalLhaAuditRegion = RxList<LhaDetail>();
  final RxList<ModelListLhaAuditRegion> lhaAuditRegion = <ModelListLhaAuditRegion>[].obs;

  //kka
  final RxList<ModelListKkaAuditRegion> kkaAuditRegion = <ModelListKkaAuditRegion>[].obs;
  var detailKkaAuditRegion = Rxn<ModelDetailKkaAuditRegion>();

  //clarification
  final RxList<ModelListClarificationAuditRegion> clarificationAuditRegion = <ModelListClarificationAuditRegion>[].obs;
  var documentClarificationAuditRegion = Rxn<ModelDocumentClarificationAuditRegion>();
  var detailClarificationAuditRegion = Rxn<ModelDetailClarificationAuditRegion>();

  //bap
  final RxList<ModelListBapAuditRegion>bapAuditRegion = <ModelListBapAuditRegion>[].obs;
  var detailBapAuditRegion = Rxn<ModelDetailBapAuditRegion>();

  //report
  var reportAuditRegion = Rxn<ModelReportAuditRegion>();

  //user
  var detailUserAuditRegion = Rxn<ModelDetailProfileAuditRegion>();

  ControllerAuditRegion(this.repositories);

  @override
  void onInit() {
    pagingControllerMainSchedule.addPageRequestListener(loadMainScheduleAuditRegion);
    loadSpecialScheduleAuditRegion();
    loadRescheduleAuditRegion();
    loadDivisionAuditRegion();
    loadSopAuditRegion();
    loadLhaAuditRegion();
    loadClarificationAuditRegion();
    loadClarificationCategoryAuditRegion();
    loadPriorityFindingAuditRegion();
    loadKkaAuditRegion();
    loadBapAuditRegion();
    super.onInit();
  }

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
      final response = await repositories.getDetailMainScheduleAuditRegion(id);
      detailMainSchedule.value = response.data;
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
  void loadSpecialScheduleAuditRegion() async {
    isLoading(true);
    try {
      final response = await repositories.getSpecialSchedulesAuditRegion();
      specialScheduleAuditRegion.assignAll(response.specialSchedules ?? []);
    } catch (error) {
      throw Exception(error);
    } finally {
      isLoading(false);
    }
  }

  void filterSpecialScheduleAuditRegion(String startDate, endDate) async {
    try {
      final response = await repositories.filterSpecialSchedulesAuditRegion(
          startDate, endDate);
      specialScheduleAuditRegion.assignAll(response.specialSchedules ?? []);
    } catch (error) {
      throw Exception(error);
    }
  }

  void loadRescheduleAuditRegion() async {
    isLoading(true);
    try {
      final response = await repositories.getRescheduleAuditRegion();
      rescheduleAuditRegion.assignAll(response.reschedules ?? []);
    } catch (error) {
      throw Exception(error);
    } finally {
      isLoading(false);
    }
  }

  void filterRescheduleAuditRegion(String startDate, endDate) async {
    try {
      final response =
          await repositories.filterReschedulesAuditRegion(startDate, endDate);
      rescheduleAuditRegion.assignAll(response.reschedules ?? []);
    } catch (error) {
      throw Exception(error);
    }
  }

  void getDetailScheduleAuditRegion(int id)async{
    try {
      final response = await repositories.getDetailScheduleAuditRegion(id);
      detailMainSchedule.value = response.data;
    } catch (error) {
      throw Exception(error);
    }
  }

  void getDetailUserAuditRegion() async {
    try {
      final response = await repositories.getDetailUserAuditRegion();
      detailUserAuditRegion.value = response.dataProfile;
    } catch (error) {
      throw Exception(error);
    }
  }

  void editProfileUserAuditRegion(int id, String email, String username) async {
    try {
      final response =
          await repositories.editUserAuditRegion(id, email, username);
      message(response.message);
    } catch (error) {
      throw Exception(error);
    }
  }

  void changePasswordAuditRegions(
      int id, String oldPassword, String newPassword, String confirmPassword) async {
    try {
      final response = await repositories.changePasswordAuditRegion(
          id, oldPassword, newPassword, confirmPassword);
      message(response.message);
    } catch (error) {
      throw Exception(error);
    }
  }
  
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
  
  void loadDivisionAuditRegion() async{
    try {
      final response = await repositories.getDivisionAuditRegion();
      divisionAuditRegion.assignAll(response.dataDivision ?? []);
    } catch (error) {
      throw Exception(error);
    }
  }
  
  void loadSopAuditRegion()async {
    try {
      final response = await repositories.getSopAuditRegion();
      sopAuditRegion.assignAll(response.dataSop ?? []);
    } catch (error) {
      throw Exception(error);
    }
  }

  void addToLocalLhaAuditRegion(int caseId, int caseCategoryId, String description, String suggestion, String temporaryRecommendation, String permanentRecommendation, int research, String divisionName, String sopName)async{
    final newDataLha = LhaDetail(
      caseId: caseId,
      caseCategoryId: caseCategoryId,
      description: description,
      suggestion: suggestion,
      temporaryRecommendation: temporaryRecommendation,
      permanentRecommendation: permanentRecommendation,
      research: research,
      divisionName: ModelListDivisionAuditRegion(id: caseId, nameDivision: divisionName),
      sopName: ModelListSopAuditRegion(id: caseCategoryId, sopName: sopName)
    );
    dataListLocalLhaAuditRegion.add(newDataLha);
  }

   void deleteLocalLha(int caseId)async{
    final index = dataListLocalLhaAuditRegion.indexWhere((items) => items.caseId == caseId);
    if(index != -1){
      dataListLocalLhaAuditRegion.removeAt(index);
    }
  }

  void inputLhaAuditRegion(int scheduleId, int branchId)async{
    try {
      final response = await repositories.inputLhaAuditRegion(scheduleId, branchId, dataListLocalLhaAuditRegion.toList());
      message(response.toString());
      dataListLocalLhaAuditRegion.clear();
    } catch (error) {
      throw Exception(error);
    }
  }

   void loadLhaAuditRegion()async {
    isLoading(true);
    try {
      final lha = await repositories.getListLhaAuditRegion();
      lhaAuditRegion.assignAll(lha.dataLha ?? []);
    } catch (error) {
      throw Exception(error);
    }finally{
      isLoading(false);
    }
   }
  
  void loadClarificationAuditRegion() async{
    isLoading(true);
    try {
      final clarfication = await repositories.getClarificationAuditRegion();
      clarificationAuditRegion.assignAll(clarfication.dataClarification ?? []);
    } catch (error) {
      throw Exception(error);
    }finally{
      isLoading(false);
    }
  }

  void filterClarificationAuditArea(String startDate, String endDate)async{
    try {
      final filterClarification = await repositories.filterClarificationAuditRegion(startDate, endDate);
      clarificationAuditRegion.assignAll(filterClarification.dataClarification ?? []);
    } catch (error) {
      throw Exception(error);
    }
  }

  void uploadKkaAuditRegion(String filePath) async {
    try {
      final response = await repositories.uploadKkaAuditRegion(filePath);
      Get.snackbar('Berhasil', 'KKA audit berhasil di unggah', colorText: CustomColors.white, backgroundColor: CustomColors.green);
      message(response.message);
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

  void getDetailLhaAuditRegion(int id)async{
    try {
      final detailLha = await repositories.getDetailLhaAuditRegion(id);
      detailLhaAuditRegion.value = detailLha.dataDetailLha;
    } catch (error) {
      throw Exception(error);
    }
  }
  
  void loadClarificationCategoryAuditRegion() async{
    try {
      final clarificationCategory = await repositories.getClarificationCategoryAuditRegion();
      clarificationCategoryAuditRegion.assignAll(clarificationCategory.clarificationCategory ?? []);
    } catch (error) {
      throw Exception(error);
    }
  }
  
  void loadPriorityFindingAuditRegion()async {
    try {
      final priorityFinding = await repositories.getPriorityFindingAuditRegion();
      priorityFindingClarificationAuditRegion.assignAll(priorityFinding.priorityFindings ?? []);
    } catch (error) {
      throw Exception(error);
    }
  }

  void inputClarificationAuditRegion(int category, String limitEvaluation, 
  String location, String division, String supervisor, String dear, String findingDescription, int priorityFinding)async {
    try {
      final inputClarificationAuditRegion = await repositories.inputClarificationAuditRegion(category, limitEvaluation, location, 
      division, supervisor, dear, findingDescription, priorityFinding);
      message(inputClarificationAuditRegion.toString());
    } catch (error) {
      throw Exception(error);
    }
  }

  void getDocumentClarificationAuditRegion(int id)async{
    try {
      final doc = await repositories.getDocumentClarification(id);
      documentClarificationAuditRegion.value = doc.documentClarification;
    } catch (error) {
      throw Exception(error);
    }
  }

  void uploadClarificationAuditRegion(String filePath)async{
    try {
      final response = await repositories.uploadClarificationAuditRegion(filePath);
      message(response.toString());
      Get.snackbar('Berhasil', 'Klarifikasi audit berhasil di unggah', colorText: CustomColors.white, backgroundColor: CustomColors.green);
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

  void inputIdentificatinClarificationAuditRegion(int evaluationClarification, String loss, String description, int followUp)async{
    try {
      final response = await repositories.inputIdentificationClarificationAuditRegion(evaluationClarification, loss, description, followUp);
      Get.snackbar('Berhasil', 'Identifikasi klarifikasi berhasil dibuat', colorText: CustomColors.white, backgroundColor: CustomColors.green);
      message(response.message);
    } catch (error) {
      throw Exception(error);
    }
  }

  void uploadBapAuditRegion(String filePath)async{
    try {
      final response = await repositories.uploadBapAuditRegion(filePath);
      message(response.toString());
      Get.snackbar('Berhasil', 'BAP audit berhasil di unggah', colorText: CustomColors.white, backgroundColor: CustomColors.green);
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
      final response = await repositories.getDetailClarificationAuditRegion(id);
      detailClarificationAuditRegion.value = response.detailClarification;
    } catch (error) {
      throw Exception(error);
    }
  }
  
  void loadKkaAuditRegion()async {
    isLoading(true);
    try {
      final kka = await repositories.getKkaAuditRegion();
      kkaAuditRegion.assignAll(kka.dataKka ?? []);
    } catch (error) {
      throw Exception(error);
    }finally{
      isLoading(false);
    }
  }

  void filterKkaAuditRegion(String startDate, String endDate)async{
    try {
      final kka = await repositories.filterKkaAuditRegion(startDate, endDate);
      kkaAuditRegion.assignAll(kka.dataKka ?? []);
    } catch (error) {
      throw Exception(error);
    }
  }

  void getDetailKkaAuditRegion(int id)async{
    try {
      final response = await repositories.getDetailKkaAuditRegion(id);
      detailKkaAuditRegion.value = response.detailKka;
    } catch (error) {
      throw Exception(error);
    }
  }
  
  void loadBapAuditRegion()async{
    isLoading(true);
    try {
      final bap = await repositories.getBapAuditRegion();
      bapAuditRegion.assignAll(bap.dataBap ?? []);
    } catch (error) {
      throw Exception(error);
    }finally{
      isLoading(false);
    }
  }

  void filterBapAuditRegion(String startDate, String endDate)async{
    try {
      final bap = await repositories.filterBapAuditRegion(startDate, endDate);
      bapAuditRegion.assignAll(bap.dataBap ?? []);
    } catch (error) {
      throw Exception(error);
    }
  }

  void getDetailBapAuditRegion(int id)async{
    try {
      final response = await repositories.getDetailBapAuditRegion(id);
      detailBapAuditRegion.value = response.detailBap;
    } catch (error) {
      throw Exception(error);
    }
  }
}
