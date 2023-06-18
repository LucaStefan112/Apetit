import 'package:apetit/pages/settings.dart';
import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';

class UserIcon extends StatelessWidget {
  const UserIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => Navigator.push(context, MaterialPageRoute(
        builder: (context) => const SettingsPage()
      )),

      child: Container(
        width: 0.25 * MediaQuery.of(context).size.width,
        height: 0.25 * MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(0.0125 * MediaQuery.of(context).size.width),
        decoration: BoxDecoration(
          color: CustomColors.white,
          borderRadius: BorderRadius.circular(0.25 * MediaQuery.of(context).size.width),
        ),
        child: const Image(
          image: AssetImage('assets/images/user.png'),
          color: CustomColors.primary,
        ),
      ),
    );
  }
}