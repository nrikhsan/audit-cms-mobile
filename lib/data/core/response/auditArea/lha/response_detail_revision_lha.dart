class ResponseDetailRevision {
  Meta? meta;
  String? message;
  int? status;
  DataDetailRevision? data;

  ResponseDetailRevision({this.meta, this.message, this.status, this.data});

  ResponseDetailRevision.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new DataDetailRevision.fromJson(json['data']) : null;
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

class DataDetailRevision {
  int? id;
  Cases? cases;
  CaseCategory? caseCategory;
  int? revisionNumber;
  String? description;
  String? suggestion;
  String? temporaryRecommendations;
  String? permanentRecommendations;
  int? isResearch;
  CreatedBy? createdBy;
  String? createdAt;

  DataDetailRevision(
      {this.id,
      this.cases,
      this.caseCategory,
      this.revisionNumber,
      this.description,
      this.suggestion,
      this.temporaryRecommendations,
      this.permanentRecommendations,
      this.isResearch,
      this.createdBy,
      this.createdAt});

  DataDetailRevision.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cases = json['cases'] != null ? new Cases.fromJson(json['cases']) : null;
    caseCategory = json['caseCategory'] != null
        ? new CaseCategory.fromJson(json['caseCategory'])
        : null;
    revisionNumber = json['revisionNumber'];
    description = json['description'];
    suggestion = json['suggestion'];
    temporaryRecommendations = json['temporary_recommendations'];
    permanentRecommendations = json['permanent_recommendations'];
    isResearch = json['is_research'];
    createdBy = json['created_by'] != null
        ? new CreatedBy.fromJson(json['created_by'])
        : null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.cases != null) {
      data['cases'] = this.cases!.toJson();
    }
    if (this.caseCategory != null) {
      data['caseCategory'] = this.caseCategory!.toJson();
    }
    data['revisionNumber'] = this.revisionNumber;
    data['description'] = this.description;
    data['suggestion'] = this.suggestion;
    data['temporary_recommendations'] = this.temporaryRecommendations;
    data['permanent_recommendations'] = this.permanentRecommendations;
    data['is_research'] = this.isResearch;
    if (this.createdBy != null) {
      data['created_by'] = this.createdBy!.toJson();
    }
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Cases {
  int? id;
  String? name;
  String? code;
  String? createdAt;
  String? updatedAt;

  Cases({this.id, this.name, this.code, this.createdAt, this.updatedAt});

  Cases.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class CaseCategory {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  Cases? cases;

  CaseCategory(
      {this.id, this.name, this.createdAt, this.updatedAt, this.cases});

  CaseCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    cases = json['cases'] != null ? new Cases.fromJson(json['cases']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.cases != null) {
      data['cases'] = this.cases!.toJson();
    }
    return data;
  }
}

class CreatedBy {
  int? id;
  String? fullname;
  String? initialName;
  String? nip;
  Cases? level;

  CreatedBy({this.id, this.fullname, this.initialName, this.nip, this.level});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    initialName = json['initial_name'];
    nip = json['nip'];
    level = json['level'] != null ? new Cases.fromJson(json['level']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    data['initial_name'] = this.initialName;
    data['nip'] = this.nip;
    if (this.level != null) {
      data['level'] = this.level!.toJson();
    }
    return data;
  }
}