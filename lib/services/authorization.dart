import 'package:apetit/entities/userData.dart';
import 'package:apetit/services/http.dart';

import '../utils/ServerRoutes.dart';

class AuthorizationService {
  static Future<dynamic> test() async {
    try {
      final data = await HttpService.get(
        url: ServerRoutes.test
      );

      return data;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<EmptyResponse> register(UserData userData) async {
    try {
      final data = await HttpService.post(
        url: ServerRoutes.register,
        body: userData.toJson()
      );

      return EmptyResponse.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<EmptyResponse> resendActivationCode(String email) async {
    try {
      final data = await HttpService.post(
        url: ServerRoutes.resendActivationCode,
        body: {
          'email': email
        }
      );

      return EmptyResponse.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<EmptyResponse> activateAccount({required String activationCode, required String email}) async {
    try {
      final data = await HttpService.post(
        url: ServerRoutes.activateAccount,
        body: {
          'activationCode': activationCode,
          'email': email
        }
      );

      return EmptyResponse.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<dynamic> login(String email, String password) async {
    try {
      final data = await HttpService.post(
        url: ServerRoutes.login,
        body: {
          'email': email,
          'password': password
        }
      );

      return data;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<dynamic> resetPassword(String email) async {
    try {
      final data = await HttpService.post(
        url: ServerRoutes.resetPassword,
        body: {
          'email': email
        }
      );

      return data;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<dynamic> checkResetPasswordCode(String email, String resetPasswordCode) async {
    try {
      final data = await HttpService.post(
        url: ServerRoutes.checkResetPasswordCode,
        body: {
          'email': email,
          'resetPasswordCode': resetPasswordCode
        }
      );

      return data;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<dynamic> changePassword(String newPassword) async {
    try {
      final data = await HttpService.post(
        url: ServerRoutes.changePassword,
        body: {
          'newPassword': newPassword
        }
      );

      return data;
    } catch (e) {
      throw Exception(e);
    }
  }
}