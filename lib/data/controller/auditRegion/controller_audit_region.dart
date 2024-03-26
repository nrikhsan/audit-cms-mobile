import 'package:audit_cms/data/core/repositories/repositories.dart';
import 'package:audit_cms/data/core/response/auditRegion/bap/response_bap_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/clarification/response_clarification_audit_region.dart';
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

class ControllerAuditRegion extends GetxController {
  final Repositories repositories;
  var isLoading = false.obs;
  var message = ''.obs;
  var selectedFileName = ''.obs;
  var uploadStatus = ''.obs;

  //schedules
  final RxList<ModelListMainScheduleAuditRegion> mainScheduleAuditRegion = <ModelListMainScheduleAuditRegion>[].obs;
  final RxList<ModelListSpecialSchedulesAuditRegion> specialScheduleAuditRegion = <ModelListSpecialSchedulesAuditRegion>[].obs;
  final RxList<ModelListReschedulesAuditRegion> rescheduleAuditRegion = <ModelListReschedulesAuditRegion>[].obs;
  var detailScheduleAuditRegion = Rxn<ModelDetailSchedulesAuditRegion>();

  //master
  final RxList<ModelListDivisionAuditRegion> divisionAuditRegion = <ModelListDivisionAuditRegion>[].obs;
  final RxList<ModelListSopAuditRegion>sopAuditRegion = <ModelListSopAuditRegion>[].obs;
  final RxList<ModelListClarificationCategoryAuditRegion> clarificationCategoryAuditRegion = <ModelListClarificationCategoryAuditRegion>[].obs;
  final RxList<ModelListPriorityFindingsAuditRegion> priorityFindingClarificationAuditRegion = <ModelListPriorityFindingsAuditRegion>[].obs;

  //lha
  var detailLhaAuditRegion = Rxn<ModelDetailLhaAuditRegion>();
  var dataListLocalLhaAuditRegion = <ModelBodyInputLhaAuditRegion>[].obs;

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
    loadMainScheduleAuditRegion();
    loadSpecialScheduleAuditRegion();
    loadRescheduleAuditRegion();
    loadDivisionAuditRegion();
    loadSopAuditRegion();
    loadClarificationAuditRegion();
    loadClarificationCategoryAuditRegion();
    loadPriorityFindingAuditRegion();
    loadKkaAuditRegion();
    loadBapAuditRegion();
    super.onInit();
  }

  void loadMainScheduleAuditRegion() async {
    isLoading(true);
    try {
      final response = await repositories.getMainSchedulesAuditRegion();
      mainScheduleAuditRegion.assignAll(response.mainSchedules ?? []);
    } catch (error) {
      throw Exception(error);
    } finally {
      isLoading(false);
    }
  }

  void filterMainScheduleAuditRegion(String startDate, endDate) async {
    try {
      final response =
          await repositories.filterMainSchedulesAuditRegion(startDate, endDate);
      mainScheduleAuditRegion.assignAll(response.mainSchedules ?? []);
    } catch (error) {
      throw Exception(error);
    }
  }

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
      detailScheduleAuditRegion.value = response.dataSchedules;
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

  void addToLocalLhaAuditRegion(int divisionId, String findingDesc, int sopId, String temporaryRec, String permanentRec, int researchValue, String suggest)async{
    final newDataLha = ModelBodyInputLhaAuditRegion(
      division: divisionId, 
      findingDescription: findingDesc, 
      sopCategory: sopId, 
      temporaryRecommendation: temporaryRec, 
      permanentRecommendation: permanentRec,
      recommendationOrSuggest: suggest,
      research: researchValue
    );
    dataListLocalLhaAuditRegion.add(newDataLha);
  }

  void inputLhaAuditRegion(int divisionId, String findingDesc, int sopId, String temporaryRec, String permanentRec, int researchValue, String suggest)async{
    try {
      final response = await repositories.inputLhaAuditRegion(divisionId, findingDesc, sopId, temporaryRec, permanentRec, researchValue, suggest);
      dataListLocalLhaAuditRegion.clear();
      addToLocalLhaAuditRegion(divisionId, findingDesc, sopId, temporaryRec, permanentRec, researchValue, suggest);
      message(response.toString());
    } catch (error) {
      throw Exception(error);
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
