// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:http/http.dart' as http;

// {
//   status: true,
//   code: 200,
//   data: []
// }

abstract class ApiService {
  static final String _baseUrl = "https://jsonplaceholder.typicode.com";

  static Map<String, String> myHeader = {'Accept': '*/*'};

  static Future<List<dynamic>> get(
    String endpoint, {
    Map<String, String>? parameters,
    Map<String, String>? headers,
  }) async {
    http.Response response;

    headers ??= {};
    headers.addAll(myHeader);

    final Uri uri = Uri.parse(
      "$_baseUrl/$endpoint",
    ).replace(queryParameters: parameters);

    response = await http.get(uri, headers: headers);

    // log(response.body);

    return jsonDecode(response.body);
  }

  static Future<Map<String, dynamic>> post(
    String endpoint, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    http.Response response;

    headers ??= {};
    headers.addAll(myHeader);

    final Uri uri = Uri.parse("$_baseUrl/$endpoint");

    response = await http
        .post(uri, headers: headers, body: jsonEncode(body))
        .timeout(Duration(seconds: 5));

    return jsonDecode(response.body);
  }

  static Future<List<dynamic>> put(
    String endpoint, {
    Map<String, String>? body,
    Map<String, String>? headers,
  }) async {
    http.Response response;

    headers ??= {};
    headers.addAll(myHeader);

    final Uri uri = Uri.parse("$_baseUrl/$endpoint");

    response = await http
        .put(uri, headers: headers, body: jsonEncode(body))
        .timeout(Duration(seconds: 5));

    return jsonDecode(response.body);
  }

  static Future<List<dynamic>> patch(
    String endpoint, {
    Map<String, String>? body,
    Map<String, String>? headers,
  }) async {
    http.Response response;

    headers ??= {};
    headers.addAll(myHeader);

    final Uri uri = Uri.parse("$_baseUrl/$endpoint");

    response = await http
        .patch(uri, headers: headers, body: jsonEncode(body))
        .timeout(Duration(seconds: 5));

    return jsonDecode(response.body);
  }

  static Future<List<dynamic>> delete(
    String endpoint, {
    Map<String, String>? body,
    Map<String, String>? headers,
  }) async {
    http.Response response;

    headers ??= {};
    headers.addAll(myHeader);

    final Uri uri = Uri.parse("$_baseUrl/$endpoint");

    response = await http
        .delete(uri, headers: headers, body: jsonEncode(body))
        .timeout(Duration(seconds: 5));

    return jsonDecode(response.body);
  }
}
