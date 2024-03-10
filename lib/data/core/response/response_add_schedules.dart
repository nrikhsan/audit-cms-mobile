class ResponseAddSchedules {
  int? status;
  String? message;

  ResponseAddSchedules({this.status, this.message});

  ResponseAddSchedules.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class RequestBodyAddSchedules {
  int? auditor;
  int? area;
  int? branch;
  int? status;
  String? startDate;
  String? endDate;
  String? scheduleDescription;

  RequestBodyAddSchedules(
      {this.auditor,
        this.area,
        this.branch,
        this.status,
        this.startDate,
        this.endDate,
        this.scheduleDescription});

  RequestBodyAddSchedules.fromJson(Map<String, dynamic> json) {
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

