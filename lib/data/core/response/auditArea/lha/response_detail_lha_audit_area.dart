class ResponseDetailLhaAuditArea {
  Metadata? metadata;
  int? status;
  String? message;
  ModelDetailLhaAuditArea? dataDetailLha;

  ResponseDetailLhaAuditArea(
      {this.metadata, this.status, this.message, this.dataDetailLha});

  ResponseDetailLhaAuditArea.fromJson(Map<String, dynamic> json) {
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    status = json['status'];
    message = json['message'];
    dataDetailLha = json['data_detail_lha'] != null
        ? new ModelDetailLhaAuditArea.fromJson(json['data_detail_lha'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.dataDetailLha != null) {
      data['data_detail_lha'] = this.dataDetailLha!.toJson();
    }
    return data;
  }
}

class Metadata {
  Null? timestamp;
  Null? apiVersion;

  Metadata({this.timestamp, this.apiVersion});

  Metadata.fromJson(Map<String, dynamic> json) {
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

class ModelDetailLhaAuditArea {
  int? id;
  String? auditor;
  String? inputDate;
  String? branch;
  String? area;
  String? lhaCase;
  String? sopCategory;
  String? lhaDescription;
  String? temporaryRecommendation;
  String? permanentRecommendation;
  String? recommendationOrSuggest;
  int? research;

  ModelDetailLhaAuditArea(
      {this.id,
        this.auditor,
        this.inputDate,
        this.branch,
        this.area,
        this.lhaCase,
        this.sopCategory,
        this.lhaDescription,
        this.temporaryRecommendation,
        this.permanentRecommendation,
        this.recommendationOrSuggest,
        this.research});

  ModelDetailLhaAuditArea.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    auditor = json['auditor'];
    inputDate = json['input_date'];
    branch = json['branch'];
    area = json['area'];
    lhaCase = json['lha_case'];
    sopCategory = json['sop_category'];
    lhaDescription = json['lha_description'];
    temporaryRecommendation = json['temporary_recommendation'];
    permanentRecommendation = json['permanent_recommendation'];
    recommendationOrSuggest = json['recommendation_or_suggest'];
    research = json['research'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['auditor'] = this.auditor;
    data['input_date'] = this.inputDate;
    data['branch'] = this.branch;
    data['area'] = this.area;
    data['lha_case'] = this.lhaCase;
    data['sop_category'] = this.sopCategory;
    data['lha_description'] = this.lhaDescription;
    data['temporary_recommendation'] = this.temporaryRecommendation;
    data['permanent_recommendation'] = this.permanentRecommendation;
    data['recommendation_or_suggest'] = this.recommendationOrSuggest;
    data['research'] = this.research;
    return data;
  }
}
