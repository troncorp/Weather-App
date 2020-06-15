import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const String apiKey = "128e72d819055d0b0d188722791e3b01";
const String openWeatherUrl = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future<dynamic> getCityWeatherData(String cityName) async {
    Location loc = Location();
    await loc.getCurrentLocation();
//    String url =
//        "https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02";
    String url = "$openWeatherUrl?q=$cityName&appid=$apiKey&units=metric";
    NetworkHelper helper = NetworkHelper(url);
    var decodedData = await helper.getData();
    return decodedData;
  }

  Future<dynamic> getWeatherData() async {
    Location loc = Location();
    await loc.getCurrentLocation();
//    String url =
//        "https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=439d4b804bc8187953eb36d2a8c26a02";
    String url =
        "$openWeatherUrl?lat=${loc.latitude.toString()}&lon=${loc.longitude.toString()}&appid=$apiKey&units=metric";
    NetworkHelper helper = NetworkHelper(url);
    var decodedData = await helper.getData();
    return decodedData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
