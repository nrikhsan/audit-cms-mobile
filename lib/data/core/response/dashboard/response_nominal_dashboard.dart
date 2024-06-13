class ResponseNominalDashboard {
  Meta? meta;
  String? message;
  int? status;
  DataNominalDashBoard? data;

  ResponseNominalDashboard({this.meta, this.message, this.status, this.data});

  ResponseNominalDashboard.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new DataNominalDashBoard.fromJson(json['data']) : null;
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

class DataNominalDashBoard {
  int? year;
  int? totalNominalLoss;
  List<ChartNominal>? chart;

  DataNominalDashBoard({this.year, this.totalNominalLoss, this.chart});

  DataNominalDashBoard.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    totalNominalLoss = json['total_nominal_loss'];
    if (json['chart'] != null) {
      chart = <ChartNominal>[];
      json['chart'].forEach((v) {
        chart!.add(new ChartNominal.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['total_nominal_loss'] = this.totalNominalLoss;
    if (this.chart != null) {
      data['chart'] = this.chart!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChartNominal {
  int? month;
  int? total;

  ChartNominal({this.month, this.total});

  ChartNominal.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['month'] = this.month;
    data['total'] = this.total;
    return data;
  }
}
