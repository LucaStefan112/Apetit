import 'package:apetit/components/dish_type_menu.dart';
import 'package:apetit/components/home_header.dart';
import 'package:apetit/utils/authorized_pages.dart';
import 'package:flutter/material.dart';

import '../utils/custom_colors.dart';

class HomePage extends AuthorizedStatelessPage {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: CustomColors.background,
      body: Column(
        children: [
          const HomeHeader(),
          SizedBox(height: 0.04 * MediaQuery.of(context).size.height),
          const DishTypeMenu()
        ],
      ),
    );
  }
}