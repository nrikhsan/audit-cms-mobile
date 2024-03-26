class ResponseAuditorAuditArea {
  Metadata? metadata;
  int? status;
  String? message;
  List<ModelListAuditorAuditArea>? dataAuditor;

  ResponseAuditorAuditArea(
      {this.metadata, this.status, this.message, this.dataAuditor});

  ResponseAuditorAuditArea.fromJson(Map<String, dynamic> json) {
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    status = json['status'];
    message = json['message'];
    if (json['data_auditor'] != null) {
      dataAuditor = <ModelListAuditorAuditArea>[];
      json['data_auditor'].forEach((v) {
        dataAuditor!.add(new ModelListAuditorAuditArea.fromJson(v));
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
    if (this.dataAuditor != null) {
      data['data_auditor'] = this.dataAuditor!.map((v) => v.toJson()).toList();
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

class ModelListAuditorAuditArea {
  int? id;
  String? auditorName;

  ModelListAuditorAuditArea({this.id, this.auditorName});

  ModelListAuditorAuditArea.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    auditorName = json['auditor_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['auditor_name'] = this.auditorName;
    return data;
  }
}