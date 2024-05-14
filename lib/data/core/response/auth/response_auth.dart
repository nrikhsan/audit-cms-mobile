class ResponseAuth {
  Metadata? meta;
  String? message;
  int? status;
  DataLogin? data;

  ResponseAuth({this.meta, this.message, this.status, this.data});

  ResponseAuth.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null
        ? new Metadata.fromJson(json['meta'])
        : null;
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new DataLogin.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Metadata {
  String? timestamp;
  String? apiVersion;

  Metadata({this.timestamp, this.apiVersion});

  Metadata.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    apiVersion = json['api_version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this.timestamp;
    data['api_version'] = this.apiVersion;
    return data;
  }
}

class DataLogin {
  String? token;
  Null refresh;

  DataLogin({this.token, this.refresh});

  DataLogin.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    refresh = json['refresh'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['refresh'] = this.refresh;
    return data;
  }
}



class ModelAuth{
  String username;
  String password;

  ModelAuth({required this.username, required this.password});

  Map<String, dynamic> toJson() => {
    'username': username,
    'password': password,
  };
}
