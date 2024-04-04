class ResponseDetailScheduleAuditRegion {
  Meta? meta;
  String? message;
  int? status;
  DataDetailScheduleAuditRegion? data;

  ResponseDetailScheduleAuditRegion(
      {this.meta, this.message, this.status, this.data});

  ResponseDetailScheduleAuditRegion.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new DataDetailScheduleAuditRegion.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this.timestamp;
    data['api_version'] = this.apiVersion;
    return data;
  }
}

class DataDetailScheduleAuditRegion {
  Schedule? schedule;
  List<Lha>? lha;
  Kka? kka;

  DataDetailScheduleAuditRegion({this.schedule, this.lha, this.kka});

  DataDetailScheduleAuditRegion.fromJson(Map<String, dynamic> json) {
    schedule = json['schedule'] != null
        ? new Schedule.fromJson(json['schedule'])
        : null;
    if (json['lha'] != null) {
      lha = <Lha>[];
      json['lha'].forEach((v) {
        lha!.add(new Lha.fromJson(v));
      });
    }
    kka = json['kka'] != null ? new Kka.fromJson(json['kka']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.schedule != null) {
      data['schedule'] = this.schedule!.toJson();
    }
    if (this.lha != null) {
      data['lha'] = this.lha!.map((v) => v.toJson()).toList();
    }
    if (this.kka != null) {
      data['kka'] = this.kka!.toJson();
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
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    branch =
        json['branch'] != null ? new Branch.fromJson(json['branch']) : null;
    description = json['description'];
    status = json['status'];
    category = json['category'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    startDateRealization = json['start_date_realization'];
    endDateRealization = json['end_date_realization'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.branch != null) {
      data['branch'] = this.branch!.toJson();
    }
    data['description'] = this.description;
    data['status'] = this.status;
    data['category'] = this.category;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['start_date_realization'] = this.startDateRealization;
    data['end_date_realization'] = this.endDateRealization;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['nip'] = this.nip;
    data['fullname'] = this.fullname;
    data['initial_name'] = this.initialName;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
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
        json['branch'] != null ? new Branch.fromJson(json['branch']) : null;
    isFlag = json['is_flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.branch != null) {
      data['branch'] = this.branch!.toJson();
    }
    data['is_flag'] = this.isFlag;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['filename'] = this.filename;
    data['file_path'] = this.filePath;
    return data;
  }
}
