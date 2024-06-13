class ResponseFindingsDashboard {
  Meta? meta;
  String? message;
  int? status;
  DataFindingsDashboard? data;

  ResponseFindingsDashboard({this.meta, this.message, this.status, this.data});

  ResponseFindingsDashboard.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? new DataFindingsDashboard.fromJson(json['data']) : null;
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

class DataFindingsDashboard {
  int? year;
  List<ChartFindings>? chart;

  DataFindingsDashboard({this.year, this.chart});

  DataFindingsDashboard.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    if (json['chart'] != null) {
      chart = <ChartFindings>[];
      json['chart'].forEach((v) {
        chart!.add(new ChartFindings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    if (this.chart != null) {
      data['chart'] = this.chart!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ChartFindings {
  int? month;
  int? total;

  ChartFindings({this.month, this.total});

  ChartFindings.fromJson(Map<String, dynamic> json) {
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
