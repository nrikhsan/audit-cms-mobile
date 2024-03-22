class ResponseAuditorAuditArea {
  List<ModelListAuditorAuditArea>? auditor;

  ResponseAuditorAuditArea({this.auditor});

  ResponseAuditorAuditArea.fromJson(Map<String, dynamic> json) {
    if (json['auditor'] != null) {
      auditor = <ModelListAuditorAuditArea>[];
      json['auditor'].forEach((v) {
        auditor!.add(ModelListAuditorAuditArea.fromJson(v));
      });
    }
  }
}

class ModelListAuditorAuditArea {
  int? id;
  String? auditorName;

  ModelListAuditorAuditArea({this.id, this.auditorName});

  ModelListAuditorAuditArea.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    auditorName = json['auditor_name'];
  }
}


class ResponseAreaAuditArea {
  List<ModelListAreaAuditArea>? area;

  ResponseAreaAuditArea({this.area});

  ResponseAreaAuditArea.fromJson(Map<String, dynamic> json) {
    if (json['area'] != null) {
      area = <ModelListAreaAuditArea>[];
      json['area'].forEach((v) {
        area!.add(ModelListAreaAuditArea.fromJson(v));
      });
    }
  }
}

class ModelListAreaAuditArea {
  int? id;
  String? areaName;

  ModelListAreaAuditArea({this.id, this.areaName});

  ModelListAreaAuditArea.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    areaName = json['area_name'];
  }
}

class ResponseBranchAuditArea {
  List<ModelListBranchAuditArea>? branch;

  ResponseBranchAuditArea({this.branch});

  ResponseBranchAuditArea.fromJson(Map<String, dynamic> json) {
    if (json['branch'] != null) {
      branch = <ModelListBranchAuditArea>[];
      json['branch'].forEach((v) {
        branch!.add(ModelListBranchAuditArea.fromJson(v));
      });
    }
  }
}

class ModelListBranchAuditArea {
  int? id;
  String? branchName;

  ModelListBranchAuditArea({this.id, this.branchName});

  ModelListBranchAuditArea.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branchName = json['branch_name'];
  }
}

class ResponseStatusScheduleAuditArea {
  List<ModelListStatusAuditArea>? status;

  ResponseStatusScheduleAuditArea({this.status});

  ResponseStatusScheduleAuditArea.fromJson(Map<String, dynamic> json) {
    if (json['status'] != null) {
      status = <ModelListStatusAuditArea>[];
      json['status'].forEach((v) {
        status!.add(new ModelListStatusAuditArea.fromJson(v));
      });
    }
  }
}

class ModelListStatusAuditArea {
  int? id;
  String? statusName;

  ModelListStatusAuditArea({this.id, this.statusName});

  ModelListStatusAuditArea.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    statusName = json['status_name'];
  }
}



