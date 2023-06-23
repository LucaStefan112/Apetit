import 'package:apetit/entities/recipe.dart';
import 'package:apetit/utils/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'buttons/action_icon.dart';


class GeneratedRecipeActionBar extends StatelessWidget {
  final Recipe? recipe;
  final Function? onDislike;
  final Function onCook;
  final Function onLike;

  const GeneratedRecipeActionBar({
    Key? key,
    this.recipe,
    required this.onDislike,
    required this.onCook,
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
                icon: Icons.close,
                color: Colors.red,
                padding: 0.1,
                size: MediaQuery.of(context).size.width * 0.2,
                onClick: onDislike!,
              ),
            ActionIcon(
              icon: Icons.food_bank_outlined,
              color: Colors.black,
              padding: 0.04,
              size: MediaQuery.of(context).size.width * 0.25,
              onClick: onCook,
            ),
            ActionIcon(
              icon: (recipe == null || recipe!.liked == null || recipe!.liked == false)
                ? Icons.favorite_border : Icons.favorite,
              color: Colors.red,
              padding: 0.1,
              size: MediaQuery.of(context).size.width * 0.2,
              onClick: onLike,
            ),
          ],
        ),
      ),
    );
  }
}