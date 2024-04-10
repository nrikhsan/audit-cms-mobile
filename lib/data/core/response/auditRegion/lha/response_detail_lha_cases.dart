class ResponseDetailLhaCasesLhaAuditRegion {
  Meta? meta;
  String? message;
  int? status;
  DataDetailCasesLha? data;

  ResponseDetailLhaCasesLhaAuditRegion({this.meta, this.message, this.status, this.data});

  ResponseDetailLhaCasesLhaAuditRegion.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? DataDetailCasesLha.fromJson(json['data']) : null;
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

class DataDetailCasesLha {
  int? id;
  Cases? cases;
  CaseCategory? caseCategory;
  String? description;
  String? permanentRecommendation;
  String? temporaryRecommendation;
  String? suggestion;
  int? isResearch;

  DataDetailCasesLha(
      {this.id,
      this.cases,
      this.caseCategory,
      this.description,
      this.permanentRecommendation,
      this.temporaryRecommendation,
      this.suggestion,
      this.isResearch});

  DataDetailCasesLha.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cases = json['cases'] != null ? Cases.fromJson(json['cases']) : null;
    caseCategory = json['case_category'] != null
        ? CaseCategory.fromJson(json['case_category'])
        : null;
    description = json['description'];
    permanentRecommendation = json['permanent_recommendation'];
    temporaryRecommendation = json['temporary_recommendation'];
    suggestion = json['suggestion'];
    isResearch = json['is_research'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (cases != null) {
      data['cases'] = cases!.toJson();
    }
    if (caseCategory != null) {
      data['case_category'] = caseCategory!.toJson();
    }
    data['description'] = description;
    data['permanent_recommendation'] = permanentRecommendation;
    data['temporary_recommendation'] = temporaryRecommendation;
    data['suggestion'] = suggestion;
    data['is_research'] = isResearch;
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
