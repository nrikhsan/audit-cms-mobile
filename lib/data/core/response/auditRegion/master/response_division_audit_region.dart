class ResponseDivisionAuditRegion {
  Metadata? metadata;
  int? status;
  String? message;
  List<ModelListDivisionAuditRegion>? dataDivision;

  ResponseDivisionAuditRegion(
      {this.metadata, this.status, this.message, this.dataDivision});

  ResponseDivisionAuditRegion.fromJson(Map<String, dynamic> json) {
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    status = json['status'];
    message = json['message'];
    if (json['data_division'] != null) {
      dataDivision = <ModelListDivisionAuditRegion>[];
      json['data_division'].forEach((v) {
        dataDivision!.add(new ModelListDivisionAuditRegion.fromJson(v));
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
    if (this.dataDivision != null) {
      data['data_division'] =
          this.dataDivision!.map((v) => v.toJson()).toList();
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

class ModelListDivisionAuditRegion {
  int? id;
  String? nameDivision;

  ModelListDivisionAuditRegion({this.id, this.nameDivision});

  ModelListDivisionAuditRegion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameDivision = json['name_division'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_division'] = this.nameDivision;
    return data;
  }
}
