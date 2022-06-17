import 'package:covid_api/model/all_cases/all_case_model.dart';
import 'package:dio/dio.dart';

AllCases? allCases;

Future<AllCases> fetchAllCaseData() async {
  final Dio dio = Dio();
  final response = await dio.get("https://disease.sh/v3/covid-19/all");
  if (response.statusCode == 200) {
    AllCases value;
    value = AllCases.fromJson(response.data);
    allCases = value;
    return value;
  } else {
    throw Exception("Unable to fetch data");
  }
}
