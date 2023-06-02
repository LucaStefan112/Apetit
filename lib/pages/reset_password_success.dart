import 'package:flutter/material.dart';

import '../components/basic_button.dart';
import '../utils/CustomColors.dart';
import '../utils/Routes.dart';

class ResetPasswordSuccessPage extends StatelessWidget {
  const ResetPasswordSuccessPage({Key? key}) : super(key: key);

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
              Container(
                alignment: Alignment.center,
                width: 400,
                child: const Text(
                  'Your password has been updated!\n\nPlease login with the new password.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: CustomColors.background,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              BasicButton(
                  text: 'Login',
                  onPressed: () => Navigator.pushNamedAndRemoveUntil(context, Routes.authentication, (route) => false)
              ),
            ],
          ),
        ),
      ),
    );
  }
}