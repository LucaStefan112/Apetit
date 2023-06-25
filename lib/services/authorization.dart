import 'package:apetit/entities/user_data.dart';
import 'package:apetit/services/http.dart';
import 'package:apetit/services/responses.dart';

import '../utils/server_routes.dart';

class AuthorizationService {
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

  static Future<EmptyResponse> login(String email, String password) async {
    try {
      final data = await HttpService.post(
        url: ServerRoutes.login,
        body: {
          'email': email,
          'password': password
        }
      );

      return EmptyResponse.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<EmptyResponse> resetPassword(String email) async {
    try {
      final data = await HttpService.post(
        url: ServerRoutes.resetPassword,
        body: {
          'email': email
        }
      );

      return EmptyResponse.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<CheckResetPasswordResponse> checkResetPasswordCode(String email, String resetPasswordCode) async {
    try {
      final data = await HttpService.post(
        url: ServerRoutes.checkResetPasswordCode,
        body: {
          'email': email,
          'resetPasswordCode': resetPasswordCode
        }
      );

      return CheckResetPasswordResponse.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<EmptyResponse> changePassword(String newPassword, String resetPasswordToken) async {
    try {
      final data = await HttpService.post(
        url: ServerRoutes.changePassword,
        body: {
          'newPassword': newPassword,
          'resetPasswordToken': resetPasswordToken
        }
      );

      return EmptyResponse.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<EmptyResponse> logout() async {
    try {
      final data = await HttpService.get(
        url: ServerRoutes.logout
      );

      return EmptyResponse.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
  }
}