

import 'package:audit_cms/data/core/response/auditArea/master/response_branch_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_users.dart';

class ModelBodySchedulesAuditArea {
  int? userId;
  int? branchId;
  String? startDate;
  String? endDate;
  String? description;
  DataListBranch? branch;
  DataUsers? user;

  ModelBodySchedulesAuditArea(
      {this.userId,
        this.branchId,
        this.startDate,
        this.endDate,
        this.description,
        this.branch,
        this.user});

  ModelBodySchedulesAuditArea.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    branchId = json['branch_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['branch_id'] = branchId;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['description'] = description;
    return data;
  }
}


class ModelBodyReschedulesAuditArea {
  int? userId;
  int? scheduleId;
  int? branchId;
  String? startDate;
  String? endDate;
  String? description;

  ModelBodyReschedulesAuditArea(
      {this.userId,
      this.scheduleId,
      this.branchId,
      this.startDate,
      this.endDate,
      this.description});

  ModelBodyReschedulesAuditArea.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    scheduleId = json['schedule_id'];
    branchId = json['branch_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['schedule_id'] = scheduleId;
    data['branch_id'] = branchId;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['description'] = description;
    return data;
  }
}
