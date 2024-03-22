class ResponseInputFollowUpAuditArea {
  int? status;
  String? message;

  ResponseInputFollowUpAuditArea({this.status, this.message});

  ResponseInputFollowUpAuditArea.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class ModelFollowUpAuditArea {
  int? penalty;
  String? realization;
  String? explanationPenalty;
  int? attachment;

  ModelFollowUpAuditArea(
      {this.penalty,
      this.realization,
      this.explanationPenalty,
      this.attachment});

  ModelFollowUpAuditArea.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? followUpDoc;

  ResponseDocumentFollowUpAuditArea({this.id, this.followUpDoc});

  ResponseDocumentFollowUpAuditArea.fromJson(Map<String, dynamic> json) {
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


