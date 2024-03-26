class ResponseClarificationCategoryAuditRegion {
  Metadata? metadata;
  int? status;
  String? message;
  List<ModelListClarificationCategoryAuditRegion>? clarificationCategory;

  ResponseClarificationCategoryAuditRegion(
      {this.metadata, this.status, this.message, this.clarificationCategory});

  ResponseClarificationCategoryAuditRegion.fromJson(Map<String, dynamic> json) {
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    status = json['status'];
    message = json['message'];
    if (json['clarification_category'] != null) {
      clarificationCategory = <ModelListClarificationCategoryAuditRegion>[];
      json['clarification_category'].forEach((v) {
        clarificationCategory!.add(new ModelListClarificationCategoryAuditRegion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.clarificationCategory != null) {
      data['clarification_category'] =
          this.clarificationCategory!.map((v) => v.toJson()).toList();
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

class ModelListClarificationCategoryAuditRegion {
  int? id;
  String? categoryName;

  ModelListClarificationCategoryAuditRegion({this.id, this.categoryName});

  ModelListClarificationCategoryAuditRegion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    return data;
  }
}
