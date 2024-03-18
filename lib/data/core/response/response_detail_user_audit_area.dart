class ResponseDetailUserAuditArea {
  int? id;
  String? username;
  String? email;
  String? nip;
  String? area;
  String? branchOffice;

  ResponseDetailUserAuditArea(
      {this.id,
      this.username,
      this.email,
      this.nip,
      this.area,
      this.branchOffice});

  ResponseDetailUserAuditArea.fromJson(Map<String, dynamic> json) {
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
