class ResponseAreaAuditArea {
  Metadata? metadata;
  int? status;
  String? message;
  List<ModelListAreaAuditArea>? dataArea;

  ResponseAreaAuditArea(
      {this.metadata, this.status, this.message, this.dataArea});

  ResponseAreaAuditArea.fromJson(Map<String, dynamic> json) {
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    status = json['status'];
    message = json['message'];
    if (json['data_area'] != null) {
      dataArea = <ModelListAreaAuditArea>[];
      json['data_area'].forEach((v) {
        dataArea!.add(new ModelListAreaAuditArea.fromJson(v));
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
    if (this.dataArea != null) {
      data['data_area'] = this.dataArea!.map((v) => v.toJson()).toList();
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

class ModelListAreaAuditArea {
  int? id;
  String? areaName;

  ModelListAreaAuditArea({this.id, this.areaName});

  ModelListAreaAuditArea.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    areaName = json['area_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['area_name'] = this.areaName;
    return data;
  }
}