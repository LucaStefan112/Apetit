import 'package:apetit/pages/reset_password_success.dart';
import 'package:apetit/utils/authorized_pages.dart';
import 'package:flutter/material.dart';

import '../components/basic_button.dart';
import '../components/text_form_input.dart';
import '../services/authorization.dart';
import '../utils/custom_colors.dart';
import '../utils/form_validation.dart';
import '../utils/toaster.dart';

class ResetPasswordPage extends StatefulWidget {
  final String resetPasswordToken;

  const ResetPasswordPage({Key? key, required this.resetPasswordToken}) : super(key: key);

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  Map<String, dynamic> userData = {
    'password': null,
    'confirmPassword': null,
  };

  submit() {
    if (!FormValidation.validateResetPassword(userData).isValid) {
      return Toaster.error(context, FormValidation.validateResetPassword(userData).message);
    }

    try {
      AuthorizationService.changePassword(userData['password'], widget.resetPasswordToken).then((value) {
        if (value.success) {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => const ResetPasswordSuccessPage()
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
                      'Enter the new password:',
                      style: TextStyle(
                        color: CustomColors.background,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  TextFormInput(
                    label: 'Password',
                    onChanged: (value) => setState(() {
                      userData['password'] = value;
                    }),
                    type: TextInputType.visiblePassword,
                  ),
                  TextFormInput(
                    label: 'Confirm Password',
                    onChanged: (value) => setState(() {
                      userData['confirmPassword'] = value;
                    }),
                    type: TextInputType.visiblePassword,
                  ),
                ],
              ),
              BasicButton(
                text: 'Send',
                onPressed: () => submit(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
