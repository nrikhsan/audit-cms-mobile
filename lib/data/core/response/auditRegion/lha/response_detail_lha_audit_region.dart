class ResponseDetailLhaAuditRegion {
  Meta? meta;
  String? message;
  int? status;
  DataDetailLhaAuditRegion? data;

  ResponseDetailLhaAuditRegion({this.meta, this.message, this.status, this.data});

  ResponseDetailLhaAuditRegion.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? DataDetailLhaAuditRegion.fromJson(json['data']) : null;
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

class DataDetailLhaAuditRegion {
  int? id;
  User? user;
  Branch? branch;
  Schedule? schedule;
  int? isResearch;
  List<LhaAuditArea>? lhaDetails;

  DataDetailLhaAuditRegion(
      {this.id,
      this.user,
      this.branch,
      this.schedule,
      this.isResearch,
      this.lhaDetails});

  DataDetailLhaAuditRegion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    branch =
        json['branch'] != null ? Branch.fromJson(json['branch']) : null;
    schedule = json['schedule'] != null
        ? Schedule.fromJson(json['schedule'])
        : null;
    isResearch = json['is_research'];
    if (json['lha_details'] != null) {
      lhaDetails = <LhaAuditArea>[];
      json['lha_details'].forEach((v) {
        lhaDetails!.add(LhaAuditArea.fromJson(v));
      });
    }
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
    data['is_research'] = isResearch;
    if (lhaDetails != null) {
      data['lha_details'] = lhaDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  int? id;
  String? fullname;
  String? email;
  String? initialName;

  User({this.id, this.fullname, this.email, this.initialName});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    email = json['email'];
    initialName = json['initial_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullname'] = fullname;
    data['email'] = email;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cases'] = cases;
    data['caseCategory'] = caseCategory;
    data['description'] = description;
    data['suggestion'] = suggestion;
    data['temporary_recommendations'] = temporaryRecommendations;
    data['permanent_recommendations'] = permanentRecommendations;
    data['is_research'] = isResearch;
    data['status_flow'] = statusFlow;
    data['status_parsing'] = statusParsing;
    data['is_revision'] = isRevision;
    return data;
  }
}
