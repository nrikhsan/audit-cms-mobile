class ResponseDetailClarificationAuditArea {
  Meta? meta;
  String? message;
  int? status;
  DataDetailClarificationAuditArea? data;

  ResponseDetailClarificationAuditArea(
      {this.meta, this.message, this.status, this.data});

  ResponseDetailClarificationAuditArea.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? DataDetailClarificationAuditArea.fromJson(json['data']) : null;
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
  int? nominalLoss;
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
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    branch =
        json['branch'] != null ? Branch.fromJson(json['branch']) : null;
    cases = json['cases'] != null ? Cases.fromJson(json['cases']) : null;
    caseCategory = json['case_category'] != null
        ? Branch.fromJson(json['case_category'])
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
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (branch != null) {
      data['branch'] = branch!.toJson();
    }
    if (cases != null) {
      data['cases'] = cases!.toJson();
    }
    if (caseCategory != null) {
      data['case_category'] = caseCategory!.toJson();
    }
    data['code'] = code;
    data['priority'] = priority;
    data['file_name'] = fileName;
    data['file_path'] = filePath;
    data['description'] = description;
    data['location'] = location;
    data['auditee'] = auditee;
    data['auditee_leader'] = auditeeLeader;
    data['recomendation'] = recomendation;
    data['evaluation'] = evaluation;
    data['status'] = status;
    data['nominal_loss'] = nominalLoss;
    data['evaluation_limitation'] = evaluationLimitation;
    data['is_follow_up'] = isFollowUp;
    data['is_flag'] = isFlag;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullname'] = fullname;
    data['initial_name'] = initialName;
    data['email'] = email;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    return data;
  }
}
