import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather2_app/components/def_button.dart';
import 'package:weather2_app/models/weather_model.dart';
import 'package:weather2_app/pages/home_page.dart';
import 'package:weather2_app/providers/weather_provider.dart';
import 'package:weather2_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {


  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xFFFFFFFF),
        foregroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Lottie.asset(
            'assets/json/icon1.json',
            height: 300.0,
            width: 300.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TextField(
              onChanged: (data)
              {
                cityName = data;
              },
              onSubmitted: (data) async
              {
                cityName = data;

                WeatherService service = WeatherService();
                WeatherModel? weather = await service.getWeather(cityName: cityName!);

                Provider.of<WeatherProvider>(context, listen: false).weatherData = weather;
                Provider.of<WeatherProvider>(context, listen: false).cityName = cityName;
                navigateTo(context, HomePage());
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
                suffixIcon: GestureDetector(
                  onTap: () async
                  {
                    WeatherService service = WeatherService();
                    WeatherModel? weather = await service.getWeather(cityName: cityName!);

                    Provider.of<WeatherProvider>(context, listen: false).weatherData = weather;
                    Provider.of<WeatherProvider>(context, listen: false).cityName = cityName;
                    navigateTo(context, HomePage());
                  },
                  child: const Icon(
                    Icons.search,
                  ),
                ),
                label: const Text(
                    'search'
                ),
                hintText: 'Enter a city name',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
