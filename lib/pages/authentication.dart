import 'package:flutter/material.dart';

import '../components/basic_button.dart';
import '../utils/CustomColors.dart';
import '../utils/Routes.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

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