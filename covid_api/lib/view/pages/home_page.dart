import 'package:covid_api/api_service/all_case_api.dart';
import 'package:covid_api/provider/all_case_provider.dart';
import 'package:covid_api/view/pages/country_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Future.microtask(() {
      Provider.of<AllCaseProvider>(context, listen: false).getAllCaseData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Covid case"),
      ),
      body: Consumer<AllCaseProvider>(
        builder: (context, child, value) {
          return Column(
            children: [
              PieChart(
                dataMap: {
                  "active": allCases?.active.toDouble() ?? 0,
                  "deaths": allCases?.deaths.toDouble() ?? 0,
                  "recovered": allCases?.recovered.toDouble() ?? 0
                },
                legendOptions: const LegendOptions(
                  legendPosition: LegendPosition.left,
                ),
                colorList: [
                  Colors.pink.shade100,
                  Colors.blue.shade100,
                  Colors.lime,
                ],
                chartValuesOptions: const ChartValuesOptions(
                    showChartValues: false, showChartValuesOutside: true),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CountryDetailPage()));
                  },
                  child: const Text("See countries"))
            ],
          );
        },
      ),
    );
  }
}
