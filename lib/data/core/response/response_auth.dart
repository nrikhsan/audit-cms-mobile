class ResponseAuth {
  int? status;
  String? message;
  Data? data;

  ResponseAuth({this.status, this.message, this.data});

  ResponseAuth.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? token;

  Data({this.token});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }
}

class ModelAuth{
  String email;
  String password;

  ModelAuth({required this.email, required this.password});

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
  };
}
