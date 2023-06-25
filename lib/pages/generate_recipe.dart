import 'package:apetit/components/buttons/generate_recipe.dart';
import 'package:apetit/components/headers/generate_recipe_header.dart';
import 'package:apetit/components/generated_recipe_action_bar.dart';
import 'package:apetit/services/recipe.dart';
import 'package:apetit/utils/authorized_pages.dart';
import 'package:apetit/utils/toaster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../components/buttons/navigation_icon.dart';
import '../components/recipe_details.dart';
import '../entities/recipe.dart';
import '../utils/custom_colors.dart';

class GenerateRecipePage extends StatefulWidget {
  const GenerateRecipePage({Key? key}) : super(key: key);

  @override
  GenerateRecipePageState createState() => GenerateRecipePageState();
}

class GenerateRecipePageState extends State<GenerateRecipePage> {
  late String paramValue;
  String details = 'anything';
  late Future<dynamic> currentFuture;
  Recipe? currentRecipe;

  generateRecipe() {
    EasyLoading.show(status: 'Generating recipe...');
    currentFuture = RecipeService.generate(paramValue, details).then((value) {
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
  void initState() {
    super.initState();
    AuthorizationRedirect.redirectIfUnauthorized(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    paramValue = ModalRoute.of(context)!.settings.arguments as String;
  }

  @override
  void dispose() {
    super.dispose();
    EasyLoading.dismiss();
    currentFuture.ignore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GenerateRecipeHeader(
            title: paramValue,
            route1: NavigationIconRoutes.back,
            route2: NavigationIconRoutes.none,
            onChanged: (value) {
              setState(() {
                details = value;
              });
            },
          ),
          if(currentRecipe != null)
            RecipeDetails(
              recipe: currentRecipe,
            ),
          if(currentRecipe == null)
            GenerateRecipeButton(
                onPressed: generateRecipe,
            ),
            GeneratedRecipeActionBar(
              recipe: currentRecipe,
              onDislike: generateRecipe,
              onLike: likeRecipe,
            ),
        ],
      ),
    );
  }
}
