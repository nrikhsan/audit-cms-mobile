class ResponseDetailScheduleAuditArea {
  Meta? meta;
  String? message;
  int? status;
  DataDetailScheduleAuditArea? data;

  ResponseDetailScheduleAuditArea(
      {this.meta, this.message, this.status, this.data});

  ResponseDetailScheduleAuditArea.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new DataDetailScheduleAuditArea.fromJson(json['data']) : null;
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

class DataDetailScheduleAuditArea {
  Schedule? schedule;
  List<Lha>? lha;
  Kka? kka;

  DataDetailScheduleAuditArea({this.schedule, this.lha, this.kka});

  DataDetailScheduleAuditArea.fromJson(Map<String, dynamic> json) {
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
  String? suggestion;
  String? status;
  String? category;
  String? startDate;
  String? endDate;
  String? startDateRealization;
  String? endDateRealization;
  CreatedBy? createdBy;

  Schedule(
      {this.id,
      this.user,
      this.branch,
      this.description,
      this.suggestion,
      this.status,
      this.category,
      this.startDate,
      this.endDate,
      this.startDateRealization,
      this.endDateRealization,
      this.createdBy});

  Schedule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    branch =
        json['branch'] != null ? new Branch.fromJson(json['branch']) : null;
    description = json['description'];
    suggestion = json['suggestion'];
    status = json['status'];
    category = json['category'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    startDateRealization = json['start_date_realization'];
    endDateRealization = json['end_date_realization'];
    createdBy = json['created_by'] != null
        ? new CreatedBy.fromJson(json['created_by'])
        : null;
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
    data['suggestion'] = this.suggestion;
    data['status'] = this.status;
    data['category'] = this.category;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['start_date_realization'] = this.startDateRealization;
    data['end_date_realization'] = this.endDateRealization;
    if (this.createdBy != null) {
      data['created_by'] = this.createdBy!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? nip;
  String? fullname;
  String? initialName;
  Level? level;

  User(
      {this.id,
      this.email,
      this.nip,
      this.fullname,
      this.initialName,
      this.level});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    nip = json['nip'];
    fullname = json['fullname'];
    initialName = json['initial_name'];
    level = json['level'] != null ? new Level.fromJson(json['level']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['nip'] = this.nip;
    data['fullname'] = this.fullname;
    data['initial_name'] = this.initialName;
    if (this.level != null) {
      data['level'] = this.level!.toJson();
    }
    return data;
  }
}

class Level {
  int? id;
  String? name;
  String? code;
  String? createdAt;
  String? updatedAt;

  Level({this.id, this.name, this.code, this.createdAt, this.updatedAt});

  Level.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Branch {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  Area? area;

  Branch({this.id, this.name, this.createdAt, this.updatedAt, this.area});

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    area = json['area'] != null ? new Area.fromJson(json['area']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.area != null) {
      data['area'] = this.area!.toJson();
    }
    return data;
  }
}

class Area {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  Region? region;

  Area({this.id, this.name, this.createdAt, this.updatedAt, this.region});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    region =
        json['region'] != null ? new Region.fromJson(json['region']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.region != null) {
      data['region'] = this.region!.toJson();
    }
    return data;
  }
}

class Region {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  Main? main;

  Region({this.id, this.name, this.createdAt, this.updatedAt, this.main});

  Region.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    main = json['main'] != null ? new Main.fromJson(json['main']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.main != null) {
      data['main'] = this.main!.toJson();
    }
    return data;
  }
}

class Main {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  Main({this.id, this.name, this.createdAt, this.updatedAt});

  Main.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class CreatedBy {
  int? id;
  String? fullname;
  String? initialName;
  Level? level;

  CreatedBy({this.id, this.fullname, this.initialName, this.level});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    initialName = json['initial_name'];
    level = json['level'] != null ? new Level.fromJson(json['level']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    data['initial_name'] = this.initialName;
    if (this.level != null) {
      data['level'] = this.level!.toJson();
    }
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
