class ResponsePriorityFindingAuditRegion {
  Metadata? metadata;
  int? status;
  String? message;
  List<ModelListPriorityFindingsAuditRegion>? priorityFindings;

  ResponsePriorityFindingAuditRegion(
      {this.metadata, this.status, this.message, this.priorityFindings});

  ResponsePriorityFindingAuditRegion.fromJson(Map<String, dynamic> json) {
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    status = json['status'];
    message = json['message'];
    if (json['priority_findings'] != null) {
      priorityFindings = <ModelListPriorityFindingsAuditRegion>[];
      json['priority_findings'].forEach((v) {
        priorityFindings!.add(new ModelListPriorityFindingsAuditRegion.fromJson(v));
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
    if (this.priorityFindings != null) {
      data['priority_findings'] =
          this.priorityFindings!.map((v) => v.toJson()).toList();
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

class ModelListPriorityFindingsAuditRegion {
  int? id;
  String? priorityFindingsName;

  ModelListPriorityFindingsAuditRegion({this.id, this.priorityFindingsName});

  ModelListPriorityFindingsAuditRegion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    priorityFindingsName = json['priority_findings_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['priority_findings_name'] = this.priorityFindingsName;
    return data;
  }
}
