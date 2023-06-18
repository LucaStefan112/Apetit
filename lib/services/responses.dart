import 'package:apetit/entities/preferences.dart';

import '../entities/userData.dart';

class EmptyResponse {
  final String message;
  final bool success;
  final String? token;

  EmptyResponse({
    required this.message,
    required this.success,
    this.token
  });

  factory EmptyResponse.fromJson(Map<String, dynamic> json) {
    return EmptyResponse(
        message: json['message'],
        success: json['success'],
        token: json['token']
    );
  }
}

class CheckResetPasswordResponse extends EmptyResponse {
  final String? resetPasswordToken;

  CheckResetPasswordResponse({
    required String message,
    required bool success,
    this.resetPasswordToken
  }) : super(
    message: message,
    success: success
  );

  factory CheckResetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return CheckResetPasswordResponse(
      message: json['message'],
      success: json['success'],
      resetPasswordToken: json['resetPasswordToken']
    );
  }
}

class GetPreferencesResponse extends EmptyResponse {
  final Preferences? preferences;

  GetPreferencesResponse({
    required String message,
    required bool success,
    this.preferences
  }) : super(
    message: message,
    success: success
  );

  factory GetPreferencesResponse.fromJson(Map<String, dynamic> json) {
    return GetPreferencesResponse(
      message: json['message'],
      success: json['success'],
      preferences: json['preferences'] != null ? Preferences.fromJson(json['preferences']) : null
    );
  }
}

class GetUserDataResponse extends EmptyResponse {
  final UserData? userData;

  GetUserDataResponse({
    required String message,
    required bool success,
    this.userData
  }) : super(
    message: message,
    success: success
  );

  factory GetUserDataResponse.fromJson(Map<String, dynamic> json) {
    return GetUserDataResponse(
      message: json['message'],
      success: json['success'],
      userData: json['userData'] != null ? UserData.fromJson(json['userData']) : null
    );
  }
}