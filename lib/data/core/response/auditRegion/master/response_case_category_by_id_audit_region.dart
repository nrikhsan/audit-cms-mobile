class ResponseCaseCategoryByIdAuditRegion {
  Meta? meta;
  String? message;
  int? status;
  List<DataCaseCategoryByIdAuditRegion>? data;

  ResponseCaseCategoryByIdAuditRegion(
      {this.meta, this.message, this.status, this.data});

  ResponseCaseCategoryByIdAuditRegion.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <DataCaseCategoryByIdAuditRegion>[];
      json['data'].forEach((v) {
        data!.add(DataCaseCategoryByIdAuditRegion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meta {
  Null? timestamp;
  Null? apiVersion;

  Meta({this.timestamp, this.apiVersion});

  Meta.fromJson(Map<String, dynamic> json) {
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

class DataCaseCategoryByIdAuditRegion {
  String? name;
  int? id;

  DataCaseCategoryByIdAuditRegion({this.name, this.id});

  DataCaseCategoryByIdAuditRegion.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}
