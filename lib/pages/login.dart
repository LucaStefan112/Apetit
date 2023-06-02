import 'package:flutter/material.dart';

import '../components/basic_button.dart';
import '../components/text_form_input.dart';
import '../utils/CustomColors.dart';
import '../utils/Routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: CustomColors.primary,
      body: SafeArea (
        child: Center (
          child: Column (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Image(
                  image: AssetImage('assets/images/Apetit_Big_Logo.png'),
                  width: 200,
                  height: 200,
              ),
              Column(
                children: [
                  TextFormInput(
                    label: 'Email',
                    onChanged: (value) => print('email changed'),
                  ),
                  TextFormInput(
                    label: 'Password',
                    onChanged: (value) => print('password changed'),
                    type: TextInputType.visiblePassword,
                  ),
                  TextButton(
                      onPressed: () => Navigator.pushNamed(context, Routes.forgotPassword),
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: CustomColors.background,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                  )
                ],
              ),
              BasicButton(
                  text: 'Login',
                  onPressed: () => Navigator.pushNamed(context, Routes.preferences)
              ),
            ],
          ),
        ),
      ),
    );
  }
}