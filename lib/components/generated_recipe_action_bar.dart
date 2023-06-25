import 'package:apetit/components/inputs/generate_recipe_input.dart';
import 'package:apetit/entities/recipe.dart';
import 'package:apetit/utils/custom_colors.dart';
import 'package:apetit/utils/toaster.dart';
import 'package:flutter/material.dart';

import 'buttons/action_icon.dart';


class GeneratedRecipeActionBar extends StatelessWidget {
  final Recipe? recipe;
  final Function? onDislike;
  final Function onLike;

  const GeneratedRecipeActionBar({
    Key? key,
    this.recipe,
    required this.onDislike,
    required this.onLike,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.1 * MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: CustomColors.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: CustomColors.secondary,
            offset: Offset(0, -1),
            blurRadius: 10,
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:  [
            if(onDislike != null)
              ActionIcon(
                icon: Icons.sync,
                color: Colors.red,
                padding: 0.1,
                size: MediaQuery.of(context).size.width * 0.2,
                onClick: onDislike!,
              ),
            ActionIcon(
              icon: (recipe == null || recipe!.liked == null || recipe!.liked == false)
                ? Icons.favorite_border : Icons.favorite,
              color: Colors.red,
              padding: 0.1,
              size: MediaQuery.of(context).size.width * 0.2,
              onClick: () {
                onLike();
                Toaster.success(
                  context,
                  (recipe == null || recipe!.liked == null || recipe!.liked == false)
                    ? 'Recipe added to your favorites!'
                    : 'Recipe removed from your favorites!'
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}