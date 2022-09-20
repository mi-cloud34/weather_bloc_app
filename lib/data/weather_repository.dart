import 'package:weather_bloc_app/data/weather_api_client.dart';
import 'package:weather_bloc_app/locator.dart';
import 'package:weather_bloc_app/model/weather.dart';

class WeatherRepository {
  WeatherApiClient _weatherApiClient = locator();
  Future<Weather> getWeatherCity(String city) async {
    final int cityID = await _weatherApiClient.getLocationID(city);
    return _weatherApiClient.getWeather(cityID);
  }
}
