class ModelLocalSchedulesAuditArea {
  int? id;
  String? auditor;
  String? area;
  String? branch;
  String? startDate;
  String? endDate;
  String? scheduleDescription;

  ModelLocalSchedulesAuditArea(
      {this.id,
        this.auditor,
        this.area,
        this.branch,
        this.startDate,
        this.endDate,
        this.scheduleDescription});

  ModelLocalSchedulesAuditArea.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    auditor = json['auditor'];
    area = json['area'];
    branch = json['branch'];
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
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['schedule_description'] = this.scheduleDescription;
    return data;
  }
}
