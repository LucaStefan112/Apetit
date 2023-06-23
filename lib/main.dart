import 'package:apetit/pages/authentication.dart';
import 'package:apetit/pages/cooking_history.dart';
import 'package:apetit/pages/forgot_password.dart';
import 'package:apetit/pages/generate_recipe.dart';
import 'package:apetit/pages/home.dart';
import 'package:apetit/pages/liked_recipes.dart';
import 'package:apetit/pages/login.dart';
import 'package:apetit/pages/preferences.dart';
import 'package:apetit/pages/register.dart';
import 'package:apetit/pages/settings.dart';
import 'package:apetit/utils/loader.dart';
import 'package:apetit/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    Loader.setup();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apetit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const AuthenticationPage(),
      routes: {
        Routes.authentication: (context) => const AuthenticationPage(),
        Routes.register: (context) => const RegisterPage(),
        Routes.login: (context) => const LoginPage(),
        Routes.forgotPassword: (context) => const ForgotPasswordPage(),
        Routes.home: (context) => const HomePage(),
        Routes.preferences: (context) => const PreferencesPage(),
        Routes.likedRecipes: (context) => const LikedRecipesPage(),
        Routes.cookingHistory: (context) => const CookingHistoryPage(),
        Routes.generateRecipe: (context) => const GenerateRecipePage(),
        Routes.settings: (context) => const SettingsPage(),
      },
      builder: EasyLoading.init(),
    );
  }
}