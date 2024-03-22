class ResponseEditUserAuditRegion {
  int? status;
  String? message;

  ResponseEditUserAuditRegion({this.status, this.message});

  ResponseEditUserAuditRegion.fromJson(Map<String, dynamic> json) {
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
