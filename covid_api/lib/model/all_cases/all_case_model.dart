class AllCases {
  final num? updated;
  final num? deaths;
  final num? recovered;
  final num? active;
  const AllCases(
      {required this.updated,
      required this.deaths,
      required this.recovered,
      required this.active});

  factory AllCases.fromJson(Map<String, dynamic> json) {
    return AllCases(
        updated: json['updated'],
        deaths: json['deaths'],
        recovered: json['recovered'],
        active: json['active']);
  }
}
