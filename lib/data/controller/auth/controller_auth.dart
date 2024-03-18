import 'package:audit_cms/data/core/repositories/repositories.dart';
import 'package:audit_cms/helper/prefs/token_manager.dart';
import 'package:audit_cms/helper/styles/custom_styles.dart';
import 'package:get/get.dart';

class ControllerAuth extends GetxController{
  final Repositories repository;

  var isLoading = true.obs;
  var token = ''.obs;
  var message = ''.obs;
  var email = ''.obs;
  var password = ''.obs;

  ControllerAuth(this.repository);

  void setEmail(String value) => email.value = value;
  void setPassword(String value) => password.value = value;

  void login() async {
    try {
      isLoading(true);
      final loginResponse = await repository.login(email.string, password.string);
      token(loginResponse.data!.token);
      await TokenManager.saveToken(token.toString());
      Get.snackbar('Selamat datang', '$email', snackPosition: SnackPosition.TOP,
          colorText: CustomColors.white, backgroundColor: CustomColors.green);
    } catch (error) {
      Get.snackbar('Error', 'Login failed: ${error.toString()}');
    } finally {
      isLoading(false);
    }
  }
}