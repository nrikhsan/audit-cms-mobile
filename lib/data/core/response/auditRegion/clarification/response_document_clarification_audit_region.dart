class ResponseDocumentClarificationAuditRegion {
  Metadata? metadata;
  int? status;
  String? message;
  ModelDocumentClarificationAuditRegion? documentClarification;

  ResponseDocumentClarificationAuditRegion(
      {this.metadata, this.status, this.message, this.documentClarification});

  ResponseDocumentClarificationAuditRegion.fromJson(Map<String, dynamic> json) {
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    status = json['status'];
    message = json['message'];
    documentClarification = json['document_clarification'] != null
        ? new ModelDocumentClarificationAuditRegion.fromJson(json['document_clarification'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.documentClarification != null) {
      data['document_clarification'] = this.documentClarification!.toJson();
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

class ModelDocumentClarificationAuditRegion {
  int? id;
  String? clarificationDoc;

  ModelDocumentClarificationAuditRegion({this.id, this.clarificationDoc});

  ModelDocumentClarificationAuditRegion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clarificationDoc = json['clarification_doc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['clarification_doc'] = this.clarificationDoc;
    return data;
  }
}
