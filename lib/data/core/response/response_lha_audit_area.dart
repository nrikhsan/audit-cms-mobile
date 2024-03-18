
class ResponseLhaAuditArea {
  List<ModelListLhaAuditArea>? lha;

  ResponseLhaAuditArea({this.lha});

  ResponseLhaAuditArea.fromJson(Map<String, dynamic> json) {
    if (json['lha'] != null) {
      lha = <ModelListLhaAuditArea>[];
      json['lha'].forEach((v) {
        lha!.add(ModelListLhaAuditArea.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (lha != null) {
      data['lha'] = lha!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ModelListLhaAuditArea {
  int? id;
  String? inputDate;
  String? auditor;
  String? branch;
  String? area;
  String? lhaCase;
  String? sopCategory;
  String? lhaDescription;
  String? temporaryRecommendation;
  String? permanentRecommendation;
  String? recommendationOrSuggest;
  bool? research;

  ModelListLhaAuditArea(
      {this.id,
      this.inputDate,
      this.auditor,
      this.branch,
      this.area,
      this.lhaCase,
      this.sopCategory,
      this.lhaDescription,
      this.temporaryRecommendation,
      this.permanentRecommendation,
      this.recommendationOrSuggest,
      this.research});

  ModelListLhaAuditArea.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    inputDate = json['input_date'];
    auditor = json['auditor'];
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
    data['input_date'] = this.inputDate;
    data['auditor'] = this.auditor;
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
