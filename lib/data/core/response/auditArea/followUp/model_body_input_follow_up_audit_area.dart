class ModelBodyFollowUpAuditArea {
  int? penalty;
  String? realization;
  String? explanationPenalty;
  int? attachment;

  ModelBodyFollowUpAuditArea(
      {this.penalty,
      this.realization,
      this.explanationPenalty,
      this.attachment});

  ModelBodyFollowUpAuditArea.fromJson(Map<String, dynamic> json) {
    penalty = json['penalty'];
    realization = json['realization'];
    explanationPenalty = json['explanation_penalty'];
    attachment = json['attachment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['penalty'] = this.penalty;
    data['realization'] = this.realization;
    data['explanation_penalty'] = this.explanationPenalty;
    data['attachment'] = this.attachment;
    return data;
  }
}

class ResponseDocumentFollowUpAuditArea {
  Metadata? metadata;
  int? status;
  String? message;
  ModelDocFollowUpAuditArea? dataDocFollowUp;

  ResponseDocumentFollowUpAuditArea(
      {this.metadata, this.status, this.message, this.dataDocFollowUp});

  ResponseDocumentFollowUpAuditArea.fromJson(Map<String, dynamic> json) {
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    status = json['status'];
    message = json['message'];
    dataDocFollowUp = json['data_doc_follow_up'] != null
        ? new ModelDocFollowUpAuditArea.fromJson(json['data_doc_follow_up'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.dataDocFollowUp != null) {
      data['data_doc_follow_up'] = this.dataDocFollowUp!.toJson();
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

class ModelDocFollowUpAuditArea {
  int? id;
  String? followUpDoc;

  ModelDocFollowUpAuditArea({this.id, this.followUpDoc});

  ModelDocFollowUpAuditArea.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    followUpDoc = json['follow_up_doc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['follow_up_doc'] = this.followUpDoc;
    return data;
  }
}



