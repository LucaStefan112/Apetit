import 'package:apetit/entities/preferences.dart';
import 'package:apetit/entities/userData.dart';

import '../entities/recipe.dart';
import '../utils/ServerRoutes.dart';
import 'http.dart';

class UserService {
  static Future<Preferences> getPreferences() async {
    try{
      final data = await HttpService.get(
        url: ServerRoutes.getPreferences
      );

      return Preferences.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<Preferences> updatePreferences(Preferences newPreferences) async {
    try{
      final data = await HttpService.put(
        url: ServerRoutes.updatePreferences,
        body: newPreferences.toJson()
      );

      return Preferences.fromJson(data);
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

  static Future<UserData> getData() async {
    try{
      final data = await HttpService.get(
        url: ServerRoutes.getUserData
      );

      return UserData.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<UserData> updateData(UserData userData) async {
    try{
      final data = await HttpService.put(
        url: ServerRoutes.updateUserData,
        body: userData.toJson()
      );

      return UserData.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
  }
}