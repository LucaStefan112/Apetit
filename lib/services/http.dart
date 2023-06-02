import 'dart:convert';
import 'package:http/http.dart' as http;

class EmptyResponse {
  final String message;
  final bool success;

  EmptyResponse({
    required this.message,
    required this.success
  });

  factory EmptyResponse.fromJson(Map<String, dynamic> json) {
    return EmptyResponse(
      message: json['message'],
      success: json['success']
    );
  }
}

class HttpService {
  static Future<Map<String, dynamic>> get({ String url = '' }) async {
    try {
      final response = await http.get(Uri.parse(url));
      return jsonDecode(response.body);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<Map<String, dynamic>> post({ String url = '', Map<String, dynamic> body = const {} }) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body)
      );
      return jsonDecode(response.body);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<Map<String, dynamic>> put({ String url = '', Map<String, dynamic> body = const {} }) async {
    try {
      final response = await http.put(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body)
      );
      return jsonDecode(response.body);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<Map<String, dynamic>> delete({ String url = '' }) async {
    try {
      final response = await http.delete(Uri.parse(url));
      return jsonDecode(response.body);
    } catch (e) {
      throw Exception(e);
    }
  }
}