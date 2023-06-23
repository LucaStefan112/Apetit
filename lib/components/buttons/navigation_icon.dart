import 'package:apetit/utils/custom_colors.dart';
import 'package:flutter/material.dart';

import '../../utils/routes.dart';

enum NavigationIconRoutes {
  back,
  settings,
  none
}

class NavigationIcon extends StatelessWidget {
  final NavigationIconRoutes route;
  final double? size;

  const NavigationIcon({Key? key,
    required this.route,
    this.size = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        if (route == NavigationIconRoutes.back) {
          Navigator.pop(context);
        } else if (route == NavigationIconRoutes.settings) {
          Navigator.pushNamed(context, Routes.settings);
        } else {
          return;
        }
      },
      child:
      route == NavigationIconRoutes.none ? const SizedBox( width: 0, height: 0,) :
      Icon(
        route == NavigationIconRoutes.back ? Icons.arrow_back_rounded : Icons.settings,
        color: CustomColors.white,
        size: size!
      )
    );
  }
}