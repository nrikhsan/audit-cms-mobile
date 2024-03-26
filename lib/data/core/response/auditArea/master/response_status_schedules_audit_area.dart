class ResponseStatusScheduleAuditArea {
  Metadata? metadata;
  int? status;
  String? message;
  List<ModelListStatusAuditArea>? dataStatus;

  ResponseStatusScheduleAuditArea(
      {this.metadata, this.status, this.message, this.dataStatus});

  ResponseStatusScheduleAuditArea.fromJson(Map<String, dynamic> json) {
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    status = json['status'];
    message = json['message'];
    if (json['data_status'] != null) {
      dataStatus = <ModelListStatusAuditArea>[];
      json['data_status'].forEach((v) {
        dataStatus!.add(new ModelListStatusAuditArea.fromJson(v));
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
    if (this.dataStatus != null) {
      data['data_status'] = this.dataStatus!.map((v) => v.toJson()).toList();
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

class ModelListStatusAuditArea {
  int? id;
  String? statusName;

  ModelListStatusAuditArea({this.id, this.statusName});

  ModelListStatusAuditArea.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    statusName = json['status_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status_name'] = this.statusName;
    return data;
  }
}