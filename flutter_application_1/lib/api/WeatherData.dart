import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherData {
  late String name;
  late String description;
  late double temperature;
  late int humidity;
  late int pressure;

  WeatherData() {
    this.name = '';
    this.description = '';
    this.temperature = 0;
    this.humidity = 0;
    this.pressure = 0;
  }
  WeatherData.fromJSON(Map<String, dynamic> responseData) {
    this.name = responseData['name'] ?? '';
    this.temperature = (responseData['main']['temp'] - 273.15 ?? 0);
    this.humidity = (responseData['main']['humidity'] ?? 0);
    this.pressure = (responseData['main']['pressure'] ?? 0);
    this.description = responseData['weather'][0]['description'] ?? '';
  }
  final String baseURI = "api.openweathermap.org";
  final String path = "/data/2.5/weather";
  final String apiKey = "2c2f7d29672d1b2bc730b503f24e416d";

  //using async await function to get the data from the API asynchronously
  Future<WeatherData> getWeather(String location) async {
    Map<String, dynamic> paramters = {
      'q': location,
      'appId': apiKey
    }; // query parameters
    Uri uri = Uri.https(baseURI, path, paramters);
    http.Response result = await http.get(uri);
    WeatherData data = WeatherData.fromJSON(jsonDecode(result.body));
    return data;
  }
}
