class ResponseEditLha {
  int? status;
  String? message;

  ResponseEditLha({this.status, this.message});

  ResponseEditLha.fromJson(Map<String, dynamic> json) {
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

class RequestBodyEditLha {
  String? lhaDescription;

  RequestBodyEditLha({this.lhaDescription});

  RequestBodyEditLha.fromJson(Map<String, dynamic> json) {
    lhaDescription = json['lha_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lha_description'] = this.lhaDescription;
    return data;
  }
}
