class ResponseDetailBapAuditArea {
  Meta? meta;
  String? message;
  int? status;
  DataDetailBapAuditArea? data;

  ResponseDetailBapAuditArea({this.meta, this.message, this.status, this.data});

  ResponseDetailBapAuditArea.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new DataDetailBapAuditArea.fromJson(json['data']) : null;
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

class Meta {
  String? timestamp;
  String? apiVersion;

  Meta({this.timestamp, this.apiVersion});

  Meta.fromJson(Map<String, dynamic> json) {
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

class DataDetailBapAuditArea {
  int? id;
  User? user;
  Clarification? clarification;
  String? code;
  String? filename;
  String? filePath;

  DataDetailBapAuditArea(
      {this.id,
      this.user,
      this.clarification,
      this.code,
      this.filename,
      this.filePath});

  DataDetailBapAuditArea.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    clarification = json['clarification'] != null
        ? new Clarification.fromJson(json['clarification'])
        : null;
    code = json['code'];
    filename = json['filename'];
    filePath = json['file_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.clarification != null) {
      data['clarification'] = this.clarification!.toJson();
    }
    data['code'] = this.code;
    data['filename'] = this.filename;
    data['file_path'] = this.filePath;
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? fullname;
  String? initialName;

  User({this.id, this.email, this.fullname, this.initialName});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    fullname = json['fullname'];
    initialName = json['initial_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['fullname'] = this.fullname;
    data['initial_name'] = this.initialName;
    return data;
  }
}

class Clarification {
  int? id;
  String? code;
  String? evaluationLimitation;

  Clarification({this.id, this.code, this.evaluationLimitation});

  Clarification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    evaluationLimitation = json['evaluation_limitation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['evaluation_limitation'] = this.evaluationLimitation;
    return data;
  }
}
