class ResponseInputClarification {
  Meta? meta;
  String? message;
  int? status;
  DataInputClarification? data;

  ResponseInputClarification({this.meta, this.message, this.status, this.data});

  ResponseInputClarification.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new DataInputClarification.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this.timestamp;
    data['api_version'] = this.apiVersion;
    return data;
  }
}

class DataInputClarification {
  Clarification? clarification;

  DataInputClarification({this.clarification});

  DataInputClarification.fromJson(Map<String, dynamic> json) {
    clarification = json['clarification'] != null
        ? new Clarification.fromJson(json['clarification'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.clarification != null) {
      data['clarification'] = this.clarification!.toJson();
    }
    return data;
  }
}

class Clarification {
  int? id;
  String? fileName;
  String? filePath;

  Clarification({this.id, this.fileName, this.filePath});

  Clarification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileName = json['file_name'];
    filePath = json['file_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['file_name'] = this.fileName;
    data['file_path'] = this.filePath;
    return data;
  }
}
