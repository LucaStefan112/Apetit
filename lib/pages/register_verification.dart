import 'package:apetit/services/authorization.dart';
import 'package:flutter/material.dart';

import '../components/basic_button.dart';
import '../components/text_form_input.dart';
import '../utils/CustomColors.dart';
import '../utils/Routes.dart';
import '../utils/Toaster.dart';

class RegisterVerificationPage extends StatefulWidget {
  final String email;

  const RegisterVerificationPage({Key? key, required this.email}) : super(key: key);

  @override
  _RegisterVerificationPageState createState() => _RegisterVerificationPageState();
}

class _RegisterVerificationPageState extends State<RegisterVerificationPage> {
  String? activationCode;

  sendVerificationCode() {
    try{
      AuthorizationService.activateAccount(
        email: widget.email,
        activationCode: activationCode ?? '',
      ).then((value) {
        if (value.success) {
          Navigator.pushNamed(context, Routes.accountActivated);
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
                      activationCode = value;
                    }),
                    type: TextInputType.number,
                  ),
                ],
              ),
              BasicButton(
                text: 'Verify',
                onPressed: () => sendVerificationCode(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
