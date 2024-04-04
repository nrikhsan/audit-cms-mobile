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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['followup_id'] = this.followupId;
    data['penalty_id'] = this.penaltyId;
    data['description'] = this.description;
    data['is_penalty'] = this.isPenalty;
    return data;
  }
}
