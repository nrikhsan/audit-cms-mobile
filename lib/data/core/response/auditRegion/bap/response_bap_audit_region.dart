class ResponseBapAuditRegion {
  Metadata? metadata;
  int? status;
  String? message;
  List<ModelListBapAuditRegion>? dataBap;

  ResponseBapAuditRegion(
      {this.metadata, this.status, this.message, this.dataBap});

  ResponseBapAuditRegion.fromJson(Map<String, dynamic> json) {
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    status = json['status'];
    message = json['message'];
    if (json['data_bap'] != null) {
      dataBap = <ModelListBapAuditRegion>[];
      json['data_bap'].forEach((v) {
        dataBap!.add(new ModelListBapAuditRegion.fromJson(v));
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
    if (this.dataBap != null) {
      data['data_bap'] = this.dataBap!.map((v) => v.toJson()).toList();
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

class ModelListBapAuditRegion {
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

  ModelListBapAuditRegion(
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

  ModelListBapAuditRegion.fromJson(Map<String, dynamic> json) {
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