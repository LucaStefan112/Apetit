import 'package:apetit/components/generated_recipe_action_bar.dart';
import 'package:apetit/services/recipe.dart';
import 'package:apetit/utils/toaster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../components/buttons/navigation_icon.dart';
import '../components/headers/basic_header.dart';
import '../components/recipe_details.dart';
import '../entities/recipe.dart';
import '../utils/authorized_pages.dart';
import '../utils/custom_colors.dart';

class RecipePage extends StatefulWidget {
  final String recipeId;

  const RecipePage({Key? key, required this.recipeId}) : super(key: key);

  @override
  RecipePageState createState() => RecipePageState();
}

class RecipePageState extends State<RecipePage> {
  Recipe? currentRecipe;

  getRecipe() {
    EasyLoading.show(status: 'Loading recipe...');

    RecipeService.get(widget.recipeId).then((value) {
      EasyLoading.dismiss();
      if (value.success) {
        setState(() {
          currentRecipe = value.recipe!;
        });
      } else {
        Toaster.error(context, value.message);
      }
    });
  }

  likeRecipe() {
    if(currentRecipe != null) {
      RecipeService.like(currentRecipe!.id).then((value) {
        EasyLoading.dismiss();
        if (value.success) {
          setState(() {
            if(currentRecipe!.liked == null) {
              currentRecipe!.liked = true;
            } else {
              currentRecipe!.liked = !currentRecipe!.liked!;
            }
          });
        } else {
          Toaster.error(context, value.message);
        }
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    AuthorizationRedirect.redirectIfUnauthorized(context);
    getRecipe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const BasicHeader(
            title: 'Recipe',
            route1: NavigationIconRoutes.back,
            route2: NavigationIconRoutes.none,
          ),
          if(currentRecipe != null)
            RecipeDetails(
              recipe: currentRecipe,
            ),
          GeneratedRecipeActionBar(
            recipe: currentRecipe,
            onLike: likeRecipe,
            onDislike: null,
          ),
        ],
      ),
    );
  }
}
