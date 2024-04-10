class ResponseCaseAuditArea {
  Meta? meta;
  String? message;
  int? status;
  List<DataCaseAuditArea>? data;

  ResponseCaseAuditArea({this.meta, this.message, this.status, this.data});

  ResponseCaseAuditArea.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <DataCaseAuditArea>[];
      json['data'].forEach((v) {
        data!.add(DataCaseAuditArea.fromJson(v));
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
  String? timestamp;
  String? apiVersion;

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

class DataCaseAuditArea {
  String? name;
  int? id;
  String? code;

  DataCaseAuditArea({this.name, this.id, this.code});

  DataCaseAuditArea.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['id'] = id;
    data['code'] = code;
    return data;
  }
}
