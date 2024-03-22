import 'package:audit_cms/data/core/response/auditArea/reponse_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_add_schedules_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_attachment_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_bap_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_change_password_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_clarification_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_detail_bap_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_detail_clarification_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_detail_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_detail_kka_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_detail_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_detail_schedule_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_detail_user_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_dropdown_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_edit_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_edit_user_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_input_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_kka_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_report_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/response_schedules_audit_area.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_bap_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_change_password_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_clarification_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_clarification_category_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_detail_bap_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_detail_clarification_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_detail_kka_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_detail_lha_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_detail_schedule_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_detail_user_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_division_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_edit_user_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_input_clarification_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_input_indentifcation_clarification_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_input_lha_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_kka_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_lha_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_priority_finding_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_report_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_schedule_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_sop_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_upload_bap_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_upload_clarification_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_upload_kka_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/response_upload_report_audit_region.dart';
import 'package:dio/dio.dart';
import '../../../helper/prefs/token_manager.dart';
import '../../constant/app_constants.dart';
import '../response/auth/response_auth.dart';

class ApiService {
  Dio dio = Dio(BaseOptions(baseUrl: AppConstant.baseUrl));


  Future<ResponseAuth> login(String email, String password) async {
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
  Future<ResponseAddSchedulesAuditArea> addScheduleAuditArea(int auditorId, int areaId, int branchId, int statusId, String startDate, String endDat, String desc) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.post(AppConstant.addSchedulesAuditArea,
          data: ModelAddScheduleAuditArea(auditor: auditorId, area: areaId, branch: branchId, status: statusId, startDate: startDate, endDate: endDat, scheduleDescription: desc).toJson());
      return ResponseAddSchedulesAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }


  Future<ResponseSchedulesAuditArea> getMainSchedulesAuditArea() async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.get(AppConstant.mainScheduleAuditArea);
      
      return ResponseSchedulesAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseSchedulesAuditArea> filterMainScheduleAuditArea(
      String startDate, String endDate, String branch, String auditor) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response =
          await dio.get(AppConstant.filterMainScheduleAuditArea, queryParameters: {
        'start_date': startDate,
        'end_date': endDate,
        'branch': branch,
        'auditor': auditor
      });
      
      return ResponseSchedulesAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseSchedulesAuditArea> getSpecialSchedulesAuditArea() async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.get(AppConstant.specialScheduleAuditArea);
      
