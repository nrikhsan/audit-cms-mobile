class ResponseDetailKkaAuditArea {
  Metadata? metadata;
  ModelDetailKkaAuditArea? detailKka;

  ResponseDetailKkaAuditArea({this.metadata, this.detailKka});

  ResponseDetailKkaAuditArea.fromJson(Map<String, dynamic> json) {
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    detailKka = json['detail_kka'] != null
        ? new ModelDetailKkaAuditArea.fromJson(json['detail_kka'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    if (this.detailKka != null) {
      data['detail_kka'] = this.detailKka!.toJson();
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

class ModelDetailKkaAuditArea {
  int? id;
  String? auditor;
  String? branch;
  String? area;
  String? dateKka;
  String? startDateExaminationPeriod;
  String? endDateExaminationPeriod;
  String? kkaDoc;

  ModelDetailKkaAuditArea(
      {this.id,
        this.auditor,
        this.branch,
        this.area,
        this.dateKka,
        this.startDateExaminationPeriod,
        this.endDateExaminationPeriod,
        this.kkaDoc});

  ModelDetailKkaAuditArea.fromJson(Map<String, dynamic> json) {
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
