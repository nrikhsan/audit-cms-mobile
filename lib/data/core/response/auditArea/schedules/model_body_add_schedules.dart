
import 'package:audit_cms/data/core/response/auditArea/master/response_branch_audit_area.dart';
import 'package:audit_cms/data/core/response/auditArea/master/response_users.dart';

class ModelBodySchedulesAuditArea {
  int? userId;
  int? branchId;
  String? startDate;
  String? endDate;
  String? description;
  DataUsers? userName;
  DataListBranch? branchName;

  ModelBodySchedulesAuditArea(
      {this.userId,
        this.branchId,
        this.startDate,
        this.endDate,
        this.description,
        this.userName,
        this.branchName});

  ModelBodySchedulesAuditArea.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    branchId = json['branch_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['branch_id'] = this.branchId;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['description'] = this.description;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['schedule_id'] = this.scheduleId;
    data['branch_id'] = this.branchId;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['description'] = this.description;
    return data;
  }
}