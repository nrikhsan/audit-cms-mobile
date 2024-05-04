class RequestBodyFollowUp {
  int? followupId;
  List<int>? penaltyId;
  String? chargingCosts;
  String? description;

  RequestBodyFollowUp(
      {this.followupId, this.penaltyId, this.chargingCosts, this.description});

  RequestBodyFollowUp.fromJson(Map<String, dynamic> json) {
    followupId = json['followup_id'];
    penaltyId = json['penalty_id'].cast<int>();
    chargingCosts = json['charging_costs'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['followup_id'] = this.followupId;
    data['penalty_id'] = this.penaltyId;
    data['charging_costs'] = this.chargingCosts;
    data['description'] = this.description;
    return data;
  }
}
