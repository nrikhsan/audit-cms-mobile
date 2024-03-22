class ResponseScheduleAuditRegion {
  List<ModelListSchedulAuditRegion>? schedules;

  ResponseScheduleAuditRegion({this.schedules});

  ResponseScheduleAuditRegion.fromJson(Map<String, dynamic> json) {
    if (json['schedules'] != null) {
      schedules = <ModelListSchedulAuditRegion>[];
      json['schedules'].forEach((v) {
        schedules!.add(new ModelListSchedulAuditRegion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.schedules != null) {
      data['schedules'] = this.schedules!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ModelListSchedulAuditRegion {
  int? id;
  String? auditor;
  String? area;
  String? branch;
  String? status;
  String? startDate;
  String? endDate;
  String? scheduleDescription;

  ModelListSchedulAuditRegion(
      {this.id,
      this.auditor,
      this.area,
      this.branch,
      this.status,
      this.startDate,
      this.endDate,
      this.scheduleDescription});

  ModelListSchedulAuditRegion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
