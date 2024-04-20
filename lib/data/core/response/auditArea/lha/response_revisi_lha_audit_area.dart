class ResponseRevisionLhaAuditArea {
  Meta? meta;
  String? message;
  int? status;
  List<DataRevisiLha>? data;

  ResponseRevisionLhaAuditArea(
      {this.meta, this.message, this.status, this.data});

  ResponseRevisionLhaAuditArea.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <DataRevisiLha>[];
      json['data'].forEach((v) {
        data!.add(new DataRevisiLha.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
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

class DataRevisiLha {
  int? id;
  Cases? cases;
  CaseCategory? caseCategory;
  int? revisionNumber;
  String? description;
  String? suggestion;
  String? temporaryRecommendations;
  String? permanentRecommendations;
  int? isResearch;
  int? createdBy;
  String? createdAt;

  DataRevisiLha(
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

  DataRevisiLha.fromJson(Map<String, dynamic> json) {
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
    createdBy = json['created_by'];
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
    data['created_by'] = this.createdBy;
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
