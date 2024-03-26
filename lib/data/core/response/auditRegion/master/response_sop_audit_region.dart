class ResponseSopAuditRegion {
  Metadata? metadata;
  int? status;
  String? message;
  List<ModelListSopAuditRegion>? dataSop;

  ResponseSopAuditRegion(
      {this.metadata, this.status, this.message, this.dataSop});

  ResponseSopAuditRegion.fromJson(Map<String, dynamic> json) {
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    status = json['status'];
    message = json['message'];
    if (json['data_sop'] != null) {
      dataSop = <ModelListSopAuditRegion>[];
      json['data_sop'].forEach((v) {
        dataSop!.add(new ModelListSopAuditRegion.fromJson(v));
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
    if (this.dataSop != null) {
      data['data_sop'] = this.dataSop!.map((v) => v.toJson()).toList();
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

class ModelListSopAuditRegion {
  int? id;
  String? sopName;

  ModelListSopAuditRegion({this.id, this.sopName});

  ModelListSopAuditRegion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sopName = json['sop_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sop_name'] = this.sopName;
    return data;
  }
}
