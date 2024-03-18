class ResponseAttachmentAuditArea {
  List<ModelListAttachmentAuditArea>? attchment;

  ResponseAttachmentAuditArea({this.attchment});

  ResponseAttachmentAuditArea.fromJson(Map<String, dynamic> json) {
    if (json['attchment'] != null) {
      attchment = <ModelListAttachmentAuditArea>[];
      json['attchment'].forEach((v) {
        attchment!.add(new ModelListAttachmentAuditArea.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attchment != null) {
      data['attchment'] = this.attchment!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ModelListAttachmentAuditArea {
  int? id;
  String? attchmentName;

  ModelListAttachmentAuditArea({this.id, this.attchmentName});

  ModelListAttachmentAuditArea.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attchmentName = json['attchment_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['attchment_name'] = this.attchmentName;
    return data;
  }
}
