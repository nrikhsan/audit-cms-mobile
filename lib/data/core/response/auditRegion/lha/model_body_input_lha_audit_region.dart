class ModelBodyInputLhaAuditRegion {
  int? division;
  String? findingDescription;
  int? sopCategory;
  String? temporaryRecommendation;
  String? permanentRecommendation;
  String? recommendationOrSuggest;
  int? research;

  ModelBodyInputLhaAuditRegion(
      {this.division,
      this.findingDescription,
      this.sopCategory,
      this.temporaryRecommendation,
      this.permanentRecommendation,
      this.recommendationOrSuggest,
      this.research});

  ModelBodyInputLhaAuditRegion.fromJson(Map<String, dynamic> json) {
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

