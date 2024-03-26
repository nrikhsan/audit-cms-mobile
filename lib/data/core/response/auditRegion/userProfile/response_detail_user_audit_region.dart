class ResponseDetailUserAuditRegion {
  Metadata? metadata;
  int? status;
  String? message;
  ModelDetailProfileAuditRegion? dataProfile;

  ResponseDetailUserAuditRegion(
      {this.metadata, this.status, this.message, this.dataProfile});

  ResponseDetailUserAuditRegion.fromJson(Map<String, dynamic> json) {
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    status = json['status'];
    message = json['message'];
    dataProfile = json['data_profile'] != null
        ? new ModelDetailProfileAuditRegion.fromJson(json['data_profile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.metadata != null) {
      data['metadata'] = this.metadata!.toJson();
    }
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.dataProfile != null) {
      data['data_profile'] = this.dataProfile!.toJson();
    }
    return data;
  }
}

class Metadata {
  Null? timestamp;
  Null? apiVersion;

  Metadata({this.timestamp, this.apiVersion});

  Metadata.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    apiVersion = json['api_version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this.timestamp;
    data['api_version'] = this.apiVersion;
    return data;
  }
}

class ModelDetailProfileAuditRegion {
  int? id;
  String? username;
  String? email;
  String? nip;
  String? area;
  String? branchOffice;

  ModelDetailProfileAuditRegion(
      {this.id,
        this.username,
        this.email,
        this.nip,
        this.area,
        this.branchOffice});

  ModelDetailProfileAuditRegion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    nip = json['nip'];
    area = json['area'];
    branchOffice = json['branch_office'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['nip'] = this.nip;
    data['area'] = this.area;
    data['branch_office'] = this.branchOffice;
    return data;
  }
}
