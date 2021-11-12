import 'package:http/http.dart' as http;

class WeatherData {
  final String baseURI = "api.openweathermap.org";
  final String path = "/data/2.5/weather";
  final String apiKey = "2c2f7d29672d1b2bc730b503f24e416d";

  //using async await function to get the data from the API asynchronously
  Future<String> getWeather(String location) async {
    Map<String, dynamic> paramters = {
      'q': location,
      'appId': apiKey
    }; // query parameters
    Uri uri = Uri.https(baseURI, path, paramters);
    http.Response result = await http.get(uri);
    return result.body;
  }
}
