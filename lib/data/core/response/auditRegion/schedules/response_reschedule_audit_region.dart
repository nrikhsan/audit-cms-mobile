class ResponseReschedulesAuditRegion {
  Meta? meta;
  String? message;
  int? status;
  Data? data;

  ResponseReschedulesAuditRegion(
      {this.meta, this.message, this.status, this.data});

  ResponseReschedulesAuditRegion.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
  List<ContentListRescheduleAuditRegion>? content;
  Pageable? pageable;

  Data({this.content, this.pageable});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <ContentListRescheduleAuditRegion>[];
      json['content'].forEach((v) {
        content!.add(ContentListRescheduleAuditRegion.fromJson(v));
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

class ContentListRescheduleAuditRegion {
  User? user;
  Branch? branch;
  int? id;
  String? description;
  String? status;
  String? category;
  Null? scheduleTrx;
  String? startDate;
  String? endDate;
  Null? startDateRealization;
  Null? endDateRealization;

  ContentListRescheduleAuditRegion(
      {this.user,
      this.branch,
      this.id,
      this.description,
      this.status,
      this.category,
      this.scheduleTrx,
      this.startDate,
      this.endDate,
      this.startDateRealization,
      this.endDateRealization});

  ContentListRescheduleAuditRegion.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    branch =
        json['branch'] != null ? Branch.fromJson(json['branch']) : null;
    id = json['id'];
    description = json['description'];
    status = json['status'];
    category = json['category'];
    scheduleTrx = json['schedule_trx'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    startDateRealization = json['start_date_realization'];
    endDateRealization = json['end_date_realization'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (branch != null) {
      data['branch'] = branch!.toJson();
    }
    data['id'] = id;
    data['description'] = description;
    data['status'] = status;
    data['category'] = category;
    data['schedule_trx'] = scheduleTrx;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['start_date_realization'] = startDateRealization;
    data['end_date_realization'] = endDateRealization;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['nip'] = nip;
    data['fullname'] = fullname;
    data['initial_name'] = initialName;
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
