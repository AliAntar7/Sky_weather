import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather2_app/models/weather_model.dart';
import 'package:weather2_app/pages/myDrawer.dart';
import 'package:weather2_app/providers/weather_provider.dart';

class HomePage extends StatelessWidget {


  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(),
      drawer: MyDrawer(),
      body: Column(
        children: [
          Center(
            child: Image(
              image: NetworkImage('http:${weatherData!.weatherStateIcon}'),
              fit: BoxFit.cover,
              height: 200,
              width: 200,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '${weatherData!.temp.toInt()}',
                style: const TextStyle(
                  fontSize: 80.0,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'o',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              Provider.of<WeatherProvider>(context).weatherData!.cityName,
              maxLines: 1,
              style: const TextStyle(
                fontFamily: 'janna',
                fontSize: 50.0,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Spacer(flex: 1,),
              Column(
                children: [
                  const Image(
                    image: AssetImage('assets/images/humidity.png'),
                    height: 50,
                    width: 50,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${weatherData!.humidity} %',
                    style: const TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 4,),
              Column(
                children: [
                  const Image(
                    image: AssetImage('assets/images/wind.png'),
                    height: 50,
                    width: 50,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '${weatherData!.wind.toInt()}',
                        style: const TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      const Text(
                        'km/h',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(flex: 1,),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: [
              const Spacer(flex: 2,),
              Column(
                children: [
                  const Image(
                    image: AssetImage('assets/images/sunrise.png'),
                    height: 50,
                    width: 50,
                  ),
                  const Text(
                    'sunrise',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontFamily: 'janna',
                    ),
                  ),
                  Text(
                    weatherData!.sunrise.toString(),
                    style: const TextStyle(
                      fontSize: 22.0,
                      fontFamily: 'janna',
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 1,),
              Column(
                children: [
                  const Image(
                    image: AssetImage('assets/images/sunset.png'),
                    height: 50,
                    width: 50,
                  ),
                  const Text(
                    'sunset',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontFamily: 'janna',
                    ),
                  ),
                  Text(
                    weatherData!.sunset.toString(),
                    style: const TextStyle(
                      fontSize: 22.0,
                      fontFamily: 'janna',
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 2,),
            ],
          ),
        ],
      ),
    );
  }
}
