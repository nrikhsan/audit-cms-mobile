class ResponseDetailClarificationAuditArea {
  Meta? meta;
  String? message;
  int? status;
  DataDetailClarificationAuditArea? data;

  ResponseDetailClarificationAuditArea(
      {this.meta, this.message, this.status, this.data});

  ResponseDetailClarificationAuditArea.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new DataDetailClarificationAuditArea.fromJson(json['data']) : null;
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

class DataDetailClarificationAuditArea {
  User? user;
  Branch? branch;
  Cases? cases;
  Branch? caseCategory;
  String? code;
  String? priority;
  String? fileName;
  String? filePath;
  String? description;
  String? location;
  String? auditee;
  String? auditeeLeader;
  String? recomendation;
  int? evaluation;
  String? status;
  String? nominalLoss;
  String? evaluationLimitation;
  int? isFollowUp;
  int? isFlag;

  DataDetailClarificationAuditArea(
      {this.user,
      this.branch,
      this.cases,
      this.caseCategory,
      this.code,
      this.priority,
      this.fileName,
      this.filePath,
      this.description,
      this.location,
      this.auditee,
      this.auditeeLeader,
      this.recomendation,
      this.evaluation,
      this.status,
      this.nominalLoss,
      this.evaluationLimitation,
      this.isFollowUp,
      this.isFlag});

  DataDetailClarificationAuditArea.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    branch =
        json['branch'] != null ? new Branch.fromJson(json['branch']) : null;
    cases = json['cases'] != null ? new Cases.fromJson(json['cases']) : null;
    caseCategory = json['case_category'] != null
        ? new Branch.fromJson(json['case_category'])
        : null;
    code = json['code'];
    priority = json['priority'];
    fileName = json['file_name'];
    filePath = json['file_path'];
    description = json['description'];
    location = json['location'];
    auditee = json['auditee'];
    auditeeLeader = json['auditee_leader'];
    recomendation = json['recomendation'];
    evaluation = json['evaluation'];
    status = json['status'];
    nominalLoss = json['nominal_loss'];
    evaluationLimitation = json['evaluation_limitation'];
    isFollowUp = json['is_follow_up'];
    isFlag = json['is_flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.branch != null) {
      data['branch'] = this.branch!.toJson();
    }
    if (this.cases != null) {
      data['cases'] = this.cases!.toJson();
    }
    if (this.caseCategory != null) {
      data['case_category'] = this.caseCategory!.toJson();
    }
    data['code'] = this.code;
    data['priority'] = this.priority;
    data['file_name'] = this.fileName;
    data['file_path'] = this.filePath;
    data['description'] = this.description;
    data['location'] = this.location;
    data['auditee'] = this.auditee;
    data['auditee_leader'] = this.auditeeLeader;
    data['recomendation'] = this.recomendation;
    data['evaluation'] = this.evaluation;
    data['status'] = this.status;
    data['nominal_loss'] = this.nominalLoss;
    data['evaluation_limitation'] = this.evaluationLimitation;
    data['is_follow_up'] = this.isFollowUp;
    data['is_flag'] = this.isFlag;
    return data;
  }
}

class User {
  int? id;
  String? fullname;
  String? initialName;
  String? email;

  User({this.id, this.fullname, this.initialName, this.email});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    initialName = json['initial_name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    data['initial_name'] = this.initialName;
    data['email'] = this.email;
    return data;
  }
}

class Branch {
  int? id;
  String? name;

  Branch({this.id, this.name});

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Cases {
  int? id;
  String? name;
  String? code;

  Cases({this.id, this.name, this.code});

  Cases.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    return data;
  }
}
