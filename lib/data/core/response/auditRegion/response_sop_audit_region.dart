class ResponseSopAuditRegion {
  List<ModelListSopAuditRegion>? sop;

  ResponseSopAuditRegion({this.sop});

  ResponseSopAuditRegion.fromJson(Map<String, dynamic> json) {
    if (json['sop'] != null) {
      sop = <ModelListSopAuditRegion>[];
      json['sop'].forEach((v) {
        sop!.add(new ModelListSopAuditRegion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.sop != null) {
      data['sop'] = this.sop!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ModelListSopAuditRegion {
  int? id;
  String? sopName;

  ModelListSopAuditRegion({this.id, this.sopName});

  ModelListSopAuditRegion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sopName = json['sop_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sop_name'] = this.sopName;
    return data;
  }
}
