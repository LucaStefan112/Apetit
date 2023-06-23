import 'package:apetit/utils/authorized_pages.dart';
import 'package:flutter/material.dart';

import '../components/buttons/basic_button.dart';
import '../utils/custom_colors.dart';
import '../utils/routes.dart';

class ResetPasswordSuccessPage extends UnauthorizedStatelessPage {
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