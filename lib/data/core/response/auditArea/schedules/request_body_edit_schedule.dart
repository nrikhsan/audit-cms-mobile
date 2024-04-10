class RequestBodyEditSchedule {
  int? userId;
  int? branchId;
  String? startDate;
  String? endDate;
  String? description;

  RequestBodyEditSchedule(
      {this.userId,
      this.branchId,
      this.startDate,
      this.endDate,
      this.description});

  RequestBodyEditSchedule.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    branchId = json['branch_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = userId;
    data['branch_id'] = branchId;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['description'] = description;
    return data;
  }
}
