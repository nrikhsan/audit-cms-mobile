class ResponseDetailLhaAuditArea {
  Meta? meta;
  String? message;
  int? status;
  DataDetailLhaAuditArea? data;

  ResponseDetailLhaAuditArea({this.meta, this.message, this.status, this.data});

  ResponseDetailLhaAuditArea.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new DataDetailLhaAuditArea.fromJson(json['data']) : null;
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

class DataDetailLhaAuditArea {
  int? id;
  User? user;
  Branch? branch;
  Schedule? schedule;
  int? isResearch;
  List<LhaAuditArea>? lhaDetails;

  DataDetailLhaAuditArea(
      {this.id,
      this.user,
      this.branch,
      this.schedule,
      this.isResearch,
      this.lhaDetails});

  DataDetailLhaAuditArea.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    branch =
        json['branch'] != null ? new Branch.fromJson(json['branch']) : null;
    schedule = json['schedule'] != null
        ? new Schedule.fromJson(json['schedule'])
        : null;
    isResearch = json['is_research'];
    if (json['lha_details'] != null) {
      lhaDetails = <LhaAuditArea>[];
      json['lha_details'].forEach((v) {
        lhaDetails!.add(new LhaAuditArea.fromJson(v));
      });
    }
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
    if (this.schedule != null) {
      data['schedule'] = this.schedule!.toJson();
    }
    data['is_research'] = this.isResearch;
    if (this.lhaDetails != null) {
      data['lha_details'] = this.lhaDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? fullname;
  String? email;
  String? initialName;
  Level? level;

  User({this.id, this.fullname, this.email, this.initialName, this.level});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    email = json['email'];
    initialName = json['initial_name'];
    level = json['level'] != null ? new Level.fromJson(json['level']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    data['email'] = this.email;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    return data;
  }
}

class LhaAuditArea {
  int? id;
  String? cases;
  String? caseCategory;
  String? description;
  String? suggestion;
  String? temporaryRecommendations;
  String? permanentRecommendations;
  int? isResearch;
  int? statusFlow;
  int? statusParsing;
  int? isRevision;

  LhaAuditArea(
      {this.id,
      this.cases,
      this.caseCategory,
      this.description,
      this.suggestion,
      this.temporaryRecommendations,
      this.permanentRecommendations,
      this.isResearch,
      this.statusFlow,
      this.statusParsing,
      this.isRevision});

  LhaAuditArea.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cases = json['cases'];
    caseCategory = json['caseCategory'];
    description = json['description'];
    suggestion = json['suggestion'];
    temporaryRecommendations = json['temporary_recommendations'];
    permanentRecommendations = json['permanent_recommendations'];
    isResearch = json['is_research'];
    statusFlow = json['status_flow'];
    statusParsing = json['status_parsing'];
    isRevision = json['is_revision'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cases'] = this.cases;
    data['caseCategory'] = this.caseCategory;
    data['description'] = this.description;
    data['suggestion'] = this.suggestion;
    data['temporary_recommendations'] = this.temporaryRecommendations;
    data['permanent_recommendations'] = this.permanentRecommendations;
    data['is_research'] = this.isResearch;
    data['status_flow'] = this.statusFlow;
    data['status_parsing'] = this.statusParsing;
    data['is_revision'] = this.isRevision;
    return data;
  }
}
