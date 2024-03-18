class ResponseKkaAuditArea {
  List<ModelListKkaAuditArea>? kka;

  ResponseKkaAuditArea({this.kka});

  ResponseKkaAuditArea.fromJson(Map<String, dynamic> json) {
    if (json['kka'] != null) {
      kka = <ModelListKkaAuditArea>[];
      json['kka'].forEach((v) {
        kka!.add(new ModelListKkaAuditArea.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.kka != null) {
      data['kka'] = this.kka!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ModelListKkaAuditArea {
  int? id;
  String? auditor;
  String? branch;
  String? area;
  String? dateKka;
  String? startDateExaminationPeriod;
  String? endDateExaminationPeriod;
  String? kkaDoc;

  ModelListKkaAuditArea(
      {this.id,
      this.auditor,
      this.branch,
      this.area,
      this.dateKka,
      this.startDateExaminationPeriod,
      this.endDateExaminationPeriod,
      this.kkaDoc});

  ModelListKkaAuditArea.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    auditor = json['auditor'];
    branch = json['branch'];
    area = json['area'];
    dateKka = json['date_kka'];
    startDateExaminationPeriod = json['start_date_examination_period'];
    endDateExaminationPeriod = json['end_date_examination_period'];
    kkaDoc = json['kka_doc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['auditor'] = this.auditor;
    data['branch'] = this.branch;
    data['area'] = this.area;
    data['date_kka'] = this.dateKka;
    data['start_date_examination_period'] = this.startDateExaminationPeriod;
    data['end_date_examination_period'] = this.endDateExaminationPeriod;
    data['kka_doc'] = this.kkaDoc;
    return data;
  }
}
