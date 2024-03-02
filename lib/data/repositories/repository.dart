abstract class Repository{

  //auth
  Future<void>login(String username, String password);
  Future<void>refreshToken();
}