class ResponseSpecialScheduleAuditArea {
  Meta? meta;
  String? message;
  int? status;
  Data? data;

  ResponseSpecialScheduleAuditArea(
      {this.meta, this.message, this.status, this.data});

  ResponseSpecialScheduleAuditArea.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
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
  List<ContentSpecialScheduleAuditArea>? content;

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
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
      content = <ContentSpecialScheduleAuditArea>[];
      json['content'].forEach((v) {
        content!.add(new ContentSpecialScheduleAuditArea.fromJson(v));
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

class ContentSpecialScheduleAuditArea {
  int? id;
  User? user;
  Branch? branch;
  String? description;
  String? status;
  String? category;
  String? startDate;
  String? endDate;
  String? startDateRealization;
  String? endDateRealization;
  String? kka;
  int? isActive;
  CreatedBy? createdBy;

  ContentSpecialScheduleAuditArea(
      {this.id,
      this.user,
      this.branch,
      this.description,
      this.status,
      this.category,
      this.startDate,
      this.endDate,
      this.startDateRealization,
      this.endDateRealization,
      this.kka,
      this.isActive,
      this.createdBy});

  ContentSpecialScheduleAuditArea.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    branch =
        json['branch'] != null ? new Branch.fromJson(json['branch']) : null;
    description = json['description'];
    status = json['status'];
    category = json['category'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    startDateRealization = json['start_date_realization'];
    endDateRealization = json['end_date_realization'];
    kka = json['kka'];
    isActive = json['is_active'];
    createdBy = json['created_by'] != null
        ? new CreatedBy.fromJson(json['created_by'])
        : null;
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
    data['description'] = this.description;
    data['status'] = this.status;
    data['category'] = this.category;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['start_date_realization'] = this.startDateRealization;
    data['end_date_realization'] = this.endDateRealization;
    data['kka'] = this.kka;
    data['is_active'] = this.isActive;
    if (this.createdBy != null) {
      data['created_by'] = this.createdBy!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? nip;
  String? fullname;
  String? initialName;

  User({this.id, this.email, this.nip, this.fullname, this.initialName});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    nip = json['nip'];
    fullname = json['fullname'];
    initialName = json['initial_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['nip'] = this.nip;
    data['fullname'] = this.fullname;
    data['initial_name'] = this.initialName;
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

class CreatedBy {
  int? id;
  String? fullname;
  String? initialName;
  Level? level;

  CreatedBy({this.id, this.fullname, this.initialName, this.level});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    initialName = json['initial_name'];
    level = json['level'] != null ? new Level.fromJson(json['level']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
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

  Level({this.id, this.name, this.code});

  Level.fromJson(Map<String, dynamic> json) {
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
