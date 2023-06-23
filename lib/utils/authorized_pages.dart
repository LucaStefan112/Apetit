import 'package:apetit/pages/authentication.dart';
import 'package:apetit/pages/home.dart';
import 'package:apetit/utils/storage_manager.dart';
import 'package:flutter/material.dart';

class AuthorizationRedirect {
  static void redirectIfAuthorized(BuildContext context) {
    StorageManager.getToken().then((token) {
      if (token != null) {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context) => const HomePage()
        ), (route) => false);
      }
    });
  }

  static void redirectIfUnauthorized(BuildContext context) {
    StorageManager.getToken().then((token) {
      if (token == null) {
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context) => const AuthenticationPage()
        ), (route) => false);
      }
    });
  }
}

class AuthorizedStatelessPage<T> extends StatelessWidget {
  const AuthorizedStatelessPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthorizationRedirect.redirectIfUnauthorized(context);
    throw UnimplementedError();
  }
}

class UnauthorizedStatelessPage<T> extends StatelessWidget {
  const UnauthorizedStatelessPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthorizationRedirect.redirectIfAuthorized(context);
    throw UnimplementedError();
  }
}