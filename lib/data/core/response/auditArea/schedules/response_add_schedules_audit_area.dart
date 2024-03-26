class ModelBodyAddScheduleAuditArea {
  int? auditor;
  int? area;
  int? branch;
  String? startDate;
  String? endDate;
  String? scheduleDescription;

  ModelBodyAddScheduleAuditArea(
      {this.auditor,
        this.area,
        this.branch,
        this.startDate,
        this.endDate,
        this.scheduleDescription});

  ModelBodyAddScheduleAuditArea.fromJson(Map<String, dynamic> json) {
    auditor = json['auditor'];
    area = json['area'];
    branch = json['branch'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    scheduleDescription = json['schedule_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['auditor'] = auditor;
    data['area'] = area;
    data['branch'] = branch;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['schedule_description'] = scheduleDescription;
    return data;
  }
}

