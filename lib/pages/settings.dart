import 'package:apetit/components/buttons/basic_button.dart';
import 'package:apetit/components/buttons/navigation_icon.dart';
import 'package:apetit/services/authorization.dart';
import 'package:apetit/services/user.dart';
import 'package:apetit/utils/routes.dart';
import 'package:apetit/utils/toaster.dart';
import 'package:flutter/material.dart';

import '../components/headers/basic_header.dart';
import '../components/inputs/date_form_input.dart';
import '../components/buttons/long_button.dart';
import '../components/inputs/text_form_input.dart';
import '../entities/user_data.dart';
import '../utils/authorized_pages.dart';
import '../utils/custom_colors.dart';
import '../utils/form_validation.dart';
import '../utils/storage_manager.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  Map<String, dynamic> userData = {
    'fullName': null,
    'dateOfBirth': null,
  };

  submit() {
    if (!FormValidation.validateUserData(userData).isValid) {
      return Toaster.error(context, FormValidation.validateUserData(userData).message);
    }

    try {
      UserService.updateData(UserData.fromJson(userData)).then((value) {
        if (value.success) {
          Toaster.success(context, value.message);
        } else {
          Toaster.error(context, value.message);
        }
      });
    } catch (e) {
      Toaster.error(context, e.toString());
    }
  }

  logout() {
    AuthorizationService.logout().then((value) {
      StorageManager.deleteToken().then((value) {
        Navigator.pushNamedAndRemoveUntil(context, Routes.authentication, (route) => false);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    AuthorizationRedirect.redirectIfUnauthorized(context);

    UserService.getData().then((value) {
      if (value.success) {
        setState(() {
          userData['fullName'] = value.userData?.fullName;
          userData['dateOfBirth'] = value.userData?.dateOfBirth;
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
      backgroundColor: CustomColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const BasicHeader(
            title: 'Settings',
            route1: NavigationIconRoutes.back,
            route2: NavigationIconRoutes.none,
          ),
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
                  label: 'Full Name',
                  onChanged: (value) {
                    setState(() {
                      userData['fullName'] = value;
                    });
                  },
                  value: userData['fullName'] ?? '',
                ),
                DateFormInput(
                  label: 'Date of Birth',
                  onChanged: (value) {
                    setState(() {
                      userData['dateOfBirth'] = value;
                    });
                  },
                  value: userData['dateOfBirth'] ?? '',
                ),
                BasicButton(
                  text: 'Save',
                  onPressed: () => submit(),
                ),
                SizedBox(height: 0.02 * MediaQuery.of(context).size.height),
              ],
            ),
          ),
          LongButton(
            text: 'Cooking History',
            icon: Icons.history,
            onPressed: () => Navigator.pushNamed(context, Routes.cookingHistory),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 0.02 * MediaQuery.of(context).size.height),
            child: LongButton(
              text: 'Logout',
              icon: Icons.logout,
              onPressed: () => logout(),
            ),
          ),
        ],
      ),
    );
  }
}
