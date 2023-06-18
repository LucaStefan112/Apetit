import 'dart:convert';
import 'package:apetit/utils/storage_manager.dart';
import 'package:http/http.dart' as http;

class HttpService {
  static Future<Map<String, dynamic>> get({ String url = ''}) async {
    try {
      final token = await StorageManager.getToken();
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>   {
          'Authorization': 'Bearer $token'
        }
      );
      final responseJson = jsonDecode(response.body);

      await StorageManager.manageResponseToken(responseJson);

      return responseJson;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<Map<String, dynamic>> post( { String url = '', Map<String, dynamic> body = const {} }) async {
    try {
      final token = await StorageManager.getToken();
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(body)
      );
      final responseJson = jsonDecode(response.body);

      await StorageManager.manageResponseToken(responseJson);

      return responseJson;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<Map<String, dynamic>> put({ String url = '', Map<String, dynamic> body = const {} }) async {
    try {
      final token = await StorageManager.getToken();
      final response = await http.put(
        Uri.parse(url),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(body)
      );
      final responseJson = jsonDecode(response.body);

      await StorageManager.manageResponseToken(responseJson);

      return responseJson;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<Map<String, dynamic>> delete({ String url = '' }) async {
    try {
      final token = await StorageManager.getToken();
      final response = await http.delete(
        Uri.parse(url),
        headers: <String, String> {
          'Authorization': 'Bearer $token'
        }
      );
      final responseJson = jsonDecode(response.body);

      await StorageManager.manageResponseToken(responseJson);

      return responseJson;
    } catch (e) {
      throw Exception(e);
    }
  }
}