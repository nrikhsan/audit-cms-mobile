import 'package:audit_cms/data/core/response/response_add_schedules.dart';
import 'package:dio/dio.dart';
import '../../../helper/prefs/token_manager.dart';
import '../../constant/app_constants.dart';
import '../response/response_auth.dart';
import '../response/response_dropdown.dart';
import '../response/response_schedules.dart';

class ApiService{

  Dio dio = Dio(BaseOptions(baseUrl: AppConstant.baseUrl));

  Future<ResponseAuth>login(String email, String password)async{
    try{
      final response = await dio.post(AppConstant.auth,
          data: RequestBody(email: email, password: password).toJson());
      return ResponseAuth.fromJson(response.data);
    }catch(error){
      throw Exception(error);
    }
  }

  Future<ResponseAddSchedules> addSchedule(int auditorId, int areaId, int branchId, int statusId, String startDate, String endDat, String desc)async{
    dio.options.headers = {
      'Authorization': '${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try{
      final response = await dio.post(AppConstant.addSchedules,
          data: RequestBodyAddSchedules(auditor: auditorId, area: areaId,
              branch: branchId, status: statusId, startDate: startDate,
              endDate: endDat, scheduleDescription: desc).toJson());
      return ResponseAddSchedules.fromJson(response.data);
    }catch(error){
      throw Exception(error);
    }
  }

  Future<ResponseSchedules> getMainSchedules()async {
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try {
      final response = await dio.get(AppConstant.mainSchedule);
      return ResponseSchedules.fromJson(response.data);
    }catch(error){
      throw Exception(error);
    }
  }

  Future<ResponseSchedules> filterMainSchedule(String startDate, String endDate, String branch, String auditor)async{
    dio.options.headers = {
      'Authorization': '${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try{
      final response = await dio.get(AppConstant.filterMainSchedule,
      queryParameters: {'start_date': startDate, 'end_date': endDate, 'branch': branch, 'auditor': auditor});
      return ResponseSchedules.fromJson(response.data);
    }catch(error){
      throw Exception(error);
    }
  }

  Future<ResponseSchedules>getSpecialSchedules()async{
    dio.options.headers ={
      'Authorization': '${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try{
      final response = await dio.get(AppConstant.specialSchedule);
      return ResponseSchedules.fromJson(response.data);
    }catch(error){
      throw Exception(error);
    }
  }

  Future<ResponseSchedules>filterReschedules(String startDate, String endDate, String branch, String auditor)async{
    dio.options.headers = {
      'Authorization': '${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try{
      final response = await dio.get(AppConstant.filterReschedules, queryParameters: {'start_date': startDate, 
      'end_date': endDate, 'branch': branch, 'auditor': auditor});
      return ResponseSchedules.fromJson(response.data);
    }catch(error){
      throw Exception(error);
    }
  }

  Future<ResponseSchedules> filterSpecialSchedules(String startDate, String endDate, String branch, String auditor)async{
    dio.options.headers = {
      'Authorization': '${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try{
      final response = await dio.get(AppConstant.filterSpecialSchedule,
          queryParameters: {'start_date': startDate, 'end_date': endDate, 'branch': branch, 'auditor': auditor});

      return ResponseSchedules.fromJson(response.data);
    }catch(error){
      throw Exception(error);
    }
  }

  Future<ResponseSchedules> getReschedules()async{
    dio.options.headers = {
      'Authorization': '${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try{
      final response = await dio.get(AppConstant.resSchedules);
      return ResponseSchedules.fromJson(response.data);
    }catch(error){
      throw Exception(error);
    }
  }

  Future<ResponseAuditor> getAuditor()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try{
      final response = await dio.get(AppConstant.auditor);
      return ResponseAuditor.fromJson(response.data);
    }catch(error){
      throw Exception(error);
    }
  }

  Future<ResponseArea> getArea()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try{
      final response = await dio.get(AppConstant.area);
      return ResponseArea.fromJson(response.data);
    }catch(error){
      throw Exception(error);
    }
  }

  Future<ResponseBranch> getBranch()async{
    dio.options.headers = {
      'Authorization': 'Bearer ${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try{
      final response = await dio.get(AppConstant.branch);
      return ResponseBranch.fromJson(response.data);
    }catch(error){
      throw Exception(error);
    }
  }

  Future<ResponseStatusSchedule> getStatus()async{
    dio.options.headers = {
      'Authorization': '${TokenManager.getToken()}',
      'Content-Type': 'application/json'
    };
    try{
      final response = await dio.get(AppConstant.status);
      return ResponseStatusSchedule.fromJson(response.data);
    }catch(error){
      throw Exception(error);
    }
  }
}