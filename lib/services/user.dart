import 'package:apetit/entities/preferences.dart';
import 'package:apetit/entities/user_data.dart';
import 'package:apetit/services/responses.dart';

import '../utils/server_routes.dart';
import 'http.dart';

class UserService {
  static Future<GetPreferencesResponse> getPreferences() async {
    try{
      final data = await HttpService.get(
        url: ServerRoutes.getPreferences
      );

      return GetPreferencesResponse.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<EmptyResponse> updatePreferences(Preferences newPreferences) async {
    try{
      final data = await HttpService.put(
        url: ServerRoutes.updatePreferences,
        body: newPreferences.toJson()
      );

      return EmptyResponse.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<GetLikedRecipesResponse> getLikedRecipes(int page) async {
    try{
      final data = await HttpService.post(
        url: ServerRoutes.getLikedRecipes,
        body: {
          'pagination': {
            'skip': page,
            'take': 10
          }
        }
      );

      return GetLikedRecipesResponse.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<GetCookingHistoryResponse> getCookingHistory(int page) async {
    try{
      final data = await HttpService.post(
        url: ServerRoutes.getCookingHistory,
        body: {
          'pagination': {
            'skip': page,
            'take': 10
          }
        }
      );

      return GetCookingHistoryResponse.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<GetUserDataResponse> getData() async {
    try{
      final data = await HttpService.get(
        url: ServerRoutes.getUserData
      );

      return GetUserDataResponse.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<EmptyResponse> updateData(UserData userData) async {
    try{
      final data = await HttpService.put(
        url: ServerRoutes.updateUserData,
        body: userData.toJson()
      );

      return EmptyResponse.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
  }
}