class WeatherModel {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateIcon;
  String weatherStateName;
  String cityName;
  int humidity;
  double wind;
  String sunrise;
  String sunset;


  WeatherModel({required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateIcon,
    required this.weatherStateName,
    required this.cityName,
    required this.humidity,
    required this.sunrise,
    required this.sunset,
    required this.wind});

  factory WeatherModel.fromJson(dynamic data){
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
        date: data['location']['localtime'],
        temp: jsonData['avgtemp_c'],
        maxTemp: jsonData['maxtemp_c'],
        minTemp: jsonData['mintemp_c'],
        weatherStateIcon: jsonData['condition']['icon'],
        weatherStateName: jsonData['condition']['text'],
        cityName: data['location']['name'],
        humidity: data['current']['humidity'],
        sunrise: data['forecast']['forecastday'][0]['astro']['sunrise'],
        sunset: data['forecast']['forecastday'][0]['astro']['sunset'],
        wind: data['current']['wind_kph'],);
  }

  @override
  String toString() {
    return 'tem= $temp , maxTemp= $maxTemp , minTemp= $minTemp , date= $date, h=$humidity, w=$wind, sr=$sunrise, ss=$sunset';
  }
}
