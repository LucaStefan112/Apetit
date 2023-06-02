import 'package:apetit/components/privacy_policy.dart';
import 'package:apetit/entities/userData.dart';
import 'package:apetit/pages/register_verification.dart';
import 'package:apetit/services/authorization.dart';
import 'package:apetit/utils/FormValidation.dart';
import 'package:apetit/utils/Routes.dart';
import 'package:apetit/utils/Toaster.dart';
import 'package:flutter/material.dart';

import '../components/basic_button.dart';
import '../components/date_form_input.dart';
import '../components/text_form_input.dart';
import '../utils/CustomColors.dart';

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
    print(newUserData);
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
