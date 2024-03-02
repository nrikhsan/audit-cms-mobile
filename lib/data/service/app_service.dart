import 'package:audit_cms/data/constants/app_constant.dart';
import 'package:audit_cms/data/helper/token_manager.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();


  //auth
  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      final response = await dio.post(
        AppConstant.auth,
        data: {
          'username': username,
          'password': password,
        },
      );

      if (response.statusCode == 200) {
        final responseData = response.data['data'];
        final token = responseData['token'];
        final refreshToken = responseData['refresh'];
        await TokenManager.saveToken(token, refreshToken);
        print(responseData.toString());
        return responseData;
      } else {
        throw Exception('Failed to login');
      }
    } catch (error) {
      throw Exception('Failed to login: $error');
    }
  }

  //auth and refresh token
  Future<String> refreshToken(String refreshToken) async {
    try {
      final response = await dio.post(
        AppConstant.auth,
        data: {
          'refresh': refreshToken,
        },
      );
      if (response.statusCode == 200) {
        final token = response.data['token'];
        await TokenManager.saveToken(token, refreshToken);
        return token;
      } else {
        throw Exception('Failed to refresh token');
      }
    } catch (error) {
      throw Exception('Failed to refresh token: $error');
    }
  }
}
