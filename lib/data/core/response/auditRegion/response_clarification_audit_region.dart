class ResponseClarificationAuditRegion {
  List<ModelListClarificationAuditRegion>? clarification;

  ResponseClarificationAuditRegion({this.clarification});

  ResponseClarificationAuditRegion.fromJson(Map<String, dynamic> json) {
    if (json['clarification'] != null) {
      clarification = <ModelListClarificationAuditRegion>[];
      json['clarification'].forEach((v) {
        clarification!.add(new ModelListClarificationAuditRegion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.clarification != null) {
      data['clarification'] =
          this.clarification!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ModelListClarificationAuditRegion {
  int? id;
  int? statusClarification;
  String? auditor;
  String? branch;
  String? clarificationDate;
  String? noClarification;
  String? noBap;
  String? clarificationCategory;
  String? limitEvaluation;
  String? divisionOrAreaBeingAudited;
  String? part;
  String? directSupervisor;
  String? dear;
  String? explanationOfAuditFinding;
  String? findingPriority;
  ClarificationIdentidicationAuditRegion? clarificationIdentidication;
  String? clarificationDoc;
  String? bapDoc;

  ModelListClarificationAuditRegion(
      {this.id,
      this.statusClarification,
      this.auditor,
      this.branch,
      this.clarificationDate,
      this.noClarification,
      this.noBap,
      this.clarificationCategory,
      this.limitEvaluation,
      this.divisionOrAreaBeingAudited,
      this.part,
      this.directSupervisor,
      this.dear,
      this.explanationOfAuditFinding,
      this.findingPriority,
      this.clarificationIdentidication,
      this.clarificationDoc,
      this.bapDoc});

  ModelListClarificationAuditRegion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    statusClarification = json['status_clarification'];
    auditor = json['auditor'];
    branch = json['branch'];
    clarificationDate = json['clarification_date'];
    noClarification = json['no_clarification'];
    noBap = json['no_bap'];
    clarificationCategory = json['clarification_category'];
    limitEvaluation = json['limit_evaluation'];
    divisionOrAreaBeingAudited = json['division_or_area_being_audited'];
    part = json['part'];
    directSupervisor = json['direct_supervisor'];
    dear = json['dear'];
    explanationOfAuditFinding = json['explanation_of_audit_finding'];
    findingPriority = json['finding_priority'];
    clarificationIdentidication = json['clarification_identidication'] != null
        ? new ClarificationIdentidicationAuditRegion.fromJson(
            json['clarification_identidication'])
        : null;
    clarificationDoc = json['clarification_doc'];
    bapDoc = json['bap_doc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status_clarification'] = this.statusClarification;
    data['auditor'] = this.auditor;
    data['branch'] = this.branch;
    data['clarification_date'] = this.clarificationDate;
    data['no_clarification'] = this.noClarification;
    data['no_bap'] = this.noBap;
    data['clarification_category'] = this.clarificationCategory;
    data['limit_evaluation'] = this.limitEvaluation;
    data['division_or_area_being_audited'] = this.divisionOrAreaBeingAudited;
    data['part'] = this.part;
    data['direct_supervisor'] = this.directSupervisor;
    data['dear'] = this.dear;
    data['explanation_of_audit_finding'] = this.explanationOfAuditFinding;
    data['finding_priority'] = this.findingPriority;
    if (this.clarificationIdentidication != null) {
      data['clarification_identidication'] =
          this.clarificationIdentidication!.toJson();
    }
    data['clarification_doc'] = this.clarificationDoc;
    data['bap_doc'] = this.bapDoc;
    return data;
  }
}

class ClarificationIdentidicationAuditRegion {
  String? clarificationEvaluation;
  int? nominalLoss;
  String? reason;

  ClarificationIdentidicationAuditRegion(
      {this.clarificationEvaluation, this.nominalLoss, this.reason});

  ClarificationIdentidicationAuditRegion.fromJson(Map<String, dynamic> json) {
    clarificationEvaluation = json['clarification_evaluation'];
    nominalLoss = json['nominal_loss'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clarification_evaluation'] = this.clarificationEvaluation;
    data['nominal_loss'] = this.nominalLoss;
    data['reason'] = this.reason;
    return data;
  }
}

class ModelDocClarificationAuditRegion {
  int? id;
  String? clarificationDoc;

  ModelDocClarificationAuditRegion({this.id, this.clarificationDoc});

  ModelDocClarificationAuditRegion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clarificationDoc = json['clarification_doc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['clarification_doc'] = this.clarificationDoc;
    return data;
  }
}
