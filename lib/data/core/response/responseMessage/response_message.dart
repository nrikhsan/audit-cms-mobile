class ResponseMessage {
  Metadata? metadata;
  int? status;
  String? message;

  ResponseMessage({this.metadata, this.status, this.message});

  ResponseMessage.fromJson(Map<String, dynamic> json) {
    metadata = json['meta'] != null
        ? Metadata.fromJson(json['meta'])
        : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class Metadata {
  String? timestamp;
  String? apiVersion;

  Metadata({this.timestamp, this.apiVersion});

  Metadata.fromJson(Map<String, dynamic> json) {
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