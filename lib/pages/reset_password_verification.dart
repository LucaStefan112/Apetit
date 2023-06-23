import 'package:apetit/pages/reset_password.dart';
import 'package:apetit/utils/authorized_pages.dart';
import 'package:flutter/material.dart';

import '../components/buttons/basic_button.dart';
import '../components/inputs/text_form_input.dart';
import '../services/authorization.dart';
import '../utils/custom_colors.dart';
import '../utils/form_validation.dart';
import '../utils/toaster.dart';

class ResetPasswordVerificationPage extends StatefulWidget {
  final String email;

  const ResetPasswordVerificationPage({Key? key, required this.email}) : super(key: key);

  @override
  _ResetPasswordVerificationPageState createState() => _ResetPasswordVerificationPageState();
}

class _ResetPasswordVerificationPageState extends State<ResetPasswordVerificationPage> {
  String verificationCode = '';

  submit() {
    if (!FormValidation.validateResetPasswordCode(verificationCode).isValid) {
      return Toaster.error(context, FormValidation.validateResetPasswordCode(verificationCode).message);
    }

    try {
      AuthorizationService.checkResetPasswordCode(widget.email, verificationCode).then((value) {
        if (value.success) {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => ResetPasswordPage(
                resetPasswordToken: value.resetPasswordToken!
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
                    onChanged: (value) => setState(() {
                      verificationCode = value;
                    }),
                    type: TextInputType.number,
                  ),
                ],
              ),
              BasicButton(
                text: 'Verify',
                onPressed: () => submit(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
