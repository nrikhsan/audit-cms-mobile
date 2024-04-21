class ResponseInputFollowUp {
  Meta? meta;
  String? message;
  int? status;
  DataInputFollowUp? data;

  ResponseInputFollowUp({this.meta, this.message, this.status, this.data});

  ResponseInputFollowUp.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new DataInputFollowUp.fromJson(json['data']) : null;
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

class DataInputFollowUp {
  Followup? followup;

  DataInputFollowUp({this.followup});

  DataInputFollowUp.fromJson(Map<String, dynamic> json) {
    followup = json['followup'] != null
        ? new Followup.fromJson(json['followup'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.followup != null) {
      data['followup'] = this.followup!.toJson();
    }
    return data;
  }
}

class Followup {
  int? id;
  String? fileName;
  String? filePath;

  Followup({this.id, this.fileName, this.filePath});

  Followup.fromJson(Map<String, dynamic> json) {
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
