import 'package:audit_cms/data/core/repositories/repositories.dart';
import 'package:audit_cms/helper/prefs/token_manager.dart';
import 'package:audit_cms/pages/bottom_navigasi/bott_nav.dart';
import 'package:get/get.dart';
import 'package:jwt_decode/jwt_decode.dart';

class ControllerAuth extends GetxController {
  final Repositories repository;
  var isLoading = false.obs;
  var isLogin = false.obs;
  var userLevel = ''.obs;
  ControllerAuth(this.repository);

  @override
  void onInit() {
    checkLoginStatus();
    super.onInit();
  }

  void login(String username, String password) async {
    isLoading.value = true;
    try {
      final response = await repository.login(username, password);
      String tokenAuth = '${response.data?.token}';

      decodeJWT(tokenAuth); 
      await TokenManager.saveToken(tokenAuth);
    } catch (error) {
      throw Exception(error);
    }finally{
      isLoading.value = false;
    }
  }
  
  void decodeJWT(String tokenAuth) {
    Map<String, dynamic> payload = Jwt.parseJwt(tokenAuth);
    userLevel.value = payload['user']['level']['name'];
    navigateBasedOnRole(userLevel.value);
    isLogin.value = true;
  }
  
  void checkLoginStatus()async {
    String? token = await TokenManager.getToken();
    if (token != null) {
      decodeJWT(token);
    }
  } 
  
  void navigateBasedOnRole(String level) {
    if (level == "AREA") {
      Get.offAll(() => BotNavePageAuditArea());
    } else if (level == "WILAYAH") {
      Get.offAll(() => BotNavAuditRegion());
    }
  }
}
