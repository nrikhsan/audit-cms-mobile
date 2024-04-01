class ResponseBapAuditArea {
  Metadata? metadata;
  int? status;
  String? message;
  List<ModelListBapAuditArea>? dataBap;

  ResponseBapAuditArea(
      {this.metadata, this.status, this.message, this.dataBap});

  ResponseBapAuditArea.fromJson(Map<String, dynamic> json) {
    metadata = json['metadata'] != null
        ? Metadata.fromJson(json['metadata'])
        : null;
    status = json['status'];
    message = json['message'];
    if (json['data_bap'] != null) {
      dataBap = <ModelListBapAuditArea>[];
      json['data_bap'].forEach((v) {
        dataBap!.add(ModelListBapAuditArea.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    data['status'] = status;
    data['message'] = message;
    if (dataBap != null) {
      data['data_bap'] = dataBap!.map((v) => v.toJson()).toList();
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

class ModelListBapAuditArea {
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

  ModelListBapAuditArea(
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

  ModelListBapAuditArea.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['no_bap'] = noBap;
    data['no_clarification'] = noClarification;
    data['auditor'] = auditor;
    data['branch'] = branch;
    data['area'] = area;
    data['date_bap'] = dateBap;
    data['start_date_examination_period'] = startDateExaminationPeriod;
    data['end_date_examination_period'] = endDateExaminationPeriod;
    data['bap_doc'] = bapDoc;
    return data;
  }
}
