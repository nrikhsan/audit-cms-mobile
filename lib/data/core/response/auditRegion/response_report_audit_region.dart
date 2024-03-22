class ResponseReportAuditRegion {
  List<ModelListReportAuditRegion>? report;

  ResponseReportAuditRegion({this.report});

  ResponseReportAuditRegion.fromJson(Map<String, dynamic> json) {
    if (json['report'] != null) {
      report = <ModelListReportAuditRegion>[];
      json['report'].forEach((v) {
        report!.add(new ModelListReportAuditRegion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.report != null) {
      data['report'] = this.report!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ModelListReportAuditRegion {
  int? id;
  String? auditor;
  String? branch;
  String? reportDate;
  String? reportDoc;

  ModelListReportAuditRegion({this.id, this.auditor, this.branch, this.reportDate, this.reportDoc});

  ModelListReportAuditRegion.fromJson(Map<String, dynamic> json) {
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
