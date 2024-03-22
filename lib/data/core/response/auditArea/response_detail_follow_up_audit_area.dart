class ResponseDetailFollowUpAuditArea {
  int? id;
  String? auditor;
  String? noKlarifikasi;
  String? dateFollowUp;
  String? branch;
  String? penalty;
  String? reason;
  String? clarificationDoc;
  String? bapDoc;
  String? followUpDoc;

  ResponseDetailFollowUpAuditArea(
      {this.id,
      this.auditor,
      this.noKlarifikasi,
      this.dateFollowUp,
      this.branch,
      this.penalty,
      this.reason,
      this.clarificationDoc,
      this.bapDoc,
      this.followUpDoc});

  ResponseDetailFollowUpAuditArea.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
