import 'package:get/get.dart';
import '../../helper/prefs/token_manager.dart';
import '../core/repositories/repositories.dart';
import '../core/response/response_dropdown.dart';
import '../core/response/response_schedules.dart';

class ControllerAllData extends GetxController{

  final Repositories repository;
  var isLoading = true.obs;
  var token = ''.obs;
  var message = ''.obs;
  var dataListLocalSchedules = <Schedules>[].obs;
  final RxList<Schedules> mainSchedules = <Schedules>[].obs;
  final RxList<Schedules> specialSchedules = <Schedules>[].obs;
  final RxList<Schedules> resSchedules = <Schedules>[].obs;
  final RxList<Auditor> auditor = <Auditor>[].obs;
  final RxList<Area> area = <Area>[].obs;
  final RxList<Branch> branch = <Branch>[].obs;
  final RxList<Status> status = <Status>[].obs;

  ControllerAllData(this.repository);

  @override
  void onInit(){
    loadMainSchedules();
    loadSpecialSchedules();
    loadReschedules();
    loadAuditor();
    loadArea();
    loadBranch();
    loadStatus();
    super.onInit();

  }


  void login(String email, String password) async {
    try {
      isLoading(true);
      final loginResponse = await repository.login(email, password);
      token(loginResponse.data!.token);
      await TokenManager.saveToken(token.toString());
    } catch (error) {
      Get.snackbar('Error', 'Login failed: ${error.toString()}');
    } finally {
      isLoading(false);
    }
  }

  void addLocalDataSchedule(Auditor auditor, Area area, Branch branch, Status status, String startDate, String endDate, String desc)async {
    final newData = Schedules(auditor: auditor.auditorName, area: area.areaName,
        branch: branch.branchName, status: status.statusName, startDate: startDate, endDate: endDate, scheduleDescription: desc);
    dataListLocalSchedules.add(newData);
  }

  void addSchedules(int auditorId, int areaId, int branchId, int statusId, String startDate, String endDat, String desc)async{
    isLoading(true);
    try{
      final addSchedules = await repository.addSchedules(auditorId, areaId, branchId, statusId, startDate, endDat, desc);
      message(addSchedules.toString());
      dataListLocalSchedules.clear();
    }catch(error){
      throw Exception(error);
    }finally{
      isLoading(false);
    }
  }

  void deleteLocalDataSchedule(String auditor)async{
    final index = dataListLocalSchedules.indexWhere((items) => items.auditor == auditor);
    if(index != -1){
      dataListLocalSchedules.removeAt(index);
    }
  }

  void loadMainSchedules()async {
    isLoading(true);
    try {
      final responseSchedules = await repository.getMainSchedules();
      mainSchedules.assignAll(responseSchedules.schedules ?? []);
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch schedules');
    } finally {
      isLoading(false);
    }
  }

  void filterMainSchedule(String startDate, String endDate, String branch, String auditor)async{
    isLoading(true);
    try{
      final responseFilter = await repository.filterMainSchedules(startDate, endDate, branch, auditor);
      mainSchedules.assignAll(responseFilter.schedules ?? []);
    }catch(error){
      throw Exception(error);
    }finally{
      isLoading(false);
    }
  }

  void filterSpecialSchedules(String startDate, String endDate, String branch, String auditor)async{
    isLoading(true);
    try{
      final response = await repository.filterSpecialSchedules(startDate, endDate, branch, auditor);
      specialSchedules.assignAll(response.schedules ?? []);
    }finally{
      isLoading(false);
    }
  }

  void filterReschedules(String startDate, String endDate, String branch, String auditor)async{
    isLoading(true);
    try{
      final response = await repository.filterResSChedules(startDate, endDate, branch, auditor);
      resSchedules.assignAll(response.schedules ?? []);
    }catch(error){
      throw Exception(error);
    }finally{
      isLoading(false);
    }
  }

  void loadAuditor()async{
    try{
      final responseAuditor = await repository.getAuditor();
      auditor.assignAll(responseAuditor.auditor ?? []);
    }catch(error){
      throw Exception(error);
    }
  }

  void loadArea()async {
    try{
      final responseArea = await repository.getArea();
      area.assignAll(responseArea.area ?? []);
    }catch(error){
      throw Exception(error);
    }
  }

  void loadBranch()async {
    try{
      final responseBranch = await repository.getBranch();
      branch.assignAll(responseBranch.branch ?? []);
    }catch(error){
      throw Exception(error);
    }
  }

  void loadStatus()async {
    try{
      final responseData = await repository.getStatus();
      status.assignAll(responseData.status ?? []);
    }catch(error){
      throw Exception(error);
    }
  }

  void loadSpecialSchedules()async {
    isLoading(true);
    try{
      final response = await repository.getSpecialSchedules();
      specialSchedules.assignAll(response.schedules ?? []);
    }catch(error){
      throw Exception(error);
    }
  }

  void loadReschedules()async{
    isLoading(true);
    try{
      final response = await repository.getReschedules();
      resSchedules.assignAll(response.schedules ?? []);
    }catch(error){
      throw Exception(error);
    }finally{
      isLoading(false);
    }
  }
}