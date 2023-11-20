import 'dart:async';
import 'package:http/http.dart' as http;

class DataRequest {
  static final Map<String, String> _headers = {
    'Content': 'application/json',
  };

  static const String URL = 'TBD';

  static Future<http.Response> get(var path) async {
    // await DataRequest._buildPlatformIdHeader();
    final url = DataRequest.URL + path;

    http.Response response = await http.get(Uri.parse(url), headers: DataRequest._headers);

    return response;
  }
}
