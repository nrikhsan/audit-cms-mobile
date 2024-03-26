class ResponseDetailFollowUpAuditArea {
  Metadata? metadata;
  int? status;
  String? message;
  ModelDetailFollowUpAuditArea? detailFollowUp;

  ResponseDetailFollowUpAuditArea(
      {this.metadata, this.status, this.message, this.detailFollowUp});

  ResponseDetailFollowUpAuditArea.fromJson(Map<String, dynamic> json) {
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    status = json['status'];
    message = json['message'];
    detailFollowUp = json['detail_follow_up'] != null
        ? new ModelDetailFollowUpAuditArea.fromJson(json['detail_follow_up'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.detailFollowUp != null) {
      data['detail_follow_up'] = this.detailFollowUp!.toJson();
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

class ModelDetailFollowUpAuditArea {
  int? id;
  int? noDocument;
  String? auditor;
  String? noKlarifikasi;
  String? dateFollowUp;
  String? branch;
  String? penalty;
  String? reason;
  String? clarificationDoc;
  String? bapDoc;
  String? followUpDoc;

  ModelDetailFollowUpAuditArea(
      {this.id,
        this.noDocument,
        this.auditor,
        this.noKlarifikasi,
        this.dateFollowUp,
        this.branch,
        this.penalty,
        this.reason,
        this.clarificationDoc,
        this.bapDoc,
        this.followUpDoc});

  ModelDetailFollowUpAuditArea.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    noDocument = json['no_document'];
    auditor = json['auditor'];
    noKlarifikasi = json['No klarifikasi'];
    dateFollowUp = json['date_follow_up'];
    branch = json['branch'];
    penalty = json['penalty'];
    reason = json['reason'];
    clarificationDoc = json['clarification_doc'];
    bapDoc = json['bap_doc'];
    followUpDoc = json['follow_up_doc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['no_document'] = this.noDocument;
    data['auditor'] = this.auditor;
    data['No klarifikasi'] = this.noKlarifikasi;
    data['date_follow_up'] = this.dateFollowUp;
    data['branch'] = this.branch;
    data['penalty'] = this.penalty;
    data['reason'] = this.reason;
    data['clarification_doc'] = this.clarificationDoc;
    data['bap_doc'] = this.bapDoc;
    data['follow_up_doc'] = this.followUpDoc;
    return data;
  }
}
