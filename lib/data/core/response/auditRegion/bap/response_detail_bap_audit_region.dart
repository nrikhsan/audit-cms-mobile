class ResponseDetailBapAuditRegion {
  Metadata? metadata;
  int? status;
  String? message;
  ModelDetailBapAuditRegion? detailBap;

  ResponseDetailBapAuditRegion(
      {this.metadata, this.status, this.message, this.detailBap});

  ResponseDetailBapAuditRegion.fromJson(Map<String, dynamic> json) {
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    status = json['status'];
    message = json['message'];
    detailBap = json['detail_bap'] != null
        ? new ModelDetailBapAuditRegion.fromJson(json['detail_bap'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.detailBap != null) {
      data['detail_bap'] = this.detailBap!.toJson();
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

class ModelDetailBapAuditRegion {
  int? id;
  String? noBap;
  String? noClarification;
  String? auditor;
  String? branch;
  String? area;
  String? dateBap;
  String? startDateExaminationPeriod;
  String? endDateExaminationPeriod;
  String? bapDoc;

  ModelDetailBapAuditRegion(
      {this.id,
        this.noBap,
        this.noClarification,
        this.auditor,
        this.branch,
        this.area,
        this.dateBap,
        this.startDateExaminationPeriod,
        this.endDateExaminationPeriod,
        this.bapDoc});

  ModelDetailBapAuditRegion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    noBap = json['no_bap'];
    noClarification = json['no_clarification'];
    auditor = json['auditor'];
    branch = json['branch'];
    area = json['area'];
    dateBap = json['date_bap'];
    startDateExaminationPeriod = json['start_date_examination_period'];
    endDateExaminationPeriod = json['end_date_examination_period'];
    bapDoc = json['bap_doc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['no_bap'] = this.noBap;
    data['no_clarification'] = this.noClarification;
    data['auditor'] = this.auditor;
    data['branch'] = this.branch;
    data['area'] = this.area;
    data['date_bap'] = this.dateBap;
    data['start_date_examination_period'] = this.startDateExaminationPeriod;
    data['end_date_examination_period'] = this.endDateExaminationPeriod;
    data['bap_doc'] = this.bapDoc;
    return data;
  }
}
