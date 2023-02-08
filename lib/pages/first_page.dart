import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather2_app/components/def_button.dart';
import 'package:weather2_app/models/weather_model.dart';
import 'package:weather2_app/pages/home_page.dart';
import 'package:weather2_app/pages/search_page.dart';
import 'package:weather2_app/providers/weather_provider.dart';
import 'package:weather2_app/services/weather_service.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Lottie.asset(
          'assets/json/weather.json',
          height: double.infinity,
          width: double.infinity,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'Welcome To Sky Weather App',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: 'janna',
                decoration: TextDecoration.none,
              ),
            ),
            Text(
              'Here you can get the weather details from all                           of the world',
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 15,
                height: 1.3,
                fontFamily: 'janna',
                decoration: TextDecoration.none,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30.0,
            ),
            DefButton(
                onTap: () async
                {
                  WeatherService service = WeatherService();
                  LatLong latLong = await service.getLatLong();
                  WeatherModel? weather =
                      await service.getWeatherByLocation(lat: latLong.lat!, long: latLong.long!);
                  Provider.of<WeatherProvider>(context, listen: false)
                      .weatherData = weather;
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ), (route) => false);
                },
                text: 'Use your Current Location',
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'OR',
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontFamily: 'janna',
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            DefButton(
                onTap: ()
                {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) => SearchPage(),
                  ), (route) => false);
                },
                text: 'Use Different Location',
            ),
            const SizedBox(
              height: 80.0,
            ),
          ],
        ),
      ],
    );
  }
}
