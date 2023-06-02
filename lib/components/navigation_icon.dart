import 'package:apetit/utils/CustomColors.dart';
import 'package:flutter/material.dart';

import '../utils/Routes.dart';

// create an enum with the routes
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
      onPressed: () => {
        if (route == NavigationIconRoutes.back) {
          Navigator.pop(context)
        } else if (route == NavigationIconRoutes.settings) {
          Navigator.pushNamed(context, Routes.settings)
        }
      },
      child:
      route == NavigationIconRoutes.none ? const SizedBox( width: 0, height: 0,) :
      Image.asset(
        route == NavigationIconRoutes.back ? 'assets/images/back.png' : 'assets/images/settings.png',
        width: size,
        height: size,
        color: CustomColors.white
      ),
    );
  }
}