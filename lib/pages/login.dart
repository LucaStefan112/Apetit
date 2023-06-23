import 'package:apetit/pages/preferences.dart';
import 'package:apetit/utils/authorized_pages.dart';
import 'package:flutter/material.dart';

import '../components/buttons/basic_button.dart';
import '../components/inputs/text_form_input.dart';
import '../services/authorization.dart';
import '../utils/custom_colors.dart';
import '../utils/form_validation.dart';
import '../utils/routes.dart';
import '../utils/toaster.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Map<String, dynamic> userData = {
    'email': null,
    'password': null,
  };

  submit() {
    if (!FormValidation.validateLogin(userData).isValid) {
      return Toaster.error(context, FormValidation.validateLogin(userData).message);
    }

    try {
      AuthorizationService.login(userData['email'], userData['password']).then((value) {
        if (value.success) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PreferencesPage(),
            ),
          );
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
                  TextFormInput(
                    label: 'Email',
                    onChanged: (value) => setState(() {
                      userData['email'] = value;
                    }),
                  ),
                  TextFormInput(
                    label: 'Password',
                    onChanged: (value) => setState(() {
                      userData['password'] = value;
                    }),
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
                onPressed: () => submit(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
