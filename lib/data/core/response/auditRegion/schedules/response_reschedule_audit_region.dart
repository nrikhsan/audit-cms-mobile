class ResponseRescheduleAuditRegion {
  Metadata? metadata;
  int? status;
  String? message;
  List<ModelListReschedulesAuditRegion>? reschedules;

  ResponseRescheduleAuditRegion(
      {this.metadata, this.status, this.message, this.reschedules});

  ResponseRescheduleAuditRegion.fromJson(Map<String, dynamic> json) {
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    status = json['status'];
    message = json['message'];
    if (json['reschedules'] != null) {
      reschedules = <ModelListReschedulesAuditRegion>[];
      json['reschedules'].forEach((v) {
        reschedules!.add(new ModelListReschedulesAuditRegion.fromJson(v));
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
    if (this.reschedules != null) {
      data['reschedules'] = this.reschedules!.map((v) => v.toJson()).toList();
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

class ModelListReschedulesAuditRegion {
  int? id;
  String? statusReschedule;
  String? auditor;
  String? area;
  String? branch;
  String? status;
  String? startDate;
  String? endDate;
  String? scheduleDescription;

  ModelListReschedulesAuditRegion(
      {this.id,
        this.statusReschedule,
        this.auditor,
        this.area,
        this.branch,
        this.status,
        this.startDate,
        this.endDate,
        this.scheduleDescription});

  ModelListReschedulesAuditRegion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    statusReschedule = json['status_reschedule'];
    auditor = json['auditor'];
    area = json['area'];
    branch = json['branch'];
    status = json['status'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    scheduleDescription = json['schedule_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status_reschedule'] = this.statusReschedule;
    data['auditor'] = this.auditor;
    data['area'] = this.area;
    data['branch'] = this.branch;
    data['status'] = this.status;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['schedule_description'] = this.scheduleDescription;
    return data;
  }
}
