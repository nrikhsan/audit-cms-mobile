class ResponseDivisionAuditRegion {
  List<ModelListDivisionAuditRegion>? division;

  ResponseDivisionAuditRegion({this.division});

  ResponseDivisionAuditRegion.fromJson(Map<String, dynamic> json) {
    if (json['division'] != null) {
      division = <ModelListDivisionAuditRegion>[];
      json['division'].forEach((v) {
        division!.add(new ModelListDivisionAuditRegion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.division != null) {
      data['division'] = this.division!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ModelListDivisionAuditRegion {
  int? id;
  String? nameDivision;

  ModelListDivisionAuditRegion({this.id, this.nameDivision});

  ModelListDivisionAuditRegion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameDivision = json['name_division'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_division'] = this.nameDivision;
    return data;
  }
}
