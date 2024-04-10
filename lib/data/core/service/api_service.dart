import 'package:audit_cms/data/core/response/auditArea/clarification/response_detail_clarification_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/lha/response_detail_lha_revision.dart';
import 'package:audit_cms/data/core/response/auditArea/lha/response_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/followUp/reponse_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/lha/response_revisi_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_penalty_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_branch_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_case_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_case_category_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_case_category_by_id_audit_area.dart';
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
import 'package:audit_cms/data/core/response/auditArea/followUp/request_body_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/kka/response_kka_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/report/response_report_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_detail_schedule_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_main_schedules_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_reschedule_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_special_schedules_audit_area.dart';
import 'package:audit_cms/data/core/response/auditRegion/lha/model_body_input_lha_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/bap/response_bap_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/clarification/response_clarification_audit_region.dart';
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
import 'package:audit_cms/data/core/response/auditRegion/userProfile/response_detail_user_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/kka/response_kka_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/master/response_priority_finding_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/report/response_report_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/schedules/response_main_schedule_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/schedules/response_reschedule_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/schedules/response_special_schedule_audit_region.dart';
import 'package:audit_cms/data/core/response/responseMessage/response_message.dart';
import 'package:dio/dio.dart';
import '../../../helper/prefs/token_manager.dart';
import '../../constant/app_constants.dart';
import '../response/auth/response_auth.dart';

class ApiService {
  Dio dio = Dio(BaseOptions(baseUrl: AppConstant.baseUrl));

