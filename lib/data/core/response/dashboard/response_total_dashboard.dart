
class ResponseTotalDashboard {
  Meta? meta;
  String? message;
  int? status;
  Data? data;

  ResponseTotalDashboard({this.meta, this.message, this.status, this.data});

  ResponseTotalDashboard.fromJson(Map<String, dynamic> json) {
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
  Summary? summary;
  Rankings? rankings;

  Data({this.year, this.month, this.summary, this.rankings});

  Data.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    month = json['month'];
    summary =
        json['summary'] != null ? Summary.fromJson(json['summary']) : null;
    rankings = json['rankings'] != null
        ? Rankings.fromJson(json['rankings'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['year'] = year;
    data['month'] = month;
    if (summary != null) {
      data['summary'] = summary!.toJson();
    }
    if (rankings != null) {
      data['rankings'] = rankings!.toJson();
    }
    return data;
  }
}

class Summary {
  Schedule? schedule;
  Special? clarification;
  Special? followUp;

  Summary({this.schedule, this.clarification, this.followUp});

  Summary.fromJson(Map<String, dynamic> json) {
    schedule = json['schedule'] != null
        ? Schedule.fromJson(json['schedule'])
        : null;
    clarification = json['clarification'] != null
        ? Special.fromJson(json['clarification'])
        : null;
    followUp = json['follow_up'] != null
        ? Special.fromJson(json['follow_up'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (schedule != null) {
      data['schedule'] = schedule!.toJson();
    }
    if (clarification != null) {
      data['clarification'] = clarification!.toJson();
    }
    if (followUp != null) {
      data['follow_up'] = followUp!.toJson();
    }
    return data;
  }
}

class Schedule {
  Special? special;
  Special? regular;

  Schedule({this.special, this.regular});

  Schedule.fromJson(Map<String, dynamic> json) {
    special =
        json['special'] != null ? Special.fromJson(json['special']) : null;
    regular =
        json['regular'] != null ? Special.fromJson(json['regular']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (special != null) {
      data['special'] = special!.toJson();
    }
    if (regular != null) {
      data['regular'] = regular!.toJson();
    }
    return data;
  }
}

class Special {
  int? total;
  int? done;

  Special({this.total, this.done});

  Special.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    done = json['done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['done'] = done;
    return data;
  }
}

class Rankings {
  Clarification? clarification;
  List<FollowUp>? followUp;

  Rankings({this.clarification, this.followUp});

  Rankings.fromJson(Map<String, dynamic> json) {
    clarification = json['clarification'] != null
        ? Clarification.fromJson(json['clarification'])
        : null;
    if (json['follow_up'] != null) {
      followUp = <FollowUp>[];
      json['follow_up'].forEach((v) {
        followUp!.add(FollowUp.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (clarification != null) {
      data['clarification'] = clarification!.toJson();
    }
    if (followUp != null) {
      data['follow_up'] = followUp!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Clarification {
  List<Top>? top;
  List<Bottom>? bottom;

  Clarification({this.top, this.bottom});

  Clarification.fromJson(Map<String, dynamic> json) {
    if (json['top'] != null) {
      top = <Top>[];
      json['top'].forEach((v) {
        top!.add(Top.fromJson(v));
      });
    }
    if (json['bottom'] != null) {
      bottom = <Bottom>[];
      json['bottom'].forEach((v) {
        bottom!.add(Bottom.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (top != null) {
      data['top'] = top!.map((v) => v.toJson()).toList();
    }
    if (bottom != null) {
      data['bottom'] = bottom!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Top {
  int? total;
  String? name;
  int? done;

  Top({this.total, this.name, this.done});

  Top.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    name = json['name'];
    done = json['done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['name'] = name;
    data['done'] = done;
    return data;
  }
}

class Bottom {
  int? total;
  String? name;
  int? done;

  Bottom({this.total, this.name, this.done});

  Bottom.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    name = json['name'];
    done = json['done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['name'] = name;
    data['done'] = done;
    return data;
  }
}

class FollowUp {
  int? total;
  String? name;
  int? close;

  FollowUp({this.total, this.name, this.close});

  FollowUp.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    name = json['name'];
    close = json['close'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['name'] = name;
    data['close'] = close;
    return data;
  }
}
