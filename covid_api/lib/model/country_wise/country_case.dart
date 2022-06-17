class Country {
  final String? country;
  final TimeLine? timeline;
  const Country({required this.country, required this.timeline});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
        country: json["country"],
        timeline: TimeLine.fromJson(json["timeline"]));
  }
}

class TimeLine {
  final num? date;
  const TimeLine({required this.date});

  factory TimeLine.fromJson(Map<String, dynamic> json) {
    return TimeLine(date: json['6/17/22']);
  }
}
