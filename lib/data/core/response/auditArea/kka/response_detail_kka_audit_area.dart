class ResponseDetailKkaAuditArea {
  Meta? meta;
  String? message;
  int? status;
  DataDetailKkaAuditArea? data;

  ResponseDetailKkaAuditArea({this.meta, this.message, this.status, this.data});

  ResponseDetailKkaAuditArea.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? DataDetailKkaAuditArea.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Meta {
  String? timestamp;
  String? apiVersion;

  Meta({this.timestamp, this.apiVersion});

  Meta.fromJson(Map<String, dynamic> json) {
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

class DataDetailKkaAuditArea {
  int? id;
  User? user;
  Branch? branch;
  Schedule? schedule;
  String? startDate;
  String? endDate;
  String? filename;
  String? filePath;

  DataDetailKkaAuditArea(
      {this.id,
      this.user,
      this.branch,
      this.schedule,
      this.startDate,
      this.endDate,
      this.filename,
      this.filePath});

  DataDetailKkaAuditArea.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    branch =
        json['branch'] != null ? Branch.fromJson(json['branch']) : null;
    schedule = json['schedule'] != null
        ? Schedule.fromJson(json['schedule'])
        : null;
    startDate = json['start_date'];
    endDate = json['end_date'];
    filename = json['filename'];
    filePath = json['file_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (branch != null) {
      data['branch'] = branch!.toJson();
    }
    if (schedule != null) {
      data['schedule'] = schedule!.toJson();
    }
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['filename'] = filename;
    data['file_path'] = filePath;
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? fullname;
  String? initialName;

  User({this.id, this.email, this.fullname, this.initialName});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    fullname = json['fullname'];
    initialName = json['initial_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['fullname'] = fullname;
    data['initial_name'] = initialName;
    return data;
  }
}

class Branch {
  int? id;
  String? name;

  Branch({this.id, this.name});

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Schedule {
  int? id;
  String? startDate;
  String? endDate;

  Schedule({this.id, this.startDate, this.endDate});

  Schedule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    return data;
  }
}
