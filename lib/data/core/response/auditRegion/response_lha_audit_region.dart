class ResponseLhaAuditRegion {
  List<ModelListLhaAuditRegion>? lha;

  ResponseLhaAuditRegion({this.lha});

  ResponseLhaAuditRegion.fromJson(Map<String, dynamic> json) {
    if (json['lha'] != null) {
      lha = <ModelListLhaAuditRegion>[];
      json['lha'].forEach((v) {
        lha!.add(new ModelListLhaAuditRegion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lha != null) {
      data['lha'] = this.lha!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ModelListLhaAuditRegion {
  int? id;
  String? inputDate;
  String? division;
  String? sopCategory;
  String? findingDescription;
  String? temporaryRecommendation;
  String? permanentRecommendation;
  String? recommendationOrSuggest;
  int? research;

  ModelListLhaAuditRegion(
      {this.id,
      this.inputDate,
      this.division,
      this.sopCategory,
      this.findingDescription,
      this.temporaryRecommendation,
      this.permanentRecommendation,
      this.recommendationOrSuggest,
      this.research});

  ModelListLhaAuditRegion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    inputDate = json['input_date'];
    division = json['division'];
    sopCategory = json['sop_category'];
    findingDescription = json['finding_description'];
    temporaryRecommendation = json['temporary_recommendation'];
    permanentRecommendation = json['permanent_recommendation'];
    recommendationOrSuggest = json['recommendation_or_suggest'];
    research = json['research'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['input_date'] = this.inputDate;
    data['division'] = this.division;
    data['sop_category'] = this.sopCategory;
    data['finding_description'] = this.findingDescription;
    data['temporary_recommendation'] = this.temporaryRecommendation;
    data['permanent_recommendation'] = this.permanentRecommendation;
    data['recommendation_or_suggest'] = this.recommendationOrSuggest;
    data['research'] = this.research;
    return data;
  }
}
