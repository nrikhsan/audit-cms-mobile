class RequestBodyFollowUp {
  int? followupId;
  int? penaltyId;
  String? description;
  int? isPenalty;

  RequestBodyFollowUp(
      {this.followupId, this.penaltyId, this.description, this.isPenalty});

  RequestBodyFollowUp.fromJson(Map<String, dynamic> json) {
    followupId = json['followup_id'];
    penaltyId = json['penalty_id'];
    description = json['description'];
    isPenalty = json['is_penalty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['followup_id'] = followupId;
    data['penalty_id'] = penaltyId;
    data['description'] = description;
    data['is_penalty'] = isPenalty;
    return data;
  }
}
