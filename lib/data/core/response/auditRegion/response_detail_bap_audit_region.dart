class ResponseDetailBapAuditRegion {
  int? id;
  String? noBap;
  String? noClarification;
  String? auditor;
  String? branch;
  String? area;
  String? dateBap;
  String? startDateExaminationPeriod;
  String? endDateExaminationPeriod;
  String? bapDoc;

  ResponseDetailBapAuditRegion(
      {this.id,
      this.noBap,
      this.noClarification,
      this.auditor,
      this.branch,
      this.area,
      this.dateBap,
      this.startDateExaminationPeriod,
      this.endDateExaminationPeriod,
      this.bapDoc});

  ResponseDetailBapAuditRegion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    noBap = json['no_bap'];
    noClarification = json['no_clarification'];
    auditor = json['auditor'];
    branch = json['branch'];
    area = json['area'];
    dateBap = json['date_bap'];
    startDateExaminationPeriod = json['start_date_examination_period'];
    endDateExaminationPeriod = json['end_date_examination_period'];
    bapDoc = json['bap_doc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['no_bap'] = this.noBap;
    data['no_clarification'] = this.noClarification;
    data['auditor'] = this.auditor;
    data['branch'] = this.branch;
    data['area'] = this.area;
    data['date_bap'] = this.dateBap;
    data['start_date_examination_period'] = this.startDateExaminationPeriod;
    data['end_date_examination_period'] = this.endDateExaminationPeriod;
    data['bap_doc'] = this.bapDoc;
    return data;
  }
}
