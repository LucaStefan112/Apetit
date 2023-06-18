import 'package:apetit/components/basic_header.dart';
import 'package:apetit/components/generated_recipe_action_bar.dart';
import 'package:flutter/material.dart';

import '../components/navigation_icon.dart';
import '../components/recipe_details.dart';
import '../utils/authorized_pages.dart';
import '../utils/custom_colors.dart';

class RecipePage extends AuthorizedStatelessPage {
  const RecipePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String paramValue = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: CustomColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BasicHeader(
              title: paramValue,
              route1: NavigationIconRoutes.back,
              route2: NavigationIconRoutes.none
          ),
          SizedBox(height: 0.04 * MediaQuery.of(context).size.height),
          const RecipeDetails(
            title: 'Recipe 1',
          ),
          const GeneratedRecipeActionBar()
        ],
      ),
    );
  }
}