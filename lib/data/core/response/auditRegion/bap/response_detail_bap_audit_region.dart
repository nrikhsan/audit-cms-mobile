class ResponseDetailBapAuditRegion {
  Meta? meta;
  String? message;
  int? status;
  DataDetailBapAuditRegion? data;

  ResponseDetailBapAuditRegion({this.meta, this.message, this.status, this.data});

  ResponseDetailBapAuditRegion.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? DataDetailBapAuditRegion.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    data['api_version'] = apiVersion;
    return data;
  }
}

class DataDetailBapAuditRegion {
  int? id;
  User? user;
  Clarification? clarification;
  String? code;
  String? filename;
  String? filePath;

  DataDetailBapAuditRegion(
      {this.id,
      this.user,
      this.clarification,
      this.code,
      this.filename,
      this.filePath});

  DataDetailBapAuditRegion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    clarification = json['clarification'] != null
        ? Clarification.fromJson(json['clarification'])
        : null;
    code = json['code'];
    filename = json['filename'];
    filePath = json['file_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (clarification != null) {
      data['clarification'] = clarification!.toJson();
    }
    data['code'] = code;
    data['filename'] = filename;
    data['file_path'] = filePath;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['fullname'] = fullname;
    data['initial_name'] = initialName;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['evaluation_limitation'] = evaluationLimitation;
    return data;
  }
}
