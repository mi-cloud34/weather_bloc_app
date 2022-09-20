import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_bloc_app/model/weather.dart';

class WeatherApiClient {
  static const baseUrl = "";
  final http.Client httpClient = http.Client();

  Future<int> getLocationID(String sehirAdi) async {
    final String sehirURL = baseUrl + "/api/location/search/?query=" + sehirAdi;
    final gelenCevap = await httpClient.get(Uri.parse(sehirURL));

    if (gelenCevap.statusCode != 200) {
      throw Exception("Veri Getirilemedi");
    }

    final gelenCevapJSON = (jsonDecode(gelenCevap.body)) as List;
    return gelenCevapJSON[0]["woeid"];
  }

  Future<Weather> getWeather(int sehirID) async {
    final String havaDurumuID = baseUrl + "/api/location/search/${sehirID}";
    final havaDurumuGelenCevap = await httpClient.get(Uri.parse(havaDurumuID));
    final havaDurumuJsonCevap = jsonDecode(havaDurumuGelenCevap.body);
    return Weather.fromJson(havaDurumuJsonCevap);
  }
}
