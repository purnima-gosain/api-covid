import 'package:covid_api/provider/all_case_provider.dart';
import 'package:covid_api/provider/country_case_provider.dart';
import 'package:covid_api/view/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AllCaseProvider()),
        ChangeNotifierProvider(create: (_) => CountryCaseProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.

          primarySwatch: Colors.lime,
        ),
        home: const HomePage(),
      ),
    );
  }
}
