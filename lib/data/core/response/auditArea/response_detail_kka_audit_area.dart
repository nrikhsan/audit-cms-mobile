class ResponseDetailKkaAuditArea {
  int? id;
  String? auditor;
  String? branch;
  String? area;
  String? dateKka;
  String? startDateExaminationPeriod;
  String? endDateExaminationPeriod;
  String? kkaDoc;

  ResponseDetailKkaAuditArea(
      {this.id,
      this.auditor,
      this.branch,
      this.area,
      this.dateKka,
      this.startDateExaminationPeriod,
      this.endDateExaminationPeriod,
      this.kkaDoc});

  ResponseDetailKkaAuditArea.fromJson(Map<String, dynamic> json) {
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
