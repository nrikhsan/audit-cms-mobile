class ResponseDashboardSop {
	Meta? meta;
	String? message;
	int? status;
	Data? data;

	ResponseDashboardSop({this.meta, this.message, this.status, this.data});

	ResponseDashboardSop.fromJson(Map<String, dynamic> json) {
		meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
		message = json['message'];
		status = json['status'];
		data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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

class Data {
	int? year;
	String? month;
	List<ChartSop>? chart;

	Data({this.year, this.month, this.chart});

	Data.fromJson(Map<String, dynamic> json) {
		year = json['year'];
		month = json['month'];
		if (json['chart'] != null) {
			chart = <ChartSop>[];
			json['chart'].forEach((v) { chart!.add(new ChartSop.fromJson(v)); });
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

class ChartSop {
	int? total;
	String? caseCategory;
	int? totalNominalLoss;
	String? cases;

	ChartSop({this.total, this.caseCategory, this.totalNominalLoss, this.cases});

	ChartSop.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		caseCategory = json['case_category'];
		totalNominalLoss = json['total_nominal_loss'];
		cases = json['case'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['total'] = this.total;
		data['case_category'] = this.caseCategory;
		data['total_nominal_loss'] = this.totalNominalLoss;
		data['case'] = this.cases;
		return data;
	}
}
