class ResponseAuth {
  Metadata? metadata;
  bool? status;
  String? message;
  Data? data;

  ResponseAuth({this.metadata, this.status, this.message, this.data});

  ResponseAuth.fromJson(Map<String, dynamic> json) {
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Metadata {
  Null? timestamp;
  Null? apiVersion;

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

class Data {
  String? token;
  String? refresh;

  Data({this.token, this.refresh});

  Data.fromJson(Map<String, dynamic> json) {
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
  String email;
  String password;

  ModelAuth({required this.email, required this.password});

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
  };
}
