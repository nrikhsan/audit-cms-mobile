class ResponseClarificationAuditRegion {
  Meta? meta;
  String? message;
  int? status;
  DataClarificationAuditRegion? data;

  ResponseClarificationAuditRegion(
      {this.meta, this.message, this.status, this.data});

  ResponseClarificationAuditRegion.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? DataClarificationAuditRegion.fromJson(json['data']) : null;
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

class DataClarificationAuditRegion {
  List<ContentListClarificationAuditRegion>? content;
  Pageable? pageable;

  DataClarificationAuditRegion({this.content, this.pageable});

  DataClarificationAuditRegion.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <ContentListClarificationAuditRegion>[];
      json['content'].forEach((v) {
        content!.add(ContentListClarificationAuditRegion.fromJson(v));
      });
    }
    pageable = json['pageable'] != null
        ? Pageable.fromJson(json['pageable'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (content != null) {
      data['content'] = content!.map((v) => v.toJson()).toList();
    }
    if (pageable != null) {
      data['pageable'] = pageable!.toJson();
    }
    return data;
  }
}

class ContentListClarificationAuditRegion {
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

  ContentListClarificationAuditRegion(
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
      this.isFlag});

  ContentListClarificationAuditRegion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    branch =
        json['branch'] != null ? Branch.fromJson(json['branch']) : null;
    cases = json['cases'] != null ? Cases.fromJson(json['cases']) : null;
    caseCategory = json['case_category'] != null
        ? Branch.fromJson(json['case_category'])
        : null;
    code = json['code'];
    priority = json['priority'];
    fileName = json['file_name'];
    filePath = json['file_path'];
    description = json['description'];
    status = json['status'];
    isFollowUp = json['is_follow_up'];
    isFlag = json['is_flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (branch != null) {
      data['branch'] = branch!.toJson();
    }
    if (cases != null) {
      data['cases'] = cases!.toJson();
    }
    if (caseCategory != null) {
      data['case_category'] = caseCategory!.toJson();
    }
    data['code'] = code;
    data['priority'] = priority;
    data['file_name'] = fileName;
    data['file_path'] = filePath;
    data['description'] = description;
    data['status'] = status;
    data['is_follow_up'] = isFollowUp;
    data['is_flag'] = isFlag;
    return data;
  }
}

class User {
  int? id;
  String? fullname;
  String? initialName;
  String? email;

  User({this.id, this.fullname, this.initialName, this.email});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    initialName = json['initial_name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullname'] = fullname;
    data['initial_name'] = initialName;
    data['email'] = email;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
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
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    offset = json['offset'];
    paged = json['paged'];
    unpaged = json['unpaged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pageNumber'] = pageNumber;
    data['pageSize'] = pageSize;
    if (sort != null) {
      data['sort'] = sort!.toJson();
    }
    data['offset'] = offset;
    data['paged'] = paged;
    data['unpaged'] = unpaged;
    return data;
  }
}

class Sort {
  bool? empty;
  bool? sorted;
  bool? unsorted;

  Sort({this.empty, this.sorted, this.unsorted});

  Sort.fromJson(Map<String, dynamic> json) {
    empty = json['empty'];
    sorted = json['sorted'];
    unsorted = json['unsorted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['empty'] = empty;
    data['sorted'] = sorted;
    data['unsorted'] = unsorted;
    return data;
  }
}
