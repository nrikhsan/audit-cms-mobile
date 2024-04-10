import 'package:audit_cms/data/core/response/auditRegion/master/response_case_audit_region.dart';
import 'package:audit_cms/data/core/response/auditRegion/master/response_case_category_audit_region.dart';

class ModelBodyInputLhaAuditRegion {
  int? scheduleId;
  int? branchId;
  List<LhaDetail>? lhaDetail;

  ModelBodyInputLhaAuditRegion(
      {this.scheduleId, this.branchId, this.lhaDetail});

  ModelBodyInputLhaAuditRegion.fromJson(Map<String, dynamic> json) {
    scheduleId = json['schedule_id'];
    branchId = json['branch_id'];
    if (json['lha_detail'] != null) {
      lhaDetail = <LhaDetail>[];
      json['lha_detail'].forEach((v) {
        lhaDetail!.add(new LhaDetail.fromJson(v));
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

class LhaDetail {
  int? caseId;
  int? caseCategoryId;
  String? description;
  String? suggestion;
  String? temporaryRecommendation;
  String? permanentRecommendation;
  int? research;
  DataCaseAuditRegion? caseName;
  DataCaseCategory? caseCategoryName;

  LhaDetail(
      {this.caseId,
      this.caseCategoryId,
      this.description,
      this.suggestion,
      this.temporaryRecommendation,
      this.permanentRecommendation,
      this.research,
      this.caseName,
      this.caseCategoryName});

  LhaDetail.fromJson(Map<String, dynamic> json) {
    caseId = json['case_id'];
    caseCategoryId = json['case_category_id'];
    description = json['description'];
    suggestion = json['suggestion'];
    temporaryRecommendation = json['temporary_recommendation'];
    permanentRecommendation = json['permanent_recommendation'];
    research = json['research'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['case_id'] = this.caseId;
    data['case_category_id'] = this.caseCategoryId;
    data['description'] = this.description;
    data['suggestion'] = this.suggestion;
    data['temporary_recommendation'] = this.temporaryRecommendation;
    data['permanent_recommendation'] = this.permanentRecommendation;
    data['research'] = this.research;
    return data;
  }
}
