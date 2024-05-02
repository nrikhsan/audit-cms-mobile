class ResponseBapAuditArea {
  Meta? meta;
  String? message;
  int? status;
  DataBapAuditArea? data;

  ResponseBapAuditArea({this.meta, this.message, this.status, this.data});

  ResponseBapAuditArea.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new DataBapAuditArea.fromJson(json['data']) : null;
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

class DataBapAuditArea {
  Pageable? pageable;
  int? totalPage;
  int? totalElement;
  int? size;
  int? number;
  bool? last;
  bool? first;
  int? numberOfElement;
  bool? empty;
  Sort? sort;
  List<ContentListBapAuditArea>?content;

  DataBapAuditArea(
      {this.pageable,
      this.totalPage,
      this.totalElement,
      this.size,
      this.number,
      this.last,
      this.first,
      this.numberOfElement,
      this.empty,
      this.sort,
      this.content});

  DataBapAuditArea.fromJson(Map<String, dynamic> json) {
    pageable = json['pageable'] != null
        ? new Pageable.fromJson(json['pageable'])
        : null;
    totalPage = json['totalPage'];
    totalElement = json['totalElement'];
    size = json['size'];
    number = json['number'];
    last = json['last'];
    first = json['first'];
    numberOfElement = json['numberOfElement'];
    empty = json['empty'];
    sort = json['sort'] != null ? new Sort.fromJson(json['sort']) : null;
    if (json['content'] != null) {
      content = <ContentListBapAuditArea>[];
      json['content'].forEach((v) {
        content!.add(new ContentListBapAuditArea.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pageable != null) {
      data['pageable'] = this.pageable!.toJson();
    }
    data['totalPage'] = this.totalPage;
    data['totalElement'] = this.totalElement;
    data['size'] = this.size;
    data['number'] = this.number;
    data['last'] = this.last;
    data['first'] = this.first;
    data['numberOfElement'] = this.numberOfElement;
    data['empty'] = this.empty;
    if (this.sort != null) {
      data['sort'] = this.sort!.toJson();
    }
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pageable {
  int? pageNumber;
  int? pageSize;
  Sort? sort;
  int? offset;
  bool? paged;
  bool? unpaged;

  Pageable(
      {this.pageNumber,
      this.pageSize,
      this.sort,
      this.offset,
      this.paged,
      this.unpaged});

  Pageable.fromJson(Map<String, dynamic> json) {
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    sort = json['sort'] != null ? new Sort.fromJson(json['sort']) : null;
    offset = json['offset'];
    paged = json['paged'];
    unpaged = json['unpaged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageNumber'] = this.pageNumber;
    data['pageSize'] = this.pageSize;
    if (this.sort != null) {
      data['sort'] = this.sort!.toJson();
    }
    data['offset'] = this.offset;
    data['paged'] = this.paged;
    data['unpaged'] = this.unpaged;
    return data;
  }
}

class Sort {
  bool? sorted;
  bool? empty;
  bool? unsorted;

  Sort({this.sorted, this.empty, this.unsorted});

  Sort.fromJson(Map<String, dynamic> json) {
    sorted = json['sorted'];
    empty = json['empty'];
    unsorted = json['unsorted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sorted'] = this.sorted;
    data['empty'] = this.empty;
    data['unsorted'] = this.unsorted;
    return data;
  }
}

class ContentListBapAuditArea {
  int? id;
  User? user;
  Clarification? clarification;
  String? code;
  String? filename;
  String? filePath;

  ContentListBapAuditArea(
      {this.id,
      this.user,
      this.clarification,
      this.code,
      this.filename,
      this.filePath});

  ContentListBapAuditArea.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    clarification = json['clarification'] != null
        ? new Clarification.fromJson(json['clarification'])
        : null;
    code = json['code'];
    filename = json['filename'];
    filePath = json['file_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.clarification != null) {
      data['clarification'] = this.clarification!.toJson();
    }
    data['code'] = this.code;
    data['filename'] = this.filename;
    data['file_path'] = this.filePath;
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? fullname;
  String? initialName;
  Level? level;

  User({this.id, this.email, this.fullname, this.initialName, this.level});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    fullname = json['fullname'];
    initialName = json['initial_name'];
    level = json['level'] != null ? new Level.fromJson(json['level']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['fullname'] = this.fullname;
    data['initial_name'] = this.initialName;
    if (this.level != null) {
      data['level'] = this.level!.toJson();
    }
    return data;
  }
}

class Level {
  int? id;
  String? name;
  String? code;
  String? createdAt;
  String? updatedAt;

  Level({this.id, this.name, this.code, this.createdAt, this.updatedAt});

  Level.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Clarification {
  int? id;
  String? code;
  String? nominalLoss;
  String? evaluationLimitation;

  Clarification(
      {this.id, this.code, this.nominalLoss, this.evaluationLimitation});

  Clarification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    nominalLoss = json['nominal_loss'];
    evaluationLimitation = json['evaluation_limitation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['nominal_loss'] = this.nominalLoss;
    data['evaluation_limitation'] = this.evaluationLimitation;
    return data;
  }
}
