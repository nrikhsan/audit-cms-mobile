import 'package:audit_cms/data/core/response/auditArea/clarification/response_detail_clarification_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/followUp/response_input_follow_up.dart';
import 'package:audit_cms/data/core/response/auditArea/lha/model_body_input_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/lha/response_detail_cases_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/lha/response_detail_revision_lha.dart';
import 'package:audit_cms/data/core/response/auditArea/lha/response_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/followUp/reponse_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/lha/response_revisi_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_penalty_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_branch_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_case_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_case_category_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_users.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/model_body_add_schedules.dart';
import 'package:audit_cms/data/core/response/auditArea/bap/response_bap_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/clarification/response_clarification_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/bap/response_detail_bap_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/followUp/response_detail_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/kka/response_detail_kka_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/lha/response_detail_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/request_body_edit_schedule.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_detail_reschedule_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/userPorfile/response_detail_user_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/kka/response_kka_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_detail_schedule_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_main_schedules_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_reschedule_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_special_schedules_audit_area.dart';
import 'package:audit_cms/data/core/response/auditRegion/clarification/response_input_clarification.dart';
import 'package:audit_cms/data/core/response/auditRegion/clarification/response_input_identification.dart';
import 'package:audit_cms/data/core/response/auditRegion/lha/model_body_input_lha_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/bap/response_bap_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/clarification/response_clarification_audit_region.dart';
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
import 'package:audit_cms/data/core/response/auditRegion/userProfile/response_detail_user_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/kka/response_kka_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/master/response_priority_finding_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/report/response_report_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/schedules/response_main_schedule_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/schedules/response_reschedule_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/schedules/response_special_schedule_audit_region.dart';
import 'package:audit_cms/data/core/response/responseMessage/response_message.dart';
import 'package:audit_cms/pages/widget/widget_snackbar_message_and_alert.dart';
import 'package:dio/dio.dart';
import '../../../helper/prefs/token_manager.dart';
import '../../constant/app_constants.dart';
import '../response/auth/response_auth.dart';

class ApiService {
  Dio dio = Dio(BaseOptions(baseUrl: AppConstant.baseUrlProd, connectTimeout: const Duration(seconds: 5000), receiveTimeout: const Duration(seconds: 5000)));

  // auth login
  Future<ResponseAuth> login(String username, String password) async {
    dio.options.headers = {
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.post(AppConstant.auth,
      data: ModelAuth(username: username, password: password).toJson());
      final messageSuccess = response.data['message'];
      snackBarMessageGreen(messageSuccess, 'Selamat datang $username');
      return ResponseAuth.fromJson(response.data);
    } on DioException catch (error) { 
      final messageError = error.response?.data['message'];
      snackBarMessageRed('Login gagal', messageError);
      throw Exception(error);
    }
  }

