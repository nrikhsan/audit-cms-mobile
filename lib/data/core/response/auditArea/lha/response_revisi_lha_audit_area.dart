class ResponseRevisionLhaAuditArea {
  Meta? meta;
  String? message;
  int? status;
  DataRevisiLha? data;

  ResponseRevisionLhaAuditArea({this.meta, this.message, this.status, this.data});

  ResponseRevisionLhaAuditArea.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? DataRevisiLha.fromJson(json['data']) : null;
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

class DataRevisiLha {
  List<LhaDetails>? lhaDetails;
  Pageable? pageable;

  DataRevisiLha({this.lhaDetails, this.pageable});

  DataRevisiLha.fromJson(Map<String, dynamic> json) {
    if (json['lha_details'] != null) {
      lhaDetails = <LhaDetails>[];
      json['lha_details'].forEach((v) {
        lhaDetails!.add(LhaDetails.fromJson(v));
      });
    }
    pageable = json['pageable'] != null
        ? Pageable.fromJson(json['pageable'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (lhaDetails != null) {
      data['lha_details'] = lhaDetails!.map((v) => v.toJson()).toList();
    }
    if (pageable != null) {
      data['pageable'] = pageable!.toJson();
    }
    return data;
  }
}

class LhaDetails {
  int? id;
  String? cases;
  String? caseCategory;
  String? description;
  String? suggestion;
  String? temporaryRecommendations;
  String? permanentRecommendations;
  int? isResearch;

  LhaDetails(
      {this.id,
      this.cases,
      this.caseCategory,
      this.description,
      this.suggestion,
      this.temporaryRecommendations,
      this.permanentRecommendations,
      this.isResearch});

  LhaDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cases = json['cases'];
    caseCategory = json['caseCategory'];
    description = json['description'];
    suggestion = json['suggestion'];
    temporaryRecommendations = json['temporary_recommendations'];
    permanentRecommendations = json['permanent_recommendations'];
    isResearch = json['is_research'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cases'] = cases;
    data['caseCategory'] = caseCategory;
    data['description'] = description;
    data['suggestion'] = suggestion;
    data['temporary_recommendations'] = temporaryRecommendations;
    data['permanent_recommendations'] = permanentRecommendations;
    data['is_research'] = isResearch;
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
    sort = json['sort'] != null ? Sort.fromJson(json['sort']) : null;
    offset = json['offset'];
    unpaged = json['unpaged'];
    paged = json['paged'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pageNumber'] = pageNumber;
    data['pageSize'] = pageSize;
    if (sort != null) {
      data['sort'] = sort!.toJson();
    }
    data['offset'] = offset;
    data['unpaged'] = unpaged;
    data['paged'] = paged;
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
