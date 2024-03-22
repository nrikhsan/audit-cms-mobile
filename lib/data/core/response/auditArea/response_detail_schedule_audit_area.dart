class ResponseDetailScheduleAuditArea {
  int? id;
  String? auditor;
  String? area;
  String? branch;
  String? status;
  String? startDate;
  String? endDate;
  String? scheduleDescription;
  String? dateProcess;
  ModelKkaAuditArea? kka;
  List<ModelListDetailLhaAuditArea>? lha;

  ResponseDetailScheduleAuditArea(
      {this.id,
      this.auditor,
      this.area,
      this.branch,
      this.status,
      this.startDate,
      this.endDate,
      this.scheduleDescription,
      this.dateProcess,
      this.kka,
      this.lha});

  ResponseDetailScheduleAuditArea.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    auditor = json['auditor'];
    area = json['area'];
    branch = json['branch'];
    status = json['status'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    scheduleDescription = json['schedule_description'];
    dateProcess = json['date_process'];
    kka = json['kka'] != null ? new ModelKkaAuditArea.fromJson(json['kka']) : null;
    if (json['lha'] != null) {
      lha = <ModelListDetailLhaAuditArea>[];
      json['lha'].forEach((v) {
        lha!.add(new ModelListDetailLhaAuditArea.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['auditor'] = this.auditor;
    data['area'] = this.area;
    data['branch'] = this.branch;
    data['status'] = this.status;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
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

class ModelKkaAuditArea {
  int? id;
  String? kkaDoc;

  ModelKkaAuditArea({this.id, this.kkaDoc});

  ModelKkaAuditArea.fromJson(Map<String, dynamic> json) {
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

class ModelListDetailLhaAuditArea {
  int? id;
  String? inputDate;
  String? auditor;
  String? branch;
  String? area;
  String? lhaCase;
  String? sopCategory;
  String? lhaDescription;
  String? temporaryRecommendation;
  String? permanentRecommendation;
  String? recommendationOrSuggest;
  bool? research;

  ModelListDetailLhaAuditArea(
      {this.id,
      this.inputDate,
      this.auditor,
      this.branch,
      this.area,
      this.lhaCase,
      this.sopCategory,
      this.lhaDescription,
      this.temporaryRecommendation,
      this.permanentRecommendation,
      this.recommendationOrSuggest,
      this.research});

  ModelListDetailLhaAuditArea.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    inputDate = json['input_date'];
    auditor = json['auditor'];
    branch = json['branch'];
    area = json['area'];
    lhaCase = json['lha_case'];
    sopCategory = json['sop_category'];
    lhaDescription = json['lha_description'];
    temporaryRecommendation = json['temporary_recommendation'];
    permanentRecommendation = json['permanent_recommendation'];
    recommendationOrSuggest = json['recommendation_or_suggest'];
    research = json['research'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['input_date'] = this.inputDate;
    data['auditor'] = this.auditor;
    data['branch'] = this.branch;
    data['area'] = this.area;
    data['lha_case'] = this.lhaCase;
    data['sop_category'] = this.sopCategory;
    data['lha_description'] = this.lhaDescription;
    data['temporary_recommendation'] = this.temporaryRecommendation;
    data['permanent_recommendation'] = this.permanentRecommendation;
    data['recommendation_or_suggest'] = this.recommendationOrSuggest;
    data['research'] = this.research;
    return data;
  }
}
