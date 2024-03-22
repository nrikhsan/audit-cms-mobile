import 'package:audit_cms/data/core/repositories/repositories.dart';
import 'package:audit_cms/helper/prefs/token_manager.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:audit_cms/pages/bottom_navigasi/bott_nav.dart';
import 'package:get/get.dart';

class ControllerAuth extends GetxController{
  final Repositories repository;
  var isLoading = false.obs;
  var isLoggedIn = false.obs;
  var message = ''.obs;
  var role = ''.obs;
  var token = ''.obs;

  ControllerAuth(this.repository);

  void login(String email, String password) async {
    try {
      isLoading(true);
      final loginResponse = await repository.login(email, password);

      token(loginResponse.data!.token.toString());
      role(loginResponse.data!.role.toString());

      await TokenManager.saveToken(token.string);
      await TokenManager.saveRole(role.string);

      String? emailUser = loginResponse.data!.email!;
      isLoggedIn.value = true;

      navigateBaseOnRole(role.string);

      
      Get.snackbar('Selamat datang', emailUser, snackPosition: SnackPosition.TOP,
          colorText: CustomColors.white, backgroundColor: CustomColors.green);
    } catch (error) {
      throw Exception(error);
    } finally {
      isLoading(false);
    }
  }

  void navigateBaseOnRole(String role) {
  if (role == 'audit_area') {
      Get.offAll(() => BotNavePageAuditArea());
    } else if(role == 'audit_wilayah') {
      Get.offAll(() => BotNavAuditRegion());
    }
  }
  

  Future<bool> checkLoggedIn() async {
    final String? token = await TokenManager.getToken();
    isLoggedIn.value = token != null;
    if (isLoggedIn.value) {
      final String? role = await TokenManager.getRole();
      navigateBaseOnRole(role!);
    }
    return isLoggedIn.value;
  }
}