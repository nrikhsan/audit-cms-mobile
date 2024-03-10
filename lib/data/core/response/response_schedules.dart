class ResponseSchedules {
  List<Schedules>? schedules;

  ResponseSchedules({this.schedules});

  ResponseSchedules.fromJson(Map<String, dynamic> json) {
    if (json['schedules'] != null) {
      schedules = <Schedules>[];
      json['schedules'].forEach((v) {
        schedules!.add(Schedules.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (schedules != null) {
      data['schedules'] = schedules!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Schedules {
  int? id;
  String? auditor;
  String? area;
  String? branch;
  String? status;
  String? startDate;
  String? endDate;
  String? scheduleDescription;

  Schedules(
      {this.id,
        this.auditor,
        this.area,
        this.branch,
        this.status,
        this.startDate,
        this.endDate,
        this.scheduleDescription});

  Schedules.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['auditor'] = auditor;
    data['area'] = area;
    data['branch'] = branch;
    data['status'] = status;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['schedule_description'] = scheduleDescription;
    return data;
  }
}
