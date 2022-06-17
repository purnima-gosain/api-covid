import 'package:covid_api/api_service/all_case_api.dart';
import 'package:covid_api/model/all_cases/all_case_model.dart';
import 'package:flutter/cupertino.dart';

class AllCaseProvider extends ChangeNotifier {
  AllCases? _allCases;

  AllCases? get allCaseMod {
    return _allCases;
  }

  set allCase(AllCases? allCasesModel) {
    _allCases = allCasesModel;
  }

  getAllCaseData() async {
    _allCases = await fetchAllCaseData();
    notifyListeners();
  }
}
