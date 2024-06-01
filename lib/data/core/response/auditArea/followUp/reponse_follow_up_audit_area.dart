import 'package:audit_cms/data/core/response/auditArea/master/response_penalty_audit_area.dart';

class ResponseFollowUp {
  Meta? meta;
  String? message;
  int? status;
  DataFollowUp? data;

  ResponseFollowUp({this.meta, this.message, this.status, this.data});

  ResponseFollowUp.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? DataFollowUp.fromJson(json['data']) : null;
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

class DataFollowUp {
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
  List<ContentListFollowUp>? content;

  DataFollowUp(
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

  DataFollowUp.fromJson(Map<String, dynamic> json) {
    pageable = json['pageable'] != null
        ? Pageable.fromJson(json['pageable'])
        : null;
    totalPage = json['totalPage'];
    totalElement = json['totalElement'];
    size = json['size'];
    number = json['number'];
    last = json['last'];
    first = json['first'];
    numberOfElement = json['numberOfElement'];
    empty = json['empty'];
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    if (json['content'] != null) {
      content = <ContentListFollowUp>[];
      json['content'].forEach((v) {
        content!.add(ContentListFollowUp.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pageable != null) {
      data['pageable'] = pageable!.toJson();
    }
    data['totalPage'] = totalPage;
    data['totalElement'] = totalElement;
    data['size'] = size;
    data['number'] = number;
    data['last'] = last;
    data['first'] = first;
    data['numberOfElement'] = numberOfElement;
    data['empty'] = empty;
    if (sort != null) {
      data['sort'] = sort!.toJson();
    }
    if (content != null) {
      data['content'] = content!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sorted'] = sorted;
    data['empty'] = empty;
    data['unsorted'] = unsorted;
    return data;
  }
}

class ContentListFollowUp {
  int? id;
  User? user;
  Branch? branch;
  List<Penalty>? penalty;
  Clarification? clarification;
  String? code;
  int? chargingCosts;
  String? description;
  String? note;
  List<DataListPenaltyAuditArea>? penaltyRelization;
  String? status;
  String? filename;
  String? filePath;
  int? isPenalty;
  String? createdAt;

  ContentListFollowUp(
      {this.id,
      this.user,
      this.branch,
      this.penalty,
      this.clarification,
      this.code,
      this.chargingCosts,
      this.description,
      this.note,
      this.penaltyRelization,
      this.status,
      this.filename,
      this.filePath,
      this.isPenalty,
      this.createdAt});

  ContentListFollowUp.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    branch =
        json['branch'] != null ? Branch.fromJson(json['branch']) : null;
    if (json['penalty'] != null) {
      penalty = <Penalty>[];
      json['penalty'].forEach((v) {
        penalty!.add(Penalty.fromJson(v));
      });
    }
    clarification = json['clarification'] != null
        ? Clarification.fromJson(json['clarification'])
        : null;
    code = json['code'];
    chargingCosts = json['charging_costs'];
    description = json['description'];
    note = json['note'];
    if (json['penalty_relization'] != null) {
      penaltyRelization = <DataListPenaltyAuditArea>[];
      json['penalty_relization'].forEach((v) {
        penaltyRelization!.add(DataListPenaltyAuditArea.fromJson(v));
      });
    }
    status = json['status'];
    filename = json['filename'];
    filePath = json['file_path'];
    isPenalty = json['is_penalty'];
    createdAt = json['created_at'];
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
    if (penalty != null) {
      data['penalty'] = penalty!.map((v) => v.toJson()).toList();
    }
    if (clarification != null) {
      data['clarification'] = clarification!.toJson();
    }
    data['code'] = code;
    data['charging_costs'] = chargingCosts;
    data['description'] = description;
    data['note'] = note;
    if (penaltyRelization != null) {
      data['penalty_relization'] =
          penaltyRelization!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['filename'] = filename;
    data['file_path'] = filePath;
    data['is_penalty'] = isPenalty;
    data['created_at'] = createdAt;
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
    level = json['level'] != null ? Level.fromJson(json['level']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['fullname'] = fullname;
    data['initial_name'] = initialName;
    if (level != null) {
      data['level'] = level!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Branch {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  Area? area;

  Branch({this.id, this.name, this.createdAt, this.updatedAt, this.area});

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    area = json['area'] != null ? Area.fromJson(json['area']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
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
  Region? region;

  Area({this.id, this.name, this.createdAt, this.updatedAt, this.region});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    region =
        json['region'] != null ? Region.fromJson(json['region']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
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
  Main? main;

  Region({this.id, this.name, this.createdAt, this.updatedAt, this.main});

  Region.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (main != null) {
      data['main'] = main!.toJson();
    }
    return data;
  }
}

class Main {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  Main({this.id, this.name, this.createdAt, this.updatedAt});

  Main.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Penalty {
  int? id;
  String? name;

  Penalty({this.id, this.name});

  Penalty.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['evaluation_limitation'] = evaluationLimitation;
    return data;
  }
}
