class ResponseLhaAuditRegion {
  Meta? meta;
  String? message;
  int? status;
  DataLhaAuditRegion? data;

  ResponseLhaAuditRegion({this.meta, this.message, this.status, this.data});

  ResponseLhaAuditRegion.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new DataLhaAuditRegion.fromJson(json['data']) : null;
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

class DataLhaAuditRegion {
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
  List<ContentListLhaAuditRegion>? content;

  DataLhaAuditRegion(
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

  DataLhaAuditRegion.fromJson(Map<String, dynamic> json) {
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
      content = <ContentListLhaAuditRegion>[];
      json['content'].forEach((v) {
        content!.add(new ContentListLhaAuditRegion.fromJson(v));
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

class ContentListLhaAuditRegion {
  int? id;
  User? user;
  Branch? branch;
  Schedule? schedule;
  String? createdAt;
  int? isResearch;
  int? isFlag;

  ContentListLhaAuditRegion(
      {this.id,
      this.user,
      this.branch,
      this.schedule,
      this.createdAt,
      this.isResearch,
      this.isFlag});

  ContentListLhaAuditRegion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    branch =
        json['branch'] != null ? new Branch.fromJson(json['branch']) : null;
    schedule = json['schedule'] != null
        ? new Schedule.fromJson(json['schedule'])
        : null;
    createdAt = json['created_at'];
    isResearch = json['is_research'];
    isFlag = json['is_flag'];
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
    if (this.schedule != null) {
      data['schedule'] = this.schedule!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['is_research'] = this.isResearch;
    data['is_flag'] = this.isFlag;
    return data;
  }
}

class User {
  int? id;
  String? fullname;
  String? email;
  String? initialName;
  Level? level;

  User({this.id, this.fullname, this.email, this.initialName, this.level});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    email = json['email'];
    initialName = json['initial_name'];
    level = json['level'] != null ? new Level.fromJson(json['level']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    data['email'] = this.email;
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

class Schedule {
  int? id;
  String? startDate;
  String? endDate;

  Schedule({this.id, this.startDate, this.endDate});

  Schedule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    return data;
  }
}
