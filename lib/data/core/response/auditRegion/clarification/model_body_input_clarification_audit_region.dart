
class ModelInputClarificationAuditRegion {
  int? clarificationCategory;
  String? limitEvaluation;
  String? inspectionLocation;
  String? inspectionDivision;
  String? directSupervisor;
  String? dear;
  String? findingDescription;
  int? priorityFinding;

  ModelInputClarificationAuditRegion(
      {this.clarificationCategory,
      this.limitEvaluation,
      this.inspectionLocation,
      this.inspectionDivision,
      this.directSupervisor,
      this.dear,
      this.findingDescription,
      this.priorityFinding});

  ModelInputClarificationAuditRegion.fromJson(Map<String, dynamic> json) {
    clarificationCategory = json['clarification_category'];
    limitEvaluation = json['limit_evaluation'];
    inspectionLocation = json['inspection_location'];
    inspectionDivision = json['inspection_division'];
    directSupervisor = json['direct_supervisor'];
    dear = json['dear'];
    findingDescription = json['finding_description'];
    priorityFinding = json['priority_finding'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clarification_category'] = this.clarificationCategory;
    data['limit_evaluation'] = this.limitEvaluation;
    data['inspection_location'] = this.inspectionLocation;
    data['inspection_division'] = this.inspectionDivision;
    data['direct_supervisor'] = this.directSupervisor;
    data['dear'] = this.dear;
    data['finding_description'] = this.findingDescription;
    data['priority_finding'] = this.priorityFinding;
    return data;
  }
}
