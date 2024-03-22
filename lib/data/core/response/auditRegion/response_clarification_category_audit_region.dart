class ResponseClarificationCategoryAuditRegion {
  List<ModelListClarificationCategoryAuditRegion>? clarificationCategory;

  ResponseClarificationCategoryAuditRegion({this.clarificationCategory});

  ResponseClarificationCategoryAuditRegion.fromJson(Map<String, dynamic> json) {
    if (json['clarification_category'] != null) {
      clarificationCategory = <ModelListClarificationCategoryAuditRegion>[];
      json['clarification_category'].forEach((v) {
        clarificationCategory!.add(new ModelListClarificationCategoryAuditRegion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.clarificationCategory != null) {
      data['clarification_category'] =
          this.clarificationCategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ModelListClarificationCategoryAuditRegion {
  int? id;
  String? categoryName;

  ModelListClarificationCategoryAuditRegion({this.id, this.categoryName});

  ModelListClarificationCategoryAuditRegion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    return data;
  }
}
