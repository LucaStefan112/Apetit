import 'package:apetit/services/authorization.dart';
import 'package:apetit/utils/authorized_pages.dart';
import 'package:flutter/material.dart';

import '../components/basic_button.dart';
import '../components/text_form_input.dart';
import '../utils/custom_colors.dart';
import '../utils/toaster.dart';
import 'account_activated.dart';

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
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => const AccountActivatedPage()
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
