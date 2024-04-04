class ResponseFollowUp {
  Meta? meta;
  String? message;
  int? status;
  DataFollowUp? data;

  ResponseFollowUp({this.meta, this.message, this.status, this.data});

  ResponseFollowUp.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new DataFollowUp.fromJson(json['data']) : null;
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

class DataFollowUp {
  List<ContentListFollowUp>? content;
  Pageable? pageable;

  DataFollowUp({this.content, this.pageable});

  DataFollowUp.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <ContentListFollowUp>[];
      json['content'].forEach((v) {
        content!.add(new ContentListFollowUp.fromJson(v));
      });
    }
    pageable = json['pageable'] != null
        ? new Pageable.fromJson(json['pageable'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    if (this.pageable != null) {
      data['pageable'] = this.pageable!.toJson();
    }
    return data;
  }
}

class ContentListFollowUp {
  int? id;
  User? user;
  Null? penalty;
  Clarification? clarification;
  String? code;
  String? description;
  String? status;
  Null? filename;
  Null? filePath;
  int? isPenalty;

  ContentListFollowUp(
      {this.id,
      this.user,
      this.penalty,
      this.clarification,
      this.code,
      this.description,
      this.status,
      this.filename,
      this.filePath,
      this.isPenalty});

  ContentListFollowUp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    penalty = json['penalty'];
    clarification = json['clarification'] != null
        ? new Clarification.fromJson(json['clarification'])
        : null;
    code = json['code'];
    description = json['description'];
    status = json['status'];
    filename = json['filename'];
    filePath = json['file_path'];
    isPenalty = json['is_penalty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['penalty'] = this.penalty;
    if (this.clarification != null) {
      data['clarification'] = this.clarification!.toJson();
    }
    data['code'] = this.code;
    data['description'] = this.description;
    data['status'] = this.status;
    data['filename'] = this.filename;
    data['file_path'] = this.filePath;
    data['is_penalty'] = this.isPenalty;
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? fullname;
  String? initialName;

  User({this.id, this.email, this.fullname, this.initialName});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    fullname = json['fullname'];
    initialName = json['initial_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['fullname'] = this.fullname;
    data['initial_name'] = this.initialName;
    return data;
  }
}

class Clarification {
  int? id;
  String? code;
  String? evaluationLimitation;

  Clarification({this.id, this.code, this.evaluationLimitation});

  Clarification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    evaluationLimitation = json['evaluation_limitation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['evaluation_limitation'] = this.evaluationLimitation;
    return data;
  }
}

class Pageable {
  int? pageNumber;
  int? pageSize;
  Sort? sort;
  int? offset;
  bool? unpaged;
  bool? paged;

  Pageable(
      {this.pageNumber,
      this.pageSize,
      this.sort,
      this.offset,
      this.unpaged,
      this.paged});

  Pageable.fromJson(Map<String, dynamic> json) {
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    sort = json['sort'] != null ? new Sort.fromJson(json['sort']) : null;
    offset = json['offset'];
    unpaged = json['unpaged'];
    paged = json['paged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageNumber'] = this.pageNumber;
    data['pageSize'] = this.pageSize;
    if (this.sort != null) {
      data['sort'] = this.sort!.toJson();
    }
    data['offset'] = this.offset;
    data['unpaged'] = this.unpaged;
    data['paged'] = this.paged;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['empty'] = this.empty;
    data['sorted'] = this.sorted;
    data['unsorted'] = this.unsorted;
    return data;
  }
}