class ResponseAttachmentAuditArea {
  Metadata? metadata;
  int? status;
  String? message;
  List<ModelListAttachmentAuditArea>? dataAttachment;

  ResponseAttachmentAuditArea(
      {this.metadata, this.status, this.message, this.dataAttachment});

  ResponseAttachmentAuditArea.fromJson(Map<String, dynamic> json) {
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    status = json['status'];
    message = json['message'];
    if (json['data_attachment'] != null) {
      dataAttachment = <ModelListAttachmentAuditArea>[];
      json['data_attachment'].forEach((v) {
        dataAttachment!.add(new ModelListAttachmentAuditArea.fromJson(v));
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
    if (this.dataAttachment != null) {
      data['data_attachment'] =
          this.dataAttachment!.map((v) => v.toJson()).toList();
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

class ModelListAttachmentAuditArea {
  int? id;
  String? attachmentName;

  ModelListAttachmentAuditArea({this.id, this.attachmentName});

  ModelListAttachmentAuditArea.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attachmentName = json['attachment_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['attachment_name'] = this.attachmentName;
    return data;
  }
}

