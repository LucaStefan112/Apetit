import 'package:apetit/components/preference_text_input.dart';
import 'package:flutter/material.dart';

import '../components/basic_button.dart';
import '../utils/CustomColors.dart';
import '../utils/Routes.dart';

class PreferencesPage extends StatelessWidget {
  const PreferencesPage({Key? key}) : super(key: key);

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
                  PreferencesTextInput(
                      label1: 'I like:',
                      onChanged: () => print('label changed'),
                      label2: '.',
                      defaultValue: 'None',
                  ),
                  PreferencesTextInput(
                      label1: 'I dislike:',
                      onChanged: () => print('label changed'),
                      label2: '.',
                      defaultValue: 'None',
                  ),
                  PreferencesTextInput(
                      label1: 'I avoid:',
                      onChanged: () => print('label changed'),
                      label2: '.',
                      defaultValue: 'None',
                  ),
                  PreferencesTextInput(
                      label1: 'I follow a',
                      onChanged: () => print('label changed'),
                      label2: ' diet.',
                      defaultValue: 'None',
                  ),
                ],
              ),
              BasicButton(
                  text: 'Set',
                  onPressed: () => Navigator.pushNamed(context, Routes.home)
              ),
            ],
          ),
        ),
      ),
    );
  }
}