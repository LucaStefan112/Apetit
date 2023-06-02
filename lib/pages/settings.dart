import 'package:apetit/components/basic_button.dart';
import 'package:apetit/components/navigation_icon.dart';
import 'package:apetit/utils/Routes.dart';
import 'package:flutter/material.dart';

import '../components/basic_header.dart';
import '../components/long_button.dart';
import '../components/text_form_input.dart';
import '../utils/CustomColors.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: CustomColors.background,
      body: Column(
        children: [
          const BasicHeader(
            title: 'Settings',
            route1: NavigationIconRoutes.back,
            route2: NavigationIconRoutes.none
          ),
          SizedBox(height: 0.04 * MediaQuery.of(context).size.height),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: const BoxDecoration(
              color: CustomColors.primary,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: CustomColors.secondary,
                  offset: Offset(0, 1),
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              children: [
                SizedBox(height: 0.02 * MediaQuery.of(context).size.height),
                TextFormInput(
                  label: 'First Name',
                  onChanged: (value) => print('firstName changed'),
                ),
                TextFormInput(
                  label: 'Last Name',
                  onChanged: (value) => print('lastName changed'),
                ),
                TextFormInput(
                  label: 'Gender',
                  onChanged: (value) => print('gender changed'),
                ),
                TextFormInput(
                  label: 'Date of Birth',
                  onChanged: (value) => print('dateOfBirth changed'),
                ),
                BasicButton(
                  text: 'Save',
                  onPressed: () => print('save pressed'),
                ),
                SizedBox(height: 0.02 * MediaQuery.of(context).size.height),
              ],
            ),
          ),
          SizedBox(height: 0.01 * MediaQuery.of(context).size.height),
          LongButton(
            text: 'Cooking History',
            icon: 'assets/images/cook.png',
            onPressed: () => Navigator.pushNamed(context, Routes.cookingHistory),
          ),
          SizedBox(height: 0.1 * MediaQuery.of(context).size.height),
          LongButton(
            text: 'Logout',
            icon: 'assets/images/logout.png',
            onPressed: () => Navigator.pushNamed(context, Routes.login),
            iconPaddingLeft: MediaQuery.of(context).size.width * 0.023,
          ),
        ],
      ),
    );
  }
}