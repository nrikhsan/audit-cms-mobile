import 'package:audit_cms/data/core/response/reponse_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/response_attachment_audit_area.dart';
import 'package:audit_cms/data/core/response/response_bap_audit_area.dart';
import 'package:audit_cms/data/core/response/response_detail_bap_audit_area.dart';
import 'package:audit_cms/data/core/response/response_detail_clarification_audit_area.dart';
import 'package:audit_cms/data/core/response/response_add_schedules_audit_area.dart';
import 'package:audit_cms/data/core/response/response_clarification_audit_area.dart';
import 'package:audit_cms/data/core/response/response_detail_kka_audit_area.dart';
import 'package:audit_cms/data/core/response/response_detail_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/response_detail_user_audit_area.dart';
import 'package:audit_cms/data/core/response/response_edit_lha_audit_area.dart';
import 'package:audit_cms/data/core/response/response_detail_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/response_edit_user_audit_area.dart';
import 'package:audit_cms/data/core/response/response_input_follow_up_audit_area.dart';
import 'package:audit_cms/data/core/response/response_kka_audit_area.dart';
import 'package:audit_cms/data/core/response/response_report_audit_area.dart';
import 'package:dio/dio.dart';
import '../../../helper/prefs/token_manager.dart';
import '../../constant/app_constants.dart';
import '../response/response_auth.dart';
import '../response/response_dropdown.dart';
import '../response/response_schedules_audit_area.dart';
import '../response/response_detail_schedule_audit_area.dart';
import '../response/response_lha_audit_area.dart';

class ApiService {
  Dio dio = Dio(BaseOptions(baseUrl: AppConstant.baseUrl));


  Future<ResponseAuth> login(String email, String password) async {
    try {
      final response = await dio.post(AppConstant.auth,
      data: ModelAuth(email: email, password: password).toJson());
      
      return ResponseAuth.fromJson(response.data);
    } catch (error) {
      throw Exception(error);
    }
  }

  Future<ResponseAddSchedulesAuditArea> addScheduleAuditArea(
      int auditorId,
      int areaId,
      int branchId,
      int statusId,
      String startDate,
      String endDat,
      String desc) async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.post(AppConstant.addSchedulesAuditArea,
          data: ModelAddScheduleAuditArea(
                  auditor: auditorId,
                  area: areaId,
                  branch: branchId,
                  status: statusId,
                  startDate: startDate,
                  endDate: endDat,
                  scheduleDescription: desc)
              .toJson());
              
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
}
