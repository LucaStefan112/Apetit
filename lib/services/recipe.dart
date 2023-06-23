import 'package:apetit/services/responses.dart';
import 'package:apetit/utils/server_routes.dart';

import 'http.dart';

class RecipeService {
  static Future<GenerateRecipeResponse> generate(String lookingFor) async {
    try{
      final data = await HttpService.post(
        url: ServerRoutes.generateRecipe,
        body: {
          "lookingFor": lookingFor
        }
      );

      return GenerateRecipeResponse.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<GetRecipeResponse> get(String recipeId) async {
    try{
      final data = await HttpService.get(
        url: ServerRoutes.getRecipe(recipeId)
      );

      return GetRecipeResponse.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<EmptyResponse> like(String recipeId) async {
    try{
      final data = await HttpService.get(
        url: ServerRoutes.likeRecipe(recipeId)
      );

      return EmptyResponse.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<EmptyResponse> cook(String recipeId) async {
    try{
      print(ServerRoutes.cookRecipe(recipeId));
      final data = await HttpService.get(
        url: ServerRoutes.cookRecipe(recipeId)
      );

      return EmptyResponse.fromJson(data);
    } catch (e) {
      throw Exception(e);
    }
  }
}