      return ResponseSchedulesAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }


  Future<ResponseSchedulesAuditArea> filterSpecialSchedulesAuditArea(
      String startDate, String endDate, String branch, String auditor) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response =
          await dio.get(AppConstant.filterSpecialScheduleAuditArea, queryParameters: {
        'start_date': startDate,
        'end_date': endDate,
        'branch': branch,
        'auditor': auditor
      });
      
      return ResponseSchedulesAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }
  Future<ResponseSchedulesAuditArea> getReschedulesAuditArea() async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.get(AppConstant.resSchedulesAuditArea);

      return ResponseSchedulesAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseSchedulesAuditArea> filterReschedulesAuditArea(
      String startDate, String endDate, String branch, String auditor) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response =
      await dio.get(AppConstant.filterReschedulesAuditArea, queryParameters: {
        'start_date': startDate,
        'end_date': endDate,
        'branch': branch,
        'auditor': auditor
      });

      return ResponseSchedulesAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDetailScheduleAuditArea> getDetailScheduleAuditArea(int id) async {
    dio.options.headers = {
      'Auhtorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.get('${AppConstant.detailScheduleAuditArea}$id');
      
      return ResponseDetailScheduleAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseAuditorAuditArea> getAuditorAuditArea() async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
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
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
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
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.get(AppConstant.branchAuditArea);
      
      return ResponseBranchAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseStatusScheduleAuditArea> getStatusAuditArea() async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.get(AppConstant.statusAuditArea);
      
      return ResponseStatusScheduleAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseLhaAuditArea> getLhaAuditArea() async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
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
      'Authorrization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try{
      final response = await dio.get(AppConstant.filterLhaAuditArea, queryParameters: {
        'start_date': startDate, 'end_date': endDate, 'branch': branch, 'auditor': auditor});
        
      return ResponseLhaAuditArea.fromJson(response.data);
    }catch(error){
      throw Exception(error);
    }
  }

  Future<ResponseDetailLhaAuditArea> getDetailLhaAuditArea(int id) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-type': 'application/json'
    };
    try {
      final response = await dio.get('${AppConstant.detailLhaAuditArea}$id');
      
      return ResponseDetailLhaAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseEditLhaAuditArea> editLhaAuditArea(int id, String lhaDescription) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/jsoon'
    };
    try{
      final response = await dio.put('${AppConstant.editLhaAuditArea}$id',
      data: ModelBodyEditLhaAuditArea(lhaDescription: lhaDescription).toJson());
      
      return ResponseEditLhaAuditArea.fromJson(response.data);
    }catch(error){
      throw Exception(error);
    }
  }

  Future<ResponseClarificationAuditArea>getClarificationAuditArea()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };

    try{
      final response = await dio.get(AppConstant.clarificationAuditArea);
      
      return ResponseClarificationAuditArea.fromJson(response.data);
    }catch(error){
      throw Exception(error);
    }
  }

  Future<ResponseDetailClarificationAuditArea> getDetailClarificationAuditArea(int id)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
    final response = await dio.get('${AppConstant.detailClarificationAuditArea}$id');
    return ResponseDetailClarificationAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseClarificationAuditArea> filterClarificationAuditArea(String startDate, String endDate, String branch, String auditor)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };

    try {
      final response = await dio.get(AppConstant.filterClarificationAuditArea,
      queryParameters: {'start_date': startDate, 'end_date': endDate, 'branch': branch, 'auditor': auditor});
      
      return ResponseClarificationAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseKkaAuditArea> getKkaAuditArea()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
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
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.get(AppConstant.filterKkaAuditArea, queryParameters: {
        'start_date': startDate, 'end_date': endDate, 'branch': branch, 'auditor': auditor 
      });
      
      return ResponseKkaAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDetailKkaAuditArea> getDetailKkaAuditArea(int id)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
        final responseDetail = await dio.get('${AppConstant.detailKkaAuditArea}$id');
        
        return ResponseDetailKkaAuditArea.fromJson(responseDetail.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseBapAuditArea>getBapAuditArea()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
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
      'Content-Type': 'application/json'
    };
    try {
      final responseBap = await dio.get(AppConstant.filterBapAuditArea, queryParameters: {
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
      'Content-Type': 'application/json'
    };
    try {
        final responseDetail = await dio.get('${AppConstant.detailBapAuditArea}$id');
        
        return ResponseDetailBapAuditArea.fromJson(responseDetail.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseFollowUpAuditArea> getFollowUpAuditArea()async{
     dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
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
      'Content-Type': 'application/json'
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

  Future<ResponseInputFollowUpAuditArea>inputFollowUpAuditArea(int penalty, String realization, String explanationPenalty, int attachment)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final responseInputFollowUp = await dio.post(AppConstant.inputFollowUpAuditArea,
      data: ModelFollowUpAuditArea(penalty: penalty, realization: realization, explanationPenalty: explanationPenalty, attachment: attachment).toJson());
      
      return ResponseInputFollowUpAuditArea.fromJson(responseInputFollowUp.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseAttachmentAuditArea>getAttachmentFollowUpAuditArea()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final responseAttahcment = await dio.get(AppConstant.attachmentFollowUpAuditArea);
      
      return ResponseAttachmentAuditArea.fromJson(responseAttahcment.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDocumentFollowUpAuditArea> getDocumentFollowUpAuditArea()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
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
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.get('${AppConstant.detailFollowUpAuditArea}$id');
      return ResponseDetailFollowUpAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseReportAuditArea> getReportAuditArea()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };

    try {
      final response = await dio.get(AppConstant.reportListAuditArea);
      return ResponseReportAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseReportAuditArea> filterReportAuditArea(String startDate, String endDate, String auditor, String branch)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };

    try {
      final response = await dio.get(AppConstant.filterListReportAuditArea, 
      queryParameters: {'start_date': startDate, 'end_date': endDate, 'auditor': auditor, 'branch': branch});
      return ResponseReportAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDetailUserAuditArea> getDetailUserAuditArea()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.get(AppConstant.detailUserAuditArea);
      return ResponseDetailUserAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseEditUserAuditArea> editProfileUserAuditArea(int id, String email, String username)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.put('${AppConstant.editProfileUserAuditArea}$id',
      data: {'email': email, 'username': username});
      return ResponseEditUserAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseChangePasswordAuditArea>changePasswordAuditArea(int id, String oldPassword, String newPassword)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.put('${AppConstant.changePasswordAuditArea}$id',
      data: {'old_password': oldPassword, 'new_password': newPassword});
      return ResponseChangePasswordAuditArea.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }


  //audit region
  Future<ResponseScheduleAuditRegion>getMainSchedulesAuditRegion()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.get(AppConstant.mainScheduleAuditRegion);
      return ResponseScheduleAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseScheduleAuditRegion>filterMainSchedulesAuditRegion(String startDate, String endDate)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.get(AppConstant.mainScheduleAuditRegion, queryParameters: {
        'start_date': startDate, 'end_date': endDate
      });
      return ResponseScheduleAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseScheduleAuditRegion>getSpecialSchedulesAuditRegion()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.get(AppConstant.specialScheduleAuditRegion);
      return ResponseScheduleAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseScheduleAuditRegion>filterSpecialSchedulesAuditRegion(String startDate, String endDate)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.get(AppConstant.specialScheduleAuditRegion, queryParameters: {
        'start_date': startDate, 'end_date': endDate
      });
      return ResponseScheduleAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseScheduleAuditRegion>getReschedulesAuditRegion()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.get(AppConstant.reScheduleAuditRegion);
      return ResponseScheduleAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseScheduleAuditRegion>filterRescheduleAuditRegion(String startDate, String endDate)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.get(AppConstant.reScheduleAuditRegion, queryParameters: {
        'start_date': startDate, 'end_date': endDate
      });
      return ResponseScheduleAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDetailUserAuditRegion> getDetailUserAuditRegion()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.get(AppConstant.detailUserAuditRegion);
      return ResponseDetailUserAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseEditUserAuditRegion> editProfileUserAuditRegion(int id, String email, String username)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.put('${AppConstant.editProfileAuditRegion}$id',
      data: {'email': email, 'username': username});
      return ResponseEditUserAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDetailScheduleAuditRegion> getDetailScheduleAuditRegion(int id)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.get('${AppConstant.detailScheduleAuditRegion}$id');
      return ResponseDetailScheduleAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseChangePasswordAuditRegion>changePasswordAuditRegion(int id, String oldPassword, String newPassword)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.put('${AppConstant.changePasswordAuditRegion}$id',
      data: {'old_password': oldPassword, 'new_password': newPassword});
      return ResponseChangePasswordAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseUploadReportAuditRegion>uploadReportAuditRegion(String filePath)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    FormData formData = FormData.fromMap({
      'report_doc': await MultipartFile.fromFile(filePath)
    });
    try {
      final response = await dio.post(AppConstant.uploadReportAuditRegion, data: formData);
      print(response.data);
      return ResponseUploadReportAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseReportAuditRegion>getReportAuditRegion()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.get(AppConstant.reportListAuditRegion);
      return ResponseReportAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseReportAuditRegion>filterReportAuditRegion(String startDate, String endDate) async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.get(AppConstant.reportListAuditRegion, 
      queryParameters: {'start_date': startDate, 'end_date': endDate});
      return ResponseReportAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseLhaAuditRegion>getLhaAuditRegion() async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.get(AppConstant.lhaAuditRegion);
      return ResponseLhaAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDivisionAuditRegion>getDivisionAuditRegion()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
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
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.get(AppConstant.sopAuditRegion);
      return ResponseSopAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseInputLhaAuditRegion>inputLhaAuditRegion(int divisionId, String findingDesc, int sopId, String temporaryRec, String permanentRec, int researchValue, String suggest)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.post(AppConstant.inputLhaAuditRegion,
      data: ModelInputLhaAuditRegion(division: divisionId, findingDescription: findingDesc, 
      sopCategory: sopId, temporaryRecommendation: temporaryRec, permanentRecommendation: permanentRec, research: researchValue, recommendationOrSuggest: suggest).toJson());
      print(response.data);
      return ResponseInputLhaAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseClarificationAuditRegion>getClarificationAuditRegion()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
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
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.get(AppConstant.clarificationAuditRegion, queryParameters: {'start_date': startDate, 'end_date': endDate});
      return ResponseClarificationAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseUploadKkaAuditRegion>uploadKkaAuditRegion(String filePath)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    FormData formData = FormData.fromMap({
      'kka_doc' : await MultipartFile.fromFile(filePath)
    });
    try {
      final response = await dio.post(AppConstant.uploadKkaAuditRegion, data: formData);
      print(response.data); 
      return ResponseUploadKkaAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDetailLhaAuditRegion> getDetailLhaAuditRegion(int id)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.get('${AppConstant.detailLhaAuditRegion}$id');
      return ResponseDetailLhaAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseClarificationCategoryAuditRegion>getClarificaCategoryAuditRegion()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.get(AppConstant.clarificationCategroyAuditRegion);
      return ResponseClarificationCategoryAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponsePriorityFindingAuditRegion>getPriorityFindingAuditRegion()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.get(AppConstant.priorityFindingClarificationAuditRegion);
      return ResponsePriorityFindingAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseInputClarificationAuditRegion>inputClarificationAuditRegion(int category, String limitEvaluation, 
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
      return ResponseInputClarificationAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ModelDocClarificationAuditRegion>getDocumentClarification(int id)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.get("${AppConstant.documentClarificationAuditRegion}$id");
      return ModelDocClarificationAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseUploadClarification>uploadClarificationAuditRegion(String filePath)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };

    FormData formData = FormData.fromMap({
      'clarification_doc': await MultipartFile.fromFile(filePath)
    });
    try {
      final response = await dio.post(AppConstant.uploadClarificationAuditRegion, data: formData);
      print(response.data);
      return ResponseUploadClarification.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseInputIdentificationClarificationAuditRegion>inputIdentificatinClarificationAuditRegion(int evaluationClarification, 
  String loss, String description, int followUp)async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    FormData formData = FormData.fromMap({
      'evaluation_clarification': evaluationClarification,
      'loss': loss,
      'description_or_recommendation': description,
      'follow_up': followUp,
      // 'clarification_doc': MultipartFile.fromFile(filePath)
      
    });
    try {
      final response = await dio.post(AppConstant.intputIdentificationClarification, data: formData);
      print(response.data);
      return ResponseInputIdentificationClarificationAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseUploadBapAuditRegion>uploadBapAuditRegion(String filePath)async{
    dio.options.headers = {
      'Content-Type' : 'application/json',
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    FormData formData = FormData.fromMap({
        'bap_doc': await MultipartFile.fromFile(filePath)
      }
    );
    try {
      final response = await dio.post(AppConstant.uploadBapAuditRegion, data: formData);
      print(response.data);
      return ResponseUploadBapAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseDetailClarificationAuditRegion>detailClarificationAuditRegion(int id)async{
    dio.options.headers = {
      'Content-Type' : 'application/json',
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get('${AppConstant.detailClarificationAuditRegion}$id');
      return ResponseDetailClarificationAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseKkaAuditRegion>getKkaAuditRegion()async{
    dio.options.headers = {
      'Content-Type' : 'application/json',
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
      'Content-Type' : 'application/json',
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
      'Content-Type' : 'application/json',
      'Authorization': 'Bearer ${TokenManager.getToken()}'
    };
    try {
      final response = await dio.get('${AppConstant.detailKkaAuditRegion}$id');
      return ResponseDetailKkaAuditRegion.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseBapAuditRegion>getBapAuditRegion()async{
    dio.options.headers = {
      'Content-Type' : 'application/json',
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
      'Content-Type' : 'application/json',
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
      'Content-Type' : 'application/json',
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