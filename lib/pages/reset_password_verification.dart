import 'package:flutter/material.dart';

import '../components/basic_button.dart';
import '../components/text_form_input.dart';
import '../utils/CustomColors.dart';
import '../utils/Routes.dart';

class ResetPasswordVerificationPage extends StatelessWidget {
  const ResetPasswordVerificationPage({Key? key}) : super(key: key);

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
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: const Text(
                      'Enter the verification code send\n to your email address:',
                      style: TextStyle(
                        color: CustomColors.background,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  TextFormInput(
                    label: 'Code',
                    onChanged: (value) => print('email changed'),
                    type: TextInputType.number,
                  ),
                ],
              ),
              BasicButton(
                  text: 'Verify',
                  onPressed: () => Navigator.pushNamed(context, Routes.resetPassword)
              ),
            ],
          ),
        ),
      ),
    );
  }
}