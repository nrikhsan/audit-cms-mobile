class ResponseDetailLhaAuditArea {
  int? id;
  String? auditor;
  String? inputDate;
  String? branch;
  String? area;
  String? lhaCase;
  String? sopCategory;
  String? lhaDescription;
  String? temporaryRecommendation;
  String? permanentRecommendation;
  String? recommendationOrSuggest;
  bool? research;

  ResponseDetailLhaAuditArea(
      {this.id,
      this.auditor,
      this.inputDate,
      this.branch,
      this.area,
      this.lhaCase,
      this.sopCategory,
      this.lhaDescription,
      this.temporaryRecommendation,
      this.permanentRecommendation,
      this.recommendationOrSuggest,
      this.research});

  ResponseDetailLhaAuditArea.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    auditor = json['auditor'];
    inputDate = json['input_date'];
    branch = json['branch'];
    area = json['area'];
    lhaCase = json['lha_case'];
    sopCategory = json['sop_category'];
    lhaDescription = json['lha_description'];
    temporaryRecommendation = json['temporary_recommendation'];
    permanentRecommendation = json['permanent_recommendation'];
    recommendationOrSuggest = json['recommendation_or_suggest'];
    research = json['research'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['auditor'] = this.auditor;
    data['input_date'] = this.inputDate;
    data['branch'] = this.branch;
    data['area'] = this.area;
    data['lha_case'] = this.lhaCase;
    data['sop_category'] = this.sopCategory;
    data['lha_description'] = this.lhaDescription;
    data['temporary_recommendation'] = this.temporaryRecommendation;
    data['permanent_recommendation'] = this.permanentRecommendation;
    data['recommendation_or_suggest'] = this.recommendationOrSuggest;
    data['research'] = this.research;
    return data;
  }
}
