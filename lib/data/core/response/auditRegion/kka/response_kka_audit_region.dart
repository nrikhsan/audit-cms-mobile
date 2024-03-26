class ResponseKkaAuditRegion {
  Metadata? metadata;
  int? status;
  String? message;
  List<ModelListKkaAuditRegion>? dataKka;

  ResponseKkaAuditRegion(
      {this.metadata, this.status, this.message, this.dataKka});

  ResponseKkaAuditRegion.fromJson(Map<String, dynamic> json) {
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    status = json['status'];
    message = json['message'];
    if (json['data_kka'] != null) {
      dataKka = <ModelListKkaAuditRegion>[];
      json['data_kka'].forEach((v) {
        dataKka!.add(new ModelListKkaAuditRegion.fromJson(v));
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
    if (this.dataKka != null) {
      data['data_kka'] = this.dataKka!.map((v) => v.toJson()).toList();
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

class ModelListKkaAuditRegion {
  int? id;
  String? auditor;
  String? branch;
  String? area;
  String? dateKka;
  String? startDateExaminationPeriod;
  String? endDateExaminationPeriod;
  String? kkaDoc;

  ModelListKkaAuditRegion(
      {this.id,
        this.auditor,
        this.branch,
        this.area,
        this.dateKka,
        this.startDateExaminationPeriod,
        this.endDateExaminationPeriod,
        this.kkaDoc});

  ModelListKkaAuditRegion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    auditor = json['auditor'];
    branch = json['branch'];
    area = json['area'];
    dateKka = json['date_kka'];
    startDateExaminationPeriod = json['start_date_examination_period'];
    endDateExaminationPeriod = json['end_date_examination_period'];
    kkaDoc = json['kka_doc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['auditor'] = this.auditor;
    data['branch'] = this.branch;
    data['area'] = this.area;
    data['date_kka'] = this.dateKka;
    data['start_date_examination_period'] = this.startDateExaminationPeriod;
    data['end_date_examination_period'] = this.endDateExaminationPeriod;
    data['kka_doc'] = this.kkaDoc;
    return data;
  }
}
