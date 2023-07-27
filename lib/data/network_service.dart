import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:learn_pagination/core/param/apis.dart';

abstract class Network {
  Future<String?> methodGet({required String api, Object? id, Map<String, String> headers = Api.headers, String baseUrl = Api.baseUrl,  Map<String, String>? query});
  Future<void> methodDelete({required String api, required Object id, Map<String, String> headers = Api.headers, String baseUrl = Api.baseUrl});
  Future<void> methodPost({required String api, Map<String, String> headers = Api.headers, String baseUrl = Api.baseUrl, required Map<String, Object?> data});
  Future<void> methodPut({required String api, required Object id, Map<String, String> headers = Api.headers, String baseUrl = Api.baseUrl, required Map<String, Object?> data});
  Future<String?> multipart({required String api, required String filePath, Map<String, String> headers = Api.headersMedia, String baseUrl = Api.baseUrl, Map<String, String>? body});
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

  @override
  Future<String?> multipart({required String api, required String filePath, Map<String, String> headers = Api.headersMedia, String baseUrl = Api.baseUrl, Map<String, String>? body}) async {
    final uri = Uri.https(baseUrl, api);
    final request = http.MultipartRequest('POST', uri);
    request.headers.addAll(headers);
    request.files.add(await http.MultipartFile.fromPath('file', filePath, contentType: MediaType("image", "jpeg")));
    if(body != null) request.fields.addAll(body);
    http.StreamedResponse response = await request.send();
    debugPrint("Response: ${response.statusCode}");
    debugPrint("Response: ${response.stream.toStringStream()}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      return await response.stream.bytesToString();
    } else {
      return null;
    }
  }
}

class MockNetwork implements Network {
  const MockNetwork();
  @override
  Future<void> methodDelete({required String api, required Object id, Map<String, String> headers = Api.headers, String baseUrl = Api.baseUrl}) async {
    debugPrint("Object Deleted: $id");
  }

  @override
  Future<String?> methodGet({required String api, Object? id, Map<String, String> headers = Api.headers, String baseUrl = Api.baseUrl, Map<String, String>? query}) async {
    return jsonEncode(mockData);
  }

  @override
  Future<void> methodPost({required String api, Map<String, String> headers = Api.headers, String baseUrl = Api.baseUrl, required Map<String, Object?> data}) async {
    debugPrint("Object Created");
  }

  @override
  Future<void> methodPut({required String api, required Object id, Map<String, String> headers = Api.headers, String baseUrl = Api.baseUrl, required Map<String, Object?> data}) async {
    debugPrint("Object Updated");
  }

  @override
  Future<String?> multipart({required String api, required String filePath, Map<String, String> headers = Api.headersMedia, String baseUrl = Api.baseUrl, Map<String, String>? body}) {
    // TODO: implement multipart
    throw UnimplementedError();
  }
}

final mockData = [
  {
    "breeds": [],
    "id": "5o5",
    "url": "https://cdn2.thecatapi.com/images/5o5.jpg",
    "width": 1536,
    "height": 2048
  },
  {
    "breeds": [],
    "id": "5q4",
    "url": "https://cdn2.thecatapi.com/images/5q4.jpg",
    "width": 400,
    "height": 602
  },
  {
    "breeds": [],
    "id": "a9o",
    "url": "https://cdn2.thecatapi.com/images/a9o.jpg",
    "width": 560,
    "height": 536
  },
  {
    "breeds": [],
    "id": "b3s",
    "url": "https://cdn2.thecatapi.com/images/b3s.jpg",
    "width": 1024,
    "height": 813
  },
  {
    "breeds": [],
    "id": "d6k",
    "url": "https://cdn2.thecatapi.com/images/d6k.jpg",
    "width": 640,
    "height": 492
  },
  {
    "breeds": [],
    "id": "e63",
    "url": "https://cdn2.thecatapi.com/images/e63.jpg",
    "width": 799,
    "height": 599
  },
  {
    "breeds": [],
    "id": "e8h",
    "url": "https://cdn2.thecatapi.com/images/e8h.jpg",
    "width": 640,
    "height": 236
  },
  {
    "breeds": [],
    "id": "MTY2MDIwMw",
    "url": "https://cdn2.thecatapi.com/images/MTY2MDIwMw.jpg",
    "width": 640,
    "height": 480
  },
  {
    "breeds": [],
    "id": "MTcwOTUyMQ",
    "url": "https://cdn2.thecatapi.com/images/MTcwOTUyMQ.jpg",
    "width": 720,
    "height": 480
  },
  {
    "breeds": [],
    "id": "MTg3NjQ0Mg",
    "url": "https://cdn2.thecatapi.com/images/MTg3NjQ0Mg.jpg",
    "width": 500,
    "height": 736
  }
];