import 'package:apetit/components/privacy_policy.dart';
import 'package:apetit/entities/userData.dart';
import 'package:apetit/pages/register_verification.dart';
import 'package:apetit/services/authorization.dart';
import 'package:apetit/utils/authorized_pages.dart';
import 'package:apetit/utils/form_validation.dart';
import 'package:apetit/utils/toaster.dart';
import 'package:flutter/material.dart';

import '../components/basic_button.dart';
import '../components/date_form_input.dart';
import '../components/text_form_input.dart';
import '../utils/custom_colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Map<String, dynamic> newUserData = {
    'fullName': null,
    'dateOfBirth': null,
    'email': null,
    'password': null,
    'confirmPassword': null,
    'privacyPolicy': false,
  };

  submit() {
    if (!FormValidation.validateRegister(newUserData).isValid) {
      return Toaster.error(context, FormValidation.validateRegister(newUserData).message);
    }

    try {
      AuthorizationService.register(UserData.fromJson(newUserData)).then((value) {
        if (value.success) {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => RegisterVerificationPage(
                email: newUserData['email'],
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
      resizeToAvoidBottomInset : false,
      backgroundColor: CustomColors.primary,
      body: SafeArea (
        child: Center (
          child: Column (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: const AssetImage('assets/images/Apetit_Big_Logo.png'),
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Form(
                child: Column(
                  children: [
                    TextFormInput(
                      label: 'Full Name',
                      onChanged: (value) => newUserData['fullName'] = value,
                    ),
                    DateFormInput(
                      label: 'Date of Birth',
                      onChanged: (value) => newUserData['dateOfBirth'] = value,
                    ),
                    TextFormInput(
                      label: 'Email',
                      onChanged: (value) => newUserData['email'] = value,
                    ),
                    TextFormInput(
                      label: 'Password',
                      onChanged: (value) => newUserData['password'] = value,
                      type: TextInputType.visiblePassword,
                    ),
                    TextFormInput(
                      label: 'Confirm Password',
                      onChanged: (value) => newUserData['confirmPassword'] = value,
                      type: TextInputType.visiblePassword,
                    ),
                    PrivacyPolicy(
                      onChanged: (value) => newUserData['privacyPolicy'] = value,
                    ),
                  ],
                ),
              ),
              BasicButton(
                text: 'Register',
                onPressed: () => submit(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
