import 'package:audit_cms/data/controller/auth/controller_auth.dart';
import 'package:audit_cms/data/core/service/api_service.dart';
import 'package:get/get.dart';
import '../../controller/auditArea/controller_audit_area.dart';
import '../repositories/repositories.dart';

class Injection extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<ApiService>(() => ApiService());
    Get.lazyPut<Repositories>(() => RepositoryImpl(Get.find()));
    Get.lazyPut<ControllerAuditArea>(()=> ControllerAuditArea(Get.find()));
    Get.lazyPut<ControllerAuth>(() => ControllerAuth(Get.find()));
  }
}