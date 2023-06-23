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
  _GenerateRecipePageState createState() => _GenerateRecipePageState();
}

class _GenerateRecipePageState extends State<GenerateRecipePage> {
  late String paramValue;
  // get the current future that is running to cancel it in the dispose method
  late Future<dynamic> currentFuture;
  Recipe? currentRecipe;

  generateRecipe() {
    EasyLoading.show(status: 'Generating recipe...');

    currentFuture = RecipeService.generate(paramValue).then((value) {
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

  cookRecipe() {
    if(currentRecipe != null) {
      RecipeService.cook(currentRecipe!.id).then((value) {
        EasyLoading.dismiss();
        if (value.success) {
         Toaster.success(context, value.message);
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
    generateRecipe();
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
          ),
          if(currentRecipe != null)
            RecipeDetails(
              recipe: currentRecipe,
            ),
          GeneratedRecipeActionBar(
            recipe: currentRecipe,
            onDislike: generateRecipe,
            onLike: likeRecipe,
            onCook: cookRecipe,
          ),
        ],
      ),
    );
  }
}
