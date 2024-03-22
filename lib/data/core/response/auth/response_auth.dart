class ResponseAuth {
  int? status;
  String? message;
  Data? data;

  ResponseAuth({this.status, this.message, this.data});

  ResponseAuth.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? token;
  String? email;
  String? role;

  Data({this.token, this.email, this.role});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    email = json['email'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['email'] = this.email;
    data['role'] = this.role;
    return data;
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
