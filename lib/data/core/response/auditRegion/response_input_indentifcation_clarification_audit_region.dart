class ResponseInputIdentificationClarificationAuditRegion {
  int? status;
  String? message;

  ResponseInputIdentificationClarificationAuditRegion(
      {this.status, this.message});

  ResponseInputIdentificationClarificationAuditRegion.fromJson(
      Map<String, dynamic> json) {
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

class ModelInputIdentificationClarificationAuditRegion {
  int? evaluationClarification;
  int? loss;
  String? descriptionOrRecommendation;
  int? followUp;

  ModelInputIdentificationClarificationAuditRegion(
      {this.evaluationClarification,
      this.loss,
      this.descriptionOrRecommendation,
      this.followUp});

  ModelInputIdentificationClarificationAuditRegion.fromJson(
      Map<String, dynamic> json) {
    evaluationClarification = json['evaluation_clarification'];
    loss = json['loss'];
    descriptionOrRecommendation = json['description_or_recommendation'];
    followUp = json['follow_up'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['evaluation_clarification'] = this.evaluationClarification;
    data['loss'] = this.loss;
    data['description_or_recommendation'] = this.descriptionOrRecommendation;
    data['follow_up'] = this.followUp;
    return data;
  }
}
