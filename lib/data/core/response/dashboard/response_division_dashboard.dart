class ResponseDivisionDashboard {
	Meta? meta;
	String? message;
	int? status;
	Data? data;

	ResponseDivisionDashboard({this.meta, this.message, this.status, this.data});

	ResponseDivisionDashboard.fromJson(Map<String, dynamic> json) {
		meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
		message = json['message'];
		status = json['status'];
		data = json['data'] != null ? Data.fromJson(json['data']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		if (meta != null) {
      data['meta'] = meta!.toJson();
    }
		data['message'] = message;
		data['status'] = status;
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
		final Map<String, dynamic> data = <String, dynamic>{};
		data['timestamp'] = timestamp;
		data['api_version'] = apiVersion;
		return data;
	}
}

class Data {
	int? year;
	String? month;
	List<ChartDivision>? chart;

	Data({this.year, this.month, this.chart});

	Data.fromJson(Map<String, dynamic> json) {
		year = json['year'];
		month = json['month'];
		if (json['chart'] != null) {
			chart = <ChartDivision>[];
			json['chart'].forEach((v) { chart!.add(ChartDivision.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['year'] = year;
		data['month'] = month;
		if (chart != null) {
      data['chart'] = chart!.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class ChartDivision {
	int? total;
	String? cases;

	ChartDivision({this.total, this.cases});

	ChartDivision.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		cases = json['case'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['total'] = total;
		data['case'] = cases;
		return data;
	}
}
