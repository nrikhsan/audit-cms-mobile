import 'package:audit_cms/data/core/response/auditArea/clarification/response_detail_clarification_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/lha/ModelBodyEditLhaAuditArea.dart';
import 'package:audit_cms/data/core/response/auditArea/lha/response_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/followUp/reponse_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_area_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_attachment_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_auditor_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_branch_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_status_schedules_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_add_schedules_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/bap/response_bap_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/clarification/response_clarification_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/bap/response_detail_bap_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/followUp/response_detail_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/kka/response_detail_kka_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/lha/response_detail_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/userPorfile/response_detail_user_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/followUp/model_body_input_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/kka/response_kka_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/report/response_report_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_detail_schedule_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_main_schedules_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_reschedule_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/schedules/response_special_schedules_audit_area.dart';
import 'package:audit_cms/data/core/response/auditRegion/clarification/model_body_input_clarification_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/lha/model_body_input_lha_audit_region.dart';
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
import 'package:audit_cms/data/core/response/auditRegion/clarification/response_document_clarification_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/kka/response_kka_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/master/response_priority_finding_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/report/response_report_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/schedules/response_main_schedule_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/schedules/response_reschedule_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/master/response_sop_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/schedules/response_special_schedule_audit_region.dart';
import 'package:audit_cms/data/core/response/responseMessage/response_message.dart';
import 'package:dio/dio.dart';
import '../../../helper/prefs/token_manager.dart';
import '../../constant/app_constants.dart';
import '../response/auth/response_auth.dart';

class ApiService {
  Dio dio = Dio(BaseOptions(baseUrl: AppConstant.baseUrl));

  Future<ResponseAuth> login(String email, String password) async {
    dio.options.headers = {
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.post(AppConstant.auth,
      data: ModelAuth(email: email, password: password).toJson());
      print(response.data);
      return ResponseAuth.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  //audit area
  //schedules
  Future<ResponseMessage>addScheduleAuditArea(int auditorId, int areaId, int branchId, String startDate, String endDat, String desc) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.post(AppConstant.addSchedulesAuditArea,
          data: ModelBodyAddScheduleAuditArea(auditor: auditorId, area: areaId, branch: branchId,
          startDate: startDate, endDate: endDat, scheduleDescription: desc).toJson());
      print(response.data);
      return ResponseMessage.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseMainScheduleAuditArea> getMainSchedulesAuditArea() async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.mainScheduleAuditArea);
      return ResponseMainScheduleAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseMainScheduleAuditArea> filterMainScheduleAuditArea(
      String startDate, String endDate, String branch, String auditor) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response =
          await dio.get(AppConstant.mainScheduleAuditArea, queryParameters: {
        'start_date': startDate,
        'end_date': endDate,
        'branch': branch,
        'auditor': auditor
      });
      
      return ResponseMainScheduleAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseSpecialSchedulesAuditArea> getSpecialSchedulesAuditArea() async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.specialScheduleAuditArea);
      
      return ResponseSpecialSchedulesAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseSpecialSchedulesAuditArea> filterSpecialSchedulesAuditArea(
      String startDate, String endDate, String branch, String auditor) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response =
          await dio.get(AppConstant.specialScheduleAuditArea, queryParameters: {
        'start_date': startDate,
        'end_date': endDate,
        'branch': branch,
        'auditor': auditor
      });
      
      return ResponseSpecialSchedulesAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseReschedulesAuditArea> getReschedulesAuditArea() async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.resSchedulesAuditArea);
      return ResponseReschedulesAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseReschedulesAuditArea> filterReschedulesAuditArea(
      String startDate, String endDate, String branch, String auditor) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response =
      await dio.get(AppConstant.resSchedulesAuditArea, queryParameters: {
        'start_date': startDate,
        'end_date': endDate,
        'branch': branch,
        'auditor': auditor
      });
      return ResponseReschedulesAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDetailSchedulesAuditArea> getDetailScheduleAuditArea(int id) async {
    dio.options.headers = {
      'Auhtorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get('${AppConstant.detailScheduleAuditArea}$id');
      return ResponseDetailSchedulesAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }


  //master
  Future<ResponseAuditorAuditArea> getAuditorAuditArea() async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.auditorAuditArea);
      
      return ResponseAuditorAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseAreaAuditArea> getAreaAuditArea() async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.areaAuditArea);
      
      return ResponseAreaAuditArea.fromJson(response.data);
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

  Future<ResponseStatusScheduleAuditArea> getStatusScheduleAuditArea() async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.statusAuditArea);
      
      return ResponseStatusScheduleAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseAttachmentAuditArea>getAttachmentFollowUpAuditArea()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
    };
    try {
      final responseAttahcment = await dio.get(AppConstant.attachmentFollowUpAuditArea);

      return ResponseAttachmentAuditArea.fromJson(responseAttahcment.data);
    } catch (error) {
      throw Exception(error);
    }
  }


  //LHA
  Future<ResponseLhaAuditArea> getLhaAuditArea() async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
    };
    try {
      final response = await dio.get(AppConstant.lhaAuditArea);
      
      return ResponseLhaAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseLhaAuditArea> filterLhaAuditArea(String startDate, String endDate, String branch, String auditor)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
    };
    try{
      final response = await dio.get(AppConstant.lhaAuditArea, queryParameters: {
        'start_date': startDate,
        'end_date': endDate,
        'branch': branch,
        'auditor': auditor});
        
      return ResponseLhaAuditArea.fromJson(response.data);
    }catch(error){
      throw Exception(error);
    }
  }

  Future<ResponseDetailLhaAuditArea> getDetailLhaAuditArea(int id) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get('${AppConstant.detailLhaAuditArea}$id');
      
      return ResponseDetailLhaAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseMessage> editLhaAuditArea(int id, String lhaDescription) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try{
      final response = await dio.put('${AppConstant.editLhaAuditArea}$id',
      data: ModelBodyEditLhaAuditArea(lhaDescription: lhaDescription).toJson());
      return ResponseMessage.fromJson(response.data);
    }catch(error){
      throw Exception(error);
    }
  }


  //clarification
  Future<ResponseClarificationAuditArea>getClarificationAuditArea()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
    };
    try{
      final response = await dio.get(AppConstant.clarificationAuditArea);
      
      return ResponseClarificationAuditArea.fromJson(response.data);
    }catch(error){
      throw Exception(error);
    }
  }

  Future<ResponseClarificationAuditArea> filterClarificationAuditArea(String startDate, String endDate, String branch, String auditor)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
    };

    try {
      final response = await dio.get(AppConstant.clarificationAuditArea,
          queryParameters: {'start_date': startDate, 'end_date': endDate, 'branch': branch, 'auditor': auditor});

      return ResponseClarificationAuditArea.fromJson(response.data);
    } catch (error) {
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
  Future<ResponseKkaAuditArea> getKkaAuditArea()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.kkaAuditArea);
      
      return ResponseKkaAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseKkaAuditArea> getFilterKkaAuditArea(String startDate, String endDate, String branch, String auditor)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
    };
    try {
      final response = await dio.get(AppConstant.kkaAuditArea, queryParameters: {
        'start_date': startDate, 'end_date': endDate, 'branch': branch, 'auditor': auditor 
      });
      
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
  Future<ResponseBapAuditArea>getBapAuditArea()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
    };
    try {
      final responseBap = await dio.get(AppConstant.bapAuditArea);
      return ResponseBapAuditArea.fromJson(responseBap.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseBapAuditArea>filterBapAuditArea(String startDate, String endDate, String branch, String auditor)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
    };
    try {
      final responseBap = await dio.get(AppConstant.bapAuditArea, queryParameters: {
        'start_date': startDate, 'end_date': endDate, 'branch': branch, 'auditor': auditor 
      });
      
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
  Future<ResponseFollowUpAuditArea> getFollowUpAuditArea()async{
     dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
    };
    try {
        final responseFollowUp = await dio.get(AppConstant.followUpAuditArea);
        
        return ResponseFollowUpAuditArea.fromJson(responseFollowUp.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseFollowUpAuditArea> filterDataFollowUpAuditArea(String startDate, String endDate, String auditor, String branch)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
    };
    try {
      final response = await dio.get(AppConstant.followUpAuditArea, queryParameters: {
        'start_date': startDate, 'end_date': endDate, 'auditor': auditor, 'branch': branch
      });
      return ResponseFollowUpAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseMessage>inputFollowUpAuditArea(int penalty, String realization, String explanationPenalty, int attachment)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final responseInputFollowUp = await dio.post(AppConstant.inputFollowUpAuditArea,
      data: ModelBodyFollowUpAuditArea(penalty: penalty, realization: realization, explanationPenalty: explanationPenalty, attachment: attachment).toJson());
      print(responseInputFollowUp.data);
      return ResponseMessage.fromJson(responseInputFollowUp.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDocumentFollowUpAuditArea> getDocumentFollowUpAuditArea()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
    };
    try {
      final responseDoc = await dio.get(AppConstant.followUpDocumentAuditArea);
      
      return ResponseDocumentFollowUpAuditArea.fromJson(responseDoc.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDetailFollowUpAuditArea> getDetailFollowUpAuditArea(int id)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
    };
    try {
      final response = await dio.get('${AppConstant.detailFollowUpAuditArea}$id');
      return ResponseDetailFollowUpAuditArea.fromJson(response.data);
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
  Future<ResponseDetailUserAuditArea> getDetailUserAuditArea()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
    };
    try {
      final response = await dio.get(AppConstant.detailUserAuditArea);
      return ResponseDetailUserAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseMessage> editProfileUserAuditArea(int id, String email, String username)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.put('${AppConstant.editProfileUserAuditArea}$id',
      data: {'email': email, 'username': username});
      print(response.data);
      return ResponseMessage.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseMessage>changePasswordAuditArea(int id, String oldPassword, String newPassword, String confirmPassword)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.put('${AppConstant.changePasswordAuditArea}$id',
      data: {'old_password': oldPassword, 'new_password': newPassword, 'confirm_password': confirmPassword});
      print(response.data);
      return ResponseMessage.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }



  //audit region
  //schedules
  Future<ResponseMainScheduleAuditRegion>getMainSchedulesAuditRegion()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.mainScheduleAuditRegion);
      return ResponseMainScheduleAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseMainScheduleAuditRegion>filterMainSchedulesAuditRegion(String startDate, String endDate)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.mainScheduleAuditRegion, queryParameters: {
        'start_date': startDate, 'end_date': endDate
      });
      return ResponseMainScheduleAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseSpecialScheduleAuditRegion>getSpecialSchedulesAuditRegion()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.specialScheduleAuditRegion);
      return ResponseSpecialScheduleAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseSpecialScheduleAuditRegion>filterSpecialSchedulesAuditRegion(String startDate, String endDate)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.specialScheduleAuditRegion, queryParameters: {
        'start_date': startDate, 'end_date': endDate
      });
      return ResponseSpecialScheduleAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseRescheduleAuditRegion>getReschedulesAuditRegion()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.reScheduleAuditRegion);
      return ResponseRescheduleAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseRescheduleAuditRegion>filterRescheduleAuditRegion(String startDate, String endDate)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.reScheduleAuditRegion, queryParameters: {
        'start_date': startDate, 'end_date': endDate
      });
      return ResponseRescheduleAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDetailScheduleAuditRegion> getDetailScheduleAuditRegion(int id)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get('${AppConstant.detailScheduleAuditRegion}$id');
      return ResponseDetailScheduleAuditRegion.fromJson(response.data);
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
  Future<ResponseDivisionAuditRegion>getDivisionAuditRegion()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.divisionAuditRegion);
      return ResponseDivisionAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseSopAuditRegion>getSopAuditRegion()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.sopAuditRegion);
      return ResponseSopAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseClarificationCategoryAuditRegion>getClarificationCategoryAuditRegion()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.clarificationCategoryAuditRegion);
      return ResponseClarificationCategoryAuditRegion.fromJson(response.data);
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


  //LHA
  Future<ResponseMessage>inputLhaAuditRegion(int divisionId, String findingDesc, int sopId, String temporaryRec, String permanentRec, int researchValue, String suggest)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.post(AppConstant.inputLhaAuditRegion,
      data: ModelBodyInputLhaAuditRegion(division: divisionId, findingDescription: findingDesc,
      sopCategory: sopId, temporaryRecommendation: temporaryRec, permanentRecommendation: permanentRec, research: researchValue, recommendationOrSuggest: suggest).toJson());
      print(response.data);
      return ResponseMessage.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
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

  Future<ResponseLhaAuditRegion>getListLhaAuditRegion()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.lhaAuditRegion);
      return ResponseLhaAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }


  //clarification
  Future<ResponseClarificationAuditRegion>getClarificationAuditRegion()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.clarificationAuditRegion);
      return ResponseClarificationAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

   Future<ResponseClarificationAuditRegion>filterClarificationAuditRegion(String startDate, String endDate)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.clarificationAuditRegion, queryParameters: {'start_date': startDate, 'end_date': endDate});
      return ResponseClarificationAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseMessage>inputClarificationAuditRegion(int category, String limitEvaluation,
      String location, String division, String supervisor, String dear, String findingDescription, int priorityFinding)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.post(AppConstant.inputClarificationAuditRegion,
          data: ModelInputClarificationAuditRegion(clarificationCategory: category, limitEvaluation: limitEvaluation,
              inspectionLocation: location, inspectionDivision: division, directSupervisor: supervisor, dear: dear,
              findingDescription: findingDescription, priorityFinding: priorityFinding).toJson());
      print(response.data);
      return ResponseMessage.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDocumentClarificationAuditRegion>getDocumentClarification(int id)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get("${AppConstant.documentClarificationAuditRegion}$id");
      return ResponseDocumentClarificationAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseMessage>uploadClarificationAuditRegion(String filePath)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'multipart/form-data'
    };

    FormData formData = FormData.fromMap({
      'clarification_doc': await MultipartFile.fromFile(filePath)
    });
    try {
      final response = await dio.post(AppConstant.uploadClarificationAuditRegion, data: formData);
      print(response.data);
      return ResponseMessage.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseMessage>inputIdentificationClarificationAuditRegion(int evaluationClarification,
      String loss, String description, int followUp)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.post(AppConstant.inputIdentificationClarification, data: {
        'evaluation_clarification': evaluationClarification,
        'loss': loss,
        'description_or_recommendation': description,
        'follow_up': followUp
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


  //KKA
  Future<ResponseMessage>uploadKkaAuditRegion(String filePath)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'multipart/form-data'
    };
    FormData formData = FormData.fromMap({
      'kka_doc' : await MultipartFile.fromFile(filePath)
    });
    try {
      final response = await dio.post(AppConstant.uploadKkaAuditRegion, data: formData);
      print(response.data); 
      return ResponseMessage.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseKkaAuditRegion>getKkaAuditRegion()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.kkaAuditRegion);
      return ResponseKkaAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseKkaAuditRegion>filterKkaAuditRegion(String startDate, String endDate)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.kkaAuditRegion, queryParameters: {
        'start_date': startDate, 'end_date': endDate
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


  //BAP
  Future<ResponseMessage>uploadBapAuditRegion(String filePath)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'multipart/form-data'
    };
    FormData formData = FormData.fromMap({
        'bap_doc': await MultipartFile.fromFile(filePath)
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

  Future<ResponseBapAuditRegion>getBapAuditRegion()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.bapAuditRegion);
      return ResponseBapAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }
  
  Future<ResponseBapAuditRegion>filterBapAuditRegion(String startDate, String endDate)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get(AppConstant.bapAuditRegion, queryParameters: {
        'start_date': startDate, 'end_date': endDate
      });
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