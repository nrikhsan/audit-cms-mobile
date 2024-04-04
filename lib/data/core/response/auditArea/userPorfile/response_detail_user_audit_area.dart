class ResponseProfileAuditArea {
  Meta? meta;
  String? message;
  int? status;
  DataProfile? data;

  ResponseProfileAuditArea({this.meta, this.message, this.status, this.data});

  ResponseProfileAuditArea.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new DataProfile.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Meta {
  String? timestamp;
  String? apiVersion;

  Meta({this.timestamp, this.apiVersion});

  Meta.fromJson(Map<String, dynamic> json) {
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

class DataProfile {
  int? id;
  Role? role;
  Level? level;
  String? email;
  String? nip;
  String? username;
  String? password;
  String? fullname;
  String? initialName;
  int? isActive;
  int? isDelete;
  String? createdAt;
  String? updatedAt;

  DataProfile(
      {this.id,
      this.role,
      this.level,
      this.email,
      this.nip,
      this.username,
      this.password,
      this.fullname,
      this.initialName,
      this.isActive,
      this.isDelete,
      this.createdAt,
      this.updatedAt});

  DataProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    level = json['level'] != null ? new Level.fromJson(json['level']) : null;
    email = json['email'];
    nip = json['nip'];
    username = json['username'];
    password = json['password'];
    fullname = json['fullname'];
    initialName = json['initial_name'];
    isActive = json['is_active'];
    isDelete = json['is_delete'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    if (this.level != null) {
      data['level'] = this.level!.toJson();
    }
    data['email'] = this.email;
    data['nip'] = this.nip;
    data['username'] = this.username;
    data['password'] = this.password;
    data['fullname'] = this.fullname;
    data['initial_name'] = this.initialName;
    data['is_active'] = this.isActive;
    data['is_delete'] = this.isDelete;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Role {
  int? id;
  String? name;
  int? isDelete;
  String? createdAt;
  String? updatedAt;

  Role({this.id, this.name, this.isDelete, this.createdAt, this.updatedAt});

  Role.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    isDelete = json['is_delete'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['is_delete'] = this.isDelete;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Level {
  int? id;
  String? name;
  String? code;
  int? isDelete;
  String? createdAt;
  String? updatedAt;

  Level(
      {this.id,
      this.name,
      this.code,
      this.isDelete,
      this.createdAt,
      this.updatedAt});

  Level.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    isDelete = json['is_delete'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['is_delete'] = this.isDelete;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Main {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  int? isDelete;
  Area? area;

  Main(
      {this.id,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.isDelete,
      this.area});

  Main.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isDelete = json['is_delete'];
    area = json['area'] != null ? new Area.fromJson(json['area']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_delete'] = this.isDelete;
    if (this.area != null) {
      data['area'] = this.area!.toJson();
    }
    return data;
  }
}

class Area {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  int? isDelete;
  Region? region;

  Area(
      {this.id,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.isDelete,
      this.region});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isDelete = json['is_delete'];
    region =
        json['region'] != null ? new Region.fromJson(json['region']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_delete'] = this.isDelete;
    if (this.region != null) {
      data['region'] = this.region!.toJson();
    }
    return data;
  }
}

class Region {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  int? isDelete;
  Role? main;

  Region(
      {this.id,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.isDelete,
      this.main});

  Region.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    isDelete = json['is_delete'];
    main = json['main'] != null ? new Role.fromJson(json['main']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['is_delete'] = this.isDelete;
    if (this.main != null) {
      data['main'] = this.main!.toJson();
    }
    return data;
  }
}
