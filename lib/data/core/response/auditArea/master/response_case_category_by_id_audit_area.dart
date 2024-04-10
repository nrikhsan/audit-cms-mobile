class ResponseCaseCategoryByIdAuditArea {
  Meta? meta;
  String? message;
  int? status;
  List<DataCaseCategoryByIdAuditArea>? data;

  ResponseCaseCategoryByIdAuditArea(
      {this.meta, this.message, this.status, this.data});

  ResponseCaseCategoryByIdAuditArea.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <DataCaseCategoryByIdAuditArea>[];
      json['data'].forEach((v) {
        data!.add(DataCaseCategoryByIdAuditArea.fromJson(v));
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

class DataCaseCategoryByIdAuditArea {
  String? name;
  int? id;

  DataCaseCategoryByIdAuditArea({this.name, this.id});

  DataCaseCategoryByIdAuditArea.fromJson(Map<String, dynamic> json) {
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
