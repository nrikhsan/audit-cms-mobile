class ResponseDetailFollowUp {
  Meta? meta;
  String? message;
  int? status;
  DataDetailFollowUp? data;

  ResponseDetailFollowUp({this.meta, this.message, this.status, this.data});

  ResponseDetailFollowUp.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new DataDetailFollowUp.fromJson(json['data']) : null;
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

class DataDetailFollowUp {
  int? id;
  User? user;
  List<Penalty>? penalty;
  Clarification? clarification;
  String? code;
  String? description;
  String? status;
  String? filename;
  String? filePath;
  int? isPenalty;

  DataDetailFollowUp(
      {this.id,
      this.user,
      this.penalty,
      this.clarification,
      this.code,
      this.description,
      this.status,
      this.filename,
      this.filePath,
      this.isPenalty});

  DataDetailFollowUp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['penalty'] != null) {
      penalty = <Penalty>[];
      json['penalty'].forEach((v) {
        penalty!.add(new Penalty.fromJson(v));
      });
    }
    clarification = json['clarification'] != null
        ? new Clarification.fromJson(json['clarification'])
        : null;
    code = json['code'];
    description = json['description'];
    status = json['status'];
    filename = json['filename'];
    filePath = json['file_path'];
    isPenalty = json['is_penalty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.penalty != null) {
      data['penalty'] = this.penalty!.map((v) => v.toJson()).toList();
    }
    if (this.clarification != null) {
      data['clarification'] = this.clarification!.toJson();
    }
    data['code'] = this.code;
    data['description'] = this.description;
    data['status'] = this.status;
    data['filename'] = this.filename;
    data['file_path'] = this.filePath;
    data['is_penalty'] = this.isPenalty;
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

class Penalty {
  int? id;
  String? code;

  Penalty({this.id, this.code});

  Penalty.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
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
