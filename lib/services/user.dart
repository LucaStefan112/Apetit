import 'package:apetit/entities/preferences.dart';
import 'package:apetit/entities/userData.dart';
import 'package:apetit/services/responses.dart';

import '../entities/recipe.dart';
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

  static Future<List<Recipe>> getLikedRecipes() async {
    try{
      final List data = (await HttpService.get(
        url: ServerRoutes.getLikedRecipes
      )) as List;

      return data.map((e) => Recipe.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<List<Recipe>> getCookingHistory() async {
    try{
      final List data = (await HttpService.get(
        url: ServerRoutes.getCookingHistory
      )) as List;

      return data.map((e) => Recipe.fromJson(e)).toList();
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