  // auth login
  Future<ResponseAuth> login(String username, String password) async {
    dio.options.headers = {
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.post(AppConstant.auth,
      data: ModelAuth(username: username, password: password).toJson());
      print(response.data);
      return ResponseAuth.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  //audit area
  //main schedules
  Future<ResponseMessage>addMainSchedules(List<ModelBodySchedulesAuditArea> schedule) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    
    try {
      final response = await dio.post(AppConstant.addMainSchedulesAuditArea,
          data: {'schedule': schedule.toList()});
      print(response.data);
      return ResponseMessage.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseMessage>editMainSchedule(int id, int userId, int branchId, String startDate, String endDate, String description)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.put('${AppConstant.editMainSchedule}$id', data: RequestBodyEditSchedule(userId: userId, branchId: branchId,
      startDate: startDate, endDate: endDate, description: description).toJson());
      print(response.data);
      return ResponseMessage.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ResponseMessage>deleteMainSchedule(int id)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
    };
    try {
      final response = await dio.delete('${AppConstant.deleteMainSchedule}$id');
      print(response.data);
      return ResponseMessage.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ResponseMainScheduleAuditArea> getMainSchedulesAuditArea(int page, String name, String branch, String startDate, String endDate) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.mainScheduleAuditArea, 
      queryParameters: {'page': page, 'name': name, 'branch': branch, 'start_date': startDate, 'end_date': endDate});
      return ResponseMainScheduleAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDetailScheduleAuditArea> getDetailMainScheduleAuditArea(int id) async {
    dio.options.headers = {
      'Auhtorization': 'Bearer ${TokenManager.getToken()}'
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
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    
    try {
      final response = await dio.post(AppConstant.addSpecialSchedulesAuditArea,
          data: {'schedule': schedule.toList()});
      print(response.data);
      return ResponseMessage.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseSpecialScheduleAuditArea> getSpecialSchedulesAuditArea(int page, String name, String branch, String startDate, String endDate) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.specialScheduleAuditArea, 
      queryParameters: {'page': page, 'name': name, 'branch': branch, 'start_date': startDate, 'end_date': endDate});
      return ResponseSpecialScheduleAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseMessage>editSpecialSchedule(int id, int userId, int branchId, String startDate, String endDate, String description)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.put('${AppConstant.editSpecialSchedule}$id', data: RequestBodyEditSchedule(userId: userId, branchId: branchId,
      startDate: startDate, endDate: endDate, description: description).toJson());
      print(response.data);
      return ResponseMessage.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ResponseMessage>deleteSpecialSchedule(int id)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
    };
    try {
      final response = await dio.delete('${AppConstant.deleteSpecialSchedule}$id');
      print(response.data);
      return ResponseMessage.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ResponseDetailScheduleAuditArea> getDetailSpecialScheduleAuditArea(int id) async {
    dio.options.headers = {
      'Auhtorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get('${AppConstant.detailSpecilaSchedule}$id');
      return ResponseDetailScheduleAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  //reschedule
  Future<ResponseMessage>requestReschedule(int userId, int scheduleId, int branchId, String startDate, String endDate, String desc)async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.post(AppConstant.requestReschedule,
          data: ModelBodyReschedulesAuditArea(userId: userId, scheduleId: scheduleId, 
          branchId: branchId, startDate: startDate, endDate: endDate, description: desc).toJson());
      print(response.data);
      return ResponseMessage.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseReschedulesAuditArea> getReschedulesAuditArea(int page, String name, String branch, String startDate, String endDate) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.reschedulesAuditArea,
       queryParameters: {'page': page, 'name': name, 'branch': branch, 'start_date': startDate, 'end_date': endDate});
      return ResponseReschedulesAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDetailRescheduleAuditArea> getDetailRescheduleAuditArea(int id) async {
    dio.options.headers = {
      'Auhtorization': 'Bearer ${TokenManager.getToken()}'
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
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.usersAuditArea);
      return ResponseUsers.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseBranchAuditArea> getBranchAuditArea() async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
    };
    try {
      final response = await dio.get(AppConstant.branchAuditArea);
      return ResponseBranchAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseCaseAuditArea> getCaseAuditArea() async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
    };
    try {
      final response = await dio.get(AppConstant.caseAuditArea);
      return ResponseCaseAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseCaseCategoryAuditArea> getCaseCategoryAuditArea() async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
    };
    try {
      final response = await dio.get(AppConstant.caseCategoryAuditArea);
      return ResponseCaseCategoryAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseCaseCategoryByIdAuditArea> getCaseCategoryByIdAuditArea(int caseId) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
    };
    try {
      final response = await dio.get(AppConstant.caseCategoryAuditArea, queryParameters: {'casesId': caseId});
      return ResponseCaseCategoryByIdAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponsePenaltyAuditArea>getPenaltyAuditArea()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
    };
    try {
      final response = await dio.get(AppConstant.penlatyAuditArea);
      return ResponsePenaltyAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  //LHA
  Future<ResponseRevisionLhaAuditArea>getRevisiLhaAuditArea(int lhaId, int page)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.listRevisiLha, 
      queryParameters: {'lha_id': lhaId, 'page': page});
      return ResponseRevisionLhaAuditArea.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ResponseMessage>revisiLhaAuditArea(int lhaId, int caseId, int caseCategoryId, String desc, String suggest, String tempRec, String perRec, int isResearch)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.post(AppConstant.lhaRevision, 
      queryParameters: {'audit_daily_report_detail_id': lhaId, 'case_id': caseId, 'case_category_id': caseCategoryId,
      'description': desc, 'suggestion': suggest, 'temporary_recommendations': tempRec, 'permanent_recommendations': perRec, 'is_research': isResearch});
      print(response.data);
      return ResponseMessage.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ResponseDetailLhaRevision>getDetailRevisionLha(int lhaId)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get('${AppConstant.revisionlhaDetail}$lhaId');
      return ResponseDetailLhaRevision.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ResponseLhaAuditArea> getLhaAuditArea(int page, int scheduleId, String name, String branch, String startDate, String endDate) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
    };
    try {
      final response = await dio.get(AppConstant.lhaAuditArea, queryParameters: {'page': page, 'schedule_id': scheduleId, 
      'name': name, 'branch': branch, 'start_date': startDate, 'end_date': endDate});
      return ResponseLhaAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDetailLhaAuditArea> getDetailLhaAuditArea(int id) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get('${AppConstant.detaillhaAuditArea}$id');
      return ResponseDetailLhaAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  //clarification
  Future<ResponseClarificationAuditArea>getClarificationAuditArea(int page, String name, String branch, String startDate, String endDate)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
    };
    try{
      final response = await dio.get(AppConstant.clarificationAuditArea, queryParameters: {'page': page, 
      'name': name, 'branch': branch, 'start_date': startDate, 'end_date': endDate});
      return ResponseClarificationAuditArea.fromJson(response.data);
    }catch(error){
      throw Exception(error);
    }
  }

  Future<ResponseDetailClarificationAuditArea> getDetailClarificationAuditArea(int id)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
    };
    try {
    final response = await dio.get('${AppConstant.detailClarificationAuditArea}$id');
    return ResponseDetailClarificationAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  //KKA
  Future<ResponseKkaAuditArea> getKkaAuditArea(int page, int scheduleId, String name, String branch, String startDate, String endDate)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.kkaAuditArea, queryParameters: {'page': page, 'schedule_id': scheduleId, 
      'name': name, 'branch': branch, 'start_date': startDate, 'end_date': endDate});
      return ResponseKkaAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDetailKkaAuditArea> getDetailKkaAuditArea(int id)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
        final responseDetail = await dio.get('${AppConstant.detailKkaAuditArea}$id');
        return ResponseDetailKkaAuditArea.fromJson(responseDetail.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  //BAP
  Future<ResponseBapAuditArea>getBapAuditArea(int page, String name, String branch, String startDate, String endDate)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
    };
    try {
      final responseBap = await dio.get(AppConstant.bapAuditArea, queryParameters: {'page': page, 
      'name': name, 'branch': branch, 'start_date': startDate, 'end_date': endDate});
      return ResponseBapAuditArea.fromJson(responseBap.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDetailBapAuditArea> getDetailBapAuditArea(int id)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
    };
    try {
        final responseDetail = await dio.get('${AppConstant.detailBapAuditArea}$id');
        return ResponseDetailBapAuditArea.fromJson(responseDetail.data);
    } catch (error) {
      throw Exception(error);
    }
  }


  //follow up
  Future<ResponseFollowUp> getFollowUpAuditArea(int page, String name, String branch, String startDate, String endDate)async{
     dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
    };
    try {
        final responseFollowUp = await dio.get(AppConstant.followUpAuditArea, queryParameters: {'page': page, 
      'name': name, 'branch': branch, 'start_date': startDate, 'end_date': endDate});
        return ResponseFollowUp.fromJson(responseFollowUp.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseMessage>inputFollowUpAuditArea(int followUpId, int penaltyId, String desc, int isPenalty)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final responseInputFollowUp = await dio.post(AppConstant.inputFollowUpAuditArea,
      data: RequestBodyFollowUp(followupId: followUpId, penaltyId: penaltyId, description: desc, isPenalty: isPenalty));
      print(responseInputFollowUp.data);
      return ResponseMessage.fromJson(responseInputFollowUp.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDetailFollowUp> getDetailFollowUpAuditArea(int id)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
    };
    try {
      final response = await dio.get('${AppConstant.detailFollowUpAuditArea}$id');
      return ResponseDetailFollowUp.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }


  //report
  Future<ResponseReportAuditArea> getReportAuditArea(String branch, String startDate, String endDate)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.reportAuditArea, queryParameters: {
        'branch': branch, 'start_date': startDate, 'end_date': endDate
      });
      return ResponseReportAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  //user profile
  Future<ResponseProfileAuditArea> getDetailUserAuditArea()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
    };
    try {
      final response = await dio.get(AppConstant.detailUserAuditArea);
      return ResponseProfileAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseMessage> editProfileUserAuditArea(String email, String username)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.patch(AppConstant.editProfileUserAuditArea,
      data: {'email': email, 'username': username});
      print(response.data);
      return ResponseMessage.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseMessage>changePasswordAuditArea(String currentPassword, String newPassword)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.patch(AppConstant.changePasswordAuditArea,
      data: {'current_password': currentPassword, 'new_password': newPassword});
      print(response.data);
      return ResponseMessage.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }



  //audit region
  //main schedules
  Future<ResponseMainScheduleAuditRegion>getMainSchedulesAuditRegion(int page, String startDate, String endDate)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.mainScheduleAuditRegion,
      queryParameters: {'page': page, 'start_date': startDate, 'end_date': endDate});
      return ResponseMainScheduleAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDetailScheduleAuditRegion> getDetailMainScheduleAuditRegion(int id)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get('${AppConstant.detailMainScheduleAuditRegion}$id');
      return ResponseDetailScheduleAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  //special schedule
  Future<ResponseSpecialScheduleAuditRegion>getSpecialSchedulesAuditRegion(int page, String startDate, String endDate)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.specialScheduleAuditRegion, 
      queryParameters: {'page': page, 'start_date': startDate, 'end_date': endDate});
      return ResponseSpecialScheduleAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDetailScheduleAuditRegion> getDetailSpecialScheduleAuditRegion(int id)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get('${AppConstant.detailSpecialScheduleAuditRegion}$id');
      return ResponseDetailScheduleAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  //reschedule
  Future<ResponseReschedulesAuditRegion>getReschedulesAuditRegion(int page, String startDate, String endDate)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.reScheduleAuditRegion, 
      queryParameters: {'page': page, 'start_date': startDate, 'end_date': endDate});
      return ResponseReschedulesAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDetailRescheduleAuditRegion> getDetailRescheduleAuditRegion(int id)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get('${AppConstant.detailRescheduleAuditRegion}$id');
      return ResponseDetailRescheduleAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  //LHA
  Future<ResponseMessage>inputLhaAuditRegion(int scheduleId, List<LhaDetail>lhaDetail)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.post(AppConstant.inputLhaAuditRegion,
      data: {'schedule_id': scheduleId, 'lha_detail': lhaDetail.toList()});
      print(response.data);
      return ResponseMessage.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDetailLhaCasesLhaAuditRegion>getDetailCasesLha(int lhaId)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get('${AppConstant.caselhaDetailAuditRegion}$lhaId');
      return ResponseDetailLhaCasesLhaAuditRegion.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ResponseDetailLhaAuditRegion> getDetailLhaAuditRegion(int id)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get('${AppConstant.detailLhaAuditRegion}$id');
      return ResponseDetailLhaAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseLhaAuditRegion>getListLhaAuditRegion(int scheduleId, int page, String startDate, String endDate)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.lhaAuditRegion,
      queryParameters: {'schedule_id': scheduleId, 'page': page, 'start_date': startDate, 'end_date': endDate});
      return ResponseLhaAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  //KKA
  Future<ResponseMessage>uploadKkaAuditRegion(String filePath, int id)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'multipart/form-data'
    };
    FormData formData = FormData.fromMap({
      'file' : await MultipartFile.fromFile(filePath),
      'schedule_id': id
    });
    try {
      final response = await dio.post(AppConstant.uploadKkaAuditRegion, data: formData);
      print(response.data); 
      return ResponseMessage.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseKkaAuditRegion>getKkaAuditRegion(int page, int scheduleId, String startDate, String endDate)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.kkaAuditRegion, queryParameters: {
        'page': page, 'schedule_id': scheduleId, 'start_date': startDate, 'end_date': endDate
      });
      return ResponseKkaAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDetailKkaAuditRegion>getDetailKkaAuditRegion(int id)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get('${AppConstant.detailKkaAuditRegion}$id');
      return ResponseDetailKkaAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  //user profile
  Future<ResponseDetailUserAuditRegion> getDetailUserAuditRegion()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.detailUserAuditRegion);
      return ResponseDetailUserAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseMessage> editProfileUserAuditRegion(int id, String email, String username)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.put('${AppConstant.editProfileAuditRegion}$id',
      data: {'email': email, 'username': username});
      print(response.data);
      return ResponseMessage.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseMessage>changePasswordAuditRegion(int id, String oldPassword, String newPassword, String confirmPassword)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.put('${AppConstant.changePasswordAuditRegion}$id',
      data: {'old_password': oldPassword, 'new_password': newPassword, 'confirm_password': confirmPassword});
      print(response.data);
      return ResponseMessage.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }


  //report
  Future<ResponseReportAuditRegion>getReportAuditRegion(String startDate, String endDate)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
    };
    try {
      final response = await dio.get(AppConstant.reportAuditRegion);
      return ResponseReportAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  //master
  Future<ResponseBranchAuditRegion> getBranchAuditRegion() async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
    };
    try {
      final response = await dio.get(AppConstant.branchAuditRegion);
      return ResponseBranchAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseCaseAuditRegion>getCasesAuditRegion()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.caseAuditRegion);
      return ResponseCaseAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseCaseCategoryAuditRegion>getCaseCategoryAuditRegion()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.caseCategoryAuditRegion);
      return ResponseCaseCategoryAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseCaseCategoryByIdAuditRegion>getCaseCategoryByIdAuditRegion(int casesId)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.caseCategoryAuditRegion, queryParameters: {'casesId': casesId});
      return ResponseCaseCategoryByIdAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponsePriorityFindingAuditRegion>getPriorityFindingAuditRegion()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.priorityFindingClarificationAuditRegion);
      return ResponsePriorityFindingAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }


  //clarification
  Future<ResponseClarificationAuditRegion>getClarificationAuditRegion(int page, String startDate, String endDate)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.clarificationAuditRegion,
      queryParameters: {'page': page, 'start_date': startDate, 'end_date': endDate});
      return ResponseClarificationAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseMessage>generateClarification(int caseId, int caseCategoryId, int branchId)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.post(AppConstant.generateClarification);
      print(response.data);
      return ResponseMessage.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<ResponseMessage>inputClarificationAuditRegion(int clarificationId, String evaluationLimitation, String location, String auditee, String auditeeLeader,
  String description, String priority)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.post(AppConstant.inputClarificationAuditRegion,
          data: {'clarification_id': clarificationId, 'evaluation_limitation': evaluationLimitation, 'location': location, 
          'auditee': auditee, 'auditee_leader': auditeeLeader, 'description': description, 'priority': priority});
      print(response.data);
      return ResponseMessage.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseMessage>uploadClarificationAuditRegion(String filePath, int id)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'multipart/form-data'
    };

    FormData formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(filePath),
      'clarification_id': id
    });
    try {
      final response = await dio.post(AppConstant.uploadClarificationAuditRegion, data: formData);
      print(response.data);
      return ResponseMessage.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseMessage>inputIdentificationClarificationAuditRegion(int clarificationId, int evaluationClarification,
      String loss, String description, int followUp)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.post(AppConstant.inputIdentificationClarification, data: {
        'clarification_id': clarificationId,
        'evaluation': evaluationClarification,
        'nominal_loss': loss,
        'recommendation': description,
        'is_followup': followUp
      });
      print(response.data);
      return ResponseMessage.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDetailClarificationAuditRegion>detailClarificationAuditRegion(int id)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get('${AppConstant.detailClarificationAuditRegion}$id');
      return ResponseDetailClarificationAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  //BAP
  Future<ResponseMessage>uploadBapAuditRegion(String filePath, int bapId)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'multipart/form-data'
    };
    FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(filePath),
        'bap_id': bapId
      }
    );
    try {
      final response = await dio.post(AppConstant.uploadBapAuditRegion, data: formData);
      print(response.data);
      return ResponseMessage.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseBapAuditRegion>getBapAuditRegion(int page, String startDate, String endDate)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.bapAuditRegion,
      queryParameters: {'page': page, 'start_date': startDate, 'end_date': endDate});
      return ResponseBapAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }
  
  Future<ResponseDetailBapAuditRegion>getDetailBapAuditRegion(int id)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get('${AppConstant.detailBapAuditRegion}$id');
      return ResponseDetailBapAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }
}