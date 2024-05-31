import 'package:audit_cms/data/core/response/auditRegion/master/response_recommendation.dart';

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
  int? id;
  User? user;
  Branch? branch;
  Cases? cases;
  CaseCategory? caseCategory;
  String? code;
  String? priority;
  String? fileName;
  String? filePath;
  String? description;
  String? location;
  String? auditee;
  String? auditeeLeader;
  String? startDateRealization;
  String? endDateRealization;
  String? gap;
  List<DataListRecommendation>? recomendation;
  int? evaluation;
  String? status;
  int? nominalLoss;
  String? evaluationLimitation;
  int? isFollowUp;
  int? isFlag;

  DataDetailClarificationAuditArea(
      {this.id,
      this.user,
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
      this.startDateRealization,
      this.endDateRealization,
      this.gap,
      this.recomendation,
      this.evaluation,
      this.status,
      this.nominalLoss,
      this.evaluationLimitation,
      this.isFollowUp,
      this.isFlag});

  DataDetailClarificationAuditArea.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    branch =
        json['branch'] != null ? Branch.fromJson(json['branch']) : null;
    cases = json['cases'] != null ? Cases.fromJson(json['cases']) : null;
    caseCategory = json['case_category'] != null
        ? CaseCategory.fromJson(json['case_category'])
        : null;
    code = json['code'];
    priority = json['priority'];
    fileName = json['file_name'];
    filePath = json['file_path'];
    description = json['description'];
    location = json['location'];
    auditee = json['auditee'];
    auditeeLeader = json['auditee_leader'];
    startDateRealization = json['start_date_realization'];
    endDateRealization = json['end_date_realization'];
    gap = json['gap'];
    if (json['recomendation'] != null) {
      recomendation = <DataListRecommendation>[];
      json['recomendation'].forEach((v) {
        recomendation!.add(DataListRecommendation.fromJson(v));
      });
    }
    evaluation = json['evaluation'];
    status = json['status'];
    nominalLoss = json['nominal_loss'];
    evaluationLimitation = json['evaluation_limitation'];
    isFollowUp = json['is_follow_up'];
    isFlag = json['is_flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
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
    data['start_date_realization'] = startDateRealization;
    data['end_date_realization'] = endDateRealization;
    data['gap'] = gap;
    if (recomendation != null) {
      data['recomendation'] =
          recomendation!.map((v) => v.toJson()).toList();
    }
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
  Level? level;

  User({this.id, this.fullname, this.initialName, this.email, this.level});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    initialName = json['initial_name'];
    email = json['email'];
    level = json['level'] != null ? Level.fromJson(json['level']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullname'] = fullname;
    data['initial_name'] = initialName;
    data['email'] = email;
    if (level != null) {
      data['level'] = level!.toJson();
    }
    return data;
  }
}

class Level {
  int? id;
  String? name;
  String? code;
  String? createdAt;
  String? updatedAt;

  Level({this.id, this.name, this.code, this.createdAt, this.updatedAt});

  Level.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Branch {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  Area? area;

  Branch({this.id, this.name, this.createdAt, this.updatedAt, this.area});

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    area = json['area'] != null ? Area.fromJson(json['area']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (area != null) {
      data['area'] = area!.toJson();
    }
    return data;
  }
}

class Area {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  Region? region;

  Area({this.id, this.name, this.createdAt, this.updatedAt, this.region});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    region =
        json['region'] != null ? Region.fromJson(json['region']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (region != null) {
      data['region'] = region!.toJson();
    }
    return data;
  }
}

class Region {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  Main? main;

  Region({this.id, this.name, this.createdAt, this.updatedAt, this.main});

  Region.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (main != null) {
      data['main'] = main!.toJson();
    }
    return data;
  }
}

class Main {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  Main({this.id, this.name, this.createdAt, this.updatedAt});

  Main.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
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

class CaseCategory {
  int? id;
  String? name;

  CaseCategory({this.id, this.name});

  CaseCategory.fromJson(Map<String, dynamic> json) {
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
