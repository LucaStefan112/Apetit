import 'package:apetit/utils/custom_colors.dart';
import 'package:flutter/cupertino.dart';

import 'action_icon.dart';

class GeneratedRecipeActionBar extends StatelessWidget {
  const GeneratedRecipeActionBar({Key? key}) : super(key: key);

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
        // add shadow
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
            ActionIcon(
              iconPath: 'assets/images/dislike.png',
              paddingLeft: MediaQuery.of(context).size.width * 0.03,
              paddingRight: MediaQuery.of(context).size.width * 0.03,
              onClick: () {},
            ),
            ActionIcon(
              iconPath: 'assets/images/cook.png',
              onClick: () {},
            ),
            ActionIcon(
              iconPath: 'assets/images/liked.png',
              onClick: () {},
            ),
          ],
        ),
      ),
    );
  }
}