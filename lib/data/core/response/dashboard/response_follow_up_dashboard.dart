class ResponseFollowUpDashBoard {
  Meta? meta;
  String? message;
  int? status;
  DataDahboardFollowUp? data;

  ResponseFollowUpDashBoard({this.meta, this.message, this.status, this.data});

  ResponseFollowUpDashBoard.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new DataDahboardFollowUp.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Meta {
  String? timestamp;
  String? apiVersion;

  Meta({this.timestamp, this.apiVersion});

  Meta.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'];
    apiVersion = json['api_version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['timestamp'] = this.timestamp;
    data['api_version'] = this.apiVersion;
    return data;
  }
}

class DataDahboardFollowUp {
  int? year;
  String? month;
  List<ChartFollowUp>? chart;

  DataDahboardFollowUp({this.year, this.month, this.chart});

  DataDahboardFollowUp.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    month = json['month'];
    if (json['chart'] != null) {
      chart = <ChartFollowUp>[];
      json['chart'].forEach((v) {
        chart!.add(new ChartFollowUp.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['month'] = this.month;
    if (this.chart != null) {
      data['chart'] = this.chart!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChartFollowUp {
  String? status;
  int? total;

  ChartFollowUp({this.status, this.total});

  ChartFollowUp.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['total'] = this.total;
    return data;
  }
}
