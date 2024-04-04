class ResponseDetailLhaRevision {
  Meta? meta;
  String? message;
  int? status;
  DataDetailRevisionLha? data;

  ResponseDetailLhaRevision({this.meta, this.message, this.status, this.data});

  ResponseDetailLhaRevision.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new DataDetailRevisionLha.fromJson(json['data']) : null;
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

class DataDetailRevisionLha {
  int? id;
  Cases? cases;
  CaseCategory? caseCategory;
  String? description;
  String? permanentRecommendation;
  String? temporaryRecommendation;
  String? suggestion;
  int? isResearch;

  DataDetailRevisionLha(
      {this.id,
      this.cases,
      this.caseCategory,
      this.description,
      this.permanentRecommendation,
      this.temporaryRecommendation,
      this.suggestion,
      this.isResearch});

  DataDetailRevisionLha.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cases = json['cases'] != null ? new Cases.fromJson(json['cases']) : null;
    caseCategory = json['case_category'] != null
        ? new CaseCategory.fromJson(json['case_category'])
        : null;
    description = json['description'];
    permanentRecommendation = json['permanent_recommendation'];
    temporaryRecommendation = json['temporary_recommendation'];
    suggestion = json['suggestion'];
    isResearch = json['is_research'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.cases != null) {
      data['cases'] = this.cases!.toJson();
    }
    if (this.caseCategory != null) {
      data['case_category'] = this.caseCategory!.toJson();
    }
    data['description'] = this.description;
    data['permanent_recommendation'] = this.permanentRecommendation;
    data['temporary_recommendation'] = this.temporaryRecommendation;
    data['suggestion'] = this.suggestion;
    data['is_research'] = this.isResearch;
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

class CaseCategory {
  int? id;
  String? name;

  CaseCategory({this.id, this.name});

  CaseCategory.fromJson(Map<String, dynamic> json) {
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
