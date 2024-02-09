import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {
  static final HttpService _instance = HttpService.internal();
  HttpService.internal();
  factory HttpService() => _instance;

  Map<String, String> headers = {};
  final JsonDecoder _decoder = const JsonDecoder();
  static const _baseUrl = "https://randomuser.me/";

  Future<dynamic> get(String desturl,
      {Map<String, String> headers = const {'': ''}}) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    return http
        .get(Uri.parse(_baseUrl + desturl), headers: requestHeaders)
        .then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400) {
        throw Exception("Error while fetching data");
      }
      return _decoder.convert(response.body);
    }, onError: (error) {
      throw Exception(error.toString());
    });
  }
}
