import 'package:covid_api/api_service/country_case_api.dart';
import 'package:covid_api/provider/country_case_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountryDetailPage extends StatefulWidget {
  const CountryDetailPage({Key? key}) : super(key: key);

  @override
  State<CountryDetailPage> createState() => _CountryDetailPageState();
}

class _CountryDetailPageState extends State<CountryDetailPage> {
  @override
  void initState() {
    Future.microtask(() {
      Provider.of<CountryCaseProvider>(context, listen: false).getCountryData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Countries"),
        ),
        body: Consumer<CountryCaseProvider>(builder: (context, value, child) {
          return SingleChildScrollView(
            child: DataTable(
                columns: const [
                  DataColumn(
                      label: Text(
                    "Country",
                  )),
                  DataColumn(
                      label: Text(
                    "Cases",
                  )),
                ],
                rows: List.generate(
                    countryCase.length,
                    (index) => DataRow(cells: [
                          DataCell(Text(countryCase[index].country!)),
                          DataCell(Text(
                              countryCase[index].timeline!.date.toString()))
                        ]))),
          );
        }));
  }
}
