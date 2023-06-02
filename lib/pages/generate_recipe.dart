import 'package:apetit/components/generate_recipe_header.dart';
import 'package:apetit/components/generated_recipe_action_bar.dart';
import 'package:apetit/components/recipe_preview.dart';
import 'package:flutter/material.dart';

import '../components/navigation_icon.dart';
import '../utils/CustomColors.dart';

class GenerateRecipePage extends StatelessWidget {
  const GenerateRecipePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String paramValue = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: CustomColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GenerateRecipeHeader(
            title: paramValue,
            route1: NavigationIconRoutes.back,
            route2: NavigationIconRoutes.none
          ),
          SizedBox(height: 0.04 * MediaQuery.of(context).size.height),
          const RecipePreview(
            title: 'Recipe 1',
            image: 'assets/images/mock-recipe.jpg',
          ),
          const GeneratedRecipeActionBar()
        ],
      ),
    );
  }
}