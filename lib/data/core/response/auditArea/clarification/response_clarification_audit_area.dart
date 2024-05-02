
class ResponseClarificationAuditArea {
  Meta? meta;
  String? message;
  int? status;
  DataClarificationAuditArea? data;

  ResponseClarificationAuditArea(
      {this.meta, this.message, this.status, this.data});

  ResponseClarificationAuditArea.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new DataClarificationAuditArea.fromJson(json['data']) : null;
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

class DataClarificationAuditArea {
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
  List<ContentListClarificationAuditArea>? content;

  DataClarificationAuditArea(
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

  DataClarificationAuditArea.fromJson(Map<String, dynamic> json) {
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
      content = <ContentListClarificationAuditArea>[];
      json['content'].forEach((v) {
        content!.add(new ContentListClarificationAuditArea.fromJson(v));
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

class ContentListClarificationAuditArea {
  int? id;
  User? user;
  Branch? branch;
  Cases? cases;
  Branch? caseCategory;
  String? code;
  String? priority;
  String? fileName;
  String? filePath;
  String? description;
  String? status;
  int? isFollowUp;
  int? isFlag;
  String? createdAt;

  ContentListClarificationAuditArea(
      {this.id,
      this.user,
      this.branch,
      this.cases,
      this.caseCategory,
      this.code,
      this.priority,
      this.fileName,
      this.filePath,
      this.description,
      this.status,
      this.isFollowUp,
      this.isFlag,
      this.createdAt});

  ContentListClarificationAuditArea.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    branch =
        json['branch'] != null ? new Branch.fromJson(json['branch']) : null;
    cases = json['cases'] != null ? new Cases.fromJson(json['cases']) : null;
    caseCategory = json['case_category'] != null
        ? new Branch.fromJson(json['case_category'])
        : null;
    code = json['code'];
    priority = json['priority'];
    fileName = json['file_name'];
    filePath = json['file_path'];
    description = json['description'];
    status = json['status'];
    isFollowUp = json['is_follow_up'];
    isFlag = json['is_flag'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.branch != null) {
      data['branch'] = this.branch!.toJson();
    }
    if (this.cases != null) {
      data['cases'] = this.cases!.toJson();
    }
    if (this.caseCategory != null) {
      data['case_category'] = this.caseCategory!.toJson();
    }
    data['code'] = this.code;
    data['priority'] = this.priority;
    data['file_name'] = this.fileName;
    data['file_path'] = this.filePath;
    data['description'] = this.description;
    data['status'] = this.status;
    data['is_follow_up'] = this.isFollowUp;
    data['is_flag'] = this.isFlag;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class User {
  int? id;
  String? fullname;
  String? initialName;
  String? email;
  Level? level;

  User({this.id, this.fullname, this.initialName, this.email, this.level});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    initialName = json['initial_name'];
    email = json['email'];
    level = json['level'] != null ? new Level.fromJson(json['level']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    data['initial_name'] = this.initialName;
    data['email'] = this.email;
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

class Branch {
  int? id;
  String? name;

  Branch({this.id, this.name});

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Cases {
  int? id;
  String? name;
  String? code;

  Cases({this.id, this.name, this.code});

  Cases.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    return data;
  }
}
