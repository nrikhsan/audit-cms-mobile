class ResponsePriorityFindingAuditRegion {
  List<ModelListPriorityFindingsAuditRegion>? priorityFindings;

  ResponsePriorityFindingAuditRegion({this.priorityFindings});

  ResponsePriorityFindingAuditRegion.fromJson(Map<String, dynamic> json) {
    if (json['priority_findings'] != null) {
      priorityFindings = <ModelListPriorityFindingsAuditRegion>[];
      json['priority_findings'].forEach((v) {
        priorityFindings!.add(new ModelListPriorityFindingsAuditRegion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.priorityFindings != null) {
      data['priority_findings'] =
          this.priorityFindings!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ModelListPriorityFindingsAuditRegion {
  int? id;
  String? priorityFindingsName;

  ModelListPriorityFindingsAuditRegion({this.id, this.priorityFindingsName});

  ModelListPriorityFindingsAuditRegion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    priorityFindingsName = json['priority_findings_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['priority_findings_name'] = this.priorityFindingsName;
    return data;
  }
}
