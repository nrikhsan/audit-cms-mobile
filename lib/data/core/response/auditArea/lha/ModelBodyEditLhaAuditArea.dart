class ModelBodyEditLhaAuditArea {
  String? lhaDescription;

  ModelBodyEditLhaAuditArea({this.lhaDescription});

  ModelBodyEditLhaAuditArea.fromJson(Map<String, dynamic> json) {
    lhaDescription = json['lha_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lha_description'] = this.lhaDescription;
    return data;
  }
}
