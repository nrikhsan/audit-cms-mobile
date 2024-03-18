class ResponseEditLhaAuditArea {
  int? status;
  String? message;

  ResponseEditLhaAuditArea({this.status, this.message});

  ResponseEditLhaAuditArea.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

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
