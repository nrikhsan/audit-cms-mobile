
import 'package:audit_cms/data/core/response/auditArea/master/response_case_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_case_category_audit_area.dart';

class ModelBodyInputLhaAuditArea {
  int? scheduleId;
  int? branchId;
  List<LhaDetailArea>? lhaDetail;

  ModelBodyInputLhaAuditArea(
      {this.scheduleId, this.branchId, this.lhaDetail});

  ModelBodyInputLhaAuditArea.fromJson(Map<String, dynamic> json) {
    scheduleId = json['schedule_id'];
    branchId = json['branch_id'];
    if (json['lha_detail'] != null) {
      lhaDetail = <LhaDetailArea>[];
      json['lha_detail'].forEach((v) {
        lhaDetail!.add(new LhaDetailArea.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['schedule_id'] = this.scheduleId;
    data['branch_id'] = this.branchId;
    if (this.lhaDetail != null) {
      data['lha_detail'] = this.lhaDetail!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LhaDetailArea {
  int? caseId;
  int? caseCategoryId;
  String? description;
  String? suggestion;
  String? temporaryRecommendation;
  String? permanentRecommendation;
  int? research;
  DataCaseAuditArea? caseName;
  DataCaseCategory? caseCategoryName;

  LhaDetailArea(
      {this.caseId,
      this.caseCategoryId,
      this.description,
      this.suggestion,
      this.temporaryRecommendation,
      this.permanentRecommendation,
      this.research,
      this.caseName,
      this.caseCategoryName});

  LhaDetailArea.fromJson(Map<String, dynamic> json) {
    caseId = json['case_id'];
    caseCategoryId = json['case_category_id'];
    description = json['description'];
    suggestion = json['suggestion'];
    temporaryRecommendation = json['temporary_recommendations'];
    permanentRecommendation = json['permanent_recommendations'];
    research = json['is_research'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['case_id'] = this.caseId;
    data['case_category_id'] = this.caseCategoryId;
    data['description'] = this.description;
    data['suggestion'] = this.suggestion;
    data['temporary_recommendations'] = this.temporaryRecommendation;
    data['permanent_recommendations'] = this.permanentRecommendation;
    data['is_research'] = this.research;
    return data;
  }
}
