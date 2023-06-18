import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageManager {
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  static const String _tokenKey = 'auth_token';
  static const deleteSignal = 'delete';
  static String? _token;

  static Future<String?> getToken() async {
    _token ??= await _secureStorage.read(key: _tokenKey);
    return _token;
  }

  static Future<void> setToken(String token) async {
    _token = token;
    await _secureStorage.write(key: _tokenKey, value: token);
  }

  static Future<void> deleteToken() async {
    _token = null;
    await _secureStorage.delete(key: _tokenKey);
  }

  static Future<bool> manageResponseToken(Map<String, dynamic> response) async {
    if (response.containsKey(_tokenKey)) {
      if(response[_tokenKey] == deleteSignal) {
        await deleteToken();
      } else {
        await setToken(response[_tokenKey]);
      }

      return true;
    }
    return false;
  }
}
