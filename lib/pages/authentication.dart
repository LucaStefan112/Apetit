import 'package:apetit/utils/authorized_pages.dart';
import 'package:flutter/material.dart';

import '../components/buttons/basic_button.dart';
import '../utils/custom_colors.dart';
import '../utils/routes.dart';

class AuthenticationPage extends UnauthorizedStatelessPage {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthorizationRedirect.redirectIfAuthorized(context);

    return Scaffold(
      backgroundColor: CustomColors.primary,
      body: SafeArea (
        child: Center(
          child: Wrap(
            spacing: 20,
            alignment: WrapAlignment.center,
            runSpacing: 100,
            children: [
              const Image(
                  image: AssetImage('assets/images/Apetit_Big_Logo.png'),
                  width: 230,
                  height: 230
              ),
              Column(
                children: [
                  BasicButton(
                    text: 'Login',
                    onPressed: () => Navigator.pushNamed(context, Routes.login)
                  ),
                  BasicButton(
                    text: 'Register',
                    onPressed: () => Navigator.pushNamed(context, Routes.register)
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}