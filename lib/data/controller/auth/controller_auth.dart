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
  var token = ''.obs;

  ControllerAuth(this.repository);

  void login(String email, String password) async {
    isLoading(true);
    try {
      final loginResponse = await repository.login(email, password);

      token(loginResponse.data!.token.toString());

      await TokenManager.saveToken(token.string);
      await TokenManager.saveRoleOrEmail(email);
      isLoggedIn.value = true;

      navigateBaseOnRole(email);

      Get.snackbar('Selamat datang', email, snackPosition: SnackPosition.TOP,
          colorText: CustomColors.white, backgroundColor: CustomColors.green);
    } catch (error) {
      throw Exception(error);
    } finally {
      isLoading(false);
    }
  }

  void navigateBaseOnRole(String email) {
  if (email == 'area@gmail.com') {
      Get.offAll(() => BotNavePageAuditArea());
    }else if(email == 'area51') {
      Get.offAll(() => BotNavePageAuditArea());
    }else if(email == 'wilayah@gmail.com'){
      Get.offAll(() => BotNavAuditRegion());
    }else if(email == 'wilayah51'){
      Get.offAll(() => BotNavAuditRegion());
    }
  }
  

  Future<bool> checkLoggedIn() async {
    final String? token = await TokenManager.getToken();
    isLoggedIn.value = token != null;
    if (isLoggedIn.value) {
      final String? email = await TokenManager.getRoleOrEmail();
      navigateBaseOnRole(email!);
    }
    return isLoggedIn.value;
  }
}