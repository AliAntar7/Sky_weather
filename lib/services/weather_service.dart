import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather2_app/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'e5bba2bf138f48b5a3502835221812';

  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;
    try {
      Uri url = Uri.parse(
          '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);

      weather = WeatherModel.fromJson(data);
      print(weather);
    } catch (error) {
      print('the $error');
    }
    return weather;
  }

  //get weather by location
  Future<WeatherModel> getWeatherByLocation(
      {required double lat, required double long}) async {
    Uri url =
    Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$lat,$long&days=7');
    http.Response response = await http.get(url);

    if (response.statusCode == 400) {
      var data = jsonDecode(response.body);
      throw Exception(data['error']['message']);
    }
    Map<String, dynamic> data = jsonDecode(response.body);
    print('${data}lol');

    WeatherModel weather = WeatherModel.fromJson(data);

    return weather;
  }
  //get current location lat and long
  Future<LatLong> getLatLong() async {
    //permission to get location from user device if not granted before
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      throw Exception('Location service is disabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permission is denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permission is denied forever');
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    LatLong latLong = LatLong(lat: position.latitude, long: position.longitude);
    print("${latLong.lat}${latLong.long}");
    return latLong;
  }
}

class LatLong {
  double? lat;
  double? long;

  LatLong({this.lat, this.long});

//get lat and long from user location
}