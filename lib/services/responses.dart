import 'package:apetit/entities/preferences.dart';
import 'package:apetit/entities/recipe.dart';

import '../entities/user_data.dart';

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

class GenerateRecipeResponse extends EmptyResponse {
  final Recipe? recipe;

  GenerateRecipeResponse({
    required String message,
    required bool success,
    this.recipe
  }) : super(
    message: message,
    success: success
  );

  factory GenerateRecipeResponse.fromJson(Map<String, dynamic> json) {
    return GenerateRecipeResponse(
      message: json['message'],
      success: json['success'],
      recipe: json['recipe'] != null ? Recipe.fromJson(json['recipe']) : null
    );
  }
}

class GetRecipeResponse extends EmptyResponse {
  final Recipe? recipe;

  GetRecipeResponse({
    required String message,
    required bool success,
    this.recipe
  }) : super(
    message: message,
    success: success
  );

  factory GetRecipeResponse.fromJson(Map<String, dynamic> json) {
    return GetRecipeResponse(
      message: json['message'],
      success: json['success'],
      recipe: json['recipe'] != null ? Recipe.fromJson(json['recipe']) : null
    );
  }
}

class GetLikedRecipesResponse extends EmptyResponse {
  final List<Recipe>? likedRecipes;

  GetLikedRecipesResponse({
    required String message,
    required bool success,
    this.likedRecipes
  }) : super(
    message: message,
    success: success
  );

  factory GetLikedRecipesResponse.fromJson(Map<String, dynamic> json) {
    return GetLikedRecipesResponse(
      message: json['message'],
      success: json['success'],
        likedRecipes: json['likedRecipes'] != null ? (json['likedRecipes'] as List).map((e) => Recipe.fromJson(e)).toList() : null
    );
  }
}

class GetCookingHistoryResponse extends EmptyResponse {
  final List<Recipe>? cookingHistory;

  GetCookingHistoryResponse({
    required String message,
    required bool success,
    this.cookingHistory
  }) : super(
    message: message,
    success: success
  );

  factory GetCookingHistoryResponse.fromJson(Map<String, dynamic> json) {
    return GetCookingHistoryResponse(
      message: json['message'],
      success: json['success'],
        cookingHistory: json['cookingHistory'] != null ? (json['cookingHistory'] as List).map((e) => Recipe.fromJson(e)).toList() : null
    );
  }
}