import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:learn_pagination/core/param/apis.dart';

abstract class Network {
  Future<String?> methodGet({required String api, Object? id, Map<String, String> headers = Api.headers, String baseUrl = Api.baseUrl,  Map<String, String>? query});
  Future<void> methodDelete({required String api, required Object id, Map<String, String> headers = Api.headers, String baseUrl = Api.baseUrl});
  Future<void> methodPost({required String api, Map<String, String> headers = Api.headers, String baseUrl = Api.baseUrl, required Map<String, Object?> data});
  Future<void> methodPut({required String api, required Object id, Map<String, String> headers = Api.headers, String baseUrl = Api.baseUrl, required Map<String, Object?> data});
}

class HttpNetwork implements Network {
  const HttpNetwork();

  @override
  Future<String?> methodGet({required String api, Object? id, Map<String, String> headers = Api.headers, String baseUrl = Api.baseUrl,  Map<String, String>? query}) async {
    try {
      Uri url = Uri.https(baseUrl, "$api${id != null ? "/$id" : ""}", query);
      final response = await http.get(url, headers: headers);
      if(response.statusCode == 200) {
        return utf8.decoder.convert(response.bodyBytes);
      }
    } catch(e) {
      return null;
    }
    return null;
  }

  @override
  Future<void> methodDelete({required String api, required Object id, Map<String, String> headers = Api.headers, String baseUrl = Api.baseUrl}) async {
    try {
      Uri url = Uri.https(baseUrl, "$api/$id");
      final response = await http.delete(url);
      if(response.statusCode == 200) {
        debugPrint(response.body);
      }
    } catch(e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> methodPost({required String api, Map<String, String> headers = Api.headers, String baseUrl = Api.baseUrl, required Map<String, Object?> data}) async {
    try {
      Uri url = Uri.https(baseUrl, api);
      final response = await http.post(url, body: jsonEncode(data));
      if(response.statusCode == 200 || response.statusCode == 201) {
        debugPrint(response.body);
      }
    } catch(e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> methodPut({required String api, required Object id, Map<String, String> headers = Api.headers, String baseUrl = Api.baseUrl, required Map<String, Object?> data}) async {
    try {
      Uri url = Uri.https(baseUrl, "$api/$id");
      final response = await http.put(url, body: jsonEncode(data));
      if(response.statusCode == 200 || response.statusCode == 201) {
        debugPrint(response.body);
      }
    } catch(e) {
      debugPrint(e.toString());
    }
  }
}