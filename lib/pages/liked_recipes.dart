import 'package:apetit/components/buttons/navigation_icon.dart';
import 'package:apetit/components/vertical_list.dart';
import 'package:apetit/entities/recipe.dart';
import 'package:apetit/pages/recipe.dart';
import 'package:apetit/services/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../components/headers/basic_header.dart';
import '../utils/authorized_pages.dart';
import '../utils/custom_colors.dart';
import '../utils/toaster.dart';

class LikedRecipesPage extends StatefulWidget {
  const LikedRecipesPage({Key? key}) : super(key: key);

  @override
  LikedRecipesPageState createState() => LikedRecipesPageState();
}

class LikedRecipesPageState extends State<LikedRecipesPage> {
  int page = 0;
  List<Recipe> recipes = [];
  Future<dynamic> future = Future.value(false);

  getNextRecipes() {
    EasyLoading.show(status: 'Loading...');

    future = UserService.getLikedRecipes(page).then((response) {
      EasyLoading.dismiss();
      if(response.success) {
        setState(() {
          response.likedRecipes?.forEach((element) {
            recipes.add(element);
          });
          page++;
        });
      } else {
        Toaster.error(context, response.message);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    AuthorizationRedirect.redirectIfUnauthorized(context);
    getNextRecipes();
  }

  @override
  void dispose() {
    super.dispose();
    EasyLoading.dismiss();
    future.ignore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomColors.background,
      body: Column(
        children: [
          const BasicHeader(title: 'Liked Recipes', route1: NavigationIconRoutes.back, route2: NavigationIconRoutes.none),
          SizedBox(height: 0.04 * MediaQuery.of(context).size.height),
          VerticalList(list: [
            for (var recipe in recipes)
              VerticalListItemData(
                title: recipe.name,
                iconType: recipe.type,
                onClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipePage(recipeId: recipe.id),
                    ),
                  );
                },
              ),
          ]),
        ],
      ),
    );
  }
}