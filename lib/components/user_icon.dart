import 'package:flutter/material.dart';

import '../utils/CustomColors.dart';
import '../utils/Routes.dart';

class UserIcon extends StatelessWidget {
  const UserIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => Navigator.pushNamed(context, Routes.settings),

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