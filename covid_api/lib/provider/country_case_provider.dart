import 'package:covid_api/api_service/country_case_api.dart';
import 'package:covid_api/model/country_wise/country_case.dart';
import 'package:flutter/cupertino.dart';

class CountryCaseProvider extends ChangeNotifier {
  List<Country>? _country;
  List<Country>? get countryMod {
    return _country;
  }

  set country(List<Country>? countryModel) {
    _country = countryModel;
  }

  getCountryData() async {
    _country = await fetchCountryData();
  }
}
