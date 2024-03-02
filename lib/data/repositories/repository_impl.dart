import 'package:audit_cms/data/helper/token_manager.dart';
import 'package:audit_cms/data/repositories/repository.dart';
import 'package:audit_cms/data/service/app_service.dart';

class RepositoryImpl implements Repository{
  final ApiService apiService;
  RepositoryImpl(this.apiService);

  //auth
  @override
  Future<void> login(String username, String password) async{
    try {
      await apiService.login(username, password);
    } catch (error) {
      throw Exception('Failed to login: $error');
    }
  }

  //auth and refresh token
  @override
  Future<void> refreshToken() async {
    try {
      final refreshToken = await TokenManager.getRefreshToken();
      if (refreshToken != null) {
        await apiService.refreshToken(refreshToken);
      } else {
        throw Exception('No refresh token found');
      }
    } catch (error) {
      throw Exception('Failed to refresh token: $error');
    }
  }
}