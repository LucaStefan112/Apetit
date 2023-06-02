import 'package:apetit/utils/ServerRoutes.dart';

import '../entities/recipe.dart';
import 'http.dart';

class RecipeService {
  static Future<Recipe> generate(String lookingFor) async {
    try{
      final data = await HttpService.post(
        url: ServerRoutes.generateRecipe,
        body: {
          "lookingFor": lookingFor
        }
      );

      return Recipe.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<dynamic> like(String recipeId) async {
    try{
      final data = await HttpService.post(
        url: ServerRoutes.likeRecipe(recipeId),
        body: {}
      );

      return data;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<dynamic> unlike(String recipeId) async {
    try{
      final data = await HttpService.post(
        url: ServerRoutes.unlikeRecipe(recipeId),
        body: {}
      );

      return data;
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<dynamic> cook(String recipeId) async {
    try{
      final data = await HttpService.post(
        url: ServerRoutes.cookRecipe(recipeId),
        body: {}
      );

      return data;
    } catch (e) {
      throw Exception(e);
    }
  }
}