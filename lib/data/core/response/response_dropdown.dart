class ResponseAuditor {
  List<Auditor>? auditor;

  ResponseAuditor({this.auditor});

  ResponseAuditor.fromJson(Map<String, dynamic> json) {
    if (json['auditor'] != null) {
      auditor = <Auditor>[];
      json['auditor'].forEach((v) {
        auditor!.add(Auditor.fromJson(v));
      });
    }
  }
}

class Auditor {
  int? id;
  String? auditorName;

  Auditor({this.id, this.auditorName});

  Auditor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    auditorName = json['auditor_name'];
  }
}


class ResponseArea {
  List<Area>? area;

  ResponseArea({this.area});

  ResponseArea.fromJson(Map<String, dynamic> json) {
    if (json['area'] != null) {
      area = <Area>[];
      json['area'].forEach((v) {
        area!.add(Area.fromJson(v));
      });
    }
  }
}

class Area {
  int? id;
  String? areaName;

  Area({this.id, this.areaName});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    areaName = json['area_name'];
  }
}

class ResponseBranch {
  List<Branch>? branch;

  ResponseBranch({this.branch});

  ResponseBranch.fromJson(Map<String, dynamic> json) {
    if (json['branch'] != null) {
      branch = <Branch>[];
      json['branch'].forEach((v) {
        branch!.add(Branch.fromJson(v));
      });
    }
  }
}

class Branch {
  int? id;
  String? branchName;

  Branch({this.id, this.branchName});

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branchName = json['branch_name'];
  }
}

class ResponseStatusSchedule {
  List<Status>? status;

  ResponseStatusSchedule({this.status});

  ResponseStatusSchedule.fromJson(Map<String, dynamic> json) {
    if (json['status'] != null) {
      status = <Status>[];
      json['status'].forEach((v) {
        status!.add(new Status.fromJson(v));
      });
    }
  }
}

class Status {
  int? id;
  String? statusName;

  Status({this.id, this.statusName});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    statusName = json['status_name'];
  }
}



