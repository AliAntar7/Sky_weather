import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather2_app/pages/first_page.dart';
import 'package:weather2_app/pages/home_page.dart';
import 'package:weather2_app/pages/search_page.dart';
import 'package:weather2_app/providers/weather_provider.dart';

void main() {
  runApp( ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


