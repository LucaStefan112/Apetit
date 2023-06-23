import 'package:apetit/components/inputs/preference_text_input.dart';
import 'package:apetit/pages/home.dart';
import 'package:apetit/services/user.dart';
import 'package:apetit/utils/toaster.dart';
import 'package:flutter/material.dart';

import '../components/buttons/basic_button.dart';
import '../entities/preferences.dart';
import '../utils/authorized_pages.dart';
import '../utils/custom_colors.dart';
import '../utils/form_validation.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({Key? key}) : super(key: key);

  @override
  _PreferencesPageState createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  Map<String, dynamic> preferences = {
    'likes': null,
    'dislikes': null,
    'avoids': null,
    'diet': null,
  };

  submit() {
    if (!FormValidation.validateUserPreferences(preferences).isValid) {
      return Toaster.error(context, FormValidation.validateUserPreferences(preferences).message);
    }

    try {
      UserService.updatePreferences(Preferences.fromJson(preferences)).then((value) {
        if (value.success) {
          Toaster.success(context, value.message);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
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
    AuthorizationRedirect.redirectIfUnauthorized(context);

    UserService.getPreferences().then((value) {
      if(value.success) {
        setState(() {
          preferences = value.preferences!.toJson();
        });
      } else {
        Toaster.error(context, value.message);
      }
    });
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
              Image(
                image: const AssetImage('assets/images/Apetit_Big_Logo.png'),
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.width * 0.5,
              ),
              Column(
                children: [
                  PreferencesTextInput(
                    label1: 'I like:',
                    label2: '.',
                    onChanged: (value) {
                      setState(() {
                        preferences['likes'] = value;
                      });
                    },
                    value: preferences['likes'] ?? ''
                  ),
                  PreferencesTextInput(
                    label1: 'I dislike:',
                    label2: '.',
                    onChanged: (value) {
                      setState(() {
                        preferences['dislikes'] = value;
                      });
                    },
                    value: preferences['dislikes'] ?? ''
                  ),
                  PreferencesTextInput(
                    label1: 'I avoid:',
                    label2: '.',
                    onChanged: (value) {
                      setState(() {
                        preferences['avoids'] = value;
                      });
                    },
                    value: preferences['avoids'] ?? ''
                  ),
                  PreferencesTextInput(
                    label1: 'I follow a',
                    label2: ' diet.',
                    onChanged: (value) {
                      setState(() {
                        preferences['diet'] = value;
                      });
                    },
                    value: preferences['diet'] ?? ''
                  ),
                ],
              ),
              BasicButton(
                text: 'Set',
                onPressed: () => submit(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
