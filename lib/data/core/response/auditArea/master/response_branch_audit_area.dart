class ResponseBranchAuditArea {
  Metadata? metadata;
  int? status;
  String? message;
  List<ModelListBranchAuditArea>? dataBranch;

  ResponseBranchAuditArea(
      {this.metadata, this.status, this.message, this.dataBranch});

  ResponseBranchAuditArea.fromJson(Map<String, dynamic> json) {
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    status = json['status'];
    message = json['message'];
    if (json['data_branch'] != null) {
      dataBranch = <ModelListBranchAuditArea>[];
      json['data_branch'].forEach((v) {
        dataBranch!.add(new ModelListBranchAuditArea.fromJson(v));
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
    if (this.dataBranch != null) {
      data['data_branch'] = this.dataBranch!.map((v) => v.toJson()).toList();
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


class ModelListBranchAuditArea {
  int? id;
  String? branchName;

  ModelListBranchAuditArea({this.id, this.branchName});

  ModelListBranchAuditArea.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branchName = json['branch_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['branch_name'] = this.branchName;
    return data;
  }
}