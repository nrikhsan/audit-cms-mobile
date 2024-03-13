import 'package:audit_cms/data/core/response/response_detail_clarification.dart';
import 'package:audit_cms/data/core/response/response_add_schedules.dart';
import 'package:audit_cms/data/core/response/response_clarification.dart';
import 'package:audit_cms/data/core/response/response_detail_schedule.dart';
import 'package:audit_cms/data/core/response/response_edit_lha.dart';
import 'package:audit_cms/data/core/response/response_lha.dart';
import 'package:audit_cms/data/core/service/api_service.dart';

import '../response/response_auth.dart';
import '../response/response_detail_lha.dart';
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
  Future<ResponseDetailSchedule> getDetailSchedule(int id);
  Future<ResponseLhaAuditArea> getLhaAuditArea();
  Future<ResponseDetailLha> getDetailLhaAuditArea(int id);
  Future<ResponseEditLha> editLha(int id, String lhaDescription);
  Future<ResponseLhaAuditArea> filterLhaAuditArea(String startDate, String endDate, String branch, String auditor);
  Future<ResponseClarification> getClarificationAuditArea();
  Future<ResponseDetailClarification> getDetailClarificationAuditArea(int id);
  Future<ResponseClarification> filterClarificationAuditArea(String startDate, String endDate, String branch, String auditor);
}



class RepositoryImpl implements Repositories {
  final ApiService apiService;
  RepositoryImpl(this.apiService);

  @override
  Future<ResponseAuth> login(String email, String password) async{
    return await apiService.login(email, password);
  }

  @override
  Future<ResponseSchedules> getMainSchedules() async{
    return await apiService.getMainSchedules();
  }

  @override
  Future<ResponseSchedules> filterMainSchedules(String startDate, String endDate, String branch, String auditor)async {
    return await apiService.filterMainSchedule(startDate, endDate, branch, auditor);
  }

  @override
  Future<ResponseSchedules> filterSpecialSchedules(String startDate, String endDate, String branch, String auditor)async {
    return await apiService.filterSpecialSchedules(startDate, endDate, branch, auditor);
  }

  @override
  Future<ResponseSchedules>filterResSChedules(String startDate, String endDate, String branch, String auditor)async {
    return await apiService.filterReschedules(startDate, endDate, branch, auditor);
  }

  @override
  Future<ResponseAuditor> getAuditor()async {
    return await apiService.getAuditor();
  }

  @override
  Future<ResponseArea> getArea() async{
   return await apiService.getArea();
  }

  @override
  Future<ResponseBranch> getBranch()async {
    return await apiService.getBranch();
  }

  @override
  Future<ResponseStatusSchedule> getStatus()async {
    return await apiService.getStatus();
  }

  @override
  Future<ResponseAddSchedules> addSchedules(int auditorId, int areaId, int branchId, int statusId, String startDate, String endDat, String desc) async{
    return await apiService.addSchedule(auditorId, areaId, branchId, statusId, startDate, endDat, desc);
  }

  @override
  Future<ResponseSchedules> getSpecialSchedules() async {
    return await apiService.getSpecialSchedules();
  }

  @override
  Future<ResponseSchedules> getReschedules() async{
    return await apiService.getReschedules();
  }
  
  @override
  Future<ResponseDetailSchedule> getDetailSchedule(int id)async {
    return await apiService.getDetailSchedule(id);
  }
  
  @override
  Future<ResponseLhaAuditArea> getLhaAuditArea()async {
    return await apiService.getLhaAuditArea();
  }
  
  @override
  Future<ResponseDetailLha> getDetailLhaAuditArea(int id)async {
    return await apiService.getDetailLhaAuditArea(id);
  }
  
  @override
  Future<ResponseEditLha> editLha(int id, String lhaDescription)async {
    return await apiService.editLha(id, lhaDescription);
  }
  
  @override
  Future<ResponseLhaAuditArea> filterLhaAuditArea(String startDate, String endDate, String branch, String auditor) async{
    return await apiService.filterLhaAuditArea(startDate, endDate, branch, auditor);
  }
  
  @override
  Future<ResponseClarification> getClarificationAuditArea() async{
    return await apiService.getClarificationAuditArea();
  }
  
  @override
  Future<ResponseDetailClarification> getDetailClarificationAuditArea(int id) async {
    return await apiService.getDetailClarification(id);
  }
  
  @override
  Future<ResponseClarification> filterClarificationAuditArea(String startDate, String endDate, String branch, String auditor)async {
    return await apiService.filterClarificationAuditArea(startDate, endDate, branch, auditor);
  }
}