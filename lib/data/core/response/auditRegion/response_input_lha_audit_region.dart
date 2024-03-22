class ResponseInputLhaAuditRegion {
  int? status;
  String? message;

  ResponseInputLhaAuditRegion({this.status, this.message});

  ResponseInputLhaAuditRegion.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}

class ModelInputLhaAuditRegion {
  int? division;
  String? findingDescription;
  int? sopCategory;
  String? temporaryRecommendation;
  String? permanentRecommendation;
  String? recommendationOrSuggest;
  int? research;

  ModelInputLhaAuditRegion(
      {this.division,
      this.findingDescription,
      this.sopCategory,
      this.temporaryRecommendation,
      this.permanentRecommendation,
      this.recommendationOrSuggest,
      this.research});

  ModelInputLhaAuditRegion.fromJson(Map<String, dynamic> json) {
    division = json['division'];
    findingDescription = json['finding_description'];
    sopCategory = json['sop_category'];
    temporaryRecommendation = json['temporary_recommendation'];
    permanentRecommendation = json['permanent_recommendation'];
    recommendationOrSuggest = json['recommendation_or_suggest'];
    research = json['research'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['division'] = this.division;
    data['finding_description'] = this.findingDescription;
    data['sop_category'] = this.sopCategory;
    data['temporary_recommendation'] = this.temporaryRecommendation;
    data['permanent_recommendation'] = this.permanentRecommendation;
    data['recommendation_or_suggest'] = this.recommendationOrSuggest;
    data['research'] = this.research;
    return data;
  }
}

