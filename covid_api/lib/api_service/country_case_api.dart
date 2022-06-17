import 'package:dio/dio.dart';

import '../model/country_wise/country_case.dart';

List<Country> countryCase = [];

Future<List<Country>> fetchCountryData() async {
  final Dio dio = Dio();
  final response = await dio.get(
      "https://disease.sh/v3/covid-19/vaccine/coverage/countries?lastdays=1");

  if (response.statusCode == 200) {
    List<dynamic> values = [];
    values = response.data;
    if (values.isNotEmpty) {
      for (int i = 0; i < values.length; i++) {
        if (values[i] != null) {
          countryCase.add(Country.fromJson(values[i]));
        }
      }
    }
    return countryCase;
  } else {
    throw Exception("Unable to fetch data");
  }
}
