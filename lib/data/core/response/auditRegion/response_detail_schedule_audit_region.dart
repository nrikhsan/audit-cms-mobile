class ResponseDetailScheduleAuditRegion {
  int? id;
  String? branch;
  String? startDate;
  String? endDate;
  String? status;
  String? scheduleDescription;
  String? dateProcess;
  KkaDetailScheduleAuditRegion? kka;
  List<LhaDetailScheduleAuditRegion>? lha;

  ResponseDetailScheduleAuditRegion(
      {this.id,
      this.branch,
      this.startDate,
      this.endDate,
      this.status,
      this.scheduleDescription,
      this.dateProcess,
      this.kka,
      this.lha});

  ResponseDetailScheduleAuditRegion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branch = json['branch'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
    scheduleDescription = json['schedule_description'];
    dateProcess = json['date_process'];
    kka = json['kka'] != null ? new KkaDetailScheduleAuditRegion.fromJson(json['kka']) : null;
    if (json['lha'] != null) {
      lha = <LhaDetailScheduleAuditRegion>[];
      json['lha'].forEach((v) {
        lha!.add(new LhaDetailScheduleAuditRegion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['branch'] = this.branch;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['status'] = this.status;
    data['schedule_description'] = this.scheduleDescription;
    data['date_process'] = this.dateProcess;
    if (this.kka != null) {
      data['kka'] = this.kka!.toJson();
    }
    if (this.lha != null) {
      data['lha'] = this.lha!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class KkaDetailScheduleAuditRegion {
  int? id;
  String? kkaDoc;

  KkaDetailScheduleAuditRegion({this.id, this.kkaDoc});

  KkaDetailScheduleAuditRegion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kkaDoc = json['kka_doc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kka_doc'] = this.kkaDoc;
    return data;
  }
}

class LhaDetailScheduleAuditRegion {
  int? id;
  String? inputDate;
  String? division;
  String? sopCategory;
  String? findingDescription;
  String? temporaryRecommendation;
  String? permanentRecommendation;
  String? recommendationOrSuggest;
  int? research;

  LhaDetailScheduleAuditRegion(
      {this.id,
      this.inputDate,
      this.division,
      this.sopCategory,
      this.findingDescription,
      this.temporaryRecommendation,
      this.permanentRecommendation,
      this.recommendationOrSuggest,
      this.research});

  LhaDetailScheduleAuditRegion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    inputDate = json['input_date'];
    division = json['division'];
    sopCategory = json['sop_category'];
    findingDescription = json['finding_description'];
    temporaryRecommendation = json['temporary_recommendation'];
    permanentRecommendation = json['permanent_recommendation'];
    recommendationOrSuggest = json['recommendation_or_suggest'];
    research = json['research'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['input_date'] = this.inputDate;
    data['division'] = this.division;
    data['sop_category'] = this.sopCategory;
    data['finding_description'] = this.findingDescription;
    data['temporary_recommendation'] = this.temporaryRecommendation;
    data['permanent_recommendation'] = this.permanentRecommendation;
    data['recommendation_or_suggest'] = this.recommendationOrSuggest;
    data['research'] = this.research;
    return data;
  }
}
