class ResponseProfileAuditRegion {
  Meta? meta;
  String? message;
  int? status;
  DataProfile? data;

  ResponseProfileAuditRegion({this.meta, this.message, this.status, this.data});

  ResponseProfileAuditRegion.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? DataProfile.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timestamp'] = timestamp;
    data['api_version'] = apiVersion;
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
    role = json['role'] != null ? Role.fromJson(json['role']) : null;
    level = json['level'] != null ? Level.fromJson(json['level']) : null;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (role != null) {
      data['role'] = role!.toJson();
    }
    if (level != null) {
      data['level'] = level!.toJson();
    }
    data['email'] = email;
    data['nip'] = nip;
    data['username'] = username;
    data['password'] = password;
    data['fullname'] = fullname;
    data['initial_name'] = initialName;
    data['is_active'] = isActive;
    data['is_delete'] = isDelete;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['is_delete'] = isDelete;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['is_delete'] = isDelete;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
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
    area = json['area'] != null ? Area.fromJson(json['area']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['is_delete'] = isDelete;
    if (area != null) {
      data['area'] = area!.toJson();
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
        json['region'] != null ? Region.fromJson(json['region']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['is_delete'] = isDelete;
    if (region != null) {
      data['region'] = region!.toJson();
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
    main = json['main'] != null ? Role.fromJson(json['main']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['is_delete'] = isDelete;
    if (main != null) {
      data['main'] = main!.toJson();
    }
    return data;
  }
}
