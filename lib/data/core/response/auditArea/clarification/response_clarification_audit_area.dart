class ResponseClarificationAuditArea {
  Metadata? metadata;
  int? status;
  String? message;
  List<ModelListClarificationAuditArea>? dataClarification;

  ResponseClarificationAuditArea(
      {this.metadata, this.status, this.message, this.dataClarification});

  ResponseClarificationAuditArea.fromJson(Map<String, dynamic> json) {
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    status = json['status'];
    message = json['message'];
    if (json['data_clarification'] != null) {
      dataClarification = <ModelListClarificationAuditArea>[];
      json['data_clarification'].forEach((v) {
        dataClarification!.add(new ModelListClarificationAuditArea.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.dataClarification != null) {
      data['data_clarification'] =
          this.dataClarification!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Metadata {
  Null? timestamp;
  Null? apiVersion;

  Metadata({this.timestamp, this.apiVersion});

  Metadata.fromJson(Map<String, dynamic> json) {
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

class ModelListClarificationAuditArea {
  int? id;
  int? noDocument;
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
  ClarificationIdentidication? clarificationIdentidication;
  String? clarificationDoc;
  String? bapDoc;

  ModelListClarificationAuditArea(
      {this.id,
        this.noDocument,
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

  ModelListClarificationAuditArea.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    noDocument = json['no_document'];
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
        ? new ClarificationIdentidication.fromJson(
        json['clarification_identidication'])
        : null;
    clarificationDoc = json['clarification_doc'];
    bapDoc = json['bap_doc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['no_document'] = this.noDocument;
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

class ClarificationIdentidication {
  String? clarificationEvaluation;
  String? nominalLoss;
  String? reason;

  ClarificationIdentidication(
      {this.clarificationEvaluation, this.nominalLoss, this.reason});

  ClarificationIdentidication.fromJson(Map<String, dynamic> json) {
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
