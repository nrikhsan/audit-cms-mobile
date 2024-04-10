class ResponseDetailScheduleAuditArea {
  Meta? meta;
  String? message;
  int? status;
  DataDetailScheduleAuditArea? data;

  ResponseDetailScheduleAuditArea(
      {this.meta, this.message, this.status, this.data});

  ResponseDetailScheduleAuditArea.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? DataDetailScheduleAuditArea.fromJson(json['data']) : null;
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

class DataDetailScheduleAuditArea {
  Schedule? schedule;
  List<Lha>? lha;
  Kka? kka;

  DataDetailScheduleAuditArea({this.schedule, this.lha, this.kka});

  DataDetailScheduleAuditArea.fromJson(Map<String, dynamic> json) {
    schedule = json['schedule'] != null
        ? Schedule.fromJson(json['schedule'])
        : null;
    if (json['lha'] != null) {
      lha = <Lha>[];
      json['lha'].forEach((v) {
        lha!.add(Lha.fromJson(v));
      });
    }
    kka = json['kka'] != null ? Kka.fromJson(json['kka']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (schedule != null) {
      data['schedule'] = schedule!.toJson();
    }
    if (lha != null) {
      data['lha'] = lha!.map((v) => v.toJson()).toList();
    }
    if (kka != null) {
      data['kka'] = kka!.toJson();
    }
    return data;
  }
}

class Schedule {
  int? id;
  User? user;
  Branch? branch;
  String? description;
  String? status;
  String? category;
  String? startDate;
  String? endDate;
  String? startDateRealization;
  String? endDateRealization;

  Schedule(
      {this.id,
      this.user,
      this.branch,
      this.description,
      this.status,
      this.category,
      this.startDate,
      this.endDate,
      this.startDateRealization,
      this.endDateRealization});

  Schedule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    branch =
        json['branch'] != null ? Branch.fromJson(json['branch']) : null;
    description = json['description'];
    status = json['status'];
    category = json['category'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    startDateRealization = json['start_date_realization'];
    endDateRealization = json['end_date_realization'];
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
    data['description'] = description;
    data['status'] = status;
    data['category'] = category;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['start_date_realization'] = startDateRealization;
    data['end_date_realization'] = endDateRealization;
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? nip;
  String? fullname;
  String? initialName;

  User({this.id, this.email, this.nip, this.fullname, this.initialName});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    nip = json['nip'];
    fullname = json['fullname'];
    initialName = json['initial_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['nip'] = nip;
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

class Lha {
  int? id;
  Branch? branch;
  int? isFlag;

  Lha({this.id, this.branch, this.isFlag});

  Lha.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branch =
        json['branch'] != null ? Branch.fromJson(json['branch']) : null;
    isFlag = json['is_flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (branch != null) {
      data['branch'] = branch!.toJson();
    }
    data['is_flag'] = isFlag;
    return data;
  }
}

class Kka {
  int? id;
  String? filename;
  String? filePath;

  Kka({this.id, this.filename, this.filePath});

  Kka.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    filename = json['filename'];
    filePath = json['file_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['filename'] = filename;
    data['file_path'] = filePath;
    return data;
  }
}
