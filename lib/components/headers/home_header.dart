import 'package:apetit/components/user_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/custom_colors.dart';
import '../../utils/routes.dart';
import '../buttons/action_icon.dart';
import '../buttons/navigation_icon.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.02
      ),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: CustomColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(MediaQuery.of(context).size.width * 0.3),
          bottomRight: Radius.circular(MediaQuery.of(context).size.width * 0.3),
        ),
        boxShadow: const [
          BoxShadow(
            color: CustomColors.secondary,
            offset: Offset(0, 1),
            blurRadius: 10,
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NavigationIcon(
                  route: NavigationIconRoutes.back,
                  size: MediaQuery.of(context).size.width * 0.09
                ),
                const Text('Welcome Chef!',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: CustomColors.white
                  ),
                ),
                NavigationIcon(
                  route: NavigationIconRoutes.settings,
                  size: MediaQuery.of(context).size.width * 0.09
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            const UserIcon(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ActionIcon(
                  icon: Icons.view_list_rounded,
                  onClick: () => Navigator.pushNamed(context, Routes.preferences),
                  size: MediaQuery.of(context).size.width * 0.17,
                  color: CustomColors.secondary,
                ),
                ActionIcon(
                  icon: Icons.favorite_rounded,
                  onClick: () => Navigator.pushNamed(context, Routes.likedRecipes),
                  size: MediaQuery.of(context).size.width * 0.17,
                  color: Colors.red,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}