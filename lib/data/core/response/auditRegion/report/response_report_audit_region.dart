class ResponseReportAuditRegion {
  Metadata? metadata;
  int? satus;
  String? message;
  ModelReportAuditRegion? detailReport;

  ResponseReportAuditRegion(
      {this.metadata, this.satus, this.message, this.detailReport});

  ResponseReportAuditRegion.fromJson(Map<String, dynamic> json) {
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    satus = json['satus'];
    message = json['message'];
    detailReport = json['detail_report'] != null
        ? new ModelReportAuditRegion.fromJson(json['detail_report'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    data['satus'] = this.satus;
    data['message'] = this.message;
    if (this.detailReport != null) {
      data['detail_report'] = this.detailReport!.toJson();
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

class ModelReportAuditRegion {
  int? id;
  String? auditor;
  String? branch;
  String? reportDate;
  String? reportDoc;

  ModelReportAuditRegion(
      {this.id, this.auditor, this.branch, this.reportDate, this.reportDoc});

  ModelReportAuditRegion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    auditor = json['auditor'];
    branch = json['branch'];
    reportDate = json['report_date'];
    reportDoc = json['report_doc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['auditor'] = this.auditor;
    data['branch'] = this.branch;
    data['report_date'] = this.reportDate;
    data['report_doc'] = this.reportDoc;
    return data;
  }
}
