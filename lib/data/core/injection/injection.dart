import 'package:audit_cms/data/core/service/api_service.dart';
import 'package:get/get.dart';
import '../../controller/controllers.dart';
import '../repositories/repositories.dart';

class Injection extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<ApiService>(() => ApiService());
    Get.lazyPut<Repositories>(() => RepositoryImpl(Get.find()));
    Get.lazyPut<ControllerAllData>(()=> ControllerAllData(Get.find()));
  }
}