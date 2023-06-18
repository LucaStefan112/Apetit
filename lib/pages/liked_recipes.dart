import 'package:apetit/components/navigation_icon.dart';
import 'package:apetit/components/vertical_list.dart';
import 'package:apetit/utils/authorized_pages.dart';
import 'package:flutter/material.dart';

import '../components/basic_header.dart';
import '../utils/custom_colors.dart';

class LikedRecipesPage extends AuthorizedStatelessPage {
  const LikedRecipesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: CustomColors.background,
      body: Column(
        children: [
          const BasicHeader(title: 'Liked Recipes', route1: NavigationIconRoutes.back, route2: NavigationIconRoutes.none),
          SizedBox(height: 0.04 * MediaQuery.of(context).size.height),
          VerticalList(list: [
            VerticalListItemData(
              title: 'Recipe 1',
              route: 'recipe1',
              iconType: IconType.mainDish
            ),
            VerticalListItemData(
              title: 'Recipe 2',
              route: 'recipe2',
              iconType: IconType.snack
            ),
            VerticalListItemData(
              title: 'Recipe 3',
              route: 'recipe3',
              iconType: IconType.dessert
            ),
          ]),
        ],
      ),
    );
  }
}