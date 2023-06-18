import 'package:apetit/pages/reset_password_verification.dart';
import 'package:apetit/utils/authorized_pages.dart';
import 'package:flutter/material.dart';

import '../components/basic_button.dart';
import '../components/text_form_input.dart';
import '../services/authorization.dart';
import '../utils/custom_colors.dart';
import '../utils/form_validation.dart';
import '../utils/toaster.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  String email = '';

  submit() {
    if (!FormValidation.validateEmail(email).isValid) {
      return Toaster.error(context, FormValidation.validateEmail(email).message);
    }

    try {
      AuthorizationService.resetPassword(email).then((value) {
        if (value.success) {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => ResetPasswordVerificationPage(
                email: email,
              )
          ));
        } else {
          Toaster.error(context, value.message);
        }
      });
    } catch (e) {
      Toaster.error(context, e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    AuthorizationRedirect.redirectIfAuthorized(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomColors.primary,
      body: SafeArea(
        child: Center(
          child: Column(
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
                      'Enter the email address:',
                      style: TextStyle(
                        color: CustomColors.background,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  TextFormInput(
                    label: 'Email',
                    onChanged: (value) => setState(() {
                      email = value;
                    }),
                  ),
                ],
              ),
              BasicButton(
                text: 'Next',
                onPressed: () => submit(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
