class ResponseReportAuditArea {
  Metadata? metadata;
  int? satus;
  String? message;
  ModelReportAuditArea? detailReport;

  ResponseReportAuditArea(
      {this.metadata, this.satus, this.message, this.detailReport});

  ResponseReportAuditArea.fromJson(Map<String, dynamic> json) {
    metadata = json['metadata'] != null
        ? Metadata.fromJson(json['metadata'])
        : null;
    satus = json['satus'];
    message = json['message'];
    detailReport = json['detail_report'] != null
        ? ModelReportAuditArea.fromJson(json['detail_report'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    data['satus'] = satus;
    data['message'] = message;
    if (detailReport != null) {
      data['detail_report'] = detailReport!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    data['api_version'] = apiVersion;
    return data;
  }
}

class ModelReportAuditArea {
  int? id;
  String? auditor;
  String? branch;
  String? reportDate;
  String? reportDoc;

  ModelReportAuditArea(
      {this.id, this.auditor, this.branch, this.reportDate, this.reportDoc});

  ModelReportAuditArea.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    auditor = json['auditor'];
    branch = json['branch'];
    reportDate = json['report_date'];
    reportDoc = json['report_doc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['auditor'] = auditor;
    data['branch'] = branch;
    data['report_date'] = reportDate;
    data['report_doc'] = reportDoc;
    return data;
  }
}
