class RequestBodyFollowUp {
  int? followupId;
  int? penaltyId;
  String? description;

  RequestBodyFollowUp(
      {this.followupId, this.penaltyId, this.description});

  RequestBodyFollowUp.fromJson(Map<String, dynamic> json) {
    followupId = json['followup_id'];
    penaltyId = json['penalty_id'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['followup_id'] = followupId;
    data['penalty_id'] = penaltyId;
    data['description'] = description;
    return data;
  }
}
