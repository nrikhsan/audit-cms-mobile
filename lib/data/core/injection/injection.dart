import 'package:audit_cms/data/core/repositories/repositories.dart';
import 'package:audit_cms/data/core/repositories/repository_impl.dart';
import 'package:audit_cms/data/core/service/api_service.dart';
import 'package:get/get.dart';

class Injection extends Bindings {
  @override
  void dependencies() {
  Get.lazyPut<ApiService>(() => ApiService());
  Get.lazyPut<Repositories>(() => RepositoryImpl(Get.find()));
  }
}