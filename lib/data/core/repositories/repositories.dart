import 'package:audit_cms/data/core/response/response_add_schedules.dart';
import 'package:audit_cms/data/core/service/api_service.dart';

import '../response/response_auth.dart';
import '../response/response_dropdown.dart';
import '../response/response_schedules.dart';



abstract class Repositories {
  Future<ResponseAuth> login(String email, String password);
  Future<ResponseAddSchedules> addSchedules(int auditorId, int areaId, int branchId, int statusId, String startDate, String endDat, String desc);
  Future<ResponseSchedules> getMainSchedules();
  Future<ResponseSchedules> filterMainSchedules(String startDate, String endDate, String branch, String auditor);
  Future<ResponseSchedules> getSpecialSchedules();
  Future<ResponseSchedules> filterSpecialSchedules(String startDate, String endDate, String branch, String auditor);
  Future<ResponseSchedules> getReschedules();
  Future<ResponseAuditor> getAuditor();
  Future<ResponseArea> getArea();
  Future<ResponseBranch> getBranch();
  Future<ResponseStatusSchedule> getStatus();
  Future<ResponseSchedules> filterResSChedules(String startDate, String endDate, String branch, String auditor);
}



class RepositoryImpl implements Repositories {
  final ApiService apiService;
  RepositoryImpl(this.apiService);

  @override
  Future<ResponseAuth> login(String email, String password) {
    return apiService.login(email, password);
  }

  @override
  Future<ResponseSchedules> getMainSchedules() {
    return apiService.getMainSchedules();
  }

  @override
  Future<ResponseSchedules> filterMainSchedules(String startDate, String endDate, String branch, String auditor) {
    return apiService.filterMainSchedule(startDate, endDate, branch, auditor);
  }

  @override
  Future<ResponseSchedules> filterSpecialSchedules(String startDate, String endDate, String branch, String auditor) {
    return apiService.filterSpecialSchedules(startDate, endDate, branch, auditor);
  }

  @override
  Future<ResponseSchedules>filterResSChedules(String startDate, String endDate, String branch, String auditor){
    return apiService.filterReschedules(startDate, endDate, branch, auditor);
  }

  @override
  Future<ResponseAuditor> getAuditor() {
    return apiService.getAuditor();
  }

  @override
  Future<ResponseArea> getArea() {
   return apiService.getArea();
  }

  @override
  Future<ResponseBranch> getBranch() {
    return apiService.getBranch();
  }

  @override
  Future<ResponseStatusSchedule> getStatus() {
    return apiService.getStatus();
  }

  @override
  Future<ResponseAddSchedules> addSchedules(int auditorId, int areaId, int branchId, int statusId, String startDate, String endDat, String desc) {
    return apiService.addSchedule(auditorId, areaId, branchId, statusId, startDate, endDat, desc);
  }

  @override
  Future<ResponseSchedules> getSpecialSchedules(){
    return apiService.getSpecialSchedules();
  }

  @override
  Future<ResponseSchedules> getReschedules() {
    return apiService.getReschedules();
  }
}