  Future<ResponseMessage> logOut() async {
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token',
    };
    try {
      final response = await dio.post(AppConstant.logOut);
      final messageSuccess = response.data['message'];
      snackBarMessageGreen(messageSuccess, 'Kamu telah keluar dari aplikasi');
      return ResponseMessage.fromJson(response.data);
    }catch (error) {
      throw Exception(error);
    }
  }

  //audit area
  //main schedules
  Future<ResponseMessage>addMainSchedules(List<ModelBodySchedulesAuditArea> schedule) async {
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.post(AppConstant.addMainSchedules,
          data: {'schedules': schedule.toList()});
      final messageSucces = response.data['message'];
      snackBarMessageGreen('Berhasil', messageSucces);
      return ResponseMessage.fromJson(response.data);
    } on DioException catch (error) {
      final messageError = error.response?.data['message'];
      snackBarMessageRed('Gagal', messageError);
      throw Exception(error);
    }
  }

  Future<ResponseMessage>editMainSchedule(int id, int userId, int branchId, String startDate, String endDate, String description)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.put('${AppConstant.editMainSchedule}$id', data: RequestBodyEditSchedule(userId: userId, branchId: branchId,
      startDate: startDate, endDate: endDate, description: description).toJson());
      final messageSucces = response.data['message'];
      snackBarMessageGreen('Berhasil', messageSucces);
      return ResponseMessage.fromJson(response.data);
    } on DioException catch (error) {
      final messageError = error.response?.data['message'];
      snackBarMessageRed('Gagal', messageError);
      throw Exception(error);
    }
  }

  Future<ResponseMessage>deleteMainSchedule(int id)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.delete('${AppConstant.deleteMainSchedule}$id');
      final messageSucces = response.data['message'];
      snackBarMessageGreen('Berhasil', messageSucces);
      return ResponseMessage.fromJson(response.data);
    } on DioException catch (error) {
      final messageError = error.response?.data['message'];
      snackBarMessageRed('Gagal', messageError);
      throw Exception(error);
    }
  }

  Future<ResponseMainScheduleAuditArea> getMainSchedulesAuditArea(int page, String name, int? branchId, String startDate, String endDate) async {
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get(AppConstant.getMainSchedule,
      queryParameters: {'page': page, 'name': name, 'branch_id': branchId, 'start_date': startDate, 'end_date': endDate});
      return ResponseMainScheduleAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDetailScheduleAuditArea> getDetailMainScheduleAuditArea(int id) async {
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get('${AppConstant.detailMainSchedule}$id');
      return ResponseDetailScheduleAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  //special schedule
  Future<ResponseMessage>addSpecialSchedule(List<ModelBodySchedulesAuditArea> schedule) async {
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.post(AppConstant.addSpecialSchedule,
          data: {'schedules': schedule.toList()});
      final messageSucces = response.data['message'];
      snackBarMessageGreen('Berhasil', messageSucces);
      return ResponseMessage.fromJson(response.data);
    } on DioException catch (error) {
      final messageError = error.response?.data['message'];
      snackBarMessageRed('Gagal', messageError);
      throw Exception(error);
    }
  }

  Future<ResponseSpecialScheduleAuditArea> getSpecialSchedulesAuditArea(int page, String name, int? branchId, String startDate, String endDate) async {
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get(AppConstant.getSpecialSchedule,
      queryParameters: {'page': page, 'name': name, 'branch_id': branchId, 'start_date': startDate, 'end_date': endDate});
      return ResponseSpecialScheduleAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseMessage>editSpecialSchedule(int id, int userId, int branchId, String startDate, String endDate, String description)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.put('${AppConstant.editSpecialSchedule}$id', data: RequestBodyEditSchedule(userId: userId, branchId: branchId,
      startDate: startDate, endDate: endDate, description: description).toJson());
      final messageSucces = response.data['message'];
      snackBarMessageGreen('Berhasil', messageSucces);
      return ResponseMessage.fromJson(response.data);
    } on DioException catch (error) {
      final messageError = error.response?.data['message'];
      snackBarMessageRed('Gagal', messageError);
      throw Exception(error);
    }
  }

  Future<ResponseMessage>deleteSpecialSchedule(int id)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.delete('${AppConstant.deleteSpecialSchedule}$id');
      final messageSucces = response.data['message'];
      snackBarMessageGreen('Berhasil', messageSucces);
      return ResponseMessage.fromJson(response.data);
    } on DioException catch (error) {
      final messageError = error.response?.data['message'];
      snackBarMessageRed('Gagal', messageError);
      throw Exception(error);
    }
  }

  Future<ResponseDetailScheduleAuditArea> getDetailSpecialScheduleAuditArea(int id) async {
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get('${AppConstant.detailSpecialSchedule}$id');
      return ResponseDetailScheduleAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  //reschedule
  Future<ResponseMessage>requestReschedule(int? userId, int scheduleId, int? branchId, String startDate, String endDate, String desc)async {
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.post(AppConstant.requestReschedule,
          data: ModelBodyReschedulesAuditArea(userId: userId, scheduleId: scheduleId, 
          branchId: branchId, startDate: startDate, endDate: endDate, description: desc).toJson());
      final messageSucces = response.data['message'];
      snackBarMessageGreen('Berhasil', messageSucces);
      return ResponseMessage.fromJson(response.data);
    } on DioException catch (error) {
      final messageError = error.response?.data['message'];
      snackBarMessageRed('Gagal', messageError);
      throw Exception(error);
    }
  }

  Future<ResponseRescheduleAuditArea> getReschedulesAuditArea(int page, String name, int? branchId, String startDate, String endDate) async {
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get(AppConstant.getReschedule,
       queryParameters: {'page': page, 'name': name, 'branch_id': branchId, 'start_date': startDate, 'end_date': endDate});
      return ResponseRescheduleAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDetailRescheduleAuditArea> getDetailRescheduleAuditArea(int id) async {
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get('${AppConstant.detailReschedule}$id');
      return ResponseDetailRescheduleAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  //master
  Future<ResponseUsers> getUsersAuditArea() async {
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get(AppConstant.getDropdownUsers);
      return ResponseUsers.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseBranchAuditArea> getBranchByUserIdAuditArea(int? userId) async {
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get(AppConstant.getDropdownBranch, queryParameters: {'user_id': userId});
      return ResponseBranchAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseBranchAuditArea> getBranchForFilterDataAuditArea() async {
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get(AppConstant.getDropdownBranch);
      return ResponseBranchAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseCaseAuditArea> getCaseAuditArea() async {
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get(AppConstant.getsDropdownCase);
      return ResponseCaseAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseCaseCategoryAuditArea> getCaseCategoryAuditArea(int? caseId) async {
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get(AppConstant.getDropdownCaseCategory, queryParameters: {'case_id': caseId});
      return ResponseCaseCategoryAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponsePenaltyAuditArea>getPenaltyAuditArea()async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get(AppConstant.getDropdownPenalty);
      return ResponsePenaltyAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  //LHA
  Future<ResponseMessage>inputLhaAuditArea(int scheduleId, List<LhaDetailArea>lhaDetail)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.post(AppConstant.inputLha,
      data: {'schedule_id': scheduleId, 'lha_detail': lhaDetail.toList()});
      final messageSucces = response.data['message'];
      snackBarMessageGreen('Berhasil', messageSucces);
      return ResponseMessage.fromJson(response.data);
    } on DioException catch (error) {
      final messageError = error.response?.data['message'];
      snackBarMessageRed('Berhasil', messageError);
      throw Exception(error);
    }
  }

  Future<ResponseRevisionLhaAuditArea>getRevisiLhaAuditArea(int? lhaDetailId)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get(AppConstant.listRevisionLha, queryParameters: {'lha_detail_id': lhaDetailId});
      return ResponseRevisionLhaAuditArea.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ResponseMessage>revisiLhaAuditArea(int? lhaId, String desc, String suggest, String tempRec, String perRec)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.post(AppConstant.lhaRevision, 
      data: {'audit_daily_report_detail_id': lhaId, 'description': desc, 'suggestion': suggest, 
      'temporary_recommendations': tempRec, 'permanent_recommendations': perRec});
      final messageSucces = response.data['message'];
      snackBarMessageGreen('Berhasil', messageSucces);
      return ResponseMessage.fromJson(response.data);
    } on DioException catch (error) {
      final messageError = error.response?.data['message'];
      snackBarMessageRed('Berhasil', messageError);
      throw Exception(error);
    }
  }

  Future<ResponseMessage>sendCaseLha(int? lhaDetailId)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.patch('${AppConstant.sendCaseLha}$lhaDetailId');
      final messageSucces = response.data['message'];
      snackBarMessageGreen('Berhasil', messageSucces);
      return ResponseMessage.fromJson(response.data);
    } on DioException catch (error) {
      final messageError = error.response?.data['message'];
      snackBarMessageRed('Berhasil', messageError);
      throw Exception(error);
    }
  }

  Future<ResponseDetailRevision>getDetailRevisionLhaAuditArea(int caseId)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get('${AppConstant.detailLhaRevision}$caseId');
      return ResponseDetailRevision.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ResponseDetailLhaCasesLhaAuditArea>getDetailCaseLhaAuditArea(int? caseId)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get('${AppConstant.detailCasesLha}$caseId');
      return ResponseDetailLhaCasesLhaAuditArea.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ResponseLhaAuditArea> getLhaAuditArea(int page, String name, int? branchId, String startDate, String endDate) async {
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
      
    try {
      final response = await dio.get(AppConstant.getListLha, queryParameters: {'page': page,
      'name': name, 'branch_id': branchId, 'start_date': startDate, 'end_date': endDate});
      return ResponseLhaAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDetailLhaAuditArea> getDetailLhaAuditArea(int? id) async {
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get('${AppConstant.detailLha}$id');
      return ResponseDetailLhaAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  //clarification
  Future<ResponseClarificationAuditArea>getClarificationAuditArea(int page, String name, int? branchId, String startDate, String endDate)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try{
      final response = await dio.get(AppConstant.getClarification, queryParameters: {'page': page,
      'name': name, 'branch_id': branchId, 'start_date': startDate, 'end_date': endDate});
      print(response.data);
      return ResponseClarificationAuditArea.fromJson(response.data);
    }catch(error){
      throw Exception(error);
    }
  }

  Future<ResponseDetailClarificationAuditArea> getDetailClarificationAuditArea(int id)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
    final response = await dio.get('${AppConstant.detailClarification}$id');
    return ResponseDetailClarificationAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  //KKA
  Future<ResponseMessage>uploadKkaAuditArea(String filePath, int id)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'multipart/form-data'
    };
    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(filePath),
      'schedule_id': id
    });
    try {
      final response = await dio.post(AppConstant.uploadKka, data: formData);
      print(response.data);
      final messageSucces = response.data['message'];
      snackBarMessageGreen('Berhasil', messageSucces);
      return ResponseMessage.fromJson(response.data);
    } on DioException  catch (e) {
      final messageError = e.response?.data['message'];
      snackBarMessageRed('Gagal', messageError);
      throw Exception(e);
    }
  }

  Future<ResponseKkaAuditArea> getKkaAuditArea(int page, int? scheduleId, String name, int? branchId, String startDate, String endDate)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get(AppConstant.getListKka, queryParameters: {'page': page, 'schedule_id': scheduleId,
      'name': name, 'branch_id': branchId, 'start_date': startDate, 'end_date': endDate});
      return ResponseKkaAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDetailKkaAuditArea> getDetailKkaAuditArea(int id)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
        final responseDetail = await dio.get('${AppConstant.detailKka}$id');
        return ResponseDetailKkaAuditArea.fromJson(responseDetail.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  //BAP
  Future<ResponseBapAuditArea>getBapAuditArea(int page, String name, int? branch, String startDate, String endDate)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token',
    };
    try {
      final responseBap = await dio.get(AppConstant.getBap, queryParameters: {'page': page,
      'name': name, 'branch_id': branch, 'start_date': startDate, 'end_date': endDate});
      return ResponseBapAuditArea.fromJson(responseBap.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDetailBapAuditArea> getDetailBapAuditArea(int? id)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token',
    };
    try {
        final responseDetail = await dio.get('${AppConstant.detailBap}$id');
        return ResponseDetailBapAuditArea.fromJson(responseDetail.data);
    } catch (error) {
      throw Exception(error);
    }
  }


  //follow up
  Future<ResponseFollowUp> getFollowUpAuditArea(int page, String name, int? branchId, String startDate, String endDate)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final responseFollowUp = await dio.get(AppConstant.getFollowUp, queryParameters: {'page': page,
      'name': name, 'branch_id': branchId, 'start_date': startDate, 'end_date': endDate});
      return ResponseFollowUp.fromJson(responseFollowUp.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseInputFollowUp>inputFollowUpAuditArea(int followUpId, List<int>? penaltyId, num charCoss, String desc)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    try {
      final responseInputFollowUp = await dio.post(AppConstant.inputFollowUp,
      data: {'followup_id': followUpId, 'penalty_id': penaltyId, 'charging_costs': charCoss, 'description': desc});
      final messageSucces = responseInputFollowUp.data['message'];
      snackBarMessageGreen('Berhasil', messageSucces);
      return ResponseInputFollowUp.fromJson(responseInputFollowUp.data);
    } on DioException  catch (e) {
      final messageError = e.response?.data['message'];
      snackBarMessageRed('Gagal', messageError);
      throw Exception(e);
    }
  }

  Future<ResponseMessage>uploadFollowUp(String filePath, int? followUpId)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'multipart/form-data'
    };
    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(filePath),
      'followup_id': followUpId
    });
    try {
    final response = await dio.post(AppConstant.uploadFollowUp, data: formData);
    final messageSucces = response.data['message'];
      snackBarMessageGreen('Berhasil', messageSucces);
      return ResponseMessage.fromJson(response.data);
    } on DioException  catch (e) {
      final messageError = e.response?.data['message'];
      snackBarMessageRed('Gagal', messageError);
      throw Exception(e);
    }
  }

  Future<ResponseDetailFollowUp> getDetailFollowUpAuditArea(int? id)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get('${AppConstant.detailFollowUp}$id');
      return ResponseDetailFollowUp.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  //user profile
  Future<ResponseProfileAuditArea> getDetailUserAuditArea()async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get(AppConstant.detailUser);
      return ResponseProfileAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseMessage> editProfileUserAuditArea(String email, String fullName)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.patch(AppConstant.editProfileUser,
      data: {'email': email, 'fullname': fullName});
      final messageSucces = response.data['message'];
      snackBarMessageGreen('Berhasil', messageSucces);
      return ResponseMessage.fromJson(response.data);
    } on DioException  catch (e) {
      final messageError = e.response?.data['message'];
      snackBarMessageRed('Gagal', messageError);
      throw Exception(e);
    }
  }

  Future<ResponseMessage>changePasswordAuditArea(String currentPassword, String newPassword)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.patch(AppConstant.changePassword,
      data: {'current_password': currentPassword, 'new_password': newPassword});
      final messageSucces = response.data['message'];
      snackBarMessageGreen('Berhasil', messageSucces);
      return ResponseMessage.fromJson(response.data);
    } on DioException  catch (e) {
      final messageError = e.response?.data['message'];
      snackBarMessageRed('Gagal', messageError);
      throw Exception(e);
    }
  }



  //audit region
  //main schedules
  Future<ResponseMainScheduleAuditRegion>getMainSchedulesAuditRegion(int page, String startDate, String endDate)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get(AppConstant.getMainSchedule,
      queryParameters: {'page': page, 'start_date': startDate, 'end_date': endDate});
      return ResponseMainScheduleAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDetailScheduleAuditRegion> getDetailMainScheduleAuditRegion(int id)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get('${AppConstant.detailMainSchedule}$id');
      return ResponseDetailScheduleAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  //special schedule
  Future<ResponseSpecialScheduleAuditRegion>getSpecialSchedulesAuditRegion(int page, String startDate, String endDate)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get(AppConstant.getSpecialSchedule,
      queryParameters: {'page': page, 'start_date': startDate, 'end_date': endDate});
      return ResponseSpecialScheduleAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDetailScheduleAuditRegion> getDetailSpecialScheduleAuditRegion(int id)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get('${AppConstant.detailMainSchedule}$id');
      return ResponseDetailScheduleAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  //reschedule
  Future<ResponseReschedulesAuditRegion>getReschedulesAuditRegion(int page, String startDate, String endDate)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get(AppConstant.getReschedule,
      queryParameters: {'page': page, 'start_date': startDate, 'end_date': endDate});
      return ResponseReschedulesAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDetailRescheduleAuditRegion> getDetailRescheduleAuditRegion(int id)async{
   final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get('${AppConstant.detailReschedule}$id');
      return ResponseDetailRescheduleAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  //LHA
  Future<ResponseMessage>inputLhaAuditRegion(int scheduleId, List<LhaDetail>lhaDetail)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.post(AppConstant.inputLha,
      data: {'schedule_id': scheduleId, 'lha_detail': lhaDetail.toList()});
      final messageSucces = response.data['message'];
      snackBarMessageGreen('Berhasil', messageSucces);
      return ResponseMessage.fromJson(response.data);
    } on DioException  catch (e) {
      final messageError = e.response?.data['message'];
      snackBarMessageRed('Gagal', messageError);
      throw Exception(e);
    }
  }

  Future<ResponseMessage>inputCaseLhaAuditRegion(int lhaDetailId, int? caseId, int? caseCategory, String desc,
    String suggestion, String tempRec, String perRec, int isResearch)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.post(AppConstant.inputCaseLha,
      data: {'audit_daily_report_id': lhaDetailId, 'case_id': caseId, 'case_category_id': caseCategory, 'description': desc, 'suggestion': suggestion,
      'temporary_recommendations': tempRec, 'permanent_recommendations': perRec, 'is_research': isResearch});
      final messageSucces = response.data['message'];
      snackBarMessageGreen('Berhasil', messageSucces);
      return ResponseMessage.fromJson(response.data);
    } on DioException  catch (e) {
      final messageError = e.response?.data['message'];
      snackBarMessageRed('Gagal', messageError);
      throw Exception(e);
    }
  }

  Future<ResponseDetailLhaCasesLhaAuditRegion>getDetailCasesLha(int lhaId)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get('${AppConstant.detailCasesLha}$lhaId');
      return ResponseDetailLhaCasesLhaAuditRegion.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ResponseDetailLhaAuditRegion> getDetailLhaAuditRegion(int? id)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get('${AppConstant.detailLha}$id');
      return ResponseDetailLhaAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseLhaAuditRegion>getListLhaAuditRegion(int page, String startDate, String endDate)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get(AppConstant.getListLha,
      queryParameters: {'page': page, 'start_date': startDate, 'end_date': endDate});
      return ResponseLhaAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseMessage>deleteCaseLha(int? lhaDetailId)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.delete('${AppConstant.deleteCaseLha}$lhaDetailId');
      final messageSucces = response.data['message'];
      snackBarMessageGreen('Berhasil', messageSucces);
      return ResponseMessage.fromJson(response.data);
    } on DioException  catch (e) {
      final messageError = e.response?.data['message'];
      snackBarMessageRed('Gagal', messageError);
      throw Exception(e);
    }
  }

  //KKA
  Future<ResponseMessage>uploadKkaAuditRegion(String filePath, int id)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'multipart/form-data'
    };
    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(filePath),
      'schedule_id': id
    });
    try {
      final response = await dio.post(AppConstant.uploadKka, data: formData);
     final messageSucces = response.data['message'];
      snackBarMessageGreen('Berhasil', messageSucces);
      return ResponseMessage.fromJson(response.data);
    } on DioException  catch (e) {
      final messageError = e.response?.data['message'];
      snackBarMessageRed('Gagal', messageError);
      throw Exception(e);
    }
  }

  Future<ResponseKkaAuditRegion>getKkaAuditRegion(int page, int? scheduleId, String startDate, String endDate)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get(AppConstant.getListKka, queryParameters: {
        'page': page, 'schedule_id': scheduleId, 'start_date': startDate, 'end_date': endDate
      });
      return ResponseKkaAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDetailKkaAuditRegion>getDetailKkaAuditRegion(int id)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get('${AppConstant.detailKka}$id');
      return ResponseDetailKkaAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  //report
  Future<ResponseReportAuditRegion>getReportAuditRegion(String startDate, String endDate)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get(AppConstant.downloadReportClarification, queryParameters: {
        'start_date': startDate, 'end_date': endDate
      });
      return ResponseReportAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  //master
  Future<ResponseRecommendationAuditRegion>getRecommendation()async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get(AppConstant.getDropdownPenalty);
      return ResponseRecommendationAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseBranchAuditRegion> getBranchAuditRegion() async {
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get(AppConstant.getDropdownBranch);
      return ResponseBranchAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseCaseAuditRegion>getCasesAuditRegion()async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get(AppConstant.getsDropdownCase);
      return ResponseCaseAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseCaseCategoryAuditRegion>getCaseCategoryAuditRegion(int? caseId)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get(AppConstant.getDropdownCaseCategory,
      queryParameters: {'case_id': caseId});
      return ResponseCaseCategoryAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponsePriorityFindingAuditRegion>getPriorityFindingAuditRegion()async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get(AppConstant.getDropdownPriorityFindingClarification);
      return ResponsePriorityFindingAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }


  //clarification
  Future<ResponseClarificationAuditRegion>getClarificationAuditRegion(int page, String startDate, String endDate)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get(AppConstant.getClarification,
      queryParameters: {'page': page, 'start_date': startDate, 'end_date': endDate});
      return ResponseClarificationAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseMessage>generateClarification(int? caseId, int? caseCategoryId, int? branchId)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.post(AppConstant.generateClarification, data: {
        'case_id': caseId, 'case_category_id': caseCategoryId, 'branch_id': branchId
      });
      final messageSucces = response.data['message'];
      snackBarMessageGreen('Berhasil', messageSucces);
      return ResponseMessage.fromJson(response.data);
    } on DioException  catch (e) {
      final messageError = e.response?.data['message'];
      snackBarMessageRed('Gagal', messageError);
      throw Exception(e);
    }
  }

  Future<ResponseInputClarification>inputClarificationAuditRegion(int? clarificationId, String evaluationLimitation, String location, String auditee, String auditeeLeader,
  String description, String priority)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.post(AppConstant.inputClarification,
          data: {'clarification_id': clarificationId, 'evaluation_limitation': evaluationLimitation, 'location': location, 
          'auditee': auditee, 'auditee_leader': auditeeLeader, 'description': description, 'priority': priority});
      print(response.data);
      final messageSucces = response.data['message'];
      snackBarMessageGreen('Berhasil', messageSucces);
      return ResponseInputClarification.fromJson(response.data);
    } on DioException  catch (e) {
      final messageError = e.response?.data['message'];
      snackBarMessageRed('Gagal', messageError);
      throw Exception(e);
    }
  }

  Future<ResponseMessage>uploadClarificationAuditRegion(String filePath, int? id)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'multipart/form-data'
    };

    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(filePath),
      'clarification_id': id
    });
    try {
      final response = await dio.post(AppConstant.uploadClarification, data: formData);
      final messageSucces = response.data['message'];
      snackBarMessageGreen('Berhasil', messageSucces);
      return ResponseMessage.fromJson(response.data);
    } on DioException  catch (e) {
      final messageError = e.response?.data['message'];
      snackBarMessageRed('Gagal', messageError);
      throw Exception(e);
    }
  }

  Future<ResponseIdentification>inputIdentificationClarificationAuditRegion(int? clarificationId, int evaluationClarification,
      num loss, List<int> recommendation, int followUp)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.post(AppConstant.inputIdentificationClarification, data: {
        'clarification_id': clarificationId,
        'evaluation': evaluationClarification,
        'nominal_loss': loss,
        'recommendation': recommendation,
        'is_followup': followUp
      });
      print(response.data);
      final messageSucces = response.data['message'];
      snackBarMessageGreen('Berhasil', messageSucces);
      return ResponseIdentification.fromJson(response.data);
    } on DioException  catch (e) {
      final messageError = e.response?.data['message'];
      snackBarMessageRed('Gagal', messageError);
      throw Exception(e);
    }
  }

  Future<ResponseDetailClarificationAuditRegion>detailClarificationAuditRegion(int id)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get('${AppConstant.detailClarification}$id');
      return ResponseDetailClarificationAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  //BAP
  Future<ResponseMessage>uploadBapAuditRegion(String filePath, int? bapId)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'multipart/form-data'
    };
    FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(filePath),
        'bap_id': bapId
      }
    );
    try {
      final response = await dio.post(AppConstant.uploadBap, data: formData);
      final messageSucces = response.data['message'];
      snackBarMessageGreen('Berhasil', messageSucces);
      return ResponseMessage.fromJson(response.data);
    } on DioException  catch (e) {
      final messageError = e.response?.data['message'];
      snackBarMessageRed('Gagal', messageError);
      throw Exception(e);
    }
  }

  Future<ResponseBapAuditRegion>getBapAuditRegion(int page, String startDate, String endDate)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get(AppConstant.getBap,
      queryParameters: {'page': page, 'start_date': startDate, 'end_date': endDate});
      return ResponseBapAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }
  
  Future<ResponseDetailBapAuditRegion>getDetailBapAuditRegion(int? id)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get('${AppConstant.detailBap}$id');
      return ResponseDetailBapAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  //user profile
  Future<ResponseProfileAuditRegion> getDetailUserAuditRegion()async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token'
    };
    try {
      final response = await dio.get(AppConstant.detailUser);
      return ResponseProfileAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseMessage> editProfileUserAuditRegion(String? email, String? fullName)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.patch(AppConstant.editProfileUser,
      data: {'email': email, 'fullname': fullName});
      final messageSucces = response.data['message'];
      snackBarMessageGreen('Berhasil', messageSucces);
      return ResponseMessage.fromJson(response.data);
    } on DioException  catch (e) {
      final messageError = e.response?.data['message'];
      snackBarMessageRed('Gagal', messageError);
      throw Exception(e);
    }
  }

  Future<ResponseMessage>changePasswordAuditRegion(String currentPassword, String newPassword)async{
    final token = await TokenManager.getToken();
    dio.options.headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.patch(AppConstant.changePassword,
      data: {'current_password': currentPassword, 'new_password': newPassword});
      final messageSucces = response.data['message'];
      snackBarMessageGreen('Berhasil', messageSucces);
      return ResponseMessage.fromJson(response.data);
    } on DioException  catch (e) {
      final messageError = e.response?.data['message'];
      snackBarMessageRed('Gagal', messageError);
      throw Exception(e);
    }
  }